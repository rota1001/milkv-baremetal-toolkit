SECTIONS
{
    .text 0x80200000: 
    {
        KEEP(*(.text._start))
        KEEP(*(.text.boot))
        *(.text*)
    }

    .rodata : ALIGN(16)
    {
        *(.rodata*)
    }

    .data : ALIGN(16)
    {
        *(.data*)
    }

    .bss : ALIGN(16)
    {
        *(.bss*)
        *(COMMON)
    }
    . = ALIGN(16);
    . += 128 * 1024; /* 128KB */
    _stack_top = .;
}
