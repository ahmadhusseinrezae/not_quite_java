int main() {
    B a;
    a = new B();
    int x;
    x = a.give();
    printInt(x);
    return 0;
}

class B extends A{
    int give() {
        this.y = 11;
        return this.y;
    }

}

class A {
   int y;

    int give() {
        this.y = 10;
        return this.y;
    } 
}
