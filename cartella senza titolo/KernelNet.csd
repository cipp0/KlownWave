a                                                                      .---.                                          
;     .           __.....__                _..._         __.....__     |   |   _..._         __.....__               
;   .'|       .-''         '.            .'     '.   .-''         '.   |   | .'     '.   .-''         '.             
; .'  |      /     .-''"'-.  `. .-,.--. .   .-.   . /     .-''"'-.  `. |   |.   .-.   . /     .-''"'-.  `.      .|   
;<    |     /     /________\   \|  .-. ||  '   '  |/     /________\   \|   ||  '   '  |/     /________\   \   .' |_  
; |   | ____|                  || |  | ||  |   |  ||                  ||   ||  |   |  ||                  | .'     | 
; |   | \ .'\    .-------------'| |  | ||  |   |  |\    .-------------'|   ||  |   |  |\    .-------------''--.  .-' 
; |   |/  .  \    '-.____...---.| |  '- |  |   |  | \    '-.____...---.|   ||  |   |  | \    '-.____...---.   |  |   
; |    /\  \  `.             .' | |     |  |   |  |  `.             .' |   ||  |   |  |  `.             .'    |  |   
; |   |  \  \   `''-...... -'   | |     |  |   |  |    `''-...... -'   '---'|  |   |  |    `''-...... -'      |  '.' 
; '    \  \  \                  |_|     |  |   |  |                         |  |   |  |                       |   /  
;'------'  '---'                        '--'   '--'                         '--'   '--'                       `'__
;

<Cabbage> 
#define buttonstyle imgfile("on", "img/buttonon.svg"), imgfile("off", "img/buttonoff.svg"), fontcolour:1("white"), fontcolour:0(220,220,220), colour("lightblue")




bounds(0, 0, 0, 0)
form caption("Kernel-Net") size(1000, 500), colour(58, 110, 182), pluginid("def1")

combobox bounds(70, 204, 100, 25), populate("*.snaps"), channelType("string") channel("combo23") value("1")
filebutton bounds(8, 204, 60, 25), text("Save", "Save"), populate("*.snaps", "test"), mode("named preset") channel("filebutton24")
filebutton bounds(8, 234, 60, 25), text("Remove", "Remove"), populate("*.snaps", "test"), mode("remove preset") channel("filebutton25")


keyboard bounds(52, 376, 424, 95)
rslider bounds(476, 32, 60, 60) range(0, 1, 0.75, 1, 0.001) channel("volume")

label bounds(174, 10, 213, 176) colour(63, 160, 241, 255) text("")
label bounds(180, 16, 200, 20) text("FM PARAMETERS") fontcolour(255, 255, 255, 255)

label bounds(766, 4, 213, 176) colour(63, 160, 241, 255) text(" ")
label bounds(772, 10, 200, 20) text("FM PARAMETERS") fontcolour(255, 255, 255, 255)

vslider bounds(6, 12, 49, 168) range(0, 7, 3, 1, 0.1) channel("carwave1")
vslider bounds(76, 12, 49, 168) range(0, 20, 0.001, 1, 0.001) channel("detune1")
vslider bounds(306, 38, 47, 119) range(0, 10, 0.001, 1, 0.001) channel("modfactor1")
hslider bounds(202, 42, 82, 53) range(0, 50, 0.001, 1, 0.001) channel("modindex1")
rslider bounds(204, 98, 76, 66) range(0, 7, 0, 1, 0.001) channel("wavemod1")

vslider bounds(632, 6, 49, 168) range(0, 7, 3, 1, 1) channel("carwave2")
vslider bounds(702, 6, 49, 168) range(0, 20, 0.001, 1, 0.001) channel("detune2")
vslider bounds(904, 42, 47, 119) range(0, 10, 0.001, 1, 0.001) channel("modfactor2")
hslider bounds(800, 46, 82, 53) range(0, 50, 0.001, 1, 0.001) channel("modindex2")
rslider bounds(802, 102, 76, 66) range(0, 7, 0, 1, 0.001) channel("wavemod2")


label bounds(468, 88, 81, 19) text("VOLUME")

label bounds(202, 82, 80, 16) text("MOD INDX") fontcolour(255, 255, 255, 255)
label bounds(292, 160, 78, 15) text("FREQ FAC") fontcolour(255, 255, 255, 255)
label bounds(196, 162, 96, 14) text("MOD WAVES") colour(255, 255, 255, 0) fontcolour(255, 255, 255, 255)


label bounds(2, 178, 57, 17) text("MORPH")
label bounds(628, 172, 56, 16) text("MORPH")
label bounds(64, 180, 80, 16) text("DETUNE")
label bounds(690, 172, 75, 17) text("DETUNE")
rslider bounds(478, 112, 60, 60) range(0, 1, 0.5, 1, 0.001) channel("ampdrywet")
label bounds(414, 140, 65, 17) text("OSC 1")
label bounds(538, 140, 63, 16) text("OSC 2")

label bounds(252, 268, 80, 16) text("CUT OFF")



combobox bounds(462, 186, 80, 20) channel("filt_menu") text("LPF18", "MOOGLADDER", "CLFILT")
vslider bounds(484, 312, 50, 150) range(0, 1, 0, 1, 0.001) channel("drywet")
rslider bounds(264, 206, 60, 60) range(20, 19000, 19000, 1, 0.001) channel("filt_freq")
rslider bounds(360, 210, 60, 60) range(0, 1, 0, 1, 0.001) channel("filt_res")
label bounds(338, 270, 98, 16) text("RESONANCE")
rslider bounds(448, 210, 60, 60) range(0, 1, 0, 1, 0.001) channel("filt_dist")

;-------------- Cabbage GUI - 1° LFO----------------------------------------------------------------------------------------------------------------------------------------------------------------

combobox bounds(616, 216, 70, 20), fontcolour("silver") channel("LFO1shape_B"), items("-","Sine","Triangle","Square","Saw Dn","Saw Up","Random"), value(1), colour(20,30,40), align("centre")
    
        rslider  bounds(616, 258, 45, 45),   channel("LFO1gain"),        range(0, 20, 0.5, 0.25, 0.01),   text("Gain"), popuppostfix(" ")
        rslider  bounds(656, 258, 45, 45),   channel("LFO1rate"),        range(0, 1000, 4, 0.25, 0.01),   text("Rate"), popuppostfix(" Hz") 
        rslider  bounds(696, 258, 45, 45),  channel("LFO1amt"),         range(-100, 100, 100, 1, 0.01),   text("Amt"), popuppostfix(" %"), $rsliderstyle

 button bounds(616, 240, 38, 17),     channel("lfo1amp"), text("Amp"), radiogroup(107), value(1), $buttonstyle 
        button bounds(656, 240, 38, 17),     channel("lfo1pitch"), text("Pitch"), radiogroup(107), $buttonstyle 
        button bounds(696, 240, 38, 17),     channel("lfo1morph"), text("Morph"), radiogroup(107), $buttonstyle  
        button bounds(736, 240, 38, 17),     channel("lfo1filter"), text("Filter"), radiogroup(107), $buttonstyle
        
;-------------- Cabbage GUI - 2° LFO----------------------------------------------------------------------------------------------------------------------------------------------------------------

combobox bounds(616, 316, 70, 20), fontcolour("silver") channel("LFO2shape_B"), items("-","Sine","Triangle","Square","Saw Dn","Saw Up","Random"), value(1), colour(20,30,40), align("centre")
    
        rslider  bounds(616, 358, 45, 45),   channel("LFO2gain"),        range(0, 20, 0.5, 0.25, 0.01),   text("Gain"), popuppostfix(" ")
        rslider  bounds(656, 358, 45, 45),   channel("LFO2rate"),        range(0, 1000, 4, 0.25, 0.01),   text("Rate"), popuppostfix(" Hz") 
        rslider  bounds(696, 358, 45, 45),  channel("LFO2amt"),         range(-100, 100, 100, 1, 0.01),   text("Amt"), popuppostfix(" %"), $rsliderstyle

 button bounds(616, 340, 38, 17),     channel("lfo2amp"), text("Amp"), radiogroup(108), value(1), $buttonstyle 
        button bounds(656, 340, 38, 17),     channel("lfo2pitch"), text("Pitch"), radiogroup(108), $buttonstyle 
        button bounds(696, 340, 38, 17),     channel("lfo2morph"), text("Morph"), radiogroup(108), $buttonstyle  
        button bounds(736, 340, 38, 17),     channel("lfo2filter"), text("Filter"), radiogroup(108), $buttonstyle
        

;-------------- Cabbage GUI - 3° LFO----------------------------------------------------------------------------------------------------------------------------------------------------------------

combobox bounds(616, 416, 70, 20), fontcolour("silver") channel("LFO3shape_B"), items("-","Sine","Triangle","Square","Saw Dn","Saw Up","Random"), value(1), colour(20,30,40), align("centre")
    
        rslider  bounds(616, 458, 45, 45),   channel("LFO3gain"),        range(0, 20, 0.5, 0.25, 0.01),   text("Gain"), popuppostfix(" ")
        rslider  bounds(656, 458, 45, 45),   channel("LFO3rate"),        range(0, 1000, 4, 0.25, 0.01),   text("Rate"), popuppostfix(" Hz") 
        rslider  bounds(696, 458, 45, 45),  channel("LFO3amt"),         range(-100, 100, 100, 1, 0.01),   text("Amt"), popuppostfix(" %"), $rsliderstyle

 button bounds(616, 440, 38, 17),     channel("lfo3amp"), text("Amp"), radiogroup(109), value(1), $buttonstyle 
        button bounds(656, 440, 38, 17),     channel("lfo3pitch"), text("Pitch"), radiogroup(109), $buttonstyle 
        button bounds(696, 440, 38, 17),     channel("lfo3morph"), text("Morph"), radiogroup(109), $buttonstyle  
        button bounds(736, 440, 38, 17),     channel("lfo3filter"), text("Filter"), radiogroup(109), $buttonstyle
                
;-------------- Cabbage GUI - 4° LFO----------------------------------------------------------------------------------------------------------------------------------------------------------------

combobox bounds(616, 516, 70, 20), fontcolour("silver") channel("LFO4shape_B"), items("-","Sine","Triangle","Square","Saw Dn","Saw Up","Random"), value(1), colour(20,30,40), align("centre")
    
        rslider  bounds(616, 558, 45, 45),   channel("LFO4gain"),        range(0, 20, 0.5, 0.25, 0.01),   text("Gain"), popuppostfix(" ")
        rslider  bounds(656, 558, 45, 45),   channel("LFO4rate"),        range(0, 1000, 4, 0.25, 0.01),   text("Rate"), popuppostfix(" Hz") 
        rslider  bounds(696, 558, 45, 45),  channel("LFO4amt"),         range(-100, 100, 100, 1, 0.01),   text("Amt"), popuppostfix(" %"), $rsliderstyle

 button bounds(616, 540, 38, 17),     channel("lfo4amp"), text("Amp"), radiogroup(110), value(1), $buttonstyle 
        button bounds(656, 540, 38, 17),     channel("lfo4pitch"), text("Pitch"), radiogroup(110), $buttonstyle 
        button bounds(696, 540, 38, 17),     channel("lfo4morph"), text("Morph"), radiogroup(110), $buttonstyle  
        button bounds(736, 540, 38, 17),     channel("lfo4filter"), text("Filter"), radiogroup(110), $buttonstyle        
        
;-------------- Cabbage GUI - 5° LFO----------------------------------------------------------------------------------------------------------------------------------------------------------------

        combobox bounds(816, 516, 70, 20), fontcolour("silver") channel("LFO5shape_B"), items("-","Sine","Triangle","Square","Saw Dn","Saw Up","Random"), value(1), colour(20,30,40), align("centre")
    
        rslider  bounds(816, 558, 45, 45),   channel("LFO5gain"),        range(0, 20, 0.5, 0.25, 0.01),   text("Gain"), popuppostfix(" ")
        rslider  bounds(856, 558, 45, 45),   channel("LFO5rate"),        range(0, 1000, 4, 0.25, 0.01),   text("Rate"), popuppostfix(" Hz") 
        rslider  bounds(896, 558, 45, 45),  channel("LFO5amt"),         range(-100, 100, 100, 1, 0.01),   text("Amt"), popuppostfix(" %"), $rsliderstyle

        button bounds(816, 540, 38, 17),     channel("lfo5amp"), text("Amp"), radiogroup(111), value(1), $buttonstyle 
        button bounds(856, 540, 38, 17),     channel("lfo5pitch"), text("Pitch"), radiogroup(111), $buttonstyle 
        button bounds(896, 540, 38, 17),     channel("lfo5morph"), text("Morph"), radiogroup(111), $buttonstyle  
        button bounds(936, 540, 38, 17),     channel("lfo5filter"), text("Filter"), radiogroup(111), $buttonstyle    

;-------------- Cabbage GUI - 6° LFO----------------------------------------------------------------------------------------------------------------------------------------------------------------

        combobox bounds(816, 416, 70, 20), fontcolour("silver") channel("LFO6shape_B"), items("-","Sine","Triangle","Square","Saw Dn","Saw Up","Random"), value(1), colour(20,30,40), align("centre")
    
        rslider  bounds(816, 458, 45, 45),   channel("LFO6gain"),        range(0, 20, 0.5, 0.25, 0.01),   text("Gain"), popuppostfix(" ")
        rslider  bounds(856, 458, 45, 45),   channel("LFO6rate"),        range(0, 1000, 4, 0.25, 0.01),   text("Rate"), popuppostfix(" Hz") 
        rslider  bounds(896, 458, 45, 45),  channel("LFO6amt"),         range(-100, 100, 100, 1, 0.01),   text("Amt"), popuppostfix(" %"), $rsliderstyle

        button bounds(816, 440, 38, 17),     channel("lfo6amp"), text("Amp"), radiogroup(112), value(1), $buttonstyle 
        button bounds(856, 440, 38, 17),     channel("lfo6pitch"), text("Pitch"), radiogroup(112), $buttonstyle 
        button bounds(896, 440, 38, 17),     channel("lfo6morph"), text("Morph"), radiogroup(112), $buttonstyle  
        button bounds(936, 440, 38, 17),     channel("lfo6filter"), text("Filter"), radiogroup(112), $buttonstyle          


;-------------- Cabbage GUI - 7° LFO----------------------------------------------------------------------------------------------------------------------------------------------------------------

        combobox bounds(816, 316, 70, 20), fontcolour("silver") channel("LFO7shape_B"), items("-","Sine","Triangle","Square","Saw Dn","Saw Up","Random"), value(1), colour(20,30,40), align("centre")
    
        rslider  bounds(816, 358, 45, 45),   channel("LFO7gain"),        range(0, 20, 0.5, 0.25, 0.01),   text("Gain"), popuppostfix(" ")
        rslider  bounds(856, 358, 45, 45),   channel("LFO7rate"),        range(0, 1000, 4, 0.25, 0.01),   text("Rate"), popuppostfix(" Hz") 
        rslider  bounds(896, 358, 45, 45),  channel("LFO7amt"),         range(-100, 100, 100, 1, 0.01),   text("Amt"), popuppostfix(" %"), $rsliderstyle

        button bounds(816, 340, 38, 17),     channel("lfo7amp"), text("Amp"), radiogroup(113), value(1), $buttonstyle 
        button bounds(856, 340, 38, 17),     channel("lfo7pitch"), text("Pitch"), radiogroup(113), $buttonstyle 
        button bounds(896, 340, 38, 17),     channel("lfo7morph"), text("Morph"), radiogroup(113), $buttonstyle  
        button bounds(936, 340, 38, 17),     channel("lfo7filter"), text("Filter"), radiogroup(113), $buttonstyle   
        
;-------------- Cabbage GUI - 8° LFO----------------------------------------------------------------------------------------------------------------------------------------------------------------

        combobox bounds(816, 216, 70, 20), fontcolour("silver") channel("LFO8shape_B"), items("-","Sine","Triangle","Square","Saw Dn","Saw Up","Random"), value(1), colour(20,30,40), align("centre")
    
        rslider  bounds(816, 258, 45, 45),   channel("LFO8gain"),        range(0, 20, 0.5, 0.25, 0.01),   text("Gain"), popuppostfix(" ")
        rslider  bounds(856, 258, 45, 45),   channel("LFO8rate"),        range(0, 1000, 4, 0.25, 0.01),   text("Rate"), popuppostfix(" Hz") 
        rslider  bounds(896, 258, 45, 45),  channel("LFO8amt"),         range(-100, 100, 100, 1, 0.01),   text("Amt"), popuppostfix(" %"), $rsliderstyle

        button bounds(816, 240, 38, 17),     channel("lfo8amp"), text("Amp"), radiogroup(114), value(1), $buttonstyle 
        button bounds(856, 240, 38, 17),     channel("lfo8pitch"), text("Pitch"), radiogroup(114), $buttonstyle 
        button bounds(896, 240, 38, 17),     channel("lfo8morph"), text("Morph"), radiogroup(114), $buttonstyle  
        button bounds(936, 240, 38, 17),     channel("lfo8filter"), text("Filter"), radiogroup(114), $buttonstyle   
        
                                            
;---------------- Cabbage GUI - ENVELOPE ADSR AMP--------------------------------------------------------------------------------------------------------------------------------------------------

groupbox bounds(150, 100, 230, 110), visible(1) , identchannel("GROUP_ENV1"), plant("GUI_ENV1"){
        image    bounds(0, 0, 230, 110), colour(20, 30, 40, 255), $bgtabstyle
        label    bounds(172,4,50,20), text("ENV1")
        rslider  bounds(0, 58, 45, 45),    channel("env1a"),        range(0.007, 10, 0.001, 0.5, 0.001),   text("A"), popuppostfix(" s"),    $rsliderstyle
        rslider  bounds(38, 58, 45, 45),   channel("env1d"),        range(0, 10, 0, 0.5, 0.001),   text("D"), popuppostfix(" s"),  $rsliderstyle
        rslider  bounds(76, 58, 45, 45),   channel("env1s"),        range(0.001, 1, 1, 1, 0.001),   text("S"), popuppostfix(" "),     $rsliderstyle
        rslider  bounds(114, 58, 45, 45),   channel("env1r"),        range(0.007, 10, 0.001, 0.5, 0.001),   text("R"), popuppostfix(" s"), $rsliderstyle
        rslider  bounds(170, 58, 45, 45),  channel("env1amt"), identchannel("ENV1AMT_BUTTON"),   range(-100, 100, 100, 1, 0.01),   text("Amt"), popuppostfix(" %"), $rsliderstyle

        button bounds(5, 30, 38, 17),   channel("env1osc1"), identchannel("ENV1OSC1_BUTTON"), text("OSC1"), value(1), $checkboxstyle
        button bounds(5, 7, 38, 17),     channel("env1amp"), text("Amp"), radiogroup(102), value(1), $buttonstyle 
       
        button bounds(119, 7, 38, 17),     channel("env1filter"), text("Filter"), radiogroup(102), $buttonstyle
        button bounds(175, 30, 38, 17),  channel("env1slope"), text("EXP","LIN"), value(0), $buttonstyleon
    }

;-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------



combobox bounds(616, 216, 70, 20), fontcolour("silver") channel("LFO1shape_B"), items("-","Sine","Triangle","Square","Saw Dn","Saw Up","Random"), value(1), colour(20,30,40), align("centre")
    
        rslider  bounds(616, 258, 45, 45),   channel("LFO1gain"),        range(0, 20, 0.5, 0.25, 0.01),   text("Gain"), popuppostfix(" ")
        rslider  bounds(656, 258, 45, 45),   channel("LFO1rate"),        range(0, 1000, 4, 0.25, 0.01),   text("Rate"), popuppostfix(" Hz") 
        rslider  bounds(696, 258, 45, 45),  channel("LFO1amt"),         range(-100, 100, 100, 1, 0.01),   text("Amt"), popuppostfix(" %"), $rsliderstyle

 button bounds(616, 240, 38, 17),     channel("lfo1amp"), text("Amp"), radiogroup(107), value(1), $buttonstyle 
        button bounds(656, 240, 38, 17),     channel("lfo1pitch"), text("Pitch"), radiogroup(107), $buttonstyle 
        button bounds(696, 240, 38, 17),     channel("lfo1morph"), text("Morph"), radiogroup(107), $buttonstyle  
        button bounds(736, 240, 38, 17),     channel("lfo1filter"), text("Filter"), radiogroup(107), $buttonstyle 
</Cabbage>
<CsoundSynthesizer>

<CsOptions>
-n -d -+rtmidi=NULL -M0 -m0d --midi-key-cps=4 --midi-velocity-amp=5
</CsOptions>
<CsInstruments>
; Initialize the global variables. 
ksmps = 32
nchnls = 2
0dbfs = 1


#include "fastLFO.udo" ; LFO
#include "fMorph.udo"    ;UDO per l'fm

opcode	scale_k,k,kkk				; UDO for an i-rate version of the 'scale' opcode
 kval,kmax,kmin	xin
 kval	=	(kval * (kmax-kmin)) + kmin
	xout	kval
endop

instr 10 

chnset  0, "button32"


endin


;buttons state initializator 
instr 11 

;;--------------------------> OSC 1

gkcarwave1  chnget "carwave1" 	; Valori di index delle tabelle per il morphing nel primo oscillatore (valori da 0 a 7)
gkcarwave1 port gkcarwave1, 0.02

;-------------------------- FM OSCILLATORE 1
gkwavemod1       chnget "wavemod1"         ;modulating waveform
gkmodfact1       chnget "modfactor1"            ;scale factor
gkmodindex1      chnget "modindex1"             ;modulation index 

gkdetune1 chnget "detune1"
gkdetune1 port gkdetune1, 0.02

;chnset  gkcarfreq1*gkmodfact1, "mod1freq"      ;displays modulating frequency 

;;--------------------------> OSC 2

gkcarwave2  chnget "carwave2" 	; Valori di index delle tabelle per il morphing nel primo oscillatore (valori da 0 a 7)
gkcarwave1 port gkcarwave1, 0.02


gkdetune2 chnget "detune2"
gkdetune2 port gkdetune2, 0.02


;-------------------------- FM OSCILLATORE 2
gkwavemod2       chnget "wavemod2"         ;modulating waveform
gkmodfact2       chnget "modfactor2"            ;scale factor
gkmodindex2      chnget "modindex2"             ;modulation index 

;chnset  gkcarfreq2*gkmodfact2, "mod2freq"

;;-------------------------- FILTRO
gkfco chnget "filt_freq" ; frequenza centrale del filtro
gkfco port gkfco, 0.02

gkres chnget "filt_res" ; resonance
gkres port gkres, 0.02

gkdist chnget "filt_dist" ; distorsione per LPF18
gkdist port gkdist, 0.02

gkmenu chnget "filt_menu" ; menù scelta del filtro


;;-------------------------- USCITA

gkvol chnget "volume" 
gkvol port gkvol, 0.02
gkdrywet chnget "ampdrywet"
gkdrywet port gkdrywet, 0.02


;------------------------LFO 1

    gklfo1shape chnget "LFO1shape_B"
    gklfo1gain chnget "LFO1gain"
    gklfo1rate chnget "LFO1rate"
    gklfo1amt chnget "LFO1amt"
    gklfo1amt/=100
    
    
    gklfo1amp chnget "lfo1amp"
    gklfo1filter chnget "lfo1filter"
    gklfo1pitch chnget "lfo1pitch"
    gklfo1morph chnget "lfo1morph"

;----------------------LFO 2

    gklfo2shape chnget "LFO2shape_B"
    gklfo2gain chnget "LFO2gain"
    gklfo2rate chnget "LFO2rate"
    gklfo2amt chnget "LFO2amt"
    gklfo2amt/=100
    
    
    gklfo2amp chnget "lfo2amp"
    gklfo2filter chnget "lfo2filter"
    gklfo2pitch chnget "lfo2pitch"
    gklfo2morph chnget "lfo2morph"

;----------------------LFO 3

    gklfo3shape chnget "LFO3shape_B"
    gklfo3gain chnget "LFO3gain"
    gklfo3rate chnget "LFO3rate"
    gklfo3amt chnget "LFO3amt"
    gklfo3amt/=100
    
    
    gklfo3amp chnget "lfo3amp"
    gklfo3filter chnget "lfo3filter"
    gklfo3pitch chnget "lfo3pitch"
    gklfo3morph chnget "lfo3morph"

;----------------------LFO 4

    gklfo4shape chnget "LFO4shape_B"
    gklfo4gain chnget "LFO4gain"
    gklfo4rate chnget "LFO4rate"
    gklfo4amt chnget "LFO4amt"
    gklfo4amt/=100
    
    
    gklfo4amp chnget "lfo4amp"
    gklfo4filter chnget "lfo4filter"
    gklfo4pitch chnget "lfo4pitch"
    gklfo4morph chnget "lfo4morph"

;----------------------LFO 5

    gklfo5shape chnget "LFO5shape_B"
    gklfo5gain chnget "LFO5gain"
    gklfo5rate chnget "LFO5rate"
    gklfo5amt chnget "LFO5amt"
    gklfo5amt/=100
    
    
    gklfo5amp chnget "lfo5amp"
    gklfo5filter chnget "lfo5filter"
    gklfo5pitch chnget "lfo5pitch"
    gklfo5morph chnget "lfo5morph"

;----------------------LFO 6

    gklfo6shape chnget "LFO6shape_B"
    gklfo6gain chnget "LFO6gain"
    gklfo6rate chnget "LFO6rate"
    gklfo6amt chnget "LFO6amt"
    gklfo6amt/=100
    
    
    gklfo6amp chnget "lfo6amp"
    gklfo6filter chnget "lfo6filter"
    gklfo6pitch chnget "lfo6pitch"
    gklfo6morph chnget "lfo6morph"
    

;----------------------LFO 7

    gklfo7shape chnget "LFO7shape_B"
    gklfo7gain chnget "LFO7gain"
    gklfo7rate chnget "LFO7rate"
    gklfo7amt chnget "LFO7amt"
    gklfo7amt/=100
    
    
    gklfo7amp chnget "lfo7amp"
    gklfo7filter chnget "lfo7filter"
    gklfo7pitch chnget "lfo7pitch"
    gklfo7morph chnget "lfo7morph"    

;----------------------LFO 8

    gklfo8shape chnget "LFO8shape_B"
    gklfo8gain chnget "LFO8gain"
    gklfo8rate chnget "LFO8rate"
    gklfo8amt chnget "LFO8amt"
    gklfo8amt/=100
    
    
    gklfo8amp chnget "lfo8amp"
    gklfo8filter chnget "lfo8filter"
    gklfo8pitch chnget "lfo8pitch"
    gklfo8morph chnget "lfo8morph"    
;---------------------ENVELOPE (ADSR) sull'ampiezza di entrambi gli oscillatori che sono in uscita

    gkenv1a chnget "env1a"
    gkenv1d chnget "env1d"
    gkenv1s chnget "env1s"
    gkenv1r chnget "env1r"
    gienv1slope chnget "env1slope"
    gkenv1amt chnget "env1amt"
    gkenv1amt/=100 
    gienv1amp chnget "env1amp"
    gienv1filter chnget "env1filter"
    gienv1pitch chnget "env1pitch"
    gienv1morph chnget "env1morph"
    gienv1slope chnget "env1slope"
    gienv1osc1 chnget "env1osc1"    
    
                                 
endin


;instrument will be triggered by keyboard widget
;sound generation CORE


instr 1	

;---------------------------------------------------------------------------- ADSR-ENVELOPE GENERATOR (AMPLITUDE)

   if gienv1slope==0 then
           kenv_1 mxadsr i(gkenv1a), i(gkenv1d), i(gkenv1s), i(gkenv1r), 0.01, 1
        else
            kenv_1 madsr i(gkenv1a), i(gkenv1d), i(gkenv1s), i(gkenv1r), 0.01, 1
        endif
        
        kenv_1 limit kenv_1,0,1 

            gkosc1envamp = kenv_1+(1*(1-gkenv1amt))

;------------------------------------------------------------------------------------ FINE ADSR --- INIZIO DEGLI 8 LFO


kLFOamp = 1
kcps = 0
icps cpsmidi

;-----------------------------------------------------------------------------------------------Inizio 1° LFO


 klfo1 fastLFO gklfo1shape, gklfo1gain, gklfo1rate                  ; LFO 1 CON UDO
 
 if (gklfo1morph==1) then                                           ; LFO SUL MORPH
           gkcarwave1 = gkcarwave1 +(klfo1*gklfo1amt*20)
           gkcarwave1 limit gkcarwave1, 0, 66
 endif
 
 if (gklfo1filter==1) then                                          ;LFO SUL FILTRO
           gkfco = gkfco +(klfo1*gklfo1amt*500) ; sistemare i valori
           gkfco limit gkfco, 40, 18000
 endif
 
  if (gklfo1pitch==1) then                                          ;LFO SUL PITCH
           kcps = kcps +(klfo1*gklfo1amt*10) ; da sistemare tutto
           
 endif
 
 
   if (gklfo1amp==1) then                                          ;LFO SULL'AMPIEZZA
           kLFOamp = kLFOamp +(klfo1*gklfo1amt)
           
 endif
 
 ;--------------------------------------------------------------------------------------------------- Inizio 2° LFO
 
 klfo2 fastLFO gklfo2shape, gklfo2gain, gklfo2rate                  ; LFO 2 CON UDO
 
 if (gklfo2morph==1) then                                           ; 2° LFO SUL MORPH
           gkcarwave1 = gkcarwave1 +(klfo2*gklfo2amt*20)
           gkcarwave1 limit gkcarwave1, 0, 66
 endif
 
 if (gklfo2filter==1) then                                          ;2° LFO SUL FILTRO
           gkfco = gkfco +(klfo2*gklfo2amt*500) ; sistemare i valori
           gkfco limit gkfco, 40, 18000
 endif
 
  if (gklfo2pitch==1) then                                          ;2° LFO SUL PITCH
           kcps = kcps +(klfo2*gklfo2amt*10) ; da sistemare tutto
           
 endif
 
 
   if (gklfo2amp==1) then                                          ;2° LFO SULL'AMPIEZZA
           kLFOamp = kLFOamp +(klfo2*gklfo2amt)
           
 endif     
 
 ;------------------------------------------------------------------------------------------------------------- Inizio 3° LFO
 
 klfo3 fastLFO gklfo3shape, gklfo3gain, gklfo3rate                  ; LFO 3 CON UDO
 
 if (gklfo3morph==1) then                                           ; 3° LFO SUL MORPH
           gkcarwave1 = gkcarwave1 +(klfo3*gklfo3amt*20)
           gkcarwave1 limit gkcarwave1, 0, 66
 endif
 
 if (gklfo3filter==1) then                                          ;3° LFO SUL FILTRO
           gkfco = gkfco +(klfo3*gklfo3amt*500) ; sistemare i valori
           gkfco limit gkfco, 40, 18000
 endif
 
  if (gklfo3pitch==1) then                                          ;3° LFO SUL PITCH
           kcps = kcps +(klfo3*gklfo3amt*10) ; da sistemare tutto
           
 endif
 
 
   if (gklfo3amp==1) then                                          ;3° LFO SULL'AMPIEZZA
           kLFOamp = kLFOamp +(klfo3*gklfo3amt)
           
 endif     

 ;------------------------------------------------------------------------------------------------------------- Inizio 4° LFO
 
 klfo4 fastLFO gklfo4shape, gklfo4gain, gklfo4rate                  ; LFO 4 CON UDO
 
 if (gklfo4morph==1) then                                           ; 4° LFO SUL MORPH
           gkcarwave1 = gkcarwave1 +(klfo4*gklfo4amt*20)
           gkcarwave1 limit gkcarwave1, 0, 66
 endif
 
 if (gklfo4filter==1) then                                          ;4° LFO SUL FILTRO
           gkfco = gkfco +(klfo4*gklfo4amt*500) ; sistemare i valori
           gkfco limit gkfco, 40, 18000
 endif
 
  if (gklfo4pitch==1) then                                          ;4° LFO SUL PITCH
           kcps = kcps +(klfo4*gklfo4amt*10) ; da sistemare tutto
           
 endif
 
 
   if (gklfo4amp==1) then                                          ;4° LFO SULL'AMPIEZZA
           kLFOamp = kLFOamp +(klfo4*gklfo4amt)
           
 endif     

 ;------------------------------------------------------------------------------------------------------------- Inizio 5° LFO
 
 klfo5 fastLFO gklfo5shape, gklfo5gain, gklfo5rate                  ; LFO 5 CON UDO
 
 if (gklfo5morph==1) then                                           ; 5° LFO SUL MORPH
           gkcarwave1 = gkcarwave1 +(klfo5*gklfo5amt*20)
           gkcarwave1 limit gkcarwave1, 0, 66
 endif
 
 if (gklfo5filter==1) then                                          ;5° LFO SUL FILTRO
           gkfco = gkfco +(klfo5*gklfo5amt*500) ; sistemare i valori
           gkfco limit gkfco, 40, 18000
 endif
 
  if (gklfo5pitch==1) then                                          ;5° LFO SUL PITCH
           kcps = kcps +(klfo5*gklfo5amt*10) ; da sistemare tutto
           
 endif
 
 
   if (gklfo5amp==1) then                                          ;5° LFO SULL'AMPIEZZA
           kLFOamp = kLFOamp +(klfo5*gklfo5amt)
           
 endif     

 ;------------------------------------------------------------------------------------------------------------- Inizio 6° LFO
 
 klfo6 fastLFO gklfo6shape, gklfo6gain, gklfo6rate                  ; LFO 6 CON UDO
 
 if (gklfo6morph==1) then                                           ; 6° LFO SUL MORPH
           gkcarwave1 = gkcarwave1 +(klfo6*gklfo6amt*20)
           gkcarwave1 limit gkcarwave1, 0, 66
 endif
 
 if (gklfo6filter==1) then                                          ;6° LFO SUL FILTRO
           gkfco = gkfco +(klfo6*gklfo6amt*500) ; sistemare i valori
           gkfco limit gkfco, 40, 18000
 endif
 
  if (gklfo6pitch==1) then                                          ;6° LFO SUL PITCH
           kcps = kcps +(klfo6*gklfo6amt*10) ; da sistemare tutto
           
 endif
 
 
   if (gklfo6amp==1) then                                          ;6° LFO SULL'AMPIEZZA
           kLFOamp = kLFOamp +(klfo6*gklfo6amt)
           
 endif     

 ;------------------------------------------------------------------------------------------------------------- Inizio 7° LFO
 
 klfo7 fastLFO gklfo7shape, gklfo7gain, gklfo7rate                  ; LFO 7 CON UDO
 
 if (gklfo7morph==1) then                                           ; 7° LFO SUL MORPH
           gkcarwave1 = gkcarwave1 +(klfo7*gklfo7amt*20)
           gkcarwave1 limit gkcarwave1, 0, 66
 endif
 
 if (gklfo7filter==1) then                                          ;7° LFO SUL FILTRO
           gkfco = gkfco +(klfo7*gklfo7amt*500) ; sistemare i valori
           gkfco limit gkfco, 40, 18000
 endif
 
  if (gklfo7pitch==1) then                                          ;7° LFO SUL PITCH
           kcps = kcps +(klfo7*gklfo7amt*10) ; da sistemare tutto
           
 endif
 
 
   if (gklfo7amp==1) then                                          ;7° LFO SULL'AMPIEZZA
           kLFOamp = kLFOamp +(klfo7*gklfo7amt)
           
 endif     

 ;------------------------------------------------------------------------------------------------------------- Inizio 8° LFO
 
 klfo8 fastLFO gklfo8shape, gklfo8gain, gklfo8rate                  ; LFO 8 CON UDO
 
 if (gklfo8morph==1) then                                           ; 8° LFO SUL MORPH
           gkcarwave1 = gkcarwave1 +(klfo8*gklfo8amt*20)
           gkcarwave1 limit gkcarwave1, 0, 66
 endif
 
 if (gklfo8filter==1) then                                          ;8° LFO SUL FILTRO
           gkfco = gkfco +(klfo8*gklfo8amt*500) ; sistemare i valori
           gkfco limit gkfco, 40, 18000
 endif
 
  if (gklfo8pitch==1) then                                          ;8° LFO SUL PITCH
           kcps = kcps +(klfo8*gklfo8amt*10) ; da sistemare tutto
           
 endif
 
 
   if (gklfo8amp==1) then                                          ;8° LFO SULL'AMPIEZZA
           kLFOamp = kLFOamp +(klfo8*gklfo8amt)
           
 endif     


;------------------------------------------------------------------------------------------------------------------------------------------- FINE DEGLI 8 LFO !!!!!!!!!!!!!!

        
       
kEnv madsr 0.02, 0.08, 0.6, 0.02

aout1 fMorph gkwavemod1, gkcarwave1, icps+gkdetune1+kcps, gkmodfact1, gkmodindex1,  88, 89, 1, 2   ;OSC1

aout2 fMorph gkwavemod2, gkcarwave2, icps+gkdetune2+kcps, gkmodfact2, gkmodindex2,  888, 899, 111, 222    ;OSC2


avol interp gkvol
adrywet interp gkdrywet           

kmix chnget "drywet"


aL = (((aout2*adrywet)+(aout1*(1-adrywet)))*0.5*avol)
aR = (((aout2*adrywet)+(aout1*(1-adrywet)))*0.5*avol)

; FILTRI 

if gkmenu = 0 then
ares lpf18 (aL+aR)*0.5, gkfco, gkres, gkdist 
elseif gkmenu = 1 then
ares moogladder2 (aL+aR), gkfco, gkres
else 
ares clfilt (aL+aR)*0.5, gkfco, 0, 10; [, ikind] [, ipbr] [, isba] [, iskip]
endif

kdeclick madsr 0.02, 0.08, 0.6, 0.02

; DCBLOCK PER EVITARE DC OFFSET ALLA FINE DELLA CATENA

ares dcblock ares

arevL, arevR  reverbsc ares, ares, 0.7, 12000, sr, 0.5, 1  
             
arevL dcblock arevL
arevR dcblock arevR       

;aoutL = (ares+arevL*a(kmix))*a(kdeclick*kLFOamp)
;aoutR = (ares+arevR*a(kmix))*a(kdeclick*kLFOamp)

;aoutL clip aoutL, 0, 0.9

;aoutR clip aoutR, 0, 0.9

outs (ares+arevL*kmix)*kLFOamp*gkosc1envamp, (ares+arevR*kmix)*kLFOamp*gkosc1envamp


;outs aout1, aout2
;outs ((aout1+aout2)*.5)*avol, ((aout1+aout2)*.5)*avol

;outs aoutL, aoutR

endin

;----------------------------------------------------


</CsInstruments>
<CsScore>


;morphing tables for OSC 1 carrier waveforms
f1 0 9 -2 3 4 5 6 7 8 9 10 11 ;12 13 14 15 16 17 18 19 20 21 22 23 24 25 26

f2 0 16384 10 1 

;morphing tables for OSC 2 carrier waveforms
f111 0 9 -2 3 4 5 6 7 8 9 10 11; 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26

f222 0 16384 10 1 

;OSC 1&2 carrier waveforms

f3 0 16384 10 1	;sine wave


;Forme d'onda di Giordani
f4 0  16384  7  0 8192 1 0 -1  8192 0;Ramp
f5 0 16384 7 1 8192-256 1 0 -1 8192+256 -1		    ;Square (slightly asym)
f6 0 16384 7 1 4772 1 0 -1 11612 -1				    ;PW1
f7 0 16384 7 1 2810 1 0 -1 13574 -1                ;PW2
f8 0 16384 7 0 16384 1 0 -1 16384 0;		;sawtooth up and down
f9 0 16384 7 0 4096-128 1  8192+128 -1 4096 0  ;!!!! Slightly asymmetric triangle
f10 0 16384 7 0.65 8192 -0.5 8182 0.35			    ; Peaked Triangle

    
f11 0 16384 1 "./Waves/BuzzBanana.wav" 0 0 1
;f11 0 16384 1 "./Waves/Acid128.wav" 0 0 1
;f12 0 16384 1 "./Waves/Bowed.wav" 0 0 1
;f13 0 16384 1 "./Waves/BuzzBanana.wav" 0 0 1
;f14 0 16384 1 "./Waves/Dist05.aif" 0 0 1
;f15 0 16384 1 "./Waves/Dist17.aif" 0 0 1
;f17 0 16384 1 "./Waves/JPSquarePWM.wav" 0 0 1
;f18 0 16384 1 "./Waves/MSSquare3.wav" 0 0 1
;f19 0 16384 1 "./Waves/NeuroSub.wav" 0 0 1
;f20 0 16384 1 "./Waves/PBass.wav" 0 0 1
;f21 0 16384 1 "./Waves/Saw_KK.wav" 0 0 1
;f22 0 16384 1 "./Waves/Saw101.wav" 0 0 1
;f23 0 16384 1 "./Waves/SawJupiter.wav" 0 0 1
;f24 0 16384 1 "./Waves/SawTB303.wav" 0 0 1
;f25 0 16384 1 "./Waves/Square101.wav" 0 0 1
;f26 0 16384 1 "./Waves/TRISUB.aif" 0 0 1









;----------------------------------------------------

;morphing tables for FM modulating waveforms (OSC 1)
f88 0 8 -2 90 91 92 93 94 95 96 97 
f89 0 256 10 1

;morphing tables for FM modulating waveforms (OSC 2)
f888 0 8 -2 90 91 92 93 94 95 96 97 
f899 0 256 10 1

;FM modulating waveforms
f90 0 256 10 1                                                                            
f91 0 256 10 1 0 0 0.01 0 0.03 0.02 0 0 0 0 0 0 0 0.01                            
f92 0 256 10 1 0 0.1 0 0 0 0 0 0 0 0 0 0 0 0.1 0 0 0 0 0 0.1                                        
f93 0 256 10 1 0 0.1 0 0 0 0 0 0 0 1 0 0 0 0.1 0 0 0 0 0 0.1
f94 0 256 10 1 0 0 0 0.025 0.07 1 0.075 0.11 0 0 0 0 0.2 0.1
f95 0 256 10 1 0 0 0 0 0 0 0 0.1 0.2 0 0 0 0 0.3 0.31 0 0 0 0 0.1 0 0.05                             
f96 0 256 10 1 0 0 0 0 0 0 0 0.1 0.2 0 0 0 0 1 1 0 0 0 0 0.1 0 0.05     
f97 0 256 10 1 0 0 0 0 0 0 0 0.4 0.2 0 0 0 0 2.5 1 0 0 0 0 0.5 0 0.2    

;----------------------------------------------------

i 11  0    z
i 10  0        .1  
;i2 0 3600

f0 z
e
</CsScore>