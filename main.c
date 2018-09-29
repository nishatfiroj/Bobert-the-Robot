// MAIN!
// GBA Video Registers and Flags
#define REG_DISPCTL (*(unsigned short *)0x4000000)
#define MODE3 3
#define BG2_ENABLE (1<<10)

// declaration of functions to prevent warnings lol
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

    REG_DISPCTL = MODE3 | BG2_ENABLE;
    
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


