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
CIAICR     EQU $bfed01

;------------------------------------------
;GLOBAL CONSTANTS
;------------------------------------------
BACKGROUND EQU $01800022

GREENEND   EQU $64
BLUEEND    EQU $96

TITLESTART EQU 800                                                             ; frame counter
TITLEEND   EQU TITLESTART+300
PLANESTART EQU TITLEEND+300
HEARTTRANS EQU PLANESTART+3850                                                  ; 3800
HEARTSTART EQU HEARTTRANS+450                                                 ;reminder fix to 3800
HAMTRANS   EQU HEARTSTART+450
HAMSTART   EQU HAMTRANS+500                                            



;------------------------------------------
;MACROS
;------------------------------------------
                   macro             breakpoint
                   clr.l             $100
                   endm

                   macro             pushHAMpalette
                   move.l            (a3)+,(a6)+
                   move.l            (a3)+,(a6)+
                   move.l            (a3)+,(a6)+
                   move.l            (a3)+,(a6)+
                   move.l            (a3)+,(a6)+
                   move.l            (a3)+,(a6)+
                   move.l            (a3)+,(a6)+
                   move.l            (a3)+,(a6)+
                   move.l            (a3)+,(a6)+
                   move.l            (a3)+,(a6)+
                   move.l            (a3)+,(a6)+
                   move.l            (a3)+,(a6)+
                   move.l            (a3)+,(a6)+
                   move.l            (a3)+,(a6)+
                   move.l            (a3)+,(a6)+
                   move.l            (a3)+,(a6)+
                   endm

             ;macro for pushing plane to copperlist. \1: pointer to bitplane
             ;\2: value of HI bitplane pointer
             ;\3: value of LO bitplane pointer
                   macro             pushPlane
                   move.l            \1,d0
                   move.w            \3,(a6)+
                   move.w            d0,(a6)+
                   swap              d0
                   move.w            \2,(a6)+
                   move.w            d0,(a6)+
                   endm

                   macro             findModulo
                   move.w            debug,d3
                   addq.w            #2,d3
                   move.w            d3,debug
                   endm
;------------------------------------------
;CODE
;------------------------------------------

init:
                   move.w            DMACONR,d0
                   or.w              #$8000,d0
                   move.w            d0,oldmareq
                   move.w            INTENAR,d0
                   or.w              #$8000,d0
                   move.w            d0,oldintena
                   move.w            INTREQR,d0
                   or.w              #$8000,d0
                   move.w            d0,oldintreq
                   move.w            ADKCONR,d0
                   or.w              #$8000,d0
                   move.w            d0,oldadkcon

                   move.l            $4,a6                                     ; address for exec.library
                   move.l            #gfxname,a1                               ;string for graphics.library
                   moveq             #0,d0                                     ;lib version we want. 0 = any
                   jsr               -552(a6)                                  ;OpenLibrary function
                   move.l            d0,gfxbase 
                   move.l            d0,a6
                   move.l            34(a6),oldview
                   move.l            38(a6),oldcopper

                   move.l            #0,a1
                   jsr               -222(a6)                                  ;LoadView Function
                   jsr               -270(a6)                                  ;WaitTOF (wait for vertical blank?)
                   jsr               -270(a6)                                  ;WaitTOF
                   move.l            $4,a6                                     ;back to exec.library
                   jsr               -132(a6)                                  ;Forbid multitasking

            ;setup keyboard
                   tst.b             $bfed01
                   move.b            #$88,$bfed01
                   and.b             #$bf,$bfee01

                   move.w            #%1000000111100000,DMACON                 ; Set DMA on for bitplane/copper
                   move.w            #%0000000000011111,DMACON                 ; Set DMA explicitly disabled for all else
                   move.w            #%1100000000000000,INTENA                 ; enable master interrupt

        
                   move.w            #$1200,BPLCON0                            ; Setup 1 bitplane for sprites
                   move.w            #$0000,BPLCON1
                   move.w            #$0000,BPL1MOD
                   move.w            #$0000,BPL2MOD
                   move.w            #$0024,BPLCON2                            ; sprite priority
                   move.w            #$0038,DDFSTRT
                   move.w            #$00d0,DDFSTOP

                   move.w            #$2c81,DIWSTRT
                   move.w            #$f4c1,DIWSTOP
                   move.w            #$38c1,DIWSTOP                            ; PAL 256 Vline screen trick


                   lea.l             currentframe,a4
            

mainloop:
                   move.l            frame,d1
                   addq.l            #1,d1
                   move.l            d1,frame
                   move.l            #copper,a6


                   cmp.l             #TITLESTART,d1
                   bls               bunk

                   cmp.l             #HAMTRANS,d1
                   bhi               HAMplanes

                   cmp.l             #HEARTSTART,d1
                   bhi               heartbeat

                   cmp.l             #HEARTTRANS,d1
                   bhi               prebunk

                   cmp.l             #PLANESTART,d1                            ; insert branch to end card here somewhere
                   bhi               plane1



                   move.l            #title,d0
            ;Foreground colour palette for titleplane
            ;list stepping is handled by waitVB
                   move.l            titlepos,d3 
                   lea.l             titletransition,a3
            ; index addressing mode: a3 + 0 + d3 (An+disp+Rn)
            ; for some reason can't simply do Rn(An)
                   move.l            0(a3,d3),(a6)+
                   bra               playplane
        
; First montage planes
plane1:

                   move.l            frame,d1
                   cmp.l             #HAMSTART,d1                              ;MESS!
                   bhi               HAMplanes

                   move.w            #$4200,BPLCON0

                   move.w            #$1b8-2,BPL1MOD
                   move.w            #$1b8-2,BPL2MOD


     

                   move.w            #$0038-8,DDFSTRT
            ;  move.w     #$015e,DDFSTOP

                   move.l            x_offset,d3                               ;current xoffset. d4 = word_skip, d5 = pixel_shift
            
                   divs              #16,d3
                   clr.l             d4
                   move.w            d3,d4
                   swap              d3
                   move.l            #16,d5
                   sub.w             d3,d5
             
                   cmp.w             #16,d5
                   bne               .nowordskip

                   subq.l            #1,d4
                   clr.l             d5
            

.nowordskip
                   move.l            d5,d6
                   lsl.l             #4,d6
                   or.l              d5,d6

                   move.w            d6,BPLCON1
                   muls              #2,d4

                   move.l            frame,d1



                   move.l            #montage_p1,d0
                   add.l             d4,d0
                   move.w            #$00e2,(a6)+
                   move.w            d0,(a6)+
                   swap              d0
                   move.w            #$00e0,(a6)+
                   move.w            d0,(a6)+

                   move.l            #montage_p1+1*120,d0                      ; 40 bytes per 320 px. 640px = 80 bytes
                   add.l             d4,d0
                   move.w            #$00e6,(a6)+
                   move.w            d0,(a6)+
                   swap              d0 
                   move.w            #$00e4,(a6)+
                   move.w            d0,(a6)+

                   move.l            #montage_p1+2*120,d0
                   add.l             d4,d0
                   move.w            #$00ea,(a6)+
                   move.w            d0,(a6)+
                   swap              d0
                   move.w            #$00e8,(a6)+
                   move.w            d0,(a6)+

                   move.l            #montage_p1+3*120,d0
                   add.l             d4,d0
                   move.w            #$00ee,(a6)+
                   move.w            d0,(a6)+
                   swap              d0
                   move.w            #$00ec,(a6)+
                   move.w            d0,(a6)+



                   move.l            #$01800000,(a6)+
                   move.l            #$01820222,(a6)+

                   move.l            #$01840521,(a6)+
                   move.l            #$01860543,(a6)+
                   move.l            #$01880a52,(a6)+
            
                   move.l            #$018a0765,(a6)+ 
                   move.l            #$018c0e44,(a6)+                          ;UP TO HERE - colors swizzled RGB-->BGR
                   move.l            #$018e0c62,(a6)+
             
                   move.l            #$01900976,(a6)+
                   move.l            #$01920988,(a6)+
                   move.l            #$01940d86,(a6)+

                   move.l            #$01960aa9,(a6)+
                   move.l            #$01980db8,(a6)+
                   move.l            #$019a0ccb,(a6)+
            
                   move.l            #$019c0ddc,(a6)+
                   move.l            #$019e0eee,(a6)+
                   move.l            #$01a00eee,(a6)+
                     
                   and.l             #$4-1,d1
                   tst.b             d1
                   bne               .noupdate
                   move.l            x_offset,d3
                   addq.l            #1,d3
                   move.l            d3,x_offset

.noupdate
                   move.l            frame,d1
                   bra               pushpalettes

HAMplanes:
                   move.w            #$6a00,BPLCON0
                   move.w            #$0000,BPLCON1
                   move.w            #$00c8,BPL1MOD
                   move.w            #$00c8,BPL2MOD
                   move.w            #$2c81,DIWSTRT
                   move.w            #$f4c1,DIWSTOP
                   move.w            #$38c1,DIWSTOP
                   move.w            #$0038,DDFSTRT

                   move.l            frame,d1
                   move.l            #end,d0
                   move.w            #$00e2,(a6)+
                   move.w            d0,(a6)+
                   swap              d0
                   move.w            #$00e0,(a6)+
                   move.w            d0,(a6)+

                   move.l            #end+40,d0
                   move.w            #$00e6,(a6)+
                   move.w            d0,(a6)+
                   swap              d0 
                   move.w            #$00e4,(a6)+
                   move.w            d0,(a6)+

                   move.l            #end+80,d0     
                   move.w            #$00ea,(a6)+
                   move.w            d0,(a6)+
                   swap              d0
                   move.w            #$00e8,(a6)+
                   move.w            d0,(a6)+

                   move.l            #end+120,d0
                   move.w            #$00ee,(a6)+
                   move.w            d0,(a6)+
                   swap              d0
                   move.w            #$00ec,(a6)+
                   move.w            d0,(a6)+

                   move.l            #end+160,d0
                   move.w            #$00f2,(a6)+
                   move.w            d0,(a6)+
                   swap              d0
                   move.w            #$00f0,(a6)+
                   move.w            d0,(a6)+

                   move.l            #end+200,d0
                   move.w            #$00f6,(a6)+
                   move.w            d0,(a6)+
                   swap              d0
                   move.w            #$00f4,(a6)+
                   move.w            d0,(a6)+


             ; transition in the palettes every 8 frames
                   lea.l             transitionpointer,a2
                   move.l            (a2),a2

                   and.l             #$8-1,d1
                   tst.b             d1
                   bne               .noupdate

                   cmp.l             #$fffffffe,(a2)
                   beq               .endlist       
             
                   move.l            (a2)+,a3
                   move.l            a2,transitionpointer
                   bra               .push

.endlist     
                   lea.l             plane_palette_4,a3

.noupdate
                   move.l            (a2),a3
                   move.l            a2,transitionpointer

.push
                   pushHAMpalette

                   move.l            #$fffffffe,(a6)+

                   bra               bars


heartbeat:
                   jsr               heartplane
                   bra               endbars

prebunk:
                   move.w            #$1200,BPLCON0
                   move.w            #$0000,BPLCON1
                   move.w            #$0000,BPL1MOD
                   move.w            #$0000,BPL2MOD
                   move.w            #$0038,DDFSTRT

                   
                   cmp.b             #$10,endpos
                   blo               bunk

                   sub.b             #$2,endpos


bunk:
            ; bunk plane

                   move.l            #plane,d0

playplane:
                   jsr               pushplane

pushpalettes:
            ; spritepalette - in theory shouldn't need all of this
                   move.l            #$01a2005a,(a6)+
                   move.l            #$01a4005a,(a6)+
                   move.l            #$01a6005a,(a6)+
                   move.l            #$01a8005a,(a6)+
                   move.l            #$01aa005a,(a6)+
                   move.l            #$01ac005a,(a6)+
                   move.l            #$01ae005a,(a6)+
                   move.l            #$01b0005a,(a6)+
                   move.l            #$01b2005a,(a6)+

            ; Wait until greenbar at end before starting spritewalk
                   move.l            bluepos,d2
                   swap              d2
                   cmpi.b            #$a0,d2
                   bhi               bars

            ;tests if sprite should start moving again
                   cmpi.l            #TITLEEND+30,d1
                   bhi               walk
            
            ; test if spritepos = middle. (64+96/4 bc offset is from back of smudge) Better way to start/stop?
                   move.w            spritepos,d2
                   cmpi.b            #$7c,d2
                   bhi               sit
                   bra               walk
             
sit:
                   jsr               sitsprite
                   bra               bars


walk:
                   move.l            #currentframe,anim_pointer
                   jsr               walksprite

            
;CopperBar routine

bars:


                   move.l            frame,d1

                   move.l            #BACKGROUND,d2 

            ; copper bars 
                   cmp.l             #$64,d1                                   ;branch to mousetest if < 2 seconds
                   blt               endbars

                   move.l            redpos,d3                                 ; waitpos V = 2c H = 85 every frame
                   move.l            #$01800f00,d0

                   jsr               createbar                                 ;creates a bar

                   cmp.l             #$c8,d1                                   ;frame 150 green bar
                   blt               endbars

                   move.l            #$018000f0,d0
                   move.l            greenpos,d3

                   jsr               createbar

                   cmp.l             #$12c,d1
                   blt               endbars

                   move.l            #$0180000f,d0
                   move.l            bluepos,d3

                   jsr               createbar

endbars:

                   move.l            #$fffffffe,(a6)+


; INPUT CHECKS

mouse:
                   btst.b            #6,CIAAPRA
                   beq               exit
                   btst.b            #7,CIAAPRA
                   beq               exit

keyboard:
            ;keyboard test - only check for q key
                   move.b            $bfec01,d0                                ; move contents of keyboard register into scratch
                   btst              #0,d0
                   not.b             d0
                   lsr.b             #1,d0                                     ; bit magic stuff idk
                   cmpi.b            #$10,d0 
                   beq               exit
                   bne               _notKey

_notKey:    ;if it's not the key we want we need to wait 85us. SILLY
                   bset              #6,$bfee01
                   move.l            VPOSR,d0
                   lsr.l             #8,d0
                   and.w             #$01ff,d0
                   moveq             #2-1,d1

_keyboardWait85us:
                   move.l            VPOSR,d2
                   lsr.l             #8,d2
                   and.w             #$01ff,d2                                 ;wait 2 raster lines?
                   cmp.w             d0,d2 
                   beq               _keyboardWait85us
                   move.w            d2,d0
                   dbf               d1,_keyboardWait85us

                   bclr              #6,$bfee01

;VERTICAL BLANKING

waitVB: 
                   move.l            VPOSR,d0                                  ; busy loop - how to improve? Look into IRQ
                   and.l             #$1ff00,d0
                   cmp.l             #300<<8,d0
                   bne               waitVB


                   move.w            spritepos,d2
                   cmpi.b            #$b0,d2
                   bhs               _setbackflag
                   bra               _startbars 

_setbackflag:
                   move.l            frame,d1
                   cmpi.l            #HEARTTRANS,d1
                   bls               .setflag

                   move.b            #$00,backflag
                   neg.b             bardecrement
                   move.b            #$fe,targetbarpos

                   bra               _startbars

.setflag
                   move.b            #$ff,backflag

_startbars:
            ;StartBars
                   move.l            frame,d1
                   cmpi.l            #$64,d1
                   blo               cop

                   cmpi.l            #HEARTTRANS+100,d1
                   bls               .continuebars
             
                   move.b            #$00,backflag

            

.continuebars
            ;test if its time to transition into the titlescreen, or transition out
            ;could probably be a subroutine.
                   cmpi.l            #TITLEEND,d1
                   bhi               fadeout

                   cmpi.l            #TITLESTART,d1
                   bls               _red

                   and.l             #16-1,d1
                   tst.b             d1
                   bne               _red

            ;increment foreground colour index. Check if > length of list (16)
                   move.l            titlepos,d3
                   cmpi.b            #$10,d3
                   bne               _dontendfade
                   beq               _endfade

_endfade:
                   move.l            #$10,titlepos
                   bra               _red

_dontendfade:
                   move.l            titlepos,d3
                   addq.b            #$4,d3 
                   move.l            d3,titlepos
                   bra               _red

;fade the title screen OUT
fadeout:

                   move.l            titlepos,d3
                   cmpi.b            #$0,d3
                   bne               _hasntfaded
                   beq               _hasfaded
_hasfaded:
                   move.l            #$0,titlepos
                   bra               _red

_hasntfaded:
                   move.l            titlepos,d3
                   subq.b            #$4,d3
                   move.l            d3,titlepos


; Handles horizontal scrolling of copperbar
_red:
                   move.l            redpos,d3
                   swap              d3



                   cmp.b             targetbarpos,d3
                   blo               _green  

             
                   sub.b             bardecrement,d3                           ; subtract 2, scroll horizontally from right
                   swap              d3
                   move.l            d3,redpos
                   bra               _green
                   
_green:
            ; test if its time to come on screen yet
                   move.l            frame,d1
                   cmp.l             #$c8,d1
                   blo               cop

            ;test if we need to move greenbar to the end 
                   move.b            backflag,d2
                   cmpi.b            #$ff,d2
                   beq               green_totheend  

                   move.l            greenpos,d3                               ; change hpos for green

                   swap              d3
                   cmpi.b            #GREENEND,d3
                   blo               _blue

green_totheend:
                   move.l            greenpos,d3
                   swap              d3
                   cmp.b             targetbarpos,d3


                   blo               _blue
    
             
                   sub.b             bardecrement,d3
                   swap              d3
                   move.l            d3,greenpos


_blue:
                   move.l            frame,d1
                   cmp.l             #$12c,d1
                   blo               cop

                   cmpi.b            #$ff,d2
                   beq               blue_totheend


                   move.l            bluepos,d3                                ; change hpos for blue 
      
                   swap              d3
                   cmpi.b            #BLUEEND,d3
                   blo               cop
      
blue_totheend:
                   move.l            bluepos,d3
                   swap              d3
                   cmp.b             targetbarpos,d3
                   blo               cop

                   sub.b             bardecrement,d3
                   swap              d3
                   move.l            d3,bluepos
            
cop:

                   move.l            #copper,a6
                   move.l            a6,COP1LCH
                   bra               mainloop


exit:
                   move.w            #$7fff,DMACON
                   move.w            oldmareq,DMACON
                   move.w            #$7fff,INTENA
                   move.w            oldintena,INTENA
                   move.w            #$7fff,INTREQ
                   move.w            oldintreq,INTREQ
                   move.w            #$7fff,ADKCON
                   move.w            oldadkcon,ADKCON

                   move.l            oldcopper,COP1LCH
                   move.l            gfxbase,a6
                   move.l            oldview,a1
                   jsr               -222(a6)
                   jsr               -270(a6)
                   jsr               -270(a6)
                   move.l            $4,a6
                   jsr               -138(a6)

                   rts 

;---------------------------------------------------------------
;SUBROUTINES
;---------------------------------------------------------------


; sit sprite routine
; Steps through a sitting animation routine. 
; initially checks if this is the first entry into routine (i.e. state change walking -> sitting)
; and updates the anim_pointer and a4 register to head of list, so that it reads the correct animation sequence
;
; steps through the framelist every 8 ticks. When at the end of the sit-down, hold for a little bit and then transition to
; sit-up state.
;consume d1 as framecount
;consume a4 as framelist pointer
;consume a2 as frame pointer
;consume a3 as scratch
;consume d2 as flag

sitsprite:
                   move.b            spritetransflag,d2                        ; test if this is first entry (i.e. state change) to subroutine, 
                   cmpi.b            #$ff,d2                                   ; need to setup animpointer if so
                   bne               .notfirst
             
                   move.l            #sit_currentframe,anim_pointer
                   lea.l             anim_pointer,a3
                   move.l            (a3),a4
                   move.b            #$00,spritetransflag
             
.notfirst
                   and.l             #$8-1,d1                                  ; increment frames only every 8 ticks
                   tst.b             d1
                   bne               .update

                   addq.l            #$4,a4
                   cmp.l             #$fffffffe,(a4)
                   bne               .update

                   move.l            frame,d1
                   cmpi.l            #TITLEEND-((14*8)-30),d1                  ;14 frames x 8 ticks per frame, minus the offset for walking to begin again
                   blo               .sub

                   lea.l             anim_pointer,a3                           ; compare anim_pointer against reverse_sit_currentframe to see if we want to sit up
                   move.l            #reverse_sit_currentframe,a2              ; or start walking again
                   cmp.l             (a3),a2
                   beq               .sub

                   move.l            #reverse_sit_currentframe,anim_pointer    ; state change from sit-down to sit-up
                   lea.l             anim_pointer,a3
                   move.l            (a3),a4
                   bra               .update
.sub
                   subq.l            #$4,a4                                    ; hold frame at end (sitting)

.update

                   move.l            (a4),a2
                   jsr               updatesprite

                   move.l            (a4),a2
                   jsr               writesprites


                   move.l            frame,d1
                   rts

;walksprite routine
;consume d1 as framecount
;consume a4 as framelist pointer
;consume a2 as frame pointer
;consume a3 as scratch
;consume d2 as spritepos
walksprite:
                   and.l             #$4-1,d1
                   tst.b             d1
                   bne               .noreset

                   addq.l            #$4,a4
                   cmp.l             #$fffffffe,(a4)
                   bne               .noreset

                   lea.l             anim_pointer,a3
                   move.l            (a3),a4
            

.noreset:
                   move.w            spritepos,d2
                   move.l            frame,d1
                   and.l             #$2-1,d1
                   bne               .nomove

                   move.b            backflag,d3
                   cmpi.b            #$ff,d3
                   beq               .moveback

.move:
                   move.w            spritepos,d2                              ;probably want to do a cmp to ensure we don't loop
                   addq.b            #$1,d2
                   bra               .nomove

.moveback:

                   move.w            spritepos,d2
                   cmpi.b            #$40,d2
                   blo               .nomove
                   subq.b            #$2,d2


.nomove:
                   move.w            d2,spritepos

.noupdate:
                   move.l            (a4),a2
                   jsr               updatesprite

                   move.l            (a4),a2
                   jsr               writesprites

                   move.l            frame,d1
                   rts


; Draws a copper bar of a given height and width on screen
; createbar(d3,d0,a6)
;   - d3 is WAITPOS value - defines vertical and horizontal start of bar
;   - d0 is the colour of the bar. This operates on the background palette
;   - a6 is a pointer to the copperlist - make sure this doesn't overwrite/is overwritten by existing copper instructions!
;   - d2 is background color

;   -d4,d5 are used as scratch, and are recovered at RTS
;   - a0 is used as scratch - VALUE IS LOST!
; OUT:
;   -Instructions in copperlist corresponding to a single raster bar
createbar:  ;d3 is WAITPOS pointer, d0 is colour. a6 is copperlist.
            ;subroutine initialise - store old register states in mem
                   move.l            #barstorage,a0
                   move.l            d0,(a0)+
                   move.l            d3,(a0)+
                   move.l            d4,(a0)+
                   move.l            d5,(a0)+

                   move.l            d2,(a6)+                                  ;move background into color00

                   move.l            #$0a,d4                                   ;setup loop counter - this corresponds to height of bar

                   inline
_loop:
                   move.l            d3,(a6)+                                  ;move waitpos into copperlist
                   move.l            d0,(a6)+                                  ;move new colour into copperlist

                   swap              d3                                        ;swap waitpos to fffe[xxxx]
                   move.l            d3,d5                
                   move.b            endpos,d5                                   ;d5 stores the endpos
                   swap              d5                                        ;swap back around to [xxff]fffe

                   move.l            d5,(a6)+
                   move.l            d2,(a6)+                                  ;move back to correct colour

                   add.w             #$0100,d3                                 ;change VPOSwait
                   swap              d3

                   subq.b            #$1,d4                                    ;decrement loop
                   cmp.w             #$0,d4
                   bne               _loop

                   einline

            ;cleanup and restore registers
                   move.l            #barstorage,a0
                   move.l            (a0)+,d0
                   move.l            (a0)+,d3
                   move.l            (a0)+,d4
                   move.l            (a0)+,d5

                   rts

; writes sprite instructions to copperlist
; consumes d0,d1 as scratch
; uses d2 as SPRxPTx register pointer starting from register 0
; uses a2 as sprite STRUCT pointer
; a3 is scratch register recovery - It is discarded!
; uses a6 as copperlist pointer
writesprites: 
                   move.l            #barstorage,a3
                   move.l            d0,(a3)+
                   move.l            d1,(a3)+
                   move.l            d2,(a3)+
                   move.l            a2,(a3)+

                   move.b            #$6,d1

                   move.l            #$01200122,d2                             ; SPR0PTL.SPR0PTH packed into a long.
                   inline 
_spriteloop:
                   move.l            (a2)+,d0                                  ; move sprite pointer to scratch and increment
                   move.w            d2,(a6)+                                  ; move SPRxPTH pointer (HI)?
                   move.w            d0,(a6)+                                  ; move low bits of sprite address

                   swap              d2                                        ;swap to LO word register
                   swap              d0                                        ;swap to LO word pointer
            
                   move.w            d2,(a6)+                                  ; move SPRxPTL pointer (LO)
                   move.w            d0,(a6)+                                  ; move HI bits of sprite address 


            ; increments sprite register pointers. Because pointers need to be written into copperlist IN THIS ORDER:
            ; xPTH, HI_word 
            ; xPTL, LO_word

            ; and n+1PTL = nPTL + 4 bytes and n+1PTH = nPTH + 4 bytes:
            ; we add $00040004 to our packed long to get to the next set of sprite registers  
                   swap              d2
                   add.l             #$00040004,d2                             ;increment sprite register pointers.


                   subq.b            #$1,d1                                    ;test counter
                   cmp.b             #$0,d1
                   bne               _spriteloop
                   einline

            ; recover registers
                   move.l            #barstorage,a3
                   move.l            (a3)+,d0
                   move.l            (a3)+,d1
                   move.l            (a3)+,d2
                   move.l            (a3)+,a2

                   rts


; Update pos of every tile in given sprite struct
; consumes d0 as newpos word of format $VVHH
; consumes a3 as pointer to spritestruct
; consumes a2 as pointer to spritestruct
; Loops through struct until it sees end-words: $fffffffe
updatesprite:
                   move.w            spritepos,d0

                   inline
_updateloop:
                   move.l            (a2)+,a3                                  ;frame ---> fx_0

                   move.w            d0,(a3)
                   addq.b            #$8,d0                                    ;increment HPOS by 8 so that tiles stitch nicely 

                   cmp.l             #$fffffffe,a3
                   bne               _updateloop
                   einline

                   rts

;BITPLANE ZERO
; TODO:
; Rewrite for any bitplane(s).
;consumes d0 as bitplane pointer
pushplane:

                   move.w            #$00e2,(a6)+
                   move.w            d0,(a6)+
                   swap              d0
                   move.w            #$00e0,(a6)+
                   move.w            d0,(a6)+ 
                   rts

; heart beat animation. Needs a different approach. write mask, write copperbar, write background? 
heartplane:
                   move.w            #$4600,BPLCON0
                   move.w            #$0000,BPLCON1
                   move.w            #$0020,BPLCON2
                   move.w            #$0000,BPL1MOD
                   move.w            #$0028,BPL2MOD
                   move.w            #$0038,DDFSTRT

                   lea.l             planepointer,a3
                   move.l            (a3),a3
            
                   cmp.l             #$fffffffe,(a3)
                   bne               .mask

                   move.l            #heartlist,planepointer
                   lea.l             planepointer,a3
                   move.l            (a3),a3

                   addq.l            #$4,backplanepointer
.mask

                   pushPlane         (a3), #$00e0, #$00e2
                   pushPlane         (a3), #$00e8, #$00ea

             
                   move.l            frame,d1
                   and.l             #$8-1,d1
                   tst.b             d1
                   bne               .return

                   addq.l            #$4,a3
.return
                   move.l            a3,planepointer


             ; current list
                   lea.l             backplanepointer,a4
                   move.l            (a4),a4
                   cmp.l             #$fffffffe,(a4)
                   bne               .bckgroundpush     

                   move.l            #backgroundlist,backplanepointer
                   lea.l             backplanepointer,a4
                   move.l            (a4),a4

.bckgroundpush
                   breakpoint
                   move.l            a4,backplanepointer

                   pushPlane         (a4), #$00e4, #$00e6                      ;background bitplanes into EVEN registers (2, 4)
                   move.l            (a4),a4
                   add.l             #40,a4
                   pushPlane         a4, #$00ec, #$00ee 


             ;TODO PALETTES
                   move.l            #$01a00000,(a6)+
                   move.l            #$019e0000,(a6)+ 
                   move.l            #$019a0000,(a6)+
                   move.l            #$01980000,(a6)+
                   move.l            #$01960fff,(a6)+
                   move.l            #$01940bba,(a6)+
                   move.l            #$01920654,(a6)+

             
             ; heartmask
                   move.l            #$01800022,(a6)+
                   move.l            #$0182000f,(a6)+
                   move.l            #$01840f00,(a6)+
                   move.l            #$01860022,(a6)+
                   move.l            #$01880f0f,(a6)+
                   move.l            #$018a0fff,(a6)+
                   move.l            #$018e00ff,(a6)+
                   move.l            #$01900000,(a6)+
             

                   rts
        


;------------------------------------------------------------
;DATA
;------------------------------------------------------------
                   CNOP              0,4
oldview:           dc.l              0
oldcopper:         dc.l              0
gfxbase:           dc.l              0
frame:             dc.l              0
scenecount:        dc.l              0

; POS for bars - copper WAIT instruction format
; Offset is prev + height + 5 spacing

redpos:            dc.l              $96fffffe 
greenpos:          dc.l              $a5fffffe 
bluepos:           dc.l              $b4fffffe


                   CNOP              0,4
oldmareq:          dc.w              0
oldintreq:         dc.w              0
oldintena:         dc.w              0
oldadkcon:         dc.w              0


                   CNOP              0,4

spritepos:         dc.w              $6d00

                   CNOP              0,4

barstorage:
                   blk.l             8,0

                   CNOP              0,4

gfxname:           dc.b              'graphics.library',0

                   CNOP              0,4

backflag:          dc.b              0
bardecrement:      dc.b              $2
targetbarpos:      dc.b              $10
endpos:            dc.b              $ff

                   CNOP              0,4

debug:             dc.w              $50

                   CNOP              0,4

x_offset:          dc.l              0
spritetransflag:   dc.b              $ff
             
                   Section           ChipRAM,Data_c

titletransition:
                   dc.l              $01820022
                   dc.l              $01820155
                   dc.l              $01820488
                   dc.l              $018208bb
                   dc.l              $01820dee
                   CNOP              0,4

titlepos:          dc.l              0

                   CNOP              0,4

title:
                   incbin            "title.raw",$74
                   blk.b             320/8*3*(200-160),0

                   CNOP              0,4

            ; cat sprite definitions
                   include           "cat.i"

                   CNOP              0,4

                   include           "sit.i"

                   CNOP              0,4

anim_pointer:      dc.l              currentframe
planepointer:      dc.l              heartlist
backplanepointer:  dc.l              backgroundlist

                   CNOP              0,4

montage_p1:
                   incbin            "m1_pf1.raw",$74
                   blk.b             320/8*3*(200-160),0

                   CNOP              0,4

                   include           "heart.i"                                 ;heart mask transition

end:
                   incbin            "smudge.raw",$74
            
                   CNOP              0,4

                   include           "HAM.i"

                   CNOP              0,4
plane:
                   blk.b             $3000,0                                   ;unnecessary?

                   CNOP              0,4

copper:
                   dc.l              BACKGROUND
                   dc.w              $ffff,$fffe
                   blk.b             1024,0
                   dc.w              $ffff,$fffe

                   CNOP              0,4

            

