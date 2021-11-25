opcode MOOG_Ladder, a, akkk

   setksmps 1


ipi init $M_PI				;


az1 init 0             /* filter delays */
az2 init 0
az3 init 0
az4 init 0
az5 init 0
ay4 init 0
amf init 0

inv_sr  init 1/sr
i2v     init 40000		;thermal voltage of a transistor   
inv_i2v init 1/i2v		;inversal of the twice the thermal voltage of a transistor


asig,kcf,kres,kmod  xin		; asig=input signal  kcf = cutoff freq. in Hz    kres = resonance (0-1)



kfc = kcf*inv_sr  			;sr is half the actual filter sampling rate 
kf = kcf * inv_sr * 0.5   	; kf =  kcf/(sr*2)

;Frequency & amplitude correction 
 
kfcr = 1.8730*(kfc*kfc*kfc) + 0.4955*(kfc*kfc) - 0.6490*kfc + 0.9988
kacr = -3.9364*(kfc*kfc) + 1.8409*kfc + 0.9968				
k2vg = i2v*(1-exp(-2*$M_PI*kfcr*kf)) 						; filter tuning 



;cascade of 4 1st order sections 

;ay1 = az1 + k2vg*(tanh((asig - 4*kres*amf*kacr)*inv_i2v) - tanh(az1*inv_i2v))

ay1 = az1 + k2vg*((asig - 4*kres*amf*kacr)*inv_i2v - az1*inv_i2v) 

az1 = ay1

;kvalore downsamp k2vg*((asig - 4*kres*amf*kacr)*inv_i2v - az1*inv_i2v)
;printk 0.5, kvalore

aX21 = ay1*inv_i2v
aX22 = az2*inv_i2v



;ay2 = az2 + k2vg * (tanh(ay1*inv_i2v) - tanh(az2*inv_i2v))

ay2 = az2 + k2vg * ((ay1*inv_i2v) - (az2*inv_i2v))

az2 = ay2

aX31 = ay2*inv_i2v
aX32 = az3*inv_i2v

;ay3 = az3 + k2vg * (tanh(ay2*inv_i2v) - tanh(az3*inv_i2v))
ay3 = az3 + k2vg * ((ay2*inv_i2v) - (az3*inv_i2v))

az3 = ay3

aX41 = ay3*inv_i2v
aX42 = az4*inv_i2v

;ay4 = az4 + k2vg * (tanh(ay3*inv_i2v) - tanh(az4*inv_i2v))

ay4 = az4 + k2vg * ((ay3*inv_i2v) - (az4*inv_i2v))
az4 = ay4


; 1/2-sample delay for phase compensation
amf = (ay4+az5)*0.5
az5 = ay4

;oversampling

ay1 = az1 + k2vg*(((asig - 4*kres*amf*kacr)*inv_i2v) - (az1*inv_i2v))
az1 = ay1
ay2 = az2 + k2vg*((ay1*inv_i2v) - (az2*inv_i2v ))
az2 = ay2
ay3 = az3 + k2vg*((ay2*inv_i2v) - (az3*inv_i2v))
az3 = ay3
ay4 = az4 + k2vg*((ay3*inv_i2v) - (az4*inv_i2v))
az4 = ay4

amf = (ay4+az5)*0.5
az5 = ay4
        
        xout  amf
	
endop
