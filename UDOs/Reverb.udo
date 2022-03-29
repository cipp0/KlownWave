opcode	Reverb, aa, akkk			
ain,kRoom, kDamp, ktype	xin		


if ktype == 0 then
denorm ain
aout_L,aout_R freeverb ain,ain, kRoom,kDamp

else

aREV_L,aREV_R reverbsc ain,ain, kRoom,kDamp*sr/2

endif

xout aout_L, aout_R
clear ain
endop

