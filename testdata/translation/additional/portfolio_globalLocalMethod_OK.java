int main() {
    B b;
    b = new B();
    printInt(show());
    b.check();
    return 0;
}

class B extends A {
    int check() {
        show();
        return 0;
    }
}

class A {
    int show() {
        int a;
        a = 20;
        printInt(a);
        return 0;
    }
}

int show() {
    int a;
    a = 10;
    printInt(a);
    return 0;
}