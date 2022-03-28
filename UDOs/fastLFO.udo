opcode	fastLFO,k,kkkk
    kshape, krate, kmin, kmax xin
    ;setksmps 1
    if kshape>=0 then    
        setksmps 1
        if kshape==1 then
            klfo lfo 1, krate, 0
            klfo scale klfo, kmin, kmax, -1, 1
        elseif kshape==2 then
            klfo lfo 1, krate, 1
            klfo scale klfo, kmin, kmax, -1, 1
        elseif kshape==3 then
            klfo lfo 1, krate, 2
            klfo scale klfo, kmin, kmax, -1, 1
        elseif kshape==4 then
            klfo lfo 1, krate, 4
            klfo scale klfo, kmin, kmax, 0, 1
           
        elseif kshape==5 then
            klfo lfo 1, krate, 5
          
            klfo scale klfo, kmin, kmax, 0, 1
            
        elseif kshape==6 then
            klfo randi 1, krate
            klfo scale klfo, kmin, kmax, -1, 1
        endif
    else
        klfo = 0
    endif
    xout klfo
endop
