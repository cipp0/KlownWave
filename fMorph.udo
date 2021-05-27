opcode fMorph, a, kkkkkiiii

kwavemod, kcarwave, kcarfreq, kmodfact, kmodindex, ia, ib, ic, id xin            

;____modulating______          
kmodamp = kmodindex*kmodfact*kcarfreq          
kfreqmod = kmodfact*kcarfreq                             
ftmorf kwavemod, ia, ib  
amod poscil3 kmodamp, kfreqmod, ib           
    
;____carrier______          
ftmorf  kcarwave, ic, id                 

aout poscil3 .8, kcarfreq+amod, id               

xout aout

endop

