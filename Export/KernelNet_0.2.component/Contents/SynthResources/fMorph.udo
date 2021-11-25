opcode fMorph, a, kkkkkiiiik

kwavemod, kcarwave, kcarfreq, kmodfact, kmodindex, ia, ib, ic, id, ksub xin            

giSine ftgen 0, 0, 2^10, 10, 1  

;____modulating______          
kmodamp = kmodindex*kmodfact*kcarfreq          
kfreqmod = kmodfact+kcarfreq                             
ftmorf kwavemod, ia, ib  
amod poscil3 kmodamp, kfreqmod, ib           
    
;____carrier______          
ftmorf  kcarwave, ic, id                 

aout poscil3 .9, kcarfreq+amod, id 

aout1 poscil3 .9, kcarfreq/2, giSine

if ksub ==1 then
        
aouts = aout + aout1 
elseif ksub ==0 then

aouts=aout
endif

xout aouts

endop

