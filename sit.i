;------------------------------------------
;SIT SPRITES
;------------------------------------------
;Contains sprite structures and animation list for sitting animation

  macro      frame_gen
  dc.w       $6d40+8*\1
  dc.w       $c300
  incbin     \2
  dc.w       $0000,0000

  CNOP       0,2
  endm

  

  Section    ChipRAM,Data_c

sit_f1_0:
  dc.w       $6d40+8*0
  dc.w       $c300
  incbin     "sitsprites/f1_0.spr"
  dc.w       $0000,0000

  CNOP       0,2

sit_f1_1:
  dc.w       $6d40+8*1
  dc.w       $c300
  incbin     "sitsprites/f1_1.spr"
  dc.w       $0000,0000

  CNOP       0,2

sit_f1_2:
  dc.w       $6d40+8*2
  dc.w       $c300
  incbin     "sitsprites/f1_2.spr"
  dc.w       $0000,0000

  CNOP       0,2

sit_f1_3:
  dc.w       $6d40+8*3
  dc.w       $c300
  incbin     "sitsprites/f1_3.spr"
  dc.w       $0000,0000

  CNOP       0,2

sit_f1_4:
  dc.w       $6d40+8*4
  dc.w       $c300
  incbin     "sitsprites/f1_4.spr"
  dc.w       $0000,0000

  CNOP       0,2

sit_f1_5:
  dc.w       $6d40+8*5
  dc.w       $c300
  incbin     "sitsprites/f1_5.spr"
  dc.w       $0000,0000

  CNOP       0,2



sit_f2_0:
  dc.w       $6d40+8*0
  dc.w       $c300
  incbin     "sitsprites/f2_0.spr"
  dc.w       $0000,0000

  CNOP       0,2

sit_f2_1:
  dc.w       $6d40+8*1
  dc.w       $c300
  incbin     "sitsprites/f2_1.spr"
  dc.w       $0000,0000

  CNOP       0,2

sit_f2_2:
  dc.w       $6d40+8*2
  dc.w       $c300
  incbin     "sitsprites/f2_2.spr"
  dc.w       $0000,0000

  CNOP       0,2

sit_f2_3:
  dc.w       $6d40+8*3
  dc.w       $c300
  incbin     "sitsprites/f2_3.spr"
  dc.w       $0000,0000

  CNOP       0,2

sit_f2_4:
  dc.w       $6d40+8*4
  dc.w       $c300
  incbin     "sitsprites/f2_4.spr"
  dc.w       $0000,0000

  CNOP       0,2

sit_f2_5:
  dc.w       $6d40+8*5
  dc.w       $c300
  incbin     "sitsprites/f2_5.spr"
  dc.w       $0000,0000

  CNOP       0,2



sit_f3_0:
  dc.w       $6d40+8*0
  dc.w       $c300
  incbin     "sitsprites/f3_0.spr"
  dc.w       $0000,0000

  CNOP       0,2

sit_f3_1:
  dc.w       $6d40+8*1
  dc.w       $c300
  incbin     "sitsprites/f3_1.spr"
  dc.w       $0000,0000

  CNOP       0,2

sit_f3_2:
  dc.w       $6d40+8*2
  dc.w       $c300
  incbin     "sitsprites/f3_2.spr"
  dc.w       $0000,0000

  CNOP       0,2

sit_f3_3:
  dc.w       $6d40+8*3
  dc.w       $c300
  incbin     "sitsprites/f3_3.spr"
  dc.w       $0000,0000

  CNOP       0,2

sit_f3_4:
  dc.w       $6d40+8*4
  dc.w       $c300
  incbin     "sitsprites/f3_4.spr"
  dc.w       $0000,0000

  CNOP       0,2

sit_f3_5:
  dc.w       $6d40+8*5
  dc.w       $c300
  incbin     "sitsprites/f3_5.spr"
  dc.w       $0000,0000

  CNOP       0,2



sit_f4_0:
  dc.w       $6d40+8*0
  dc.w       $c300
  incbin     "sitsprites/f4_0.spr"
  dc.w       $0000,0000

  CNOP       0,2

sit_f4_1:
  dc.w       $6d40+8*1
  dc.w       $c300
  incbin     "sitsprites/f4_1.spr"
  dc.w       $0000,0000

  CNOP       0,2

sit_f4_2:
  dc.w       $6d40+8*2
  dc.w       $c300
  incbin     "sitsprites/f4_2.spr"
  dc.w       $0000,0000

  CNOP       0,2

sit_f4_3:
  dc.w       $6d40+8*3
  dc.w       $c300
  incbin     "sitsprites/f4_3.spr"
  dc.w       $0000,0000

  CNOP       0,2

sit_f4_4:
  dc.w       $6d40+8*4
  dc.w       $c300
  incbin     "sitsprites/f4_4.spr"
  dc.w       $0000,0000

  CNOP       0,2

sit_f4_5:
  dc.w       $6d40+8*5
  dc.w       $c300
  incbin     "sitsprites/f4_5.spr"
  dc.w       $0000,0000

  CNOP       0,2



sit_f5_0:
  dc.w       $6d40+8*0
  dc.w       $c300
  incbin     "sitsprites/f5_0.spr"
  dc.w       $0000,0000

  CNOP       0,2

sit_f5_1:
  dc.w       $6d40+8*1
  dc.w       $c300
  incbin     "sitsprites/f5_1.spr"
  dc.w       $0000,0000

  CNOP       0,2

sit_f5_2:
  dc.w       $6d40+8*2
  dc.w       $c300
  incbin     "sitsprites/f5_2.spr"
  dc.w       $0000,0000

  CNOP       0,2

sit_f5_3:
  dc.w       $6d40+8*3
  dc.w       $c300
  incbin     "sitsprites/f5_3.spr"
  dc.w       $0000,0000

  CNOP       0,2

sit_f5_4:
  dc.w       $6d40+8*4
  dc.w       $c300
  incbin     "sitsprites/f5_4.spr"
  dc.w       $0000,0000

  CNOP       0,2

sit_f5_5:
  dc.w       $6d40+8*5
  dc.w       $c300
  incbin     "sitsprites/f5_5.spr"
  dc.w       $0000,0000

  CNOP       0,2



sit_f6_0:
  dc.w       $6d40+8*0
  dc.w       $c300
  incbin     "sitsprites/f6_0.spr"
  dc.w       $0000,0000

  CNOP       0,2

sit_f6_1:
  dc.w       $6d40+8*1
  dc.w       $c300
  incbin     "sitsprites/f6_1.spr"
  dc.w       $0000,0000

  CNOP       0,2

sit_f6_2:
  dc.w       $6d40+8*2
  dc.w       $c300
  incbin     "sitsprites/f6_2.spr"
  dc.w       $0000,0000

  CNOP       0,2

sit_f6_3:
  dc.w       $6d40+8*3
  dc.w       $c300
  incbin     "sitsprites/f6_3.spr"
  dc.w       $0000,0000

  CNOP       0,2

sit_f6_4:
  dc.w       $6d40+8*4
  dc.w       $c300
  incbin     "sitsprites/f6_4.spr"
  dc.w       $0000,0000

  CNOP       0,2

sit_f6_5:
  dc.w       $6d40+8*5
  dc.w       $c300
  incbin     "sitsprites/f6_5.spr"
  dc.w       $0000,0000

  CNOP       0,2



sit_f7_0:
  dc.w       $6d40+8*0
  dc.w       $c300
  incbin     "sitsprites/f7_0.spr"
  dc.w       $0000,0000

  CNOP       0,2

sit_f7_1:
  dc.w       $6d40+8*1
  dc.w       $c300
  incbin     "sitsprites/f7_1.spr"
  dc.w       $0000,0000

  CNOP       0,2

sit_f7_2:
  dc.w       $6d40+8*2
  dc.w       $c300
  incbin     "sitsprites/f7_2.spr"
  dc.w       $0000,0000

  CNOP       0,2

sit_f7_3:
  dc.w       $6d40+8*3
  dc.w       $c300
  incbin     "sitsprites/f7_3.spr"
  dc.w       $0000,0000

  CNOP       0,2

sit_f7_4:
  dc.w       $6d40+8*4
  dc.w       $c300
  incbin     "sitsprites/f7_4.spr"
  dc.w       $0000,0000

  CNOP       0,2

sit_f7_5:
  dc.w       $6d40+8*5
  dc.w       $c300
  incbin     "sitsprites/f7_5.spr"
  dc.w       $0000,0000

  CNOP       0,2



sit_f8_0:
  dc.w       $6d40+8*0
  dc.w       $c300
  incbin     "sitsprites/f8_0.spr"
  dc.w       $0000,0000

  CNOP       0,2

sit_f8_1:
  dc.w       $6d40+8*1
  dc.w       $c300
  incbin     "sitsprites/f8_1.spr"
  dc.w       $0000,0000

  CNOP       0,2

sit_f8_2:
  dc.w       $6d40+8*2
  dc.w       $c300
  incbin     "sitsprites/f8_2.spr"
  dc.w       $0000,0000

  CNOP       0,2

sit_f8_3:
  dc.w       $6d40+8*3
  dc.w       $c300
  incbin     "sitsprites/f8_3.spr"
  dc.w       $0000,0000

  CNOP       0,2

sit_f8_4:
  dc.w       $6d40+8*4
  dc.w       $c300
  incbin     "sitsprites/f8_4.spr"
  dc.w       $0000,0000

  CNOP       0,2

sit_f8_5:
  dc.w       $6d40+8*5
  dc.w       $c300
  incbin     "sitsprites/f8_5.spr"
  dc.w       $0000,0000

  CNOP       0,2



sit_f9_0:
  dc.w       $6d40+8*0
  dc.w       $c300
  incbin     "sitsprites/f9_0.spr"
  dc.w       $0000,0000

  CNOP       0,2

sit_f9_1:
  dc.w       $6d40+8*1
  dc.w       $c300
  incbin     "sitsprites/f9_1.spr"
  dc.w       $0000,0000

  CNOP       0,2

sit_f9_2:
  dc.w       $6d40+8*2
  dc.w       $c300
  incbin     "sitsprites/f9_2.spr"
  dc.w       $0000,0000

  CNOP       0,2

sit_f9_3:
  dc.w       $6d40+8*3
  dc.w       $c300
  incbin     "sitsprites/f9_3.spr"
  dc.w       $0000,0000

  CNOP       0,2

sit_f9_4:
  dc.w       $6d40+8*4
  dc.w       $c300
  incbin     "sitsprites/f9_4.spr"
  dc.w       $0000,0000

  CNOP       0,2

sit_f9_5:
  dc.w       $6d40+8*5
  dc.w       $c300
  incbin     "sitsprites/f9_5.spr"
  dc.w       $0000,0000

  CNOP       0,2

sit_10_0:
  dc.w       $6d40+8*0
  dc.w       $c300
  incbin     "sitsprites/f10_0.spr"
  dc.w       $0000,0000

  CNOP       0,2

sit_10_1:
  dc.w       $6d40+8*1
  dc.w       $c300
  incbin     "sitsprites/f10_1.spr"
  dc.w       $0000,0000

  CNOP       0,2

sit_10_2:
  dc.w       $6d40+8*2
  dc.w       $c300
  incbin     "sitsprites/f10_2.spr"
  dc.w       $0000,0000

  CNOP       0,2

sit_10_3:
  dc.w       $6d40+8*3
  dc.w       $c300
  incbin     "sitsprites/f10_3.spr"
  dc.w       $0000,0000

  CNOP       0,2

sit_10_4:
  dc.w       $6d40+8*4
  dc.w       $c300
  incbin     "sitsprites/f10_4.spr"
  dc.w       $0000,0000

  CNOP       0,2

sit_10_5:
  dc.w       $6d40+8*5
  dc.w       $c300
  incbin     "sitsprites/f10_5.spr"
  dc.w       $0000,0000

  CNOP       0,2



sit_11_0:
  dc.w       $6d40+8*0
  dc.w       $c300
  incbin     "sitsprites/f11_0.spr"
  dc.w       $0000,0000

  CNOP       0,2

sit_11_1:
  dc.w       $6d40+8*1
  dc.w       $c300
  incbin     "sitsprites/f11_1.spr"
  dc.w       $0000,0000

  CNOP       0,2

sit_11_2:
  dc.w       $6d40+8*2
  dc.w       $c300
  incbin     "sitsprites/f11_2.spr"
  dc.w       $0000,0000

  CNOP       0,2

sit_11_3:
  dc.w       $6d40+8*3
  dc.w       $c300
  incbin     "sitsprites/f11_3.spr"
  dc.w       $0000,0000

  CNOP       0,2

sit_11_4:
  dc.w       $6d40+8*4
  dc.w       $c300
  incbin     "sitsprites/f11_4.spr"
  dc.w       $0000,0000

  CNOP       0,2

sit_11_5:
  dc.w       $6d40+8*5
  dc.w       $c300
  incbin     "sitsprites/f11_5.spr"
  dc.w       $0000,0000

  CNOP       0,2



sit_12_0:
  dc.w       $6d40+8*0
  dc.w       $c300
  incbin     "sitsprites/f12_0.spr"
  dc.w       $0000,0000

  CNOP       0,2

sit_12_1:
  dc.w       $6d40+8*1
  dc.w       $c300
  incbin     "sitsprites/f12_1.spr"
  dc.w       $0000,0000

  CNOP       0,2

sit_12_2:
  dc.w       $6d40+8*2
  dc.w       $c300
  incbin     "sitsprites/f12_2.spr"
  dc.w       $0000,0000

  CNOP       0,2

sit_12_3:
  dc.w       $6d40+8*3
  dc.w       $c300
  incbin     "sitsprites/f12_3.spr"
  dc.w       $0000,0000

  CNOP       0,2

sit_12_4:
  dc.w       $6d40+8*4
  dc.w       $c300
  incbin     "sitsprites/f12_4.spr"
  dc.w       $0000,0000

  CNOP       0,2

sit_12_5:
  dc.w       $6d40+8*5
  dc.w       $c300
  incbin     "sitsprites/f12_5.spr"
  dc.w       $0000,0000

  CNOP       0,2



sit_13_0:
  dc.w       $6d40+8*0
  dc.w       $c300
  incbin     "sitsprites/f13_0.spr"
  dc.w       $0000,0000

  CNOP       0,2

sit_13_1:
  dc.w       $6d40+8*1
  dc.w       $c300
  incbin     "sitsprites/f13_1.spr"
  dc.w       $0000,0000

  CNOP       0,2

sit_13_2:
  dc.w       $6d40+8*2
  dc.w       $c300
  incbin     "sitsprites/f13_2.spr"
  dc.w       $0000,0000

  CNOP       0,2

sit_13_3:
  dc.w       $6d40+8*3
  dc.w       $c300
  incbin     "sitsprites/f13_3.spr"
  dc.w       $0000,0000

  CNOP       0,2

sit_13_4:
  dc.w       $6d40+8*4
  dc.w       $c300
  incbin     "sitsprites/f13_4.spr"
  dc.w       $0000,0000

  CNOP       0,2

sit_13_5:
  dc.w       $6d40+8*5
  dc.w       $c300
  incbin     "sitsprites/f13_5.spr"
  dc.w       $0000,0000

  CNOP       0,2



sit_14_0:
  dc.w       $6d40+8*0
  dc.w       $c300
  incbin     "sitsprites/f14_0.spr"
  dc.w       $0000,0000

  CNOP       0,2

sit_14_1:
  dc.w       $6d40+8*1
  dc.w       $c300
  incbin     "sitsprites/f14_1.spr"
  dc.w       $0000,0000

  CNOP       0,2

sit_14_2:
  dc.w       $6d40+8*2
  dc.w       $c300
  incbin     "sitsprites/f14_2.spr"
  dc.w       $0000,0000

  CNOP       0,2

sit_14_3:
  dc.w       $6d40+8*3
  dc.w       $c300
  incbin     "sitsprites/f14_3.spr"
  dc.w       $0000,0000

  CNOP       0,2

sit_14_4:
  dc.w       $6d40+8*4
  dc.w       $c300
  incbin     "sitsprites/f14_4.spr"
  dc.w       $0000,0000

  CNOP       0,2

sit_14_5:
  dc.w       $6d40+8*5
  dc.w       $c300
  incbin     "sitsprites/f14_5.spr"
  dc.w       $0000,0000

  CNOP       0,2


sit_frame1:
  dc.l       sit_f1_0
  dc.l       sit_f1_1
  dc.l       sit_f1_2
  dc.l       sit_f1_3
  dc.l       sit_f1_4
  dc.l       sit_f1_5
  dc.l       $fffffffe
  CNOP       0,4

sit_frame2:
  dc.l       sit_f2_0
  dc.l       sit_f2_1
  dc.l       sit_f2_2
  dc.l       sit_f2_3
  dc.l       sit_f2_4
  dc.l       sit_f2_5
  dc.l       $fffffffe
  CNOP       0,4

sit_frame3:
  dc.l       sit_f3_0
  dc.l       sit_f3_1
  dc.l       sit_f3_2
  dc.l       sit_f3_3
  dc.l       sit_f3_4
  dc.l       sit_f3_5
  dc.l       $fffffffe
  CNOP       0,4

sit_frame4:
  dc.l       sit_f4_0
  dc.l       sit_f4_1
  dc.l       sit_f4_2
  dc.l       sit_f4_3
  dc.l       sit_f4_4
  dc.l       sit_f4_5
  dc.l       $fffffffe
  CNOP       0,4

sit_frame5:
  dc.l       sit_f5_0
  dc.l       sit_f5_1
  dc.l       sit_f5_2
  dc.l       sit_f5_3
  dc.l       sit_f5_4
  dc.l       sit_f5_5
  dc.l       $fffffffe
  CNOP       0,4

sit_frame6:
  dc.l       sit_f6_0
  dc.l       sit_f6_1
  dc.l       sit_f6_2
  dc.l       sit_f6_3
  dc.l       sit_f6_4
  dc.l       sit_f6_5
  dc.l       $fffffffe
  CNOP       0,4

sit_frame7:
  dc.l       sit_f7_0
  dc.l       sit_f7_1
  dc.l       sit_f7_2
  dc.l       sit_f7_3
  dc.l       sit_f7_4
  dc.l       sit_f7_5
  dc.l       $fffffffe
  CNOP       0,4

sit_frame8:
  dc.l       sit_f8_0
  dc.l       sit_f8_1
  dc.l       sit_f8_2
  dc.l       sit_f8_3
  dc.l       sit_f8_4
  dc.l       sit_f8_5
  dc.l       $fffffffe
  CNOP       0,4

sit_frame9:
  dc.l       sit_f9_0
  dc.l       sit_f9_1
  dc.l       sit_f9_2
  dc.l       sit_f9_3
  dc.l       sit_f9_4
  dc.l       sit_f9_5
  dc.l       $fffffffe
  CNOP       0,4 

sit_frame10:
  dc.l       sit_10_0
  dc.l       sit_10_1
  dc.l       sit_10_2
  dc.l       sit_10_3
  dc.l       sit_10_4
  dc.l       sit_10_5
  dc.l       $fffffffe
  CNOP       0,4

sit_frame11:
  dc.l       sit_11_0
  dc.l       sit_11_1
  dc.l       sit_11_2
  dc.l       sit_11_3
  dc.l       sit_11_4
  dc.l       sit_11_5
  dc.l       $fffffffe
  CNOP       0,4

sit_frame12:
  dc.l       sit_12_0
  dc.l       sit_12_1
  dc.l       sit_12_2
  dc.l       sit_12_3
  dc.l       sit_12_4
  dc.l       sit_12_5
  dc.l       $fffffffe
  CNOP       0,4

sit_frame13:
  dc.l       sit_13_0
  dc.l       sit_13_1
  dc.l       sit_13_2
  dc.l       sit_13_3
  dc.l       sit_13_4
  dc.l       sit_13_5
  dc.l       $fffffffe
  CNOP       0,4

sit_frame14:
  dc.l       sit_14_0
  dc.l       sit_14_1
  dc.l       sit_14_2
  dc.l       sit_14_3
  dc.l       sit_14_4
  dc.l       sit_14_5
  dc.l       $fffffffe
  CNOP       0,4

sit_currentframe:
  dc.l       sit_frame1
  dc.l       sit_frame2
  dc.l       sit_frame3
  dc.l       sit_frame7     ; imagemagick/ffmpeg/etc fucking up my ordering
  dc.l       sit_frame8
  dc.l       sit_frame9
  dc.l       sit_frame10
  dc.l       sit_frame11
  dc.l       sit_frame12
  dc.l       sit_frame13
  dc.l       sit_frame14
  dc.l       sit_frame4
  dc.l       sit_frame5
  dc.l       sit_frame6

  dc.l       $fffffffe     

  reverse_sit_currentframe:
  dc.l       sit_frame6
  dc.l       sit_frame5
  dc.l       sit_frame4
  dc.l       sit_frame14
  dc.l       sit_frame13
  dc.l       sit_frame12
  dc.l       sit_frame11
  dc.l       sit_frame10
  dc.l       sit_frame9
  dc.l       sit_frame8
  dc.l       sit_frame7     ; imagemagick/ffmpeg/etc fucking up my ordering
  dc.l       sit_frame3
  dc.l       sit_frame2
  dc.l       sit_frame1
  dc.l       $fffffffe      

  CNOP       0,4