#include "stack.h"
#include <stdlib.h>

int stack_initialize(Stack *stack, int size)
{
    if(size < 0)
        return 0;

    stack->data = malloc(size * sizeof(void*));

    if(!stack->data)
        return 0;

    stack->top = -1;
    stack->size = size;

    return 1;
}

void stack_finalize(Stack *stack)
{
    if(!stack)
        return;

    if(stack->data)
    {
        for(int i = 0; i <= stack->top; i++)
            free(stack->data[i]);

        free(stack->data);
    }

    stack->data = NULL;
    stack->top = -1;
    stack->size = 0;
}

Stack *stack_new(int size)
{
    Stack *stack = (Stack*) malloc(sizeof(Stack));

    if(!stack_initialize(stack, size))
    {
        free(stack);
        return NULL;
    }

    return stack;
}

void stack_free(Stack *stack)
{
    if(!stack)
        return;

    stack_finalize(stack);

    free(stack);
}

int stack_push(Stack *stack, void *value)
{
    if(stack->top + 1 >= stack->size)
        return 0;

    stack->data[++stack->top] = value;

    return 1;
}

void *stack_pop(Stack *stack)
{
    if(stack->top < 0)
        return NULL;

    void *value = stack->data[stack->top];

    stack->data[stack->top] = NULL;

    stack->top--;

    return value;
}

