// ncurses1.c
#include<ncurses.h>
#include<stdlib.h>
#include<time.h>

unsigned int Seeder(void);
int Irand(int low, int high);
void Print_A_Character(void);

int main(void)
{
	atexit( (void *)endwin );
	initscr();
	Seeder();

	for (int i = 0; i < 500000; ++i)
		Print_A_Character();

	return 0;
}


void Print_A_Character(void)
{
	int x = Irand(0, COLS);
	int y = Irand(0, LINES);
	unsigned ascii = Irand('A', 'z');  // ASCII dependent
	mvaddch(y, x, ascii);
	refresh();
}


int Irand(int low, int high)
{  
	return low + (int)( (double)(high-low) * rand()/(RAND_MAX + 1.0) );
}


unsigned int Seeder(void)
{
	time_t seed;
	time(&seed);
	srand((unsigned)seed);

	return seed;
}
