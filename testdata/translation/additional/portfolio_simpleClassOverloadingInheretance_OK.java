int main() {
    B a;
    a = new B();
    int x;
    x = a.give(20);
    printInt(x);

    x = a.give(true);
    printInt(x);   
    
    printInt(a.show());
    return 0;
}

class B extends A{
    int y;
    int give(int x) {
        this.y = x;
        return this.y;
    }

    int give(boolean x) {
        this.y = 10;
        return this.y;
    }
}

class A {
    int show(){
        printInt(100);
        return 0;
    }
}


