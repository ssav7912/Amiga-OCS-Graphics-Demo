  Section    ChipRAM,Data_c
  CNOP       0,4

plane_palette_0:
  dc.l       $019e0022
  dc.l       $019c0022
  dc.l       $019a0022
  dc.l       $01980022
  dc.l       $01960022
  dc.l       $01940022
  dc.l       $01920022
  dc.l       $01900022
  dc.l       $018e0022
  dc.l       $018c0022
  dc.l       $018a0022
  dc.l       $01880022
  dc.l       $01860022
  dc.l       $01840022
  dc.l       $01820022
  dc.l       $01800022
  dc.l       $fffffffe

  CNOP       0,4

plane_palette_1:
  dc.l       $019e0021
  dc.l       $019c0183
  dc.l       $019a0174
  dc.l       $01980172
  dc.l       $01960173
  dc.l       $01940172
  dc.l       $01920162
  dc.l       $01900062
  dc.l       $018e0163
  dc.l       $018c0052
  dc.l       $018a0052
  dc.l       $01880142
  dc.l       $01860042
  dc.l       $01840042
  dc.l       $01820031
  dc.l       $01800021
  dc.l       $fffffffe

  CNOP       0,4

plane_palette_2:
  dc.l       $019e0121
  dc.l       $019c08d3
  dc.l       $019a02c2
  dc.l       $019807a3
  dc.l       $019603a2
  dc.l       $019406a3
  dc.l       $01920693
  dc.l       $019004a1
  dc.l       $018e0382
  dc.l       $018c0382
  dc.l       $018a0381
  dc.l       $01880462
  dc.l       $01860371
  dc.l       $01840151
  dc.l       $01820251
  dc.l       $01800130
  dc.l       $fffffffe

  CNOP       0,4

plane_palette_3:
  dc.l       $019e0111
  dc.l       $019c0ec9
  dc.l       $019a0ad7
  dc.l       $01980bb8
  dc.l       $01960ac5
  dc.l       $01940ba7
  dc.l       $01920a96
  dc.l       $01900de2
  dc.l       $018e09a4
  dc.l       $018c0993
  dc.l       $018a0bb2
  dc.l       $01880764
  dc.l       $01860882
  dc.l       $01840453
  dc.l       $01820651
  dc.l       $01800331
  dc.l       $fffffffe

  CNOP       0,4

plane_palette_4:
  dc.l       $019e0eee
  dc.l       $019c0dcc
  dc.l       $019a0cca
  dc.l       $01980bbb
  dc.l       $01960ba8
  dc.l       $01940aaa
  dc.l       $01920999
  dc.l       $01900c86
  dc.l       $018e0987
  dc.l       $018c0975
  dc.l       $018a0b63
  dc.l       $01880766
  dc.l       $01860853
  dc.l       $01840554
  dc.l       $01820632
  dc.l       $01800321
  dc.l       $fffffffe

  CNOP       0,4

transitionlist:
  dc.l       plane_palette_0
  dc.l       plane_palette_1
  dc.l       plane_palette_2
  dc.l       plane_palette_3
  dc.l       plane_palette_4
  dc.l       $fffffffe

  CNOP       0,4

transitionpointer:
  dc.l       transitionlist

  CNOP       0,4