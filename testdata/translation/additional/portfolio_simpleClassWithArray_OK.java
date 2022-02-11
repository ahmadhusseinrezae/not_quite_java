int main() {
    B a;
    a = new B();
    int x;
    x = a.give(10);
    printInt(x);
    return 0;
}

class B {
    int y;
    int[] x;

    int give(int some) {
        this.x = new int[2];
        this.x[0] = some;
        this.y = 11;
        return this.x[0];
    }

}
