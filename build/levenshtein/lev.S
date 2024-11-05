	.att_syntax
	.text
	.p2align	5
	.globl	_levenshtein
	.globl	levenshtein
_levenshtein:
levenshtein:
	movq	%rsp, %rax
	leaq	-56(%rsp), %rsp
	andq	$-8, %rsp
	movq	%rbx, (%rsp)
	movq	%rbp, 8(%rsp)
	movq	%r12, 16(%rsp)
	movq	%r13, 24(%rsp)
	movq	%r14, 32(%rsp)
	movq	%r15, 40(%rsp)
	movq	%rax, 48(%rsp)
	movq	%r8, %rax
	addq	$2, %rax
	movq	$0, %r9
	jmp 	Llevenshtein$11
Llevenshtein$12:
	movq	%r9, (%rdi,%r9,8)
	incq	%r9
Llevenshtein$11:
	cmpq	%rax, %r9
	jb  	Llevenshtein$12
	movq	$1, -8(%rdi,%rax,8)
	movq	$0, %r13
	movq	$0, %r9
	movq	%rcx, %r10
	addq	$-1, %r10
	jmp 	Llevenshtein$1
Llevenshtein$2:
	movq	$0, %r11
	jmp 	Llevenshtein$5
Llevenshtein$6:
	movq	%r13, %r12
	addq	$-1, %r12
	cmpq	$0, %r12
	jnl 	Llevenshtein$10
	movq	%rax, %r12
	addq	$-1, %r12
Llevenshtein$10:
	movq	%r13, %rbx
	incq	%rbx
	cmpq	%rax, %rbx
	jb  	Llevenshtein$9
	movq	$0, %rbx
Llevenshtein$9:
	movq	$0, %rbp
	movb	(%rsi,%r9), %r14b
	movb	(%rdx,%r11), %r15b
	cmpb	%r15b, %r14b
	je  	Llevenshtein$8
	movq	$1, %rbp
Llevenshtein$8:
	movq	(%rdi,%r12,8), %r12
	incq	%r12
	movq	(%rdi,%rbx,8), %rbx
	incq	%rbx
	movq	(%rdi,%r13,8), %r14
	addq	%rbp, %r14
	movq	%r12, %rbp
	cmpq	%rbx, %r12
	cmovnbe	%rbx, %rbp
	cmpq	%r14, %rbp
	cmovnbe	%r14, %rbp
	movq	%rbp, (%rdi,%r13,8)
	incq	%r13
	cmpq	%rax, %r13
	jb  	Llevenshtein$7
	movq	$0, %r13
Llevenshtein$7:
	incq	%r11
Llevenshtein$5:
	cmpq	%r8, %r11
	jb  	Llevenshtein$6
	cmpq	%r10, %r9
	jnb 	Llevenshtein$3
	movq	%r9, %r11
	addq	$2, %r11
	movq	%r11, (%rdi,%r13,8)
	incq	%r13
	cmpq	%rax, %r13
	jb  	Llevenshtein$3
	movq	$0, %r13
Llevenshtein$4:
Llevenshtein$3:
	incq	%r9
Llevenshtein$1:
	cmpq	%rcx, %r9
	jb  	Llevenshtein$2
	movq	(%rdi,%r13,8), %rax
	movq	(%rsp), %rbx
	movq	8(%rsp), %rbp
	movq	16(%rsp), %r12
	movq	24(%rsp), %r13
	movq	32(%rsp), %r14
	movq	40(%rsp), %r15
	movq	48(%rsp), %rsp
	ret
