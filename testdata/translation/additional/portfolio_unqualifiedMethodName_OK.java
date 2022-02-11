int main() {
    B a;
    a = new B();
    int x;
    x = a.give();
    printInt(x);
    return 0;
}

class B {
    int y;

    int give() {
        this.y = 11;
        this.get(100);
        return this.y;
    }

    int get(int x){
        printInt(x);
        return 0;
    }

}
