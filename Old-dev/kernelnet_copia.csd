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

#define buttonstyle imgFile("on", "img/buttonon.svg"), imgFile("off", "img/buttonoff.svg"), fontColour:1("white"), fontColour:0(220,220,220), colour("lightblue")
#define buttonstyleon imgFile("on", "img/buttonon.svg"), imgFile("off", "img/buttonon.svg"), fontColour:1("white"), fontColour:1("white"), colour:0("lightblue"), colour:1("lightblue")
#define buttontabstyle fontColour:1("white"), fontColour:0(220,220,220), colour("lightblue"), imgFile("on", "img/tabon.svg"), imgFile("off", "img/taboff.svg")
#define checkboxstyle fontColour:1("white"), fontColour:0(220,220,220), colour("lightblue"), imgFile("on", "img/buttonon.svg"), imgFile("off", "img/buttonoff.svg")
#define sliderstyle outlineColour(58, 58, 58, 0) filmstrip("./SynthResources/knob.png", 128)  textColour(255, 255, 255, 200) fontColour(255, 255, 255, 255) textBoxOutlineColour(0,0,0,0) trackerInsideRadius(0.67) popupText("") text("")
#define combostyle colour(120, 50, 5, 255) alpha(0.7)

bounds(0, 0, 0, 0)
form caption("KernelNet") size(1300, 600), openGL(1), pluginId("plup") bundle("./SynthResources", "./KernelNet_beta_v_01.snaps", "./UDOs") guiMode("queue")

;-------------- Background e pagliaccio ----------------------------------------------------------------------------------------------------------------------------------------------------------------

image bounds(0, 0, 1268, 600) channel("ibg") file("./SynthResources/bg.jpg")

image bounds(480, 0, 334, 404) channel("image10000") file("./SynthResources/pagliacciosint2.png")

image bounds(0, 2, 505, 182) channel("ooscil1") file("./SynthResources/oscil.png")
image bounds(790, 6, 505, 182) channel("ooscil2") file("./SynthResources/oscil.png")

image bounds(0, 182, 505, 182) channel("filter1") file("./SynthResources/filter.png")
image bounds(794, 200, 505, 182) channel("filter2") file("./SynthResources/envelope.png")

image bounds(474, 84, 200, 200) channel("occhio") file("./SynthResources/occhi.png") alpha(0)
image bounds(620, 85, 200, 200) channel("occhio1") file("./SynthResources/occhi.png") alpha(0)
rslider bounds(580, 200, 131, 130) channel("ampdrywet") range(0, 1, 0.5, 1, 0.001)  outlineColour(58, 58, 58, 0) filmstrip("./SynthResources/nasoknob.png", 128)  textColour(0, 0, 0, 255) fontColour(0, 0, 0, 255) trackerInsideRadius(0.67) 


;-------------- Presets .snaps ----------------------------------------------------------------------------------------------------------------------------------------------------------------

combobox bounds(588, 516, 123, 25), populate("*.snaps"), channelType("string") channel("combo23") value("1") automatable(0) text("FM_1", "303")
filebutton bounds(590, 542, 60, 25), text("Save", "Save"), populate("*.snaps", "test"), mode("named preset") channel("filebutton24")
filebutton bounds(650, 542, 60, 25), text("Remove", "Remove"), populate("*.snaps", "test"), mode("remove preset") channel("filebutton25")

signaldisplay bounds(522, 36, 253, 127), colour("white") displayType("waveform"), backgroundColour(147, 210, 0,0), zoom(-1), signalVariable("aoutLeft", "aoutRight"), channel("display")

;-------------- Oscillatore 1 ----------------------------------------------------------------------------------------------------------------------------------------------------------------

rslider bounds(0, 32, 120, 120) range(0, 11, 3, 1, 0.001) channel("carwave1") $sliderstyle popupText("Wavetable Morph") text("Morph") valueTextBox(1) filmstrip("./SynthResources/knob.png", 128) fontColour(255, 255, 255, 255) outlineColour(58, 58, 58, 0) textColour(255, 255, 255, 200) trackerInsideRadius(0.67) trackerOutsideRadius(0.55)
rslider bounds(100, 32, 120, 120) range(-20, 20, 0, 1, 0.001) channel("detune1") $sliderstyle popupText("Detune") text("Detune") valueTextBox(1) filmstrip("./SynthResources/knob.png", 128) fontColour(255, 255, 255, 255) outlineColour(58, 58, 58, 0) textColour(255, 255, 255, 200) trackerInsideRadius(0.67)
rslider bounds(316, 32, 120, 120) range(0, 10, 0, 1, 0.001) channel("modfactor1") $sliderstyle popupText("FM Mod") text("FM Modulation") valueTextBox(1) filmstrip("./SynthResources/knob.png", 128) fontColour(255, 255, 255, 255) outlineColour(58, 58, 58, 0) textColour(255, 255, 255, 200) trackerInsideRadius(0.67)
rslider bounds(206, 32, 120, 120) range(0, 50, 0, 1, 0.001) channel("modindex1") $sliderstyle popupText("FM Index") text("FM Index") valueTextBox(1) filmstrip("./SynthResources/knob.png", 128) fontColour(255, 255, 255, 255) outlineColour(58, 58, 58, 0) textColour(255, 255, 255, 200) trackerInsideRadius(0.67)

combobox bounds(428, 82, 57, 20) channel("wavemod1") text("Sine", "Sine 2 Harm", "Sine 3 Harm", "Sine 4 Harm", "Sine 5 Harm", "Sine 6 Harm", "Sine 7 Harm", "Sine 8 Harm")popupText("FM Src") $combostyle alpha(0.7) colour(120, 50, 5, 255)
label bounds(426, 64, 59, 12) channel("fmsrc_1") fontColour(255, 255, 255, 255) text("FM Source") alpha(0.84)


;-------------- Oscillatore 2 ----------------------------------------------------------------------------------------------------------------------------------------------------------------

rslider bounds(594, 396, 110, 110) range(0, 1, 1, 1, 0.001) channel("vol") $sliderstyle popupText("Volume") text("Volume") valueTextBox(1) filmstrip("./SynthResources/knob.png", 128) fontColour(255, 255, 255, 255) outlineColour(58, 58, 58, 0) textColour(255, 255, 255, 200) trackerInsideRadius(0.67)

rslider bounds(862, 32, 120, 120) range(0, 11, 3, 1, 0.001) $sliderstyle popupText("Wavetable Morph") text("Morph") valueTextBox(1) filmstrip("./SynthResources/knob.png", 128) fontColour(255, 255, 255, 255) outlineColour(58, 58, 58, 0) textColour(255, 255, 255, 200) trackerInsideRadius(0.67) channel("carwave")
rslider bounds(970, 32, 120, 120) range(-20, 20, 0.001, 1, 0.001) channel("detune2") $sliderstyle popupText("Detune") text("Detune") valueTextBox(1) filmstrip("./SynthResources/knob.png", 128) fontColour(255, 255, 255, 255) outlineColour(58, 58, 58, 0) textColour(255, 255, 255, 200) trackerInsideRadius(0.67)
rslider bounds(1180, 32, 120, 120) range(0, 10, 0.001, 1, 0.001) channel("modfactor2") $sliderstyle popupText("FM Mod") text("FM Modulation") valueTextBox(1) filmstrip("./SynthResources/knob.png", 128) fontColour(255, 255, 255, 255) outlineColour(58, 58, 58, 0) textColour(255, 255, 255, 200) trackerInsideRadius(0.67)
rslider bounds(1076, 32, 120, 120) range(0, 50, 0.001, 1, 0.001) channel("modindex2") $sliderstyle popupText("FM Index") text("FM Index") valueTextBox(1) filmstrip("./SynthResources/knob.png", 128) fontColour(255, 255, 255, 255) outlineColour(58, 58, 58, 0) textColour(255, 255, 255, 200) trackerInsideRadius(0.67)
combobox bounds(818, 82, 57, 20) channel("wavemod2") text("Sine", "Sine 2 Harm", "Sine 3 Harm", "Sine 4 Harm", "Sine 5 Harm", "Sine 6 Harm", "Sine 7 Harm", "Sine 8 Harm")popupText("FM Src") colour(120, 50, 5, 255) alpha(0.7)

label bounds(816, 64, 59, 12) channel("fmsrc_2") fontColour(255, 255, 255, 255) text("FM Source") alpha(0.84)

;-------------- Parametri Filtro----------------------------------------------------------------------------------------------------------------------------------------------------------------

rslider bounds(200, 220, 120, 120) channel("filAttack") range(0.001, 2, 0.2, 1, 0.001) $sliderstyle popupText("Attack") text("Attack") valueTextBox(1) filmstrip("./SynthResources/knob.png", 128) fontColour(255, 255, 255, 255) outlineColour(58, 58, 58, 0) textColour(255, 255, 255, 200) trackerInsideRadius(0.67)
rslider bounds(294, 220, 120, 120) channel("filEmphasis") range(100, 10000, 100, 1, 1) $sliderstyle popupText("Emphasis") text("Emphasis") valueTextBox(1) filmstrip("./SynthResources/knob.png", 128) fontColour(255, 255, 255, 255) outlineColour(58, 58, 58, 0) textColour(255, 255, 255, 200) trackerInsideRadius(0.67)
rslider bounds(394, 222, 120, 120) channel("filDec") range(50, 10000, 100, 1, 1) $sliderstyle popupText("Decay Freq") text("Decay Freq") valueTextBox(1) filmstrip("./SynthResources/knob.png", 128) fontColour(255, 255, 255, 255) outlineColour(58, 58, 58, 0) textColour(255, 255, 255, 200) trackerInsideRadius(0.67)
combobox bounds(340, 202, 153, 20) channel("filt_menu") text("diode_ladder", "vclpf", "spf LowPass", "spf HighPass", "spf BandPass", "svn Highpass", "svn Lowpass", "svn Bandpass", "svn Band Reject") $combostyle alpha(0.7) colour(120, 50, 5, 255)
rslider bounds(0, 220, 120, 120) range(50, 10000, 10000, 1, 0.001) channel("filt_freq") $sliderstyle popupText("Cutoff Frequency") text("Cutoff")  filmstrip("./SynthResources/knob.png", 128) fontColour(255, 255, 255, 255) outlineColour(58, 58, 58, 0) textColour(255, 255, 255, 200) trackerInsideRadius(0.67) valueTextBox(1)
rslider bounds(102, 220, 120, 120) range(0, 1, 0, 1, 0.001) channel("filt_res") $sliderstyle popupText("Resonance") text("Resonance") valueTextBox(1) filmstrip("./SynthResources/knob.png", 128) fontColour(255, 255, 255, 255) outlineColour(58, 58, 58, 0) textColour(255, 255, 255, 200) trackerInsideRadius(0.67)
rslider bounds(174, 382, 120, 120) range(0, 1, 0, 1, 0.001) channel("filt_dist") $sliderstyle popupText("Distortion") text("Distortion") valueTextBox(1) filmstrip("./SynthResources/knob.png", 128) fontColour(255, 255, 255, 255) outlineColour(58, 58, 58, 0) textColour(255, 255, 255, 200) trackerInsideRadius(0.67)


;--------------  1° LFO----------------------------------------------------------------------------------------------------------------------------------------------------------------


     

;--------------  ADSR----------------------------------------------------------------------------------------------------------------------------------------------------------------

rslider bounds(812, 236, 120, 120) channel("env1a") range(0.001, 2, 0.2, 1, 0.001) $sliderstyle valueTextBox(1) popupText("Attack") text("Attack") filmstrip("./SynthResources/knob.png", 128) fontColour(255, 255, 255, 255) outlineColour(58, 58, 58, 0) textColour(255, 255, 255, 200) trackerInsideRadius(0.67)
rslider bounds(932, 236, 120, 120) channel("env1d") range(0.001, 2, 0.2, 1, 0.001) $sliderstyle valueTextBox(1) popupText("Decay") text("Decay") filmstrip("./SynthResources/knob.png", 128) fontColour(255, 255, 255, 255) outlineColour(58, 58, 58, 0) textColour(255, 255, 255, 200) trackerInsideRadius(0.67)
rslider bounds(1052, 236, 120, 120) channel("env1s") range(0.001, 2, 1, 1, 0.001) $sliderstyle valueTextBox(1) popupText("Sustain") text("Sustain") filmstrip("./SynthResources/knob.png", 128) fontColour(255, 255, 255, 255) outlineColour(58, 58, 58, 0) textColour(255, 255, 255, 200) trackerInsideRadius(0.67)
rslider bounds(1170, 236, 120, 120) channel("env1r") range(0.01, 2, 0.4, 1, 0.001) $sliderstyle valueTextBox(1) popupText("Release") text("Release") filmstrip("./SynthResources/knob.png", 128) fontColour(255, 255, 255, 255) outlineColour(58, 58, 58, 0) textColour(255, 255, 255, 200) trackerInsideRadius(0.67)



;keyboard bounds(440, 480, 400, 100) channel("keyboard10079")







nslider bounds(8, 346, 100, 23)  range(50, 10000, 0, 1, 0.01) channel("filt_freq_disp") valueTextBox(1)
</Cabbage>
<CsoundSynthesizer>

<CsOptions>
-n -d -+rtmidi=NULL -M0 -m0d --midi-key-cps=4 --midi-velocity-amp=5 --displays
</CsOptions>
<CsInstruments>
; Initialize the global variables. 
ksmps = 512
nchnls = 2
0dbfs = 2


#include "./SynthResources/fastLFO.udo" ; LFO
#include "./SynthResources/fMorph1.udo"    ;UDO per l'fm
#include "./SynthResources/fMorph.udo"    ;UDO per l'fm
#include "./SynthResources/MOOG_Ladder.udo"; UDO filtro
#include "./UDOs/Flanger.udo"; Flanger
;#include "./SynthResources/limiter.udo"

opcode	scale_k,k,kkk				; UDO for an k-rate version of the 'scale' opcode
 kval,kmax,kmin	xin
 kval	=	(kval * (kmax-kmin)) + kmin
	xout	kval
endop




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

gkcarwave2  chnget "carwave" 	; Valori di index delle tabelle per il morphing nel primo oscillatore (valori da 0 a 7)
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
gkfcodisp tablei  gkfco/10000, 100, 1
chnset gkfcodisp, "filt_freq_disp"  

printk2 gkfcodisp

gifco = i(gkfcodisp)
gkres chnget "filt_res" ; resonance
gkres port gkres, 0.02

gkdist chnget "filt_dist" ; distorsione per LPF18
gkdist port gkdist, 0.02

gkmenu chnget "filt_menu" ; menù scelta del filtro

;;-------------------------- USCITA

gkvol chnget "vol" 
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

    
;---------------------ENVELOPE (ADSR) sull'ampiezza di entrambi gli oscillatori che sono in uscita

    gkenv1a chnget "env1a"
    gkenv1d chnget "env1d"
    gkenv1s chnget "env1s"
    gkenv1r chnget "env1r"
       
    
                                 
endin


;instrument will be triggered by keyboard widget
;sound generation CORE


instr 1	


;--------------------------------------------------------------------------------------- INIZIO DEGLI LFO


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
           gkfcodisp = gkfcodisp +(klfo1*gklfo1amt*500) ; sistemare i valori
           gkfcodisp limit gkfcodisp, 40, 18000
 endif
 
  if (gklfo1pitch==1) then                                          ;LFO SUL PITCH
           kcps = kcps +(klfo1*gklfo1amt*10) ; da sistemare tutto
           
 endif
 
 
 ;--------------------------------------------------------------------------------------------------- Inizio 2° LFO
 
 klfo2 fastLFO gklfo2shape, gklfo2gain, gklfo2rate                  ; LFO 2 CON UDO
 
 if (gklfo2morph==1) then                                           ; 2° LFO SUL MORPH
           gkcarwave1 = gkcarwave1 +(klfo2*gklfo2amt*20)
           gkcarwave1 limit gkcarwave1, 0, 66
 endif
 
 if (gklfo2filter==1) then                                          ;2° LFO SUL FILTRO
           gkfcodisp = gkfcodisp +(klfo2*gklfo2amt*500) ; sistemare i valori
           gkfcodisp limit gkfcodisp, 40, 18000
 endif
 
  if (gklfo2pitch==1) then                                          ;2° LFO SUL PITCH
           kcps = kcps +(klfo2*gklfo2amt*10) ; da sistemare tutto
           
 endif
 
   
 
 ;------------------------------------------------------------------------------------------------------------- Inizio 3° LFO
 
 klfo3 fastLFO gklfo3shape, gklfo3gain, gklfo3rate                  ; LFO 3 CON UDO
 
 if (gklfo3morph==1) then                                           ; 3° LFO SUL MORPH
           gkcarwave1 = gkcarwave1 +(klfo3*gklfo3amt*20)
           gkcarwave1 limit gkcarwave1, 0, 66
 endif
 
 if (gklfo3filter==1) then                                          ;3° LFO SUL FILTRO
           gkfcodisp = gkfcodisp +(klfo3*gklfo3amt*500) ; sistemare i valori
           gkfcodisp limit gkfcodisp, 40, 18000
 endif
 
  if (gklfo3pitch==1) then                                          ;3° LFO SUL PITCH
           kcps = kcps +(klfo3*gklfo3amt*10) ; da sistemare tutto
           
 endif
 
 

 ;------------------------------------------------------------------------------------------------------------- Inizio 4° LFO
 
 klfo4 fastLFO gklfo4shape, gklfo4gain, gklfo4rate                  ; LFO 4 CON UDO
 
 if (gklfo4morph==1) then                                           ; 4° LFO SUL MORPH
           gkcarwave1 = gkcarwave1 +(klfo4*gklfo4amt*20)
           gkcarwave1 limit gkcarwave1, 0, 66
 endif
 
 if (gklfo4filter==1) then                                          ;4° LFO SUL FILTRO
           gkfcodisp = gkfcodisp +(klfo4*gklfo4amt*500) ; sistemare i valori
           gkfcodisp limit gkfcodisp, 40, 18000
 endif
 
  if (gklfo4pitch==1) then                                          ;4° LFO SUL PITCH
           kcps = kcps +(klfo4*gklfo4amt*10) ; da sistemare tutto
           
 endif
 
 




;------------------------------------------------------------------------------------------------------------------------------------------- FINE DEGLI  LFO !!!!!!!!!!!!!!

        
   ;gkenv1a chnget "env1a"    
aEnv madsr i(gkenv1a), i(gkenv1d), i(gkenv1s), i(gkenv1r);0.02, 0.08, 0.6, 0.02

aout1 fMorph gkwavemod1, gkcarwave1, icps+gkdetune1+kcps, gkmodfact1, gkmodindex1,  88, 89, 1, 2, 0  ;OSC1

aout2 fMorph gkwavemod2, gkcarwave2, icps+gkdetune2+kcps, gkmodfact2, gkmodindex2,  888, 899, 111, 222, 0    ;OSC2


avol interp gkvol
adrywet interp gkdrywet           

kmix chnget "drywet"

iamp = ampdbfs(-7) 

aL sum (aout2*adrywet), (aout1*(1-adrywet))
aL = (aL*0.5*iamp)*aEnv

; ----------------------------------------------------------- FILTRI 


; Filter Exponential Envelope

ifilAttack chnget "filAttack"
ifilDecay chnget "env1r"
ifilEmphasis chnget "filEmphasis"
ifilDec chnget "filDec"

acut = expseg:a(i(gkfcodisp), ifilAttack, (i(gkfcodisp)+ifilEmphasis), ifilDecay, ifilDec)

  acut limit acut, 100, 10000  


 ; FILTRI  
 
 
    
if gkmenu == 1 then

    ares diode_ladder aL, acut, gkres*17., 1, 4
elseif gkmenu == 2 then

    ares vclpf aL, k(acut), gkres;, k(gifco)
elseif gkmenu == 3 then

    abp = 0
    ahp = 0
    alp  = aL
    ares spf alp,ahp,abp,acut,gkres*2 ; la resonance funzia al contrario
elseif gkmenu == 4 then
    abp = 0
    alp = 0
    ahp  = aL
    ares spf alp,ahp,abp,acut,gkres*2 ; la resonance funzia al contrario
elseif gkmenu == 5 then
    ahp = 0
    alp = 0
    abp  = aL
    ares spf alp,ahp,abp,acut,gkres*2 ; la resonance funzia al contrario
elseif gkmenu == 6 then
    gkres limit gkres, 0.5, 1.
    ares,alp1,abp1,abr1 svn aL, acut, gkres ,gkdist 
    
elseif gkmenu == 7 then
    gkres limit gkres, 0.5, 1.
    ahp1,ares,abp1,abr1 svn aL, acut, gkres ,gkdist  
    
elseif gkmenu == 8 then
    gkres limit gkres, 0.5, 1.
    ahp1,alp1,ares,abr1 svn aL, acut, gkres ,gkdist  
elseif gkmenu == 9 then
    gkres limit gkres, 0.5, 1.
   ahp1,alp1,abp1,ares svn aL, acut, gkres ,gkdist  
    

endif


; EFFETTI:


; ---------- FLANGER
; Performance
; -----------
; ain    --  input audio to which the flanging effect will be applied
; krate  --  rate control of the lfo of the effect *NOT IN HERTZ* (range 0 to 1)
; kdepth --  depth of the lfo of the effect (range 0 to 1)
; kdelay --  static delay offset of the flanging effect (range 0 to 1)
; kfback --  feedback and therefore intensity of the effect (range 0 to 1)

aout3 Flanger ares, 0.2, 0.6, 0.4, 0.7
aout4 Flanger ares, 0.2, 0.6, 0.4, 0.7
              
           
                                                                     
    
aoutL = ares;*aEnv;(kdeclick)
aoutR = ares;*aEnv;(kdeclick)




;----- balance volume!
aoutLeft balance2 aoutL, (aL*0.5)
aoutRight balance2 aoutR, (aL*0.5)

aoutLeft  = limit(aoutLeft, -0.7, .7)
aoutRight  = limit(aoutRight, -0.7, .7)

aoutLeft dcblock aoutLeft
aoutRight dcblock aoutRight 

display	aoutLeft, .01, 2
dispfft aoutLeft, .01, 512

iamp1 = ampdbfs(-6)
outs aoutLeft*iamp1*avol , aoutRight*iamp1*avol

endin

;----------------------------------------------------
;Occhi reattivi al BPM dell'Host


instr 6 ; Ricevo le info di BPM e Play/Stop dall'Host
kplay chnget "IS_PLAYING"
kBPM chnget "HOST_BPM"
kTrig metro 1;(kBPM/60)

if kTrig == 1 && kplay == 1 then
schedkwhen kTrig, 0, 0, 7, 0, 1; Triggero lo strumento 7 ogni ciclo
else
cabbageSet 1,  "occhio", "alpha", 0
cabbageSet 1,  "occhio1", "alpha", 0
endif

endin

instr 7 ; Inviluppo lineare sull'alpha del widget da 0 a 1

kline linseg  0., 0.5, 1
;printk2 kline
cabbageSet 1,  "occhio", "alpha", kline
cabbageSet 1,  "occhio1", "alpha", kline

endin


</CsInstruments>
<CsScore>
i6 0 z

;morphing tables for OSC 1 carrier waveforms
f1 0 10 -2 3 4 5 6 7 8 9 10 11 12 13; 14 15 16 17 18 19 20 21 22 23 24 25 26

f2 0 16384 10 1 

;morphing tables for OSC 2 carrier waveforms
f111 0 10 -2 300 400 500 600 700 800 900 1000 1100 1200 1300; 14 15 16 17 18 19 20 21 22 23 24 25 26

f222 0 16384 10 1 

;OSC 1&2 carrier waveforms

f3 0 16384 10 1	;sine wave
f300 0 16384 10 1	;sine wave


;Forme d'onda di Giordani
f4 0 16384  7   0       8192    1       0       -1      8192    0                              ;Ramp
f5 0 16384  7   1       7936    1       0       -1      8448    -1	                           ;Square (slightly asym)
f6 0 16384  7   0       0       1       8192    1       0       -1  8192    -1  0       0       ;Square
f7 0 16384  7   1       4772    1       0       -1      11612   -1				               ;PW1
f8 0 16384  7   1       2810    1       0       -1      13574   -1                             ;PW2
f9 0 16384  7   0       0       1       1024    1       0       -1  15360   -1  0       0      ;Pulse
f10 0 16384 7   0       16384   1       0       -1      16384   0		                       ;sawtooth up and down
f11 0 16384 7   0       4096    1       8192    -1      4096    0                              ;Triangle
f12 0 16384 7   0       3968    1       8320    -1      4096    0                              ;Slightly asymmetric triangle
f13 0 16384 7   0.65    8192    -0.5    8182    0.35			                               ;Peaked Triangle


f400 0 16384  7   0       8192    1       0       -1      8192    0                              ;Ramp
f500 0 16384  7   1       7936    1       0       -1      8448    -1	                           ;Square (slightly asym)
f600 0 16384  7   0       0       1       8192    1       0       -1  8192    -1  0       0       ;Square
f700 0 16384  7   1       4772    1       0       -1      11612   -1				               ;PW1
f800 0 16384  7   1       2810    1       0       -1      13574   -1                             ;PW2
f900 0 16384  7   0       0       1       1024    1       0       -1  15360   -1  0       0      ;Pulse
f1000 0 16384 7   0       16384   1       0       -1      16384   0		                       ;sawtooth up and down
f1100 0 16384 7   0       4096    1       8192    -1      4096    0                              ;Triangle
f1200 0 16384 7   0       3968    1       8320    -1      4096    0                              ;Slightly asymmetric triangle
f1300 0 16384 7   0.65    8192    -0.5    8182    0.35			                               ;Peaked Triangle

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

;widget evolution functions
f100 0 1025 -16  -109 1024 -3 10000                                                        ;cutoff frequency

;----------------------------------------------------

i 11  0    z
i 10  0        .1  
;i2 0 3600

f0 z
e
</CsScore>