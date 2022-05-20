;
;		True if TOS < HL
;
		.export __ccgteq

		.setcpu 8085

		.code
;
;	The 8080 doesn't have signed comparisons directly
;
;	The 8085 has K which might be worth using TODO
;
__ccgteq:
		xchg
		pop	h
		shld	__retaddr
		pop	h
		mov	a,h
		xra	d
		jp	sign_same
		xra	d		; A is now H
		jp	__rfalse
		jmp	__rtrue
sign_same:
		mov	a,e
		sub	l
		mov	a,d
		sbb	h
		jc	__rfalse
		jmp	__rtrue

