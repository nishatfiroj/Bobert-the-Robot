# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"







void erase();
void delay();
void frame1();
void frame2();
void frame3();
void frame4();
void frame5();
void frame6();
void frame7();
void frame8();

int main() {

    (*(unsigned short *)0x4000000) = 3 | (1<<10);

    while (1) {
        erase();
        frame1();
        delay(300);
        waitForVBlank();
        erase();
        frame2();
        delay(150);
        waitForVBlank();
        erase();
        frame3();
        delay(150);
        waitForVBlank();
        erase();
        frame4();
        delay(150);
        waitForVBlank();
        erase();
        frame5();
        delay(150);
        waitForVBlank();
        erase();
        frame6();
        delay(150);
        waitForVBlank();
        erase();
        frame7();
        delay(150);
        waitForVBlank();
        erase();
        frame8();
        delay(300);
        waitForVBlank();


    }

    while(1);
}
