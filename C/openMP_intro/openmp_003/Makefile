#
# %Log: Makefile,v %
# Revision 1.0  2017/11/30  Lukas Krawczyk
# Initial revision
#
CC = gcc
CFLAGS = -g -Wall -O2 -fopenmp
TARGET = openmp_003

all: $(TARGET)

$(TARGET): $(TARGET).c
	$(CC) $(CFLAGS) -o $(TARGET) $(TARGET).c
	
run: $(TARGET)
	./$(TARGET)

clean:
	rm -f *.o $(TARGET)
