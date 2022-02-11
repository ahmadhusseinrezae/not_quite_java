int main() {
    B a;
    a = new B();
    int x;
    x = a.give();
    printInt(x);
    a.A();
    return 0;
}

class B extends A{
    int give() {
        this.y = 11;
        return this.y;
    }

    int A(){
        printInt(10);
        return 0; 
    }

}

class A {
   int y;

    int give() {
        this.y = 11;
        return this.y;
    } 
}
