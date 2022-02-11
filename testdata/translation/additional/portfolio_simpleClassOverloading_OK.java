int main() {
    B a;
    a = new B();
    int x;
    x = a.give(20);
    printInt(x);

    x = a.give(true);
    printInt(x);    
    return 0;
}

class B {
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


