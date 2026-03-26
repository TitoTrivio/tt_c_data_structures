#ifndef TT_STACK_H
#define TT_STACK_H

// Stack definition

struct _Stack
{
    void **data;
    int top;
    int size;
};

typedef struct _Stack Stack;

// Stack functions

int stack_initialize(Stack *stack, int size);

void stack_finalize(Stack *stack);

Stack *stack_new(int size);

void stack_free(Stack *stack);

int stack_push(Stack *stack, void *value);

void *stack_pop(Stack *stack);

#endif

