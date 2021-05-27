                                                                      .---.                                          
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




    gklfo1shape chnget "LFO1shape_B"
    gklfo1gain chnget "LFO1gain"
    gklfo1rate chnget "LFO1rate"
    gklfo1amt chnget "LFO1amt"
    gklfo1amt/=100
    
    
    gklfo1amp chnget "lfo1amp"
    gklfo1filter chnget "lfo1filter"
    gklfo1pitch chnget "lfo1pitch"
    gklfo1morph chnget "lfo1morph"


endin


;instrument will be triggered by keyboard widget
;sound generation CORE
instr 1	
kLFOamp = 1
kcps = 0
icps cpsmidi


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

aoutL = (ares+arevL*a(kmix))*a(kdeclick*kLFOamp)
aoutR = (ares+arevR*a(kmix))*a(kdeclick*kLFOamp)

aoutL clip aoutL, 0, 0.9

aoutR clip aoutR, 0, 0.9


;outs aout1, aout2
;outs ((aout1+aout2)*.5)*avol, ((aout1+aout2)*.5)*avol

outs aoutL, aoutR

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