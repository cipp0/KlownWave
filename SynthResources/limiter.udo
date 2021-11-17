opcode limitor, a, akkk
ain, ktresh, ksmooth, kgain xin

 kthresh 		init 0; read in widgets
 ksmooth	 	init 0	; this is needed as an i-time variable so will have to be cast as an i variable and a reinitialisation forced
 kthresh	=		ampdbfs(kthresh)	; convert threshold to an amplitude value
 if changed(ksmooth)==1 then			; if Smoothing slider is moved...
  reinit REINIT							; ... force a reinitialisation
 endif
 REINIT:								; reinitialise from here
 krmsL		rms		ain,1/i(ksmooth)		; scan both channels
 rireturn								; return to performance pass from reinitialisation pass (if applicable)
 krms		max		krmsL, krmsL			; but only used the highest rms

 kdelay		chnget	"delay"				
 if kdelay>0 then						; if Delay value is anything above zero ...
  ain	vdelay	ain, kdelay*1000, 200	; delay audio signals before limiting
  
 endif

 if krms>kthresh then					; if current RMS is above threshold; i.e. limiting required
  kfctr		=	kthresh/krms			; derive less than '1' factor required to attenuate audio signal to limiting value
  afctr		interp	kfctr				; smooth changes (and interpolate from k to a)
  ain_L		=	ain * afctr			; apply scaling factor
  
  klimiting	=	1				; switch value used by GUI indicator (on)
 else
  ain_L		=	ain				; pass audio signals unchanged
  klimiting	=	0				; switch value used by GUI indicator (off)
 endif

 kgain		chnget	"gain"				; make up gain control
 kgain		=	ampdb(kgain)			; derive gain value as an amplitude factor
 ain_L		*=	kgain				; make up gain

 if metro(16)==1 then					; peg rate if updates of limiting indicator (to save a bit of CPU)
  		chnset	klimiting,"limiting"		; send value for limiting indicator
 endif

	xout 	ain_L				; send limited audio signals to outputs
endop
