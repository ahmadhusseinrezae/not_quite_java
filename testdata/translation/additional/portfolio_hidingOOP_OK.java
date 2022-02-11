int main() {
    A a;
    a = new A();
    int x;
    x = a.give();
    printInt(x);
    return 0;
}

class A extends B {
    int x;

    int give() {
        this.x = 10;
        return this.x;
    }
}

class B {
    int x;

    int give() {
        this.x = 11;
        return this.x;
    }

}
