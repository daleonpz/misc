/* End of RAM/Start of stack */
_estack = 0x2004C000;

MEMORY
{
    FLASH ( rx )      : ORIGIN = 0x08000000, LENGTH = 1024K
    RAM ( rxw )       : ORIGIN = 0x20010000, LENGTH = 240K
}
