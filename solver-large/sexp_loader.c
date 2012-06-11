/* -*- Mode: C; tab-width: 2; indent-tabs-mode: nil; c-basic-offset: 2 -*- */

#include <stdio.h>
#include <ctype.h>
#include <assert.h>
#include <stdlib.h>
/*
 * by some reason necessary to include this to avoid
 * collect2: ld terminated with signal 11 [Segmentation fault]
 * crash.
 * it is the case since errno is used
 */
#include <errno.h>

#include "sexp_loader.h"
#include "libsexp.h"

/* An input data structure used in parser */
typedef struct parse_data_tag {
  fea_task *task;
  fea_solution_params *fea_params;
  nodes_array *nodes;
  elements_array *elements;
  presc_bnd_array *presc_boundary;
  char* current_text;
  int current_size;
} parse_data;


static void process_model(sexp_item* item, parse_data* data)
{
  /* first determine model type */
  sexp_item* value = sexp_item_attribute(item,"name");
  if (value)
  {
    if (sexp_item_is_symbol(value,"A5"))
    {
      data->task->model.model = MODEL_A5;
      data->task->model.parameters_count = 2;
    }
    else if (sexp_item_is_symbol(value,"COMPRESSIBLE_NEOHOOKEAN"))
    {
      data->task->model.model = MODEL_COMPRESSIBLE_NEOHOOKEAN;
      data->task->model.parameters_count = 2;
    }
    else
    {
      printf("unknown model type '%s'\n",value->atom->value.symbol);
    }
  }
}

static void process_model_parameters(sexp_item* item, parse_data* data)
{
  sexp_item* value; 
  switch(data->task->model.model)
  {
  case MODEL_COMPRESSIBLE_NEOHOOKEAN:
  case MODEL_A5:
    value = sexp_item_attribute(item,"lambda");
    assert(value);
    data->task->model.parameters[0] = atom_token_number(value->atom);
    value = sexp_item_attribute(item,"mu");
    assert(value);
    data->task->model.parameters[1] = atom_token_number(value->atom);
    break;
  default:
    break;
  }
}

static void process_solution(sexp_item* item, parse_data* data)
{
  sexp_item* value;
  value = sexp_item_attribute(item,"desired-tolerance");
  assert(value);
  data->task->desired_tolerance = atom_token_number(value->atom);
  value = sexp_item_attribute(item,"task-type");
  assert(value);
  if (sexp_item_is_symbol(value,"CARTESIAN3D"))
    data->task->type = CARTESIAN3D;
  value = sexp_item_attribute(item,"load-increments-count");
  assert(value);
  data->task->load_increments_count = value->atom->value.int_number;
  value = sexp_item_attribute(item,"modified-newton");
  assert(value);
  data->task->modified_newton = FALSE;
  if (sexp_item_is_symbol(value,"YES") || sexp_item_is_symbol(value,"TRUE"))
    data->task->modified_newton = TRUE;
}

static void process_element_type(sexp_item* item, parse_data* data)
{
  sexp_item* value;
  value = sexp_item_attribute(item,"gauss-nodes-count");
  assert(value);
  data->fea_params->gauss_nodes_count = value->atom->value.int_number;
  value = sexp_item_attribute(item,"nodes-count");
  assert(value);
  data->fea_params->nodes_per_element = value->atom->value.int_number;
  value = sexp_item_attribute(item,"name");
  assert(value);
  if (sexp_item_is_symbol(value,"TETRAHEDRA10"))
    data->task->ele_type = TETRAHEDRA10;
}

static void process_line_search(sexp_item* item, parse_data* data)
{
  sexp_item* value;
  value = sexp_item_attribute(item,"max");
  assert(value);
  data->task->linesearch_max = value->atom->value.int_number;
}

static void process_arc_length(sexp_item* item, parse_data* data)
{
  sexp_item* value;
  value = sexp_item_attribute(item,"max");
  assert(value);
  data->task->arclength_max = value->atom->value.int_number;
}

static void process_nodes(sexp_item* item, parse_data* data)
{
  int count = 0;
  int i = 0;
  sexp_item* next = sexp_item_cdr(item);
  count = sexp_item_length(item) - 1;
  data->nodes->nodes_count = count;
  /* allocate storage for nodes */
  data->nodes->nodes =
    (real**)malloc(data->nodes->nodes_count*sizeof(real*));
  for (; i < data->nodes->nodes_count; ++ i)
  {
    data->nodes->nodes[i] = (real*)malloc(MAX_DOF*sizeof(real));
    item = sexp_item_car(next);
    assert(sexp_item_length(item) == 3);
    data->nodes->nodes[i][0] = atom_token_number(sexp_item_nth(item,0)->atom);
    data->nodes->nodes[i][1] = atom_token_number(sexp_item_nth(item,1)->atom);
    data->nodes->nodes[i][2] = atom_token_number(sexp_item_nth(item,2)->atom);
    next = sexp_item_cdr(next);
  }
}

static void process_elements(sexp_item* item, parse_data* data)
{
  int count = 0;
  int i = 0,j = 0;
  sexp_item* next = sexp_item_cdr(item);
  count = sexp_item_length(item) - 1;
  data->elements->elements_count = count;
  /* allocate storage for elements */
  data->elements->elements = 
    (int**)malloc(data->elements->elements_count*sizeof(int*));
  for (; i < data->elements->elements_count; ++ i)
  {
    data->elements->elements[i] =
      (int*)malloc(data->fea_params->nodes_per_element*sizeof(int));
    item = sexp_item_car(next);
    assert(sexp_item_length(item) == data->fea_params->nodes_per_element);
    for ( j = 0; j < data->fea_params->nodes_per_element; ++ j)
      data->elements->elements[i][j] =
        sexp_item_nth(item,j)->atom->value.int_number;
    next = sexp_item_cdr(next);
  }
}

static void process_prescribed(sexp_item* item, parse_data* data)
{
  int count = 0;
  int i = 0;
  int size;
  sexp_item* next = sexp_item_cdr(item);
  count = sexp_item_length(item) - 1;
  data->presc_boundary->prescribed_nodes_count = count;
  size = data->presc_boundary->prescribed_nodes_count;
  size = size*sizeof(prescribed_bnd_node);
  /* allocate storage for prescribed nodes */
  data->presc_boundary->prescribed_nodes =
    (prescribed_bnd_node*)malloc(size);
  for ( ; i < data->presc_boundary->prescribed_nodes_count; ++ i)
  {
    item = sexp_item_car(next);

    assert(sexp_item_starts_with_symbol(item,"presc-node"));
    data->presc_boundary->prescribed_nodes[i].node_number =
      sexp_item_attribute(item,"node-id")->atom->value.int_number;
    data->presc_boundary->prescribed_nodes[i].values[0] =
      atom_token_number(sexp_item_attribute(item,"x")->atom);
    data->presc_boundary->prescribed_nodes[i].values[1] =
      atom_token_number(sexp_item_attribute(item,"y")->atom);
    data->presc_boundary->prescribed_nodes[i].values[2] =
      atom_token_number(sexp_item_attribute(item,"z")->atom);
    data->presc_boundary->prescribed_nodes[i].type =
      (presc_boundary_type)
      sexp_item_attribute(item,"type")->atom->value.int_number;

    next = sexp_item_cdr(next);
  }
}


static void traverse_function(sexp_item* item, void* data)
{
  parse_data* parse = (parse_data*)data;
  if (sexp_item_starts_with_symbol(item,"model"))
    process_model(item,parse);
  else if (sexp_item_starts_with_symbol(item,"model-parameters"))
    process_model_parameters(item,parse);
  else if (sexp_item_starts_with_symbol(item,"solution"))
    process_solution(item,parse);
  else if (sexp_item_starts_with_symbol(item,"element-type"))
    process_element_type(item,parse);
  else if (sexp_item_starts_with_symbol(item,"line-search"))
    process_line_search(item,parse);
  else if (sexp_item_starts_with_symbol(item,"arc-length"))
    process_arc_length(item,parse);
  else if (sexp_item_starts_with_symbol(item,"nodes"))
    process_nodes(item,parse);
  else if (sexp_item_starts_with_symbol(item,"elements"))
    process_elements(item,parse);
  else if (sexp_item_starts_with_symbol(item,"prescribed-displacements"))
    process_prescribed(item,parse);
}


BOOL sexp_data_load(char *filename,
                    fea_task **task,
                    fea_solution_params **fea_params,
                    nodes_array **nodes,
                    elements_array **elements,
                    presc_bnd_array **presc_boundary)
{
  BOOL result = FALSE;
  FILE* sexp_document_file;
  size_t file_size = 0;
  size_t read_bytes = 0;
  char *file_contents = (char*)0;
  sexp_item* sexp;
  parse_data parse;

  
  /* Try to open file */
  if (!(sexp_document_file = fopen(filename,"rt")))
  {
    fprintf(stderr,"Error, could not open file %s\n",filename);
    return FALSE;
  }
  /* Determine file size */
  if (fseek(sexp_document_file,0,SEEK_END))
  {
    fprintf(stderr,"Error reading file %s\n",filename);
    return FALSE;
  }
  file_size = ftell(sexp_document_file);
  /* rewind to the begin of file */
  fseek(sexp_document_file,0,SEEK_SET);

  /* read whole file */
  file_contents = (char*)malloc(file_size+1);
  read_bytes = fread(file_contents,1,file_size,sexp_document_file);
  if (errno)
  {
    free(file_contents);
    return FALSE;
  }
  assert(read_bytes == file_size);
  fclose(sexp_document_file);
  file_contents[read_bytes] = '\0';
  
  /* parse input */
  sexp = sexp_parse(file_contents);
  if (!sexp)
  {
    free(file_contents);
    printf("Error: unable to parse SEXP input\n");
    return FALSE;
  }

  /* allocate parse data */
  parse.task = fea_task_alloc();
  parse.fea_params = fea_solution_params_alloc();
  parse.nodes = nodes_array_alloc();
  parse.elements = elements_array_alloc();
  parse.presc_boundary = presc_bnd_array_alloc();
  parse.current_size = 0;
  parse.current_text = (char*)0;

  if (sexp_item_starts_with_symbol(sexp,"task"))
  {
    sexp_item_traverse(sexp,traverse_function,&parse);
    *task = parse.task;
    *fea_params = parse.fea_params;
    *nodes = parse.nodes;
    *elements = parse.elements;
    *presc_boundary = parse.presc_boundary;

    
    result = TRUE;
  }
  free(file_contents);
  sexp_item_free(sexp);

  return result;
}