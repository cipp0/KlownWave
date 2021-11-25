opcode	fastLFO,k,kkk
    kshape, kgain, krate xin
    if kshape>=1 then    
        setksmps 1
        if kshape==2 then
            klfo lfo kgain, krate, 0
        elseif kshape==3 then
            klfo lfo kgain, krate, 1
        elseif kshape==4 then
            klfo lfo kgain, krate, 2
        elseif kshape==5 then
            klfo lfo kgain, krate, 4
            klfo = -klfo
        elseif kshape==6 then
            klfo lfo kgain, krate, 5
            klfo = -klfo
        elseif kshape==7 then
            klfo randi kgain, krate
        endif
    else
        klfo = 0
    endif
    xout klfo
endop
