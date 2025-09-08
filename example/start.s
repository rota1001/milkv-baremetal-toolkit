# Modified from https://community.milkv.io/t/opensbi/681
	.section .text
	.global _start
_start:
	j boot
	.balign 4
	.word 0x33334c42
	.word 0xdeadbeea
	.word 0xdeadbeeb
	.quad 0x80200000
	.word 0xdeadbeec
