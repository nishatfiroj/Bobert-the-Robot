# 1 "myLib.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "myLib.c"
# 23 "myLib.c"
void setPixel(int, int, unsigned short);
void drawTriangle(int, int);


unsigned short *videoBuffer = (unsigned short *)0x6000000;


void delay(int amount) {
 volatile int trash = 0;
 for(int i=0; i<amount*1000; i++) {
  trash++;
 }
}

void waitForVBlank() {
    while(*(volatile unsigned short *)0x4000006 > 160);
    while(*(volatile unsigned short *)0x4000006 < 160);

}

void erase() {
 for(int x = 0; x < 240; x++) {
  for(int y = 0; y < 160; y++) {
   videoBuffer[x+y*240] = ((31) | (31)<<5 | (31)<<10);
  }
 }
}

void setPixel(int row, int col, unsigned short color) {
 videoBuffer[((row)*(240)+(col))] = color;
}

void drawTriangle(int row, int col) {
 int y = col;
 int x = row;

    while (y < (col + 10)) {
     setPixel(y, x, ((31) | (31)<<5 | (31)<<10));
     y = y + 1;
    }

    while (x < (row + 10)) {
     setPixel(y, x, ((31) | (31)<<5 | (31)<<10));
     x = x + 1;
    }

    y = row;
    x = col;
    while (y < (row + 10)) {
     setPixel(x, y, ((31) | (31)<<5 | (31)<<10));
     x = x + 1;
     y = y + 1;
    }
}

void drawSquare(int row, int col, int size) {
    int vertical = col;
    int horizontal = row;


    while (vertical < (col + size)) {
        setPixel(vertical, horizontal, ((31) | (31)<<5 | (31)<<10));
        setPixel(vertical, horizontal + size, ((31) | (31)<<5 | (31)<<10));
        vertical = vertical + 1;
    }


    while (horizontal < (row + size) + 1) {
        setPixel(vertical, horizontal, ((31) | (31)<<5 | (31)<<10));
        setPixel(vertical - size, horizontal, ((31) | (31)<<5 | (31)<<10));
        horizontal = horizontal + 1;
    }

}

void drawRectangle (int row, int col, int height, int width, unsigned short color) {



    for (int i = row; i < row + height; i++) {
     for (int j = col; j < col + width; j++) {
      setPixel(i, j, color);
     }
    }

}

void drawPrism(int row, int col, int width, int length, unsigned short color) {
    int vertical = col;
    int horizontal = row;


    while (horizontal < (row + length) + 1) {
     while (vertical < (col + width) + 1) {
         setPixel(vertical, horizontal, color);
         vertical++;
     }
     vertical = col;
     horizontal++;
    }


    int r1 = row + length;
    int r2 = row;
    int r3 = row;
    int c1 = col;
    int c2 = col;
    int c3 = col + width;


    int counter = 10;
    while (counter > 0) {
        setPixel(c1, r1, ((25) | (25)<<5 | (25)<<10));
        setPixel(c2, r2, ((25) | (25)<<5 | (25)<<10));
        setPixel(c3, r3, ((25) | (25)<<5 | (25)<<10));
        r1--;
        r2--;
        r3--;
        c1--;
        c2--;
        c3--;

        counter--;
    }


    while (c2 < col + width - 10) {
        setPixel(c2, r2, ((25) | (25)<<5 | (25)<<10));
        c2++;
    }


    c2 = c2 - width;
    while (r2 < row + length - 10) {
        setPixel(c2, r2, ((25) | (25)<<5 | (25)<<10));
        r2++;
    }
}


void frame1() {

    drawPrism(110, 20, 10, 20, ((25) | (25)<<5 | (25)<<10));


    drawPrism(100, 30, 40, 40, ((25) | (25)<<5 | (25)<<10));


    drawSquare(110, 40, 5);
    drawSquare(130, 40, 5);


    drawTriangle(120, 45);


    drawPrism(85, 75, 70, 70, ((25) | (25)<<5 | (25)<<10));


    drawPrism(65, 75, 30, 15, ((25) | (25)<<5 | (25)<<10));


    drawPrism(160, 75, 30, 15, ((25) | (25)<<5 | (25)<<10));

}


void frame2() {

    drawPrism(110, 20, 10, 20, ((25) | (25)<<5 | (25)<<10));


    drawPrism(100, 30, 40, 40, ((25) | (25)<<5 | (25)<<10));


    drawSquare(110, 40, 5);
    drawSquare(130, 40, 5);


    drawTriangle(120, 45);


    drawPrism(85, 75, 70, 70, ((25) | (25)<<5 | (25)<<10));


    drawPrism(65, 75, 15, 15, ((25) | (25)<<5 | (25)<<10));


    drawPrism(160, 75, 15, 15, ((25) | (25)<<5 | (25)<<10));

}

void frame3() {

    drawPrism(110, 20, 10, 20, ((25) | (25)<<5 | (25)<<10));


    drawPrism(100, 30, 40, 40, ((25) | (25)<<5 | (25)<<10));


    drawSquare(110, 40, 5);
    drawSquare(130, 40, 5);


    drawTriangle(120, 45);


    drawPrism(85, 75, 70, 70, ((25) | (25)<<5 | (25)<<10));


    drawPrism(65, 75, 1, 15, ((25) | (25)<<5 | (25)<<10));


    drawPrism(160, 75, 1, 15, ((25) | (25)<<5 | (25)<<10));

}

void frame4() {

    drawPrism(110, 20, 10, 20, ((25) | (25)<<5 | (25)<<10));


    drawPrism(100, 30, 40, 40, ((25) | (25)<<5 | (25)<<10));


    drawSquare(110, 40, 5);
    drawSquare(130, 40, 5);


    drawTriangle(120, 45);


    drawPrism(85, 75, 70, 70, ((25) | (25)<<5 | (25)<<10));

}

void frame5() {

    drawPrism(110, 40, 10, 20, ((25) | (25)<<5 | (25)<<10));


    drawPrism(100, 50, 40, 40, ((25) | (25)<<5 | (25)<<10));


    drawSquare(110, 60, 5);
    drawSquare(130, 60, 5);


    drawTriangle(120, 65);


    drawPrism(85, 95, 50, 70, ((25) | (25)<<5 | (25)<<10));
}

void frame6() {

    drawPrism(110, 60, 10, 20, ((25) | (25)<<5 | (25)<<10));


    drawPrism(100, 70, 40, 40, ((25) | (25)<<5 | (25)<<10));


    drawSquare(110, 80, 5);
    drawSquare(130, 80, 5);


    drawTriangle(120, 85);


    drawPrism(85, 115, 30, 70, ((25) | (25)<<5 | (25)<<10));
}

void frame7() {

    drawPrism(110, 80, 10, 20, ((25) | (25)<<5 | (25)<<10));


    drawPrism(100, 90, 40, 40, ((25) | (25)<<5 | (25)<<10));


    drawSquare(110, 100, 5);
    drawSquare(130, 100, 5);


    drawTriangle(120, 105);


    drawPrism(85, 135, 10, 70, ((25) | (25)<<5 | (25)<<10));
}

void frame8() {

    drawPrism(110, 90, 10, 20, ((25) | (25)<<5 | (25)<<10));


    drawPrism(100, 100, 40, 40, ((25) | (25)<<5 | (25)<<10));


    drawSquare(110, 110, 5);
    drawSquare(130, 110, 5);


    drawTriangle(120, 115);
}
