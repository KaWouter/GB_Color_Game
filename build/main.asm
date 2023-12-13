;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.3.2 #14228 (MINGW64)
;--------------------------------------------------------
	.module main
	.optsdcc -msm83
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _set_sprite_data
	.globl _wait_vbl_done
	.globl _joypad
	.globl _smile
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;../main.c:13: void main(){
;	---------------------------------
; Function main
; ---------------------------------
_main::
;../main.c:16: uint8_t x = 55; // Our beginning x coord
;../main.c:17: uint8_t y = 75; // Our beginning y coord
	ld	bc, #0x4b37
;../main.c:19: SPRITES_8x8;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xfb
	ldh	(_LCDC_REG + 0), a
;../main.c:21: set_sprite_data(0, 1, smile);
	ld	de, #_smile
	push	de
	xor	a, a
	inc	a
	push	af
	call	_set_sprite_data
	add	sp, #4
;c:\users\woute\documents\github\gb_color_game\gbdk\include\gb\gb.h:1804: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
	ld	(hl), #0x00
;c:\users\woute\documents\github\gb_color_game\gbdk\include\gb\gb.h:1877: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
;c:\users\woute\documents\github\gb_color_game\gbdk\include\gb\gb.h:1878: itm->y=y, itm->x=x;
	ld	a, #0x4b
	ld	(hl+), a
	ld	(hl), #0x37
;../main.c:25: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;../main.c:27: while(1){
00110$:
;../main.c:28: joydata = joypad(); // Read once per frame and cache the result
	call	_joypad
	ld	e, a
;../main.c:30: if (joydata & J_RIGHT) // If RIGHT is pressed
	bit	0, e
	jr	Z, 00102$
;../main.c:32: x++;
	inc	c
;c:\users\woute\documents\github\gb_color_game\gbdk\include\gb\gb.h:1877: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
;c:\users\woute\documents\github\gb_color_game\gbdk\include\gb\gb.h:1878: itm->y=y, itm->x=x;
	ld	(hl), b
	inc	hl
	ld	(hl), c
;../main.c:33: move_sprite(0,x,y); // move sprite 0 to x and y coords
00102$:
;../main.c:36: if (joydata & J_LEFT)  // If LEFT is pressed
	bit	1, e
	jr	Z, 00104$
;../main.c:38: x--;
	dec	c
;c:\users\woute\documents\github\gb_color_game\gbdk\include\gb\gb.h:1877: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
;c:\users\woute\documents\github\gb_color_game\gbdk\include\gb\gb.h:1878: itm->y=y, itm->x=x;
	ld	(hl), b
	inc	hl
	ld	(hl), c
;../main.c:39: move_sprite(0,x,y); // move sprite 0 to x and y coords
00104$:
;../main.c:42: if (joydata & J_UP)  // If UP is pressed
	bit	2, e
	jr	Z, 00106$
;../main.c:44: y--;
	dec	b
;c:\users\woute\documents\github\gb_color_game\gbdk\include\gb\gb.h:1877: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
;c:\users\woute\documents\github\gb_color_game\gbdk\include\gb\gb.h:1878: itm->y=y, itm->x=x;
	ld	(hl), b
	inc	hl
	ld	(hl), c
;../main.c:45: move_sprite(0,x,y); // move sprite 0 to x and y coords
00106$:
;../main.c:48: if (joydata & J_DOWN)  // If DOWN is pressed
	bit	3, e
	jr	Z, 00108$
;../main.c:50: y++;
	inc	b
;c:\users\woute\documents\github\gb_color_game\gbdk\include\gb\gb.h:1877: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
;c:\users\woute\documents\github\gb_color_game\gbdk\include\gb\gb.h:1878: itm->y=y, itm->x=x;
	ld	(hl), b
	inc	hl
	ld	(hl), c
;../main.c:51: move_sprite(0,x,y); // move sprite 0 to x and y coords
00108$:
;../main.c:54: wait_vbl_done(); // Idle until next frame
	call	_wait_vbl_done
;../main.c:56: }
	jr	00110$
_smile:
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x42	; 66	'B'
	.db #0x42	; 66	'B'
	.db #0x81	; 129
	.db #0x81	; 129
	.db #0xa5	; 165
	.db #0xa5	; 165
	.db #0x81	; 129
	.db #0x81	; 129
	.db #0x81	; 129
	.db #0xa5	; 165
	.db #0x42	; 66	'B'
	.db #0x5a	; 90	'Z'
	.db #0x3c	; 60
	.db #0x3c	; 60
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
