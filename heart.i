;------------------------------------------
;HEARTBEAT ANIMATION - SCENE 3
;------------------------------------------
; Contains frames for the DPF heart mask and backplanes.
            Section     ChipRAM,Data_c

heart_frame1:
            incbin      "heartplanes/001.iff",$4a
            
heart_frame2:
            incbin      "heartplanes/002.iff",$4a

heart_frame3:
            incbin      "heartplanes/003.iff",$4a

heart_frame4:
            incbin      "heartplanes/004.iff",$4a

heart_frame5:
            incbin      "heartplanes/005.iff",$4a

heart_frame6:
            incbin      "heartplanes/006.iff",$4a

heart_frame7:
            incbin      "heartplanes/007.iff",$4a

heart_frame8:
            incbin      "heartplanes/008.iff",$4a

heartlist:
            dc.l        heart_frame1
            dc.l        heart_frame2
            dc.l        heart_frame3
            dc.l        heart_frame4
            dc.l        heart_frame5
            dc.l        heart_frame6
            dc.l        heart_frame7

            dc.l        heart_frame8
            dc.l        heart_frame8
            dc.l        heart_frame8
            dc.l        heart_frame8
            dc.l        heart_frame8 ;hack lol
            dc.l        heart_frame8
            dc.l        heart_frame8
            dc.l        heart_frame8
            dc.l        heart_frame8
            
            dc.l        heart_frame7
            dc.l        heart_frame6
            dc.l        heart_frame5
            dc.l        heart_frame4
            dc.l        heart_frame3
            dc.l        heart_frame2
            dc.l        heart_frame1

            dc.l        $fffffffe


heart_background1:
            incbin      "001_framed_output.iff",$50
            blk.b       320*8,0

heart_background2:
            incbin      "002_framed_output.iff",$50
            blk.b       320*8,0
            

backgroundlist:
            dc.l        heart_background1
            dc.l        heart_background2
            dc.l        $fffffffe