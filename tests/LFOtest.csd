<Cabbage>
form caption("Untitled") size(400, 500), guiMode("queue"), pluginId("tes1")

rslider bounds(312, 176, 60, 60) channel("channel1") range(0, 1, 0, 1, 0.001)
groupbox bounds(90, 10, 200, 120) channel("LFOs") lineThickness(0), popup(0) visible(1) outlineThickness(0)colour(0, 0, 0,0){

groupbox bounds(0, 0, 50, 120) channel("LFO1") lineThickness(0), popup(0) visible(1) outlineThickness(0)colour(0, 0, 0,0){
{
label bounds(4, 0, 38, 16) channel("LFO1label") fontColour(255, 255, 255, 255) text("LFO1") 
combobox bounds(0, 20, 46, 19) channel("LFO1type") text("Sine", "Triangle", "Square", "Ramp", "Ramp Down", "Random")
nslider bounds(4, 40, 35, 22) channel("LFO1rate") range(0, 2, 0, 1, 0.001) text("Rate") textColour(255, 255, 255, 255)
nslider bounds(4, 65, 35, 22) channel("LFO1min") range(0, 20, 0, 1, 0.01) text("Min")textColour(255, 255, 255, 255)
nslider bounds(4, 90, 35, 22) channel("LFO1max") range(0, 20, 0, 1, 0.01) text("Max")textColour(255, 255, 255, 255)
}

groupbox bounds(50, 0, 50, 120) channel("LFO2") lineThickness(0), popup(0) visible(1) outlineThickness(0)colour(0, 0, 0,0){
{
label bounds(4, 0, 38, 16) channel("LFO2label") fontColour(255, 255, 255, 255) text("LFO2") 
combobox bounds(0, 20, 46, 19) channel("LFO2type") text("Sine", "Triangle", "Square", "Ramp", "Ramp Down", "Random")
nslider bounds(4, 40, 35, 22) channel("LFO2rate") range(0, 2, 0, 1, 0.001) text("Rate") textColour(255, 255, 255, 255)
nslider bounds(4, 65, 35, 22) channel("LFO2min") range(0, 20, 0, 1, 0.01) text("Min")textColour(255, 255, 255, 255)
nslider bounds(4, 90, 35, 22) channel("LFO2max") range(0, 20, 0, 1, 0.01) text("Max")textColour(255, 255, 255, 255)
}

groupbox bounds(100, 0, 50, 120) channel("LFO3") lineThickness(0), popup(0) visible(1) outlineThickness(0)colour(0, 0, 0,0){
{
label bounds(4, 0, 38, 16) channel("LFO3label") fontColour(255, 255, 255, 255) text("LFO3") 
combobox bounds(0, 20, 46, 19) channel("LFO3type") text("Sine", "Triangle", "Square", "Ramp", "Ramp Down", "Random")
nslider bounds(4, 40, 35, 22) channel("LFO3rate") range(0, 2, 0, 1, 0.001) text("Rate") textColour(255, 255, 255, 255)
nslider bounds(4, 65, 35, 22) channel("LFO3min") range(0, 20, 0, 1, 0.01) text("Min")textColour(255, 255, 255, 255)
nslider bounds(4, 90, 35, 22) channel("LFO3max") range(0, 20, 0, 1, 0.01) text("Max")textColour(255, 255, 255, 255)
}

groupbox bounds(150, 0, 50, 120) channel("LFO4") lineThickness(0), popup(0) visible(1) outlineThickness(0)colour(0, 0, 0,0){
{
label bounds(4, 0, 38, 16) channel("LFO4label") fontColour(255, 255, 255, 255) text("LFO4") 
combobox bounds(0, 20, 46, 19) channel("LFO4type") text("Sine", "Triangle", "Square", "Ramp", "Ramp Down", "Random")
nslider bounds(4, 40, 35, 22) channel("LFO4rate") range(0, 2, 0, 1, 0.001) text("Rate") textColour(255, 255, 255, 255)
nslider bounds(4, 65, 35, 22) channel("LFO4min") range(0, 20, 0, 1, 0.01) text("Min")textColour(255, 255, 255, 255)
nslider bounds(4, 90, 35, 22) channel("LFO4max") range(0, 20, 0, 1, 0.01) text("Max")textColour(255, 255, 255, 255)
}
}


groupbox bounds(90, 370, 200, 120) channel("LFOs2") lineThickness(0), popup(0) visible(1) outlineThickness(0)colour(0, 0, 0,0){

groupbox bounds(0, 0, 50, 120) channel("LFO5") lineThickness(0), popup(0) visible(1) outlineThickness(0)colour(0, 0, 0,0){
{
label bounds(4, 0, 38, 16) channel("LFO5label") fontColour(255, 255, 255, 255) text("LFO5") 
combobox bounds(0, 20, 46, 19) channel("LFO5type") text("Sine", "Triangle", "Square", "Ramp", "Ramp Down", "Random")
nslider bounds(4, 40, 35, 22) channel("LFO5rate") range(0, 2, 0, 1, 0.001) text("Rate") textColour(255, 255, 255, 255)
nslider bounds(4, 65, 35, 22) channel("LFO5min") range(0, 20, 0, 1, 0.01) text("Min")textColour(255, 255, 255, 255)
nslider bounds(4, 90, 35, 22) channel("LFO5max") range(0, 20, 0, 1, 0.01) text("Max")textColour(255, 255, 255, 255)
}

groupbox bounds(50, 0, 50, 120) channel("LFO6") lineThickness(0), popup(0) visible(1) outlineThickness(0)colour(0, 0, 0,0){
{
label bounds(4, 0, 38, 16) channel("LFO6label") fontColour(255, 255, 255, 255) text("LFO6") 
combobox bounds(0, 20, 46, 19) channel("LFO6type") text("Sine", "Triangle", "Square", "Ramp", "Ramp Down", "Random")
nslider bounds(4, 40, 35, 22) channel("LFO6rate") range(0, 2, 0, 1, 0.001) text("Rate") textColour(255, 255, 255, 255)
nslider bounds(4, 65, 35, 22) channel("LFO6min") range(0, 20, 0, 1, 0.01) text("Min")textColour(255, 255, 255, 255)
nslider bounds(4, 90, 35, 22) channel("LFO6max") range(0, 20, 0, 1, 0.01) text("Max")textColour(255, 255, 255, 255)
}

groupbox bounds(100, 0, 50, 120) channel("LFO7") lineThickness(0), popup(0) visible(1) outlineThickness(0)colour(0, 0, 0,0){
{
label bounds(4, 0, 38, 16) channel("LFO7label") fontColour(255, 255, 255, 255) text("LFO7") 
combobox bounds(0, 20, 46, 19) channel("LFO7type") text("Sine", "Triangle", "Square", "Ramp", "Ramp Down", "Random")
nslider bounds(4, 40, 35, 22) channel("LFO7rate") range(0, 2, 0, 1, 0.001) text("Rate") textColour(255, 255, 255, 255)
nslider bounds(4, 65, 35, 22) channel("LFO7min") range(0, 20, 0, 1, 0.01) text("Min")textColour(255, 255, 255, 255)
nslider bounds(4, 90, 35, 22) channel("LFO7max") range(0, 20, 0, 1, 0.01) text("Max")textColour(255, 255, 255, 255)
}

groupbox bounds(150, 0, 50, 120) channel("LFO8") lineThickness(0), popup(0) visible(1) outlineThickness(0)colour(0, 0, 0,0){
{
label bounds(4, 0, 38, 16) channel("LFO8label") fontColour(255, 255, 255, 255) text("LFO8") 
combobox bounds(0, 20, 46, 19) channel("LFO8type") text("Sine", "Triangle", "Square", "Ramp", "Ramp Down", "Random")
nslider bounds(4, 40, 35, 22) channel("LFO8rate") range(0, 2, 0, 1, 0.001) text("Rate") textColour(255, 255, 255, 255)
nslider bounds(4, 65, 35, 22) channel("LFO8min") range(0, 20, 0, 1, 0.01) text("Min")textColour(255, 255, 255, 255)
nslider bounds(4, 90, 35, 22) channel("LFO8max") range(0, 20, 0, 1, 0.01) text("Max")textColour(255, 255, 255, 255)
}
}

groupbox bounds(46, 136, 300, 220) channel("matrix") lineThickness(0),   outlineThickness(0)colour(0, 0, 0, 0){

groupbox bounds(0, 0, 400, 220) channel("LABELS") lineThickness(0),   outlineThickness(0)colour(0, 0, 0, 0){

label bounds(0, 20, 38, 12) channel("label1") fontColour(255, 255, 255, 255) text("LFO1") 
label bounds(0, 45, 38, 12) channel("label2") fontColour(255, 255, 255, 255) text("LFO2") 
label bounds(0, 70, 38, 12) channel("label3") fontColour(255, 255, 255, 255) text("LFO3") 
label bounds(0, 95, 38, 12) channel("label4") fontColour(255, 255, 255, 255) text("LFO4") 
label bounds(0, 120, 38, 12) channel("label5") fontColour(255, 255, 255, 255) text("LFO5") 
label bounds(0, 145, 38, 12) channel("label6") fontColour(255, 255, 255, 255) text("LFO6") 
label bounds(0, 170, 38, 12) channel("label7") fontColour(255, 255, 255, 255) text("LFO7") 
label bounds(0, 195, 38, 12) channel("label8") fontColour(255, 255, 255, 255) text("LFO8") 

label bounds(23, 0, 62, 12) channel("label2") fontColour(255, 255, 255, 255) text("MorphWT1") 
}
groupbox bounds(0, 0, 400, 220) channel("buttons") lineThickness(0),   outlineThickness(0)colour(0, 0, 0, 0){

checkbox bounds(40, 17, 20, 20) channel("check1")
checkbox bounds(65, 17, 20, 20) channel("check2")
checkbox bounds(90, 17, 20, 20) channel("check3")
checkbox bounds(115, 17, 20, 20) channel("check4")
checkbox bounds(140, 17, 20, 20) channel("check5")
checkbox bounds(165, 17, 20, 20) channel("check6")
checkbox bounds(190, 17, 20, 20) channel("check7")
checkbox bounds(215, 17, 20, 20) channel("check8")
checkbox bounds(240, 17, 20, 20) channel("check9")

checkbox bounds(40, 42, 20, 20) channel("check10")
checkbox bounds(65, 42, 20, 20) channel("check11")
checkbox bounds(90, 42, 20, 20) channel("check12")
checkbox bounds(115, 42, 20, 20) channel("check13")
checkbox bounds(140, 42, 20, 20) channel("check14")
checkbox bounds(165, 42, 20, 20) channel("check15")
checkbox bounds(190, 42, 20, 20) channel("check16")
checkbox bounds(215, 42, 20, 20) channel("check17")
checkbox bounds(240, 42, 20, 20) channel("check18")

checkbox bounds(40, 67, 20, 20) channel("check19")
checkbox bounds(65, 67, 20, 20) channel("check20")
checkbox bounds(90, 67, 20, 20) channel("check21")
checkbox bounds(115, 67, 20, 20) channel("check22")
checkbox bounds(140, 67, 20, 20) channel("check23")
checkbox bounds(165, 67, 20, 20) channel("check24")
checkbox bounds(190, 67, 20, 20) channel("check25")
checkbox bounds(215, 67, 20, 20) channel("check26")
checkbox bounds(240, 67, 20, 20) channel("check27")

checkbox bounds(40, 92, 20, 20) channel("check28")
checkbox bounds(65, 92, 20, 20) channel("check29")
checkbox bounds(90, 92, 20, 20) channel("check30")
checkbox bounds(115, 92, 20, 20) channel("check31")
checkbox bounds(140, 92, 20, 20) channel("check32")
checkbox bounds(165, 92, 20, 20) channel("check33")
checkbox bounds(190, 92, 20, 20) channel("check34")
checkbox bounds(215, 92, 20, 20) channel("check35")
checkbox bounds(240, 92, 20, 20) channel("check36")

checkbox bounds(40, 117, 20, 20) channel("check37")
checkbox bounds(65, 117, 20, 20) channel("check38")
checkbox bounds(90, 117, 20, 20) channel("check39")
checkbox bounds(115, 117, 20, 20) channel("check40")
checkbox bounds(140, 117, 20, 20) channel("check41")
checkbox bounds(165, 117, 20, 20) channel("check42")
checkbox bounds(190, 117, 20, 20) channel("check43")
checkbox bounds(215, 117, 20, 20) channel("check44")
checkbox bounds(240, 117, 20, 20) channel("check45")

checkbox bounds(40, 142, 20, 20) channel("check46")
checkbox bounds(65, 142, 20, 20) channel("check47")
checkbox bounds(90, 142, 20, 20) channel("check48")
checkbox bounds(115, 142, 20, 20) channel("check49")
checkbox bounds(140, 142, 20, 20) channel("check50")
checkbox bounds(165, 142, 20, 20) channel("check51")
checkbox bounds(190, 142, 20, 20) channel("check52")
checkbox bounds(215, 142, 20, 20) channel("check53")
checkbox bounds(240, 142, 20, 20) channel("check54")

checkbox bounds(40, 167, 20, 20) channel("check55")
checkbox bounds(65, 167, 20, 20) channel("check56")
checkbox bounds(90, 167, 20, 20) channel("check57")
checkbox bounds(115, 167, 20, 20) channel("check58")
checkbox bounds(140, 167, 20, 20) channel("check59")
checkbox bounds(165, 167, 20, 20) channel("check60")
checkbox bounds(190, 167, 20, 20) channel("check61")
checkbox bounds(215, 167, 20, 20) channel("check62")
checkbox bounds(240, 167, 20, 20) channel("check63")

checkbox bounds(40, 192, 20, 20) channel("check64")
checkbox bounds(65, 192, 20, 20) channel("check65")
checkbox bounds(90, 192, 20, 20) channel("check66")
checkbox bounds(115, 192, 20, 20) channel("check67")
checkbox bounds(140, 192, 20, 20) channel("check68")
checkbox bounds(165, 192, 20, 20) channel("check69")
checkbox bounds(190, 192, 20, 20) channel("check70")
checkbox bounds(215, 192, 20, 20) channel("check71")
checkbox bounds(240, 192, 20, 20) channel("check72")
}
}
</Cabbage>
<CsoundSynthesizer>
<CsOptions>
-n -d -+rtmidi=NULL -M0 --midi-key-cps=4 --midi-velocity-amp=5
</CsOptions>
<CsInstruments>
; Initialize the global variables. 
ksmps = 32
nchnls = 2
0dbfs = 1

opcode	fastLFO,k,kkkk
    kshape, krate, kmin, kmax xin
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

instr 1
endin
;instrument will be triggered by keyboard widget
instr 2

kbutton cabbageGetValue "button1"
printk2 kbutton
    ;printk2 kX 
    kchannel1 cabbageGetValue  "channel1"
    ;printk 2, kchannel1
    kcheck1 cabbageGetValue "check1"
    krate cabbageGetValue "LFO1rate"
    kmin cabbageGetValue "LFO1min"
    kmax cabbageGetValue "LFO1max"
    
    
    kcombo1 cabbageGetValue "LFO1type"
    ;printk2 kcombo1
    
   
    if kcheck1 == 1 then;&&  kDragged = 1 && kDropped = 1 && kbutton == 0 then 
    klfo fastLFO kcombo1, krate, kmin, kmax
      cabbageSetValue "channel1", klfo
    endif
    
    if kbutton == 1 then
    kDropped = 0
    kDragged=0
    endif
endin

</CsInstruments>
<CsScore>
;causes Csound to run for about 7000 years...
f0 z

i2 0 3600*7
</CsScore>
</CsoundSynthesizer>
