#include <iostream>

using namespace std;

struct stiva{
    int info;
    stiva *next;
} *top;

void push(int x){
    stiva *new_stiva = new stiva;
    new_stiva -> info = x;
    new_stiva -> next = top;
    top = new_stiva;
}

int pop() {
    stiva *bob = top;
    int gigel = -1;

    if (top != NULL){
        gigel = top -> info;

        top = top -> next;
        delete bob;
    }

    return gigel;
}

int main()
{
    push(1);
    cout << pop();
    push(2);
    push(3);
    cout << pop();
    cout << pop();
    return 0;
}
