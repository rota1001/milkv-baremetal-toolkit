

void sbi_call(long arg0,
              long arg1,
              long arg2,
              long arg3,
              long arg4,
              long arg5,
              long fid,
              long eid)
{
    register long a0 asm("a0") = arg0;
    register long a1 asm("a1") = arg1;
    register long a2 asm("a2") = arg2;
    register long a3 asm("a3") = arg3;
    register long a4 asm("a4") = arg4;
    register long a5 asm("a5") = arg5;
    register long a6 asm("a6") = fid;
    register long a7 asm("a7") = eid;
    asm volatile("ecall\n"
                 : "+r"(a0), "+r"(a1)
                 : "r"(a2), "r"(a3), "r"(a4), "r"(a5), "r"(a6), "r"(a7));
}


void putchar(long c)
{
    if (c == '\n')
        sbi_call('\r', 0, 0, 0, 0, 0, 0, 1);
    sbi_call(c, 0, 0, 0, 0, 0, 0, 1);
}

char s[] = "helloworld\r\n";

void kernel_main(void)
{
    while (1)
        for (int i = 0; i <= 12; i++)
            putchar(s[i]);
}