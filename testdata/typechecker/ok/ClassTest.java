class ClassTest {
    int x;
    boolean y;

    int doStuff(int xin, boolean yin) {
        this.x = xin;
        this.y = !yin;
        return 0;
    }

}

int main() {
    ClassTest test;
    test = new ClassTest();

    test.doStuff(2, true);
    return 0;
}


