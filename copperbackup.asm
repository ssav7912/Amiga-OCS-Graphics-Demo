;----------------------------------
;CUSTOM REGISTER MNEMONICS
;----------------------------------
DMACONR    EQU $dff002
ADKCONR    EQU $dff010
INTENAR    EQU $dff01c
INTREQR    EQU $dff01e

DMACON     EQU $dff096
ADKCON     EQU $dff09e
INTENA     EQU $dff09a
INTREQ     EQU $dff09c

BPLCON0    EQU $dff100
BPLCON1    EQU $dff102
BPLCON2    EQU $dff104
BPL1MOD    EQU $dff108
BPL2MOD    EQU $dff10a
DIWSTRT    EQU $dff08e
DIWSTOP    EQU $dff090
DDFSTRT    EQU $dff092
DDFSTOP    EQU $dff094
VPOSR      EQU $dff004
COP1LCH    EQU $dff080

CIAAPRA    EQU $bfe001

;------------------------------------------
;GLOBAL CONSTANTS
;------------------------------------------
BACKGROUND EQU $01800022

GREENEND   EQU $64
BLUEEND    EQU $96


;------------------------------------------
;CODE
;------------------------------------------

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

            move.w     #%1000000111100000,DMACON    ; Set DMA on for bitplane/copper
            move.w     #%0000000000011111,DMACON    ; Set DMA explicitly disabled for all else
            move.w     #%1100000000000000,INTENA    ; enable master interrupt

        
            move.w     #$1200,BPLCON0               ; Setup 1 bitplane 4 sprites
            move.w     #$0000,BPL1MOD
            move.w     #$0000,BPLCON1
            move.w     #$0024,BPLCON2               ; sprite priority
            move.w     #$0038,DDFSTRT
            move.w     #$00d0,DDFSTOP

            move.w     #$2c81,DIWSTRT
            move.w     #$f4c1,DIWSTOP
            move.w     #$38c1,DIWSTOP               ; PAL 256 Vline screen trick


            lea.l      currentframe,a4
            

mainloop:
            move.l     frame,d1
            addq.l     #1,d1
            move.l     d1,frame
            move.l     #copper,a6



            cmp.l      #$ff,d1
            bls        bunk

            move.l     #title,d0
            move.l     #titlepos,a3
            move.l     (a3),a3
            move.l     (a3)+,(a6)+
            move.l     a3,titlepos
            bra        playplane
            

bunk:
            ; bunk plane
            move.l     #plane,d0

playplane:
            jsr        pushplane

            ; spritepalette
            move.l     #BACKGROUND,(a6)+
            move.l     #$01a0005a,(a6)+
            move.l     #$01a2005a,(a6)+
            move.l     #$01a4005a,(a6)+
            move.l     #$01a6005a,(a6)+
            move.l     #$01a8005a,(a6)+
            move.l     #$01aa005a,(a6)+
            move.l     #$01ac005a,(a6)+
            move.l     #$01ae005a,(a6)+
            move.l     #$01b0005a,(a6)+
            move.l     #$01b2005a,(a6)+

            ; Wait until redbar at end before starting spritewalk
            move.l     redpos,d2
            swap       d2
            cmpi.b     #$30,d2
            bhi        bars

            ; test if spritepos = middle. Better way to start/stop?
            move.w     spritepos,d2
            cmpi.b     #$64,d2
            bhs        _noupdate

            and.l      #$4-1,d1
            tst.b      d1    
            bne        _noreset

            addq.l     #$4,a4
            cmp.l      #$fffffffe,(a4)
            bne        _noreset

            lea.l      currentframe,a4





            ; sprite routine
            ; could probably make faster by incorporating updatesprite into writesprite loop
            ; will look into if causes problems
_noreset:
            move.w     spritepos,d2
            addq.b     #$1,d2
            move.w     d2,spritepos
            
_noupdate:
            move.l     (a4),a2                      ;currentframe pointer into a2 (tilesetpointer)
            jsr        updatesprite                 ; update sprite pos 
            
            move.l     (a4),a2                      ; reset tilecounter
            jsr        writesprites                 ;write da sprites

bars:
            move.l     frame,d1

            ; copper bars 
            cmp.l      #$64,d1                      ;branch to mousetest if < 2 seconds
            blt        endbars

            move.l     redpos,d3                    ; waitpos V = 2c H = 85 every frame
            move.l     #$01800f00,d0

            jsr        createbar                    ;creates a bar

            cmp.l      #$c8,d1                      ;frame 150 green bar
            blt        endbars

            move.l     #$018000f0,d0
            move.l     greenpos,d3

            jsr        createbar

            cmp.l      #$12c,d1
            blt        endbars

            move.l     #$0180000f,d0
            move.l     bluepos,d3

            jsr        createbar

endbars:

            move.l     #$fffffffe,(a6)+

                        
mouse:
            btst.b     #6,CIAAPRA
            beq        exit
            btst.b     #7,CIAAPRA
            beq        exit

keyboard:
            ;keyboard test - only check for q key
            move.b     $bfec01,d0                   ; move contents of keyboard register into scratch
            btst       #0,d0
            not.b      d0
            lsr.b      #1,d0                        ; bit magic stuff idk
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
            and.w      #$01ff,d2                    ;wait 2 raster lines?
            cmp.w      d0,d2 
            beq        _keyboardWait85us
            move.w     d2,d0
            dbf        d1,_keyboardWait85us

            bclr       #6,$bfee01

waitVB: 
            move.l     VPOSR,d0                     ; busy loop - how to improve? Look into IRQ
            and.l      #$1ff00,d0
            cmp.l      #300<<8,d0
            bne        waitVB


            move.l     frame,d1
            cmpi.l     #$64,d1
            blo        cop

_red:
            move.l     redpos,d3

            swap       d3
            cmpi.b     #$30,d3
            blo        _green  


            subq.b     #$2,d3                       ; subtract 2, scroll horizontally from right
            swap       d3
            move.l     d3,redpos


_green:
            move.l     frame,d1
            cmp.l      #$c8,d1
            blo        cop

            move.l     greenpos,d3                  ; change hpos for green

            swap       d3
            cmpi.b     #GREENEND,d3
            blo        _blue


            subq.b     #$2,d3
            swap       d3
            move.l     d3,greenpos


_blue:
            move.l     frame,d1
            cmp.l      #$12c,d1
            blo        cop

           
            move.l     bluepos,d3                   ; change hpos for blue 
      
            swap       d3
            cmpi.b     #BLUEEND,d3
            blo        cop
      
            subq.l     #$2,d3
            swap       d3
            move.l     d3,bluepos
            
cop:

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

;---------------------------------------------------------------
;SUBROUTINES
;---------------------------------------------------------------

; Draws a copper bar of a given height and width on screen
; createbar(d3,d0,a6)
;   - d3 is WAITPOS value - defines vertical and horizontal start of bar
;   - d0 is the colour of the bar. This operates on the background palette
;   - a6 is a pointer to the copperlist - make sure this doesn't overwrite/is overwritten by existing copper instructions!

;   -d4,d5 are used as scratch, and are recovered at RTS
;   - a0 is used as scratch - VALUE IS LOST!
; OUT:
;   -Instructions in copperlist corresponding to a single raster bar
createbar:  ;d3 is WAITPOS pointer, d0 is colour. a6 is copperlist.
            ;subroutine initialise - store old register states in mem
            move.l     #barstorage,a0
            move.l     d0,(a0)+
            move.l     d3,(a0)+
            move.l     d4,(a0)+
            move.l     d5,(a0)+

            move.l     #BACKGROUND,(a6)+            ;move background into color00

            move.l     #$0a,d4                      ;setup loop counter - this corresponds to height of bar

            inline
_loop:
            move.l     d3,(a6)+                     ;move waitpos into copperlist
            move.l     d0,(a6)+                     ;move new colour into copperlist

            swap       d3                           ;swap waitpos to fffe[xxxx]
            move.l     d3,d5                
            move.b     #$ff,d5                      ;d5 stores the endpos
            swap       d5                           ;swap back around to [xxff]fffe

            move.l     d5,(a6)+
            move.l     #BACKGROUND,(a6)+            ;move back to correct colour

            add.w      #$0100,d3                    ;change VPOSwait
            swap       d3

            subq.b     #$1,d4                       ;decrement loop
            cmp.w      #$0,d4
            bne        _loop

            einline

            ;cleanup and restore registers
            move.l     #barstorage,a0
            move.l     (a0)+,d0
            move.l     (a0)+,d3
            move.l     (a0)+,d4
            move.l     (a0)+,d5

            rts

; writes sprite instructions to copperlist
; consumes d0,d1 as scratch
; uses d2 as SPRxPTx register pointer starting from register 0
; uses a2 as sprite STRUCT pointer
; a3 is scratch register recovery - It is discarded!
; uses a6 as copperlist pointer
writesprites: 
            move.l     #barstorage,a3
            move.l     d0,(a3)+
            move.l     d1,(a3)+
            move.l     d2,(a3)+
            move.l     a2,(a3)+

            move.b     #$6,d1
            ;move.l     #frame1,a2                   ;frame1 pointer - double indirection... Potentially triple...?

            move.l     #$01200122,d2                ; SPR0PTL.SPR0PTH packed into a long.
            inline 
_spriteloop:
            move.l     (a2)+,d0                     ; move sprite pointer to scratch and increment
            move.w     d2,(a6)+                     ; move SPRxPTH pointer (HI)?
            move.w     d0,(a6)+                     ; move low bits of sprite address

            swap       d2                           ;swap to LO word register
            swap       d0                           ;swap to LO word pointer
            
            move.w     d2,(a6)+                     ; move SPRxPTL pointer (LO)
            move.w     d0,(a6)+                     ; move HI bits of sprite address 


            ; increments sprite register pointers. Because pointers need to be written into copperlist IN THIS ORDER:
            ; xPTH, HI_word 
            ; xPTL, LO_word

            ; and n+1PTL = nPTL + 4 bytes and n+1PTH = nPTH + 4 bytes:
            ; we add $00040004 to our packed long to get to the next set of sprite registers  
            swap       d2
            add.l      #$00040004,d2                ;increment sprite register pointers.


            subq.b     #$1,d1                       ;test counter
            cmp.b      #$0,d1
            bne        _spriteloop
            einline

            ; recover registers
            move.l     #barstorage,a3
            move.l     (a3)+,d0
            move.l     (a3)+,d1
            move.l     (a3)+,d2
            move.l     (a3)+,a2

            rts


; Update pos of every tile in given sprite struct
; consumes d0 as newpos word of format $VVHH
; consumes a3 as pointer to spritestruct
; consumes a2 as pointer to spritestruct
; Loops through struct until it sees end-words: $fffffffe
updatesprite:
            move.w     spritepos,d0

            inline
_updateloop:
            move.l     (a2)+,a3                     ;frame ---> fx_0

            move.w     d0,(a3)
            addq.b     #$8,d0                       ;increment HPOS by 8 so that tiles stitch nicely 

            cmp.l      #$fffffffe,a3
            bne        _updateloop
            einline

            rts

;BITPLANE ZERO
; TODO:
; Rewrite for any bitplane(s).
;consumes d0 as bitplane pointer
pushplane:
            move.w     #$00e2,(a6)+
            move.w     d0,(a6)+
            swap       d0
            move.w     #$00e0,(a6)+
            move.w     d0,(a6)+ 
            
            rts




;------------------------------------------------------------
;DATA
;------------------------------------------------------------
            CNOP       0,4
oldview:    dc.l       0
oldcopper:  dc.l       0
gfxbase:    dc.l       0
frame:      dc.l       0

; POS for bars - copper WAIT instruction format
; Offset is prev + height + 5 spacing

redpos:     dc.l       $96fffffe 
greenpos:   dc.l       $a5fffffe 
bluepos:    dc.l       $b4fffffe


            CNOP       0,4
oldmareq:   dc.w       0
oldintreq:  dc.w       0
oldintena:  dc.w       0
oldadkcon:  dc.w       0


            CNOP       0,4

spritepos:  dc.w       $6d00

            CNOP       0,4

barstorage:
            blk.l      8,0

            CNOP       0,4

gfxname:    dc.b       'graphics.library',0

            CNOP       0,4

titletransition:
            dc.l       $01820022
            dc.l       $01820155
            dc.l       $01820488
            dc.l       $018208bb
            dc.l       $01820dee

titlepos:
            dc.l       titletransition

            CNOP       0,4
            Section    ChipRAM,Data_c

title:
            incbin    "title.raw",$45
            blk.b      320/8*3*(200-160),0

            CNOP       0,2

            ; cat sprite definitions
            include    "cat.i"

            CNOP       0,4
plane:
            blk.l      $1999,0

            CNOP       0,4
copper:
            dc.l       BACKGROUND
            dc.w       $ffff,$fffe
            blk.b      1023,0

            CNOP       0,4

            

