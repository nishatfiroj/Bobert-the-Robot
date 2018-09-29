// could this program be more efficient? sure. will i? probably not. 

// Create a color with the specified RGB values
#define COLOR(r, g, b) ((r) | (g)<<5 | (b)<<10)

// Calculate the position of a pixel based on its row and column
#define OFFSET(r, c, rowlen) ((r)*(rowlen)+(c))

#define SCANLINECOUNTER *(volatile unsigned short *)0x4000006

// Predefined colors
#define RED COLOR(31, 0, 0)
#define GREEN COLOR(0, 31, 0)
#define BLUE COLOR(0, 0, 31)
#define MAGENTA COLOR(31, 0, 31)
#define CYAN COLOR(0, 31, 31)
#define GRAY COLOR(25, 25, 25)
#define BLACK 0
#define WHITE COLOR(31, 31, 31)


// Function Prototypes
void setPixel(int, int, unsigned short);
void drawTriangle(int, int);

// Global Variables
unsigned short *videoBuffer = (unsigned short *)0x6000000;


void delay(int amount) {
	volatile int trash = 0;
	for(int i=0; i<amount*1000; i++) {
		trash++;
	}
}

void waitForVBlank() {
    while(SCANLINECOUNTER > 160);
    while(SCANLINECOUNTER < 160);

}

void erase() {
	for(int x = 0; x < 240; x++) {
		for(int y = 0; y < 160; y++) {
			videoBuffer[x+y*240] = WHITE;  
		}
	}
}

void setPixel(int row, int col, unsigned short color) {
	videoBuffer[OFFSET(row,col,240)] = color;
}

void drawTriangle(int row, int col) {
	int y = col;
	int x = row;
	// vertical line 
    while (y < (col + 10)) {
    	setPixel(y, x, WHITE);
    	y = y + 1;
    }
    // horizontal line
    while (x < (row + 10)) {
    	setPixel(y, x, WHITE);
    	x = x + 1;
    }
    // diagonal
    y = row;
    x = col;
    while (y < (row + 10)) {
    	setPixel(x, y, WHITE);
    	x = x + 1;
    	y = y + 1;
    }
}

void drawSquare(int row, int col, int size) {
    int vertical = col;
    int horizontal = row; 

    // vertical lines
    while (vertical < (col + size)) {
        setPixel(vertical, horizontal, WHITE);
        setPixel(vertical, horizontal + size, WHITE);
        vertical = vertical + 1;
    }

    // horizontal lines
    while (horizontal < (row + size) + 1) {
        setPixel(vertical, horizontal, WHITE);
        setPixel(vertical - size, horizontal, WHITE);
        horizontal = horizontal + 1;
    }

}

void drawRectangle (int row, int col, int height, int width, unsigned short color) {
	
    // TODO #1: Implement this function

    for (int i = row; i < row + height; i++) {
    	for (int j = col; j < col + width; j++) {
    		setPixel(i, j, color);
    	}
    }

}

void drawPrism(int row, int col, int width, int length, unsigned short color) {
    int vertical = col;
    int horizontal = row;

    // vertical lines
    while (horizontal < (row + length) + 1) {
    	while (vertical < (col + width) + 1) {
	        setPixel(vertical, horizontal, color);
	        vertical++;
	    }
	    vertical = col;
	    horizontal++;
    }

    // reset horizontals and columns
    int r1 = row + length;
    int r2 = row;
    int r3 = row;
    int c1 = col;
    int c2 = col;
    int c3 = col + width;

    // set up the diagonals 
    int counter = 10;
    while (counter > 0) {
        setPixel(c1, r1, GRAY);
        setPixel(c2, r2, GRAY);
        setPixel(c3, r3, GRAY);
        r1--;
        r2--;
        r3--;
        c1--;
        c2--;
        c3--;

        counter--;
    }

    // shadow left side
    while (c2 < col + width - 10) {
        setPixel(c2, r2, GRAY);
        c2++;
    }

    // shadow top side and reset c2
    c2 = c2 - width;
    while (r2 < row + length - 10) {
        setPixel(c2, r2, GRAY);
        r2++;
    }
}

                                    // time to bring bobert to life.....
void frame1() {
    //little box on top of his head
    drawPrism(110, 20, 10, 20, GRAY);

    //head
    drawPrism(100, 30, 40, 40, GRAY);

    // eyes
    drawSquare(110, 40, 5);
    drawSquare(130, 40, 5);

    //nose
    drawTriangle(120, 45);

    //body
    drawPrism(85, 75, 70, 70, GRAY);

    //left arm
    drawPrism(65, 75, 30, 15, GRAY);
    
    //right arm
    drawPrism(160, 75, 30, 15, GRAY);

}

                                    // ARMS SHRINKING //
void frame2() {
    //little box on top of his head
    drawPrism(110, 20, 10, 20, GRAY);

    //head
    drawPrism(100, 30, 40, 40, GRAY);

    // eyes
    drawSquare(110, 40, 5);
    drawSquare(130, 40, 5);

    //nose
    drawTriangle(120, 45);

    //body
    drawPrism(85, 75, 70, 70, GRAY);

    //left arm
    drawPrism(65, 75, 15, 15, GRAY);
    
    //right arm
    drawPrism(160, 75, 15, 15, GRAY);

}

void frame3() {
    //little box on top of his head
    drawPrism(110, 20, 10, 20, GRAY);

    //head
    drawPrism(100, 30, 40, 40, GRAY);

    // eyes
    drawSquare(110, 40, 5);
    drawSquare(130, 40, 5);

    //nose
    drawTriangle(120, 45);

    //body
    drawPrism(85, 75, 70, 70, GRAY);

    //left arm
    drawPrism(65, 75, 1, 15, GRAY);
    
    //right arm
    drawPrism(160, 75, 1, 15, GRAY);

}
                                    // SHRINK BODY
void frame4() {
    //little box on top of his head
    drawPrism(110, 20, 10, 20, GRAY);

    //head
    drawPrism(100, 30, 40, 40, GRAY);

    // eyes
    drawSquare(110, 40, 5);
    drawSquare(130, 40, 5);

    //nose
    drawTriangle(120, 45);

    //body
    drawPrism(85, 75, 70, 70, GRAY);

}

void frame5() {
    //little box on top of his head
    drawPrism(110, 40, 10, 20, GRAY);

    //head
    drawPrism(100, 50, 40, 40, GRAY);

    // eyes
    drawSquare(110, 60, 5);
    drawSquare(130, 60, 5);

    //nose
    drawTriangle(120, 65);

    //body
    drawPrism(85, 95, 50, 70, GRAY);
}

void frame6() {
    //little box on top of his head
    drawPrism(110, 60, 10, 20, GRAY);

    //head
    drawPrism(100, 70, 40, 40, GRAY);

    // eyes
    drawSquare(110, 80, 5);
    drawSquare(130, 80, 5);

    //nose
    drawTriangle(120, 85);

    //body
    drawPrism(85, 115, 30, 70, GRAY);
}

void frame7() {
    //little box on top of his head
    drawPrism(110, 80, 10, 20, GRAY);

    //head
    drawPrism(100, 90, 40, 40, GRAY);

    // eyes
    drawSquare(110, 100, 5);
    drawSquare(130, 100, 5);

    //nose
    drawTriangle(120, 105);

    //body
    drawPrism(85, 135, 10, 70, GRAY);
}

void frame8() {
    //little box on top of his head
    drawPrism(110, 90, 10, 20, GRAY);

    //head
    drawPrism(100, 100, 40, 40, GRAY);

    // eyes
    drawSquare(110, 110, 5);
    drawSquare(130, 110, 5);

    //nose
    drawTriangle(120, 115);
}