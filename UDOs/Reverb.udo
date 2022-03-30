opcode	Reverb, aa, akkkk			
ain,kfblvl, kfco,kpitchm,	kmix xin		


denorm        ain    ;DENORMALIZE BOTH CHANNELS OF AUDIO SIGNAL
    
     kfco    expcurve    kfco, 4    ;CREATE A MAPPING CURVE TO GIVE A NON LINEAR RESPONSE
     kfco    scale    kfco,20000,20    ;RESCALE 0 - 1 TO 20 TO 20000
     kSwitch        changed        kpitchm    ;GENERATE A MOMENTARY '1' PULSE IN OUTPUT 'kSwitch' IF ANY OF THE SCANNED INPUT VARIABLES CHANGE. (OUTPUT 'kSwitch' IS NORMALLY ZERO)
                     ;A LABEL
     arvbL, arvbR     reverbsc     ain, ain, kfblvl, kfco, sr, i(kpitchm)
     rireturn            ;RETURN TO PERFORMANCE TIME PASSES
    
    amixL        ntrpol        ain, arvbL, kmix    ;CREATE A DRY/WET MIX BETWEEN THE DRY AND THE REVERBERATED SIGNAL
    amixR        ntrpol        ain, arvbR, kmix    ;CREATE A DRY/WET MIX BETWEEN THE DRY AND THE REVERBERATED SIGNAL
 
			xout amixL, amixR
;clear ain
endop

