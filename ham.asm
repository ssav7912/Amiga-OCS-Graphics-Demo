DMACONR EQU $dff002
ADKCONR EQU $dff010
INTENAR EQU $dff01c
INTREQR EQU $dff01e

DMACON  EQU $dff096
ADKCON  EQU $dff09e
INTENA  EQU $dff09a
INTREQ  EQU $dff09c

BPLCON0 EQU $dff100
BPLCON1 EQU $dff102
BPL1MOD EQU $dff108
BPL2MOD EQU $dff10a
DIWSTRT EQU $dff08e
DIWSTOP EQU $dff090
DDFSTRT EQU $dff092
DDFSTOP EQU $dff094
VPOSR   EQU $dff004
COP1LCH EQU $dff080

CIAAPRA EQU $bfe001

init:
            move.w     DMACONR,d0
            or.w       #$8000,d0
            move.w     d0,oldmareq
            move.w     INTENAR,d0
            or.w       #$8000,d0
            move.w     d0,oldintena
            move.w     INTREQR,d0
            or.w       #$8000,d0
            move.w     d0,oldintreq
            move.w     ADKCONR,d0
            or.w       #$8000,d0
            move.w     d0,oldadkcon

            move.l     $4,a6                        ; address for exec.library
            move.l     #gfxname,a1                  ;string for graphics.library
            moveq      #0,d0                        ;lib version we want. 0 = any
            jsr        -552(a6)                     ;OpenLibrary function
            move.l     d0,gfxbase 
            move.l     d0,a6
            move.l     34(a6),oldview
            move.l     38(a6),oldcopper

            move.l     #0,a1
            jsr        -222(a6)                     ;LoadView Function
            jsr        -270(a6)                     ;WaitTOF (wait for vertical blank?)
            jsr        -270(a6)                     ;WaitTOF
            move.l     $4,a6                        ;back to exec.library
            jsr        -132(a6)                     ;Forbid multitasking

            ;setup keyboard
            tst.b      $bfed01
            move.b     #$88,$bfed01
            and.b      #$bf,$bfee01


            move.w     #$6a00,BPLCON0               ; 6 bitplanes HAM
            move.w     #$0000,BPLCON1
            move.w     #$00c8,BPL1MOD               ;jump 200 bytes to next raster line
            move.w     #$00c8,BPL2MOD 
            move.w     #$2c81,DIWSTRT               ;topleft corner
            move.w     #$f4c1,DIWSTOP               ;bottom right corner
            move.w     #$38c1,DIWSTOP
            move.w     #$0038,DDFSTRT
            move.w     #$00d0,DDFSTOP
            move.w     #%1000000110000000,DMACON    ;Set DMA on for bitplane/copper
            move.w     #%0000000001111111,DMACON    ; set DMA explicitly disabled for all else
            move.w     #%1100000000000000,INTENA    ; enable master interrupt
            move.w     #%0011111111111111,INTENA    ; disable all other interrupts

mainloop:
            move.l     frame,d1                     ;framecounter
            move.l     #copper,a6                   ;copperlist in mem - $dff000?
            addq.l     #1,d1                        ;increase frame
            move.l     d1,frame                     ;move back to mem


  ; bitplane 1
            move.l     #bitplanes,d0
            move.w     #$00e2,(a6)+                 ;move and increment by word (16bits)
            move.w     d0,(a6)+                     ;dff0e2 - start of bitplane?
            swap       d0                           ;LOW to HIGH
            move.w     #$00e0,(a6)+
            move.w     d0,(a6)+

  ;bitplane 2
            move.l     #bitplanes+40,d0
            move.w     #$00e6,(a6)+
            move.w     d0,(a6)+
            swap       d0
            move.w     #$00e4,(a6)+
            move.w     d0,(a6)+

  ;bitplane 3
            move.l     #bitplanes+80,d0
            move.w     #$00ea,(a6)+
            move.w     d0,(a6)+
            swap       d0
            move.w     #$00e8,(a6)+
            move.w     d0,(a6)+
  ;bitplane 4
            move.l     #bitplanes+120,d0
            move.w     #$00ee,(a6)+
            move.w     d0,(a6)+
            swap       d0
            move.w     #$00ec,(a6)+
            move.w     d0,(a6)+

 ;bitplane 5
            move.l     #bitplanes+160,d0
            move.w     #$00f2,(a6)+
            move.w     d0,(a6)+
            swap       d0
            move.w     #$00f0,(a6)+
            move.w     d0,(a6)+

 ;bitplane 6
            move.l     #bitplanes+200,d0
            move.w     #$00f6,(a6)+
            move.w     d0,(a6)+
            swap       d0
            move.w     #$00f4,(a6)+
            move.w     d0,(a6)+

            ; move.l     #$019e0321,(a6)+
            ; move.l     #$019c0632,(a6)+
            ; move.l     #$019a0554,(a6)+
            ; move.l     #$01980853,(a6)+
            ; move.l     #$01960766,(a6)+
            ; move.l     #$01940b63,(a6)+
            ; move.l     #$01920975,(a6)+
            ; move.l     #$01900987,(a6)+
            ; move.l     #$018e0c86,(a6)+
            ; move.l     #$018c0999,(a6)+
            ; move.l     #$018a0aaa,(a6)+
            ; move.l     #$01880ba8,(a6)+
            ; move.l     #$01860bbb,(a6)+
            ; move.l     #$01840cca,(a6)+
            ; move.l     #$01820dcc,(a6)+
            ; move.l     #$01800eee,(a6)+
            
            move.l     #$019e0eee,(a6)+
            move.l     #$019c0dcc,(a6)+
            move.l     #$019a0cca,(a6)+
            move.l     #$01980bbb,(a6)+
            move.l     #$01960ba8,(a6)+
            move.l     #$01940aaa,(a6)+
            move.l     #$01920999,(a6)+
            move.l     #$01900c86,(a6)+
            move.l     #$018e0987,(a6)+
            move.l     #$018c0975,(a6)+
            move.l     #$018a0b63,(a6)+
            move.l     #$01880766,(a6)+
            move.l     #$01860853,(a6)+
            move.l     #$01840554,(a6)+
            move.l     #$01820632,(a6)+
            move.l     #$01800321,(a6)+


            ;end the list
            move.l     #$fffffffe,(a6)+

            ;mouse test
            btst.b     #6,CIAAPRA
            beq        exit
            btst.b     #7,CIAAPRA
            beq        exit

            ;keyboard test - only check for q key
            move.b     $bfec01,d0 ;move contents of keyboard register into scratch
            btst       #0,d0
            not.b      d0
            lsr.b      #1,d0 ;bit magic stuff idk
            cmpi.b     #$10,d0 
            beq        exit
            bne        _notKey

_notKey:    ;if it's not the key we want we need to wait 85us. SILLY
            bset       #6,$bfee01
            move.l     VPOSR,d0
            lsr.l      #8,d0
            and.w      #$01ff,d0
            moveq      #2-1,d1
_keyboardWait85us:
            move.l     VPOSR,d2
            lsr.l      #8,d2
            and.w      #$01ff,d2 ;wait 2 raster lines?
            cmp.w      d0,d2 
            beq        _keyboardWait85us
            move.w     d2,d0
            dbf        d1,_keyboardWait85us

            bclr       #6,$bfee01


waitVB:
            move.l     VPOSR,d0
            and.l      #$1ff00,d0
            cmp.l      #300<<8,d0
            bne        waitVB

            move.l     #copper,a6
            move.l     a6,COP1LCH
            bra        mainloop

exit:
            move.w     #$7fff,DMACON
            move.w     oldmareq,DMACON
            move.w     #$7fff,INTENA
            move.w     oldintena,INTENA
            move.w     #$7fff,INTREQ
            move.w     oldintreq,INTREQ
            move.w     #$7fff,ADKCON
            move.w     oldadkcon,ADKCON

            move.l     oldcopper,COP1LCH
            move.l     gfxbase,a6
            move.l     oldview,a1
            jsr        -222(a6)
            jsr        -270(a6)
            jsr        -270(a6)
            move.l     $4,a6
            jsr        -138(a6)

            rts 


  ;DATA
            CNOP       0,4
oldview:    dc.l       0
oldcopper:  dc.l       0
gfxbase:    dc.l       0
lolbase:    dc.l       0
frame:      dc.l       0

            CNOP       0,4
oldmareq:   dc.w       0
oldintreq:  dc.w       0
oldintena:  dc.w       0
oldadkcon:  dc.w       0

            CNOP       0,4
gfxname:    dc.b       'graphics.library',0
  
            Section    ChipRAM,Data_c

            CNOP       0,4
bitplanes:
            incbin     "smudge.raw",$74
            blk.b      320/8*6*(200-160),0          ;reserve mem for 5 bitplanes? idk what 200-160 does here

            CNOP       0,4

copper:
            dc.l       $ffffffe
            blk.l      1023,0