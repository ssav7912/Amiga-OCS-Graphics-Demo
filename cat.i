;------------------------------------------
;WALK SPRITES
;------------------------------------------
;Contains sprite structures and animation list for walking animation
       Section    ChipRAM,Data_c
f1_0:
       dc.w       $6d40
       dc.w       $c300
       incbin     "sprites/f1_0.spr"
       dc.w       $0000,0000
            
       CNOP       0,2

f1_1:
       dc.w       $6d48
       dc.w       $c300
       incbin     "sprites/f1_1.spr"
       dc.w       $0000,$0000

       CNOP       0,2

f1_2:
       dc.w       $6d50
       dc.w       $c300
       incbin     "sprites/f1_2.spr"
       dc.w       $0000,0000

       CNOP       0,2

f1_3:     
       dc.w       $6d58                  ; Control word 1 VPOSHPOS
       dc.w       $c300                  ; Control word 2 VSTOP
       incbin     "sprites/f1_3.spr"
       dc.w       $0000
       dc.w       $0000

       CNOP       0,2

f1_4
       dc.w       $6d60
       dc.w       $c300
       incbin     "sprites/f1_4.spr"
       dc.w       $0000,0000

       CNOP       0,2

f1_5:       
       dc.w       $6d68
       dc.w       $c300
       incbin     "sprites/f1_5.spr"
       dc.w       $0000,0000

       CNOP       0,2

;Frame2

f2_0:
       dc.w       $6d40
       dc.w       $c300
       incbin     "sprites/f2_0.spr"
       dc.w       $0000,$0000

       CNOP       0,2

f2_1:       
       dc.w       $6d48
       dc.w       $c300
       incbin     "sprites/f2_1.spr"
       dc.w       $0000,$0000

       CNOP       0,2
f2_2:
       dc.w       $6d50
       dc.w       $c300
       incbin     "sprites/f2_2.spr"
       dc.w       $0000,$0000


       CNOP       0,2
f2_3:
       dc.w       $6d58,$c300
       incbin     "sprites/f2_3.spr"
       dc.w       $0000,$0000

       CNOP       0,2
f2_4:       
       dc.w       $6d60,$c300
       incbin     "sprites/f2_4.spr"
       dc.w       $0000,$0000

       CNOP       0,2

f2_5:  dc.w       $6d68,$c300
       incbin     "sprites/f2_5.spr"
       dc.w       $0000,$0000

       CNOP       0,2

;Frame 3

f3_0:
       dc.w       $6d40
       dc.w       $c300
       incbin     "sprites/f3_0.spr"
       dc.w       $0000,$0000

       CNOP       0,2

f3_1:       
       dc.w       $6d48
       dc.w       $c300
       incbin     "sprites/f3_1.spr"
       dc.w       $0000,$0000

       CNOP       0,2
f3_2:
       dc.w       $6d50
       dc.w       $c300
       incbin     "sprites/f3_2.spr"
       dc.w       $0000,$0000


       CNOP       0,2
f3_3:
       dc.w       $6d58,$c300
       incbin     "sprites/f3_3.spr"
       dc.w       $0000,$0000

       CNOP       0,2
f3_4:       
       dc.w       $6d60,$c300
       incbin     "sprites/f3_4.spr"
       dc.w       $0000,$0000

       CNOP       0,2

f3_5:  dc.w       $6d68,$c300
       incbin     "sprites/f3_5.spr"
       dc.w       $0000,$0000

       CNOP       0,2

;frame 4:

f4_0:
       dc.w       $6d40
       dc.w       $c300
       incbin     "sprites/f4_0.spr"
       dc.w       $0000,$0000

       CNOP       0,2

f4_1:       
       dc.w       $6d48
       dc.w       $c300
       incbin     "sprites/f4_1.spr"
       dc.w       $0000,$0000

       CNOP       0,2
f4_2:
       dc.w       $6d50
       dc.w       $c300
       incbin     "sprites/f4_2.spr"
       dc.w       $0000,$0000


       CNOP       0,2
f4_3:
       dc.w       $6d58,$c300
       incbin     "sprites/f4_3.spr"
       dc.w       $0000,$0000

       CNOP       0,2
f4_4:       
       dc.w       $6d60,$c300
       incbin     "sprites/f4_4.spr"
       dc.w       $0000,$0000

       CNOP       0,2

f4_5:  dc.w       $6d68,$c300
       incbin     "sprites/f4_5.spr"
       dc.w       $0000,$0000

       CNOP       0,2

;frame 5:

f5_0:
       dc.w       $6d40
       dc.w       $c300
       incbin     "sprites/f5_0.spr"
       dc.w       $0000,$0000

       CNOP       0,2

f5_1:       
       dc.w       $6d48
       dc.w       $c300
       incbin     "sprites/f5_1.spr"
       dc.w       $0000,$0000

       CNOP       0,2
f5_2:
       dc.w       $6d50
       dc.w       $c300
       incbin     "sprites/f5_2.spr"
       dc.w       $0000,$0000


       CNOP       0,2
f5_3:
       dc.w       $6d58,$c300
       incbin     "sprites/f5_3.spr"
       dc.w       $0000,$0000

       CNOP       0,2
f5_4:       
       dc.w       $6d60,$c300
       incbin     "sprites/f5_4.spr"
       dc.w       $0000,$0000

       CNOP       0,2

f5_5:  dc.w       $6d68,$c300
       incbin     "sprites/f5_5.spr"
       dc.w       $0000,$0000

       CNOP       0,2

;Frame 6:

f6_0:
       dc.w       $6d40
       dc.w       $c300
       incbin     "sprites/f6_0.spr"
       dc.w       $0000,$0000

       CNOP       0,2

f6_1:       
       dc.w       $6d48
       dc.w       $c300
       incbin     "sprites/f6_1.spr"
       dc.w       $0000,$0000

       CNOP       0,2
f6_2:
       dc.w       $6d50
       dc.w       $c300
       incbin     "sprites/f6_2.spr"
       dc.w       $0000,$0000


       CNOP       0,2
f6_3:
       dc.w       $6d58,$c300
       incbin     "sprites/f6_3.spr"
       dc.w       $0000,$0000

       CNOP       0,2
f6_4:       
       dc.w       $6d60,$c300
       incbin     "sprites/f6_4.spr"
       dc.w       $0000,$0000

       CNOP       0,2

f6_5:  dc.w       $6d68,$c300
       incbin     "sprites/f6_5.spr"
       dc.w       $0000,$0000

       CNOP       0,2
            
;Frame 7:
f7_0:
       dc.w       $6d40
       dc.w       $c300
       incbin     "sprites/f7_0.spr"
       dc.w       $0000,$0000

       CNOP       0,2

f7_1:       
       dc.w       $6d48
       dc.w       $c300
       incbin     "sprites/f7_1.spr"
       dc.w       $0000,$0000

       CNOP       0,2
f7_2:
       dc.w       $6d50
       dc.w       $c300
       incbin     "sprites/f7_2.spr"
       dc.w       $0000,$0000


       CNOP       0,2
f7_3:
       dc.w       $6d58,$c300
       incbin     "sprites/f7_3.spr"
       dc.w       $0000,$0000

       CNOP       0,2
f7_4:       
       dc.w       $6d60,$c300
       incbin     "sprites/f7_4.spr"
       dc.w       $0000,$0000

       CNOP       0,2

f7_5:  dc.w       $6d68,$c300
       incbin     "sprites/f7_5.spr"
       dc.w       $0000,$0000

       CNOP       0,2

f8_0:
       dc.w       $6d40
       dc.w       $c300
       incbin     "sprites/f8_0.spr"
       dc.w       $0000,$0000

       CNOP       0,2

f8_1:       
       dc.w       $6d48
       dc.w       $c300
       incbin     "sprites/f8_1.spr"
       dc.w       $0000,$0000

       CNOP       0,2
f8_2:
       dc.w       $6d50
       dc.w       $c300
       incbin     "sprites/f8_2.spr"
       dc.w       $0000,$0000


       CNOP       0,2
f8_3:
       dc.w       $6d58,$c300
       incbin     "sprites/f8_3.spr"
       dc.w       $0000,$0000

       CNOP       0,2
f8_4:       
       dc.w       $6d60,$c300
       incbin     "sprites/f8_4.spr"
       dc.w       $0000,$0000

       CNOP       0,2

f8_5:  dc.w       $6d68,$c300
       incbin     "sprites/f8_5.spr"
       dc.w       $0000,$0000

       CNOP       0,2

f9_0:
       dc.w       $6d40
       dc.w       $c300
       incbin     "sprites/f9_0.spr"
       dc.w       $0000,$0000

       CNOP       0,2

f9_1:       
       dc.w       $6d48
       dc.w       $c300
       incbin     "sprites/f9_1.spr"
       dc.w       $0000,$0000

       CNOP       0,2
f9_2:
       dc.w       $6d50
       dc.w       $c300
       incbin     "sprites/f9_2.spr"
       dc.w       $0000,$0000


       CNOP       0,2
f9_3:
       dc.w       $6d58,$c300
       incbin     "sprites/f9_3.spr"
       dc.w       $0000,$0000

       CNOP       0,2
f9_4:       
       dc.w       $6d60,$c300
       incbin     "sprites/f9_4.spr"
       dc.w       $0000,$0000

       CNOP       0,2

f9_5:  dc.w       $6d68,$c300
       incbin     "sprites/f9_5.spr"
       dc.w       $0000,$0000

       CNOP       0,2

fA_0:
       dc.w       $6d40
       dc.w       $c300
       incbin     "sprites/f10_0.spr"
       dc.w       $0000,$0000

       CNOP       0,2

fA_1:       
       dc.w       $6d48
       dc.w       $c300
       incbin     "sprites/f10_1.spr"
       dc.w       $0000,$0000

       CNOP       0,2
fA_2:
       dc.w       $6d50
       dc.w       $c300
       incbin     "sprites/f10_2.spr"
       dc.w       $0000,$0000


       CNOP       0,2
fA_3:
       dc.w       $6d58,$c300
       incbin     "sprites/f10_3.spr"
       dc.w       $0000,$0000

       CNOP       0,2
fA_4:       
       dc.w       $6d60,$c300
       incbin     "sprites/f10_4.spr"
       dc.w       $0000,$0000

       CNOP       0,2

fA_5:  dc.w       $6d68,$c300
       incbin     "sprites/f10_5.spr"
       dc.w       $0000,$0000

       CNOP       0,2

fB_0:
       dc.w       $6d40
       dc.w       $c300
       incbin     "sprites/f11_0.spr"
       dc.w       $0000,$0000

       CNOP       0,2

fB_1:       
       dc.w       $6d48
       dc.w       $c300
       incbin     "sprites/f11_1.spr"
       dc.w       $0000,$0000

       CNOP       0,2
fB_2:
       dc.w       $6d50
       dc.w       $c300
       incbin     "sprites/f11_2.spr"
       dc.w       $0000,$0000


       CNOP       0,2
fB_3:
       dc.w       $6d58,$c300
       incbin     "sprites/f11_3.spr"
       dc.w       $0000,$0000

       CNOP       0,2
fB_4:       
       dc.w       $6d60,$c300
       incbin     "sprites/f11_4.spr"
       dc.w       $0000,$0000

       CNOP       0,2

fB_5:  dc.w       $6d68,$c300
       incbin     "sprites/f11_5.spr"
       dc.w       $0000,$0000
            
       CNOP       0,2

fC_0:
       dc.w       $6d40
       dc.w       $c300
       incbin     "sprites/f12_0.spr"
       dc.w       $0000,$0000

       CNOP       0,2

fC_1:       
       dc.w       $6d48
       dc.w       $c300
       incbin     "sprites/f12_1.spr"
       dc.w       $0000,$0000

       CNOP       0,2
fC_2:
       dc.w       $6d50
       dc.w       $c300
       incbin     "sprites/f12_2.spr"
       dc.w       $0000,$0000


       CNOP       0,2
fC_3:
       dc.w       $6d58,$c300
       incbin     "sprites/f12_3.spr"
       dc.w       $0000,$0000

       CNOP       0,2
fC_4:       
       dc.w       $6d60,$c300
       incbin     "sprites/f12_4.spr"
       dc.w       $0000,$0000

       CNOP       0,2

fC_5:  dc.w       $6d68,$c300
       incbin     "sprites/f12_5.spr"
       dc.w       $0000,$0000
            
       CNOP       0,2
fD_0:
       dc.w       $6d40
       dc.w       $c300
       incbin     "sprites/f13_0.spr"
       dc.w       $0000,$0000

       CNOP       0,2

fD_1:       
       dc.w       $6d48
       dc.w       $c300
       incbin     "sprites/f13_1.spr"
       dc.w       $0000,$0000

       CNOP       0,2
fD_2:
       dc.w       $6d50
       dc.w       $c300
       incbin     "sprites/f13_2.spr"
       dc.w       $0000,$0000


       CNOP       0,2
fD_3:
       dc.w       $6d58,$c300
       incbin     "sprites/f13_3.spr"
       dc.w       $0000,$0000

       CNOP       0,2
fD_4:       
       dc.w       $6d60,$c300
       incbin     "sprites/f13_4.spr"
       dc.w       $0000,$0000

       CNOP       0,2

fD_5:  dc.w       $6d68,$c300
       incbin     "sprites/f13_5.spr"
       dc.w       $0000,$0000
            
    ;    CNOP       0,2
; fE_0:
;        dc.w       $6d40
;        dc.w       $c300
;        incbin     "sprites/f14_0.spr"
;        dc.w       $0000,$0000

;        CNOP       0,2

; fE_1:       
;        dc.w       $6d48
;        dc.w       $c300
;        incbin     "sprites/f14_1.spr"
;        dc.w       $0000,$0000

;        CNOP       0,2
; fE_2:
;        dc.w       $6d50
;        dc.w       $c300
;        incbin     "sprites/f14_2.spr"
;        dc.w       $0000,$0000


;        CNOP       0,2
; fE_3:
;        dc.w       $6d58,$c300
;        incbin     "sprites/f14_3.spr"
;        dc.w       $0000,$0000

;        CNOP       0,2
; fE_4:       
;        dc.w       $6d60,$c300
;        incbin     "sprites/f14_4.spr"
;        dc.w       $0000,$0000

;        CNOP       0,2

; fE_5:  dc.w       $6d68,$c300
;        incbin     "sprites/f14_5.spr"
;        dc.w       $0000,$0000
            
;        CNOP       0,4

       CNOP       0,4
frame1:
       dc.l       f1_0
       dc.l       f1_1
       dc.l       f1_2
       dc.l       f1_3
       dc.l       f1_4
       dc.l       f1_5
       dc.l       $fffffffe

       CNOP       0,4
frame2:
       dc.l       f2_0
       dc.l       f2_1
       dc.l       f2_2
       dc.l       f2_3
       dc.l       f2_4
       dc.l       f2_5
       dc.l       $fffffffe

       CNOP       0,4

frame3:
       dc.l       f3_0
       dc.l       f3_1
       dc.l       f3_2
       dc.l       f3_3
       dc.l       f3_4
       dc.l       f3_5
       dc.l       $fffffffe

       CNOP       0,4

frame4:
       dc.l       f4_0
       dc.l       f4_1
       dc.l       f4_2
       dc.l       f4_3
       dc.l       f4_4
       dc.l       f4_5
       dc.l       $fffffffe

       CNOP       0,4

frame5:
       dc.l       f5_0
       dc.l       f5_1
       dc.l       f5_2
       dc.l       f5_3
       dc.l       f5_4
       dc.l       f5_5
       dc.l       $fffffffe

       CNOP       0,4

frame6:
       dc.l       f6_0
       dc.l       f6_1
       dc.l       f6_2
       dc.l       f6_3
       dc.l       f6_4
       dc.l       f6_5
       dc.l       $fffffffe

       CNOP       0,4

frame7:
       dc.l       f7_0
       dc.l       f7_1
       dc.l       f7_2
       dc.l       f7_3
       dc.l       f7_4
       dc.l       f7_5
       dc.l       $fffffffe

       CNOP       0,4

frame8:
       dc.l       f8_0
       dc.l       f8_1
       dc.l       f8_2
       dc.l       f8_3
       dc.l       f8_4
       dc.l       f8_5
       dc.l       $fffffffe

       CNOP       0,4

frame9:
       dc.l       f9_0
       dc.l       f9_1
       dc.l       f9_2
       dc.l       f9_3
       dc.l       f9_4
       dc.l       f9_5
       dc.l       $fffffffe

       CNOP       0,4
frameA:
       dc.l       fA_0
       dc.l       fA_1
       dc.l       fA_2
       dc.l       fA_3
       dc.l       fA_4
       dc.l       fA_5
       dc.l       $fffffffe

       CNOP       0,4
frameB:
       dc.l       fB_0
       dc.l       fB_1
       dc.l       fB_2
       dc.l       fB_3
       dc.l       fB_4
       dc.l       fB_5
       dc.l       $fffffffe

       CNOP       0,4

frameC:
       dc.l       fC_0
       dc.l       fC_1
       dc.l       fC_2
       dc.l       fC_3
       dc.l       fC_4
       dc.l       fC_5
       dc.l       $fffffffe

       CNOP       0,4

frameD:
       dc.l       fD_0
       dc.l       fD_1
       dc.l       fD_2
       dc.l       fD_3
       dc.l       fD_4
       dc.l       fD_5
       dc.l       $fffffffe

       CNOP       0,4

; frameE:
;        dc.l       fE_0
;        dc.l       fE_1
;        dc.l       fE_2
;        dc.l       fE_3
;        dc.l       fE_4
;        dc.l       fE_5
;        dc.l       $fffffffe

;        CNOP       0,4

currentframe:
       dc.l       frame1
       dc.l       frame2
       dc.l       frame3
       dc.l       frame4
       dc.l       frame5
       dc.l       frame6
       dc.l       frame7
       dc.l       frame8
       dc.l       frame9
       dc.l       frameA
       dc.l       frameB
       dc.l       frameC
       dc.l       frameD
    ;    dc.l       frameE
       dc.l       $fffffffe 