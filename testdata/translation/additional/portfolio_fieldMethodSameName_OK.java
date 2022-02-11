int main() {
    B a;
    a = new B();
    int x;
    x = a.y();
    printInt(x);
    return 0;
}

class B {
    int y;

    int y() {
        this.y = 11;
        return this.y;
    }

}
