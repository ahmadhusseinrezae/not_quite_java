int main() {
    A a;
    a = new A();
    printInt(a.check());
    return 0;
}

class A {
    int b;

    int check() {
        int b;

        b = 1;
        this.b = 2;
        printInt(b);
        printInt(this.b);

        b = 1 + 1;
        this.b = 2 + 2;
        printInt(b);
        printInt(this.b);
        
        return 0;
    }
}