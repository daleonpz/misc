/* Define the end of RAM and limit of stack memory */
/* (240KB SRAM on the STM32F746G line -> 3C000) */
/* (SRAM1 starts at address 0x20010000)
_estack = 0x2004C000;

MEMORY
{
    FLASH ( rx )      : ORIGIN = 0x08000000, LENGTH = 1024K
    RAM ( rxw )       : ORIGIN = 0x20010000, LENGTH = 240K
}
