extern char _stack_top[];
extern void kernel_main(void);

__attribute__((section(".text.boot"))) __attribute__((naked)) void boot(void)
{
    asm volatile(
        "mv sp, %[_stack_top]\n"
        "j kernel_main\n" ::[_stack_top] "r"(_stack_top));
}
