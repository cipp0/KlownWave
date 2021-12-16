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

image bounds(0, 0, 1300, 600) channel("ibg") file("./SynthResources/bg0.jpg")


image bounds(518, 474, 238, 131) channel("image10000") file("./SynthResources/scritta.png")
;image bounds(480, 32, 334, 404) channel("image11000") file("./SynthResources/pagliacciosint2.png")

image bounds(0, 2, 505, 182) channel("ooscil1") file("./SynthResources/cornice.png")
image bounds(794, 16, 505, 182) channel("ooscil2") file("./SynthResources/cornice.png")

image bounds(0, 182, 505, 182) channel("filter1") file("./SynthResources/cornice.png")
image bounds(794, 200, 505, 182) channel("filter2") file("./SynthResources/cornice.png")

image bounds(474, 116, 200, 200) channel("occhio") file("./SynthResources/occhi.png") alpha(0)
image bounds(620, 116, 200, 200) channel("occhio1") file("./SynthResources/occhi.png") alpha(0)
rslider bounds(580, 232, 131, 130) channel("ampdrywet") range(0, 1, 0.5, 1, 0.001)  outlineColour(58, 58, 58, 0) filmstrip("./SynthResources/nasoknob.png", 128)  textColour(0, 0, 0, 255) fontColour(0, 0, 0, 255) trackerInsideRadius(0.67) 


;-------------- Presets .snaps ----------------------------------------------------------------------------------------------------------------------------------------------------------------

combobox bounds(592, 404, 123, 25), populate("*.snaps"), channelType("string") channel("combo23") value("1") automatable(0) text("Growling01", "303")
filebutton bounds(592, 430, 60, 25), text("Save", "Save"), populate("*.snaps", "test"), mode("named preset") channel("filebutton24")
filebutton bounds(654, 430, 60, 25), text("Remove", "Remove"), populate("*.snaps", "test"), mode("remove preset") channel("filebutton25")

signaldisplay bounds(524, 70, 239, 117), colour("white") displayType("waveform"), backgroundColour(147, 210, 0,0), zoom(-1), signalVariable("aoutLeft", "aoutRight"), channel("display")

;-------------- Oscillatore 1 ----------------------------------------------------------------------------------------------------------------------------------------------------------------

rslider bounds(0, 32, 120, 120) range(0, 10, 3, 1, 0.001) channel("carwave1") $sliderstyle popupText("Wavetable Morph") text("Morph") valueTextBox(1) filmstrip("./SynthResources/knob.png", 128) fontColour(255, 255, 255, 255) outlineColour(58, 58, 58, 0) textColour(255, 255, 255, 200) trackerInsideRadius(0.67) trackerOutsideRadius(0.55)
rslider bounds(100, 32, 120, 120) range(-20, 20, 0, 1, 0.001) channel("detune1") $sliderstyle popupText("Detune") text("Detune") valueTextBox(1) filmstrip("./SynthResources/knob.png", 128) fontColour(255, 255, 255, 255) outlineColour(58, 58, 58, 0) textColour(255, 255, 255, 200) trackerInsideRadius(0.67)
rslider bounds(316, 32, 120, 120) range(0, 10, 0, 1, 0.001) channel("modfactor1") $sliderstyle popupText("FM Mod") text("FM Modulation") valueTextBox(1) filmstrip("./SynthResources/knob.png", 128) fontColour(255, 255, 255, 255) outlineColour(58, 58, 58, 0) textColour(255, 255, 255, 200) trackerInsideRadius(0.67)
rslider bounds(206, 32, 120, 120) range(0, 50, 0, 1, 0.001) channel("modindex1") $sliderstyle popupText("FM Index") text("FM Index") valueTextBox(1) filmstrip("./SynthResources/knob.png", 128) fontColour(255, 255, 255, 255) outlineColour(58, 58, 58, 0) textColour(255, 255, 255, 200) trackerInsideRadius(0.67)

combobox bounds(428, 82, 57, 20) channel("wavemod1") text("Sine", "Sine 2 Harm", "Sine 3 Harm", "Sine 4 Harm", "Sine 5 Harm", "Sine 6 Harm", "Sine 7 Harm", "Sine 8 Harm")popupText("FM Src") $combostyle alpha(0.7) colour(120, 50, 5, 255)
label bounds(426, 64, 59, 12) channel("fmsrc_1") fontColour(255, 255, 255, 255) text("FM Source") alpha(0.84)


;-------------- Oscillatore 2 ----------------------------------------------------------------------------------------------------------------------------------------------------------------

rslider bounds(1188, 488, 110, 110) range(0, 1, 1, 1, 0.001) channel("vol") $sliderstyle popupText("Volume") text("Volume") valueTextBox(1) filmstrip("./SynthResources/knob.png", 128) fontColour(255, 255, 255, 255) outlineColour(58, 58, 58, 0) textColour(255, 255, 255, 200) trackerInsideRadius(0.67)

rslider bounds(862, 32, 120, 120) range(0, 10, 3, 1, 0.001) $sliderstyle popupText("Wavetable Morph") text("Morph") valueTextBox(1) filmstrip("./SynthResources/knob.png", 128) fontColour(255, 255, 255, 255) outlineColour(58, 58, 58, 0) textColour(255, 255, 255, 200) trackerInsideRadius(0.67) channel("carwave")
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
rslider bounds(0, 220, 120, 120) range(0, 1, 1, 1, 0.001) channel("filt_freq") $sliderstyle popupText("Cutoff Frequency") text("Cutoff") valueTextBox(1) filmstrip("./SynthResources/knob.png", 128) fontColour(255, 255, 255, 255) outlineColour(58, 58, 58, 0) textColour(255, 255, 255, 200) trackerInsideRadius(0.67)
rslider bounds(102, 220, 120, 120) range(0, 1, 0, 1, 0.001) channel("filt_res") $sliderstyle popupText("Resonance") text("Resonance") valueTextBox(1) filmstrip("./SynthResources/knob.png", 128) fontColour(255, 255, 255, 255) outlineColour(58, 58, 58, 0) textColour(255, 255, 255, 200) trackerInsideRadius(0.67)
rslider bounds(2, 478, 120, 120) range(0, 1, 0, 1, 0.001) channel("filt_dist") $sliderstyle popupText("Distortion") text("Distortion") valueTextBox(1) filmstrip("./SynthResources/knob.png", 128) fontColour(255, 255, 255, 255) outlineColour(58, 58, 58, 0) textColour(255, 255, 255, 200) trackerInsideRadius(0.67)

;--------------  1° LFO----------------------------------------------------------------------------------------------------------------------------------------------------------------


     

;--------------  ADSR----------------------------------------------------------------------------------------------------------------------------------------------------------------

rslider bounds(812, 236, 120, 120) channel("env1a") range(0.001, 2, 0.2, 1, 0.001) $sliderstyle valueTextBox(1) popupText("Attack") text("Attack") filmstrip("./SynthResources/knob.png", 128) fontColour(255, 255, 255, 255) outlineColour(58, 58, 58, 0) textColour(255, 255, 255, 200) trackerInsideRadius(0.67)
rslider bounds(932, 236, 120, 120) channel("env1d") range(0.001, 2, 0.2, 1, 0.001) $sliderstyle valueTextBox(1) popupText("Decay") text("Decay") filmstrip("./SynthResources/knob.png", 128) fontColour(255, 255, 255, 255) outlineColour(58, 58, 58, 0) textColour(255, 255, 255, 200) trackerInsideRadius(0.67)
rslider bounds(1052, 236, 120, 120) channel("env1s") range(0.001, 2, 1, 1, 0.001) $sliderstyle valueTextBox(1) popupText("Sustain") text("Sustain") filmstrip("./SynthResources/knob.png", 128) fontColour(255, 255, 255, 255) outlineColour(58, 58, 58, 0) textColour(255, 255, 255, 200) trackerInsideRadius(0.67)
rslider bounds(1170, 236, 120, 120) channel("env1r") range(0.01, 2, 0.4, 1, 0.001) $sliderstyle valueTextBox(1) popupText("Release") text("Release") filmstrip("./SynthResources/knob.png", 128) fontColour(255, 255, 255, 255) outlineColour(58, 58, 58, 0) textColour(255, 255, 255, 200) trackerInsideRadius(0.67)



;keyboard bounds(440, 480, 400, 100) channel("keyboard10079")
image bounds(260, 428, 100, 100) file("./SynthResources/basemanopola3.png") channel("image102")
rslider bounds(244, 412, 130, 122) channel("rslider10038") range(0, 1, 0, 1, 0.001) outlineColour(58, 58, 58, 0) markerColour(80, 80, 80, 0) trackerColour(147, 210, 0, 0) fontColour(160, 160, 160, 0) imgFile("Slider", "SynthResources/manopolina2.png")


rslider bounds(468, 436, 80, 80) channel("rslider10038") range(0, 1, 0, 1, 0.001) outlineColour(58, 58, 58, 0) markerColour(80, 80, 80, 0) trackerColour(147, 210, 0, 0) fontColour(160, 160, 160, 0) imgFile("Slider", "SynthResources/manopola6.png")

;rslider bounds(468, 436, 114, 96) channel("rslider10038") range(0, 1, 0, 1, 0.001) outlineColour(58, 58, 58, 0) markerColour(80, 80, 80, 0) trackerColour(147, 210, 0, 0) fontColour(160, 160, 160, 0) imgFile("Slider", "SynthResources/manovelle.png")


</Cabbage>
<CsoundSynthesizer>

<CsOptions>
-n -d -+rtmidi=NULL -M0 -m0d --midi-key-cps=4 --midi-velocity-amp=5 --displays
</CsOptions>
<CsInstruments>
; Initialize the global variables. 
;sr			= 	44100
ksmps		= 	512
nchnls		= 	2
0dbfs		=	1	

#include "./SynthResources/fastLFO.udo" ; LFO
#include "./SynthResources/fMorph1.udo"    ;UDO per l'fm
#include "./SynthResources/fMorph.udo"    ;UDO per l'fm
#include "./SynthResources/MOOG_Ladder.udo"; UDO filtro
#include "./UDOs/Flanger.udo"; Flanger





;======================= UDO FROM JORDAN

;=========================                       
opcode AMP_ON, k,iiiii  		;Envelope (Attack / Decay  to Sustain -  No Release )
ia,irise,itype,idec, isus xin
setksmps 1

kAmpEnv	transeg	ia,irise,itype,1,idec,itype,isus

xout kAmpEnv
endop   

;==========================
opcode AMP_OFF, k,iiii  		;Envelope (Release only)
ia,irel,itype,ib xin
setksmps 1
kAmpEnv	transeg	ia,irel,itype,ib 
xout kAmpEnv
endop 
  	   
;=========================
opcode FILT_ON, k,iiiii  
ia,irise,itype,idec, isus xin
setksmps 1

kFiltEnv	transeg	ia,irise,itype,1,idec,itype,isus

xout kFiltEnv
endop  

;========================
opcode FILT_OFF, k,iiii  
ia,irel,itype,ib xin
setksmps 1

kFiltEnv	transeg	ia,irel,itype,ib

xout kFiltEnv
endop  


;=============================
;=== MAIN AUDIO WAVETABLES ===
;=============================

;------------------------Elenco di tabelle tra cui fare il morphing per l'oscillatore 1 & 2

gimorph1 ftgen 1000, 0, 10, -2, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11
gidum1 ftgen 1001, 0, 16384, 10, 1;------------------------Tabella dummy OSC 1 

gimorph2 ftgen 1002, 0, 10, -2, 12, 13, 14, 15, 16, 17, 18 ,19, 20, 21
gidum2 ftgen 1003, 0, 4096, 10, 1 ;------------------------Tabella dummy OSC 2 

;(NB: la lunghezzza in samples della dummy deve essere uguale a quella delle waves)


;----------------------- Analog-inspred WAVES

;Sawtooth up and down
giwave1 ftgen 1, 0, 16384, 7,  0,       16384,   1,       0,       -1,      16384,   0	

;Ramp 
giwave2 ftgen 2, 0, 16384, 7 ,   0,       8192,   1,       0,       -1,      8192,     0  

;Sinusoide
giwave3 ftgen 3, 0, 16384, 10, 1  

;Square (slightly asym)                    
giwave4 ftgen 4, 0, 16384,  7,   1,       7936,   1,       0,       -1,      8448,    -1

;Square
giwave5 ftgen 5, 0, 16384,  7,   0,       0,      1,       8192,    1,       0,       -1,  8192, -1,  0,  0  

;PW1
giwave6 ftgen 6, 0, 16384,  7,   1,      4772,    1,       0,       -1,      11612,   -1

;PW2								               
giwave7 ftgen 7, 0, 16384,  7,   1,       2810,    1,       0,       -1,      13574,   -1                             

;Pulse
giwave8 ftgen 8, 0, 16384,  7,   0,       0,       1,       1024,    1,       0,       -1,  15360,   -1,  0,      0     	
	                      
;Triangle
giwave9 ftgen 9, 0, 16384, 7,   0,       4096,    1,       8192,    -1,      4096,    0                              

;Slightly asymmetric triangle
giwave10 ftgen 10, 0, 16384, 7,   0,       3968,    1,       8320,    -1,      4096,    0                             

;Peaked Triangle
giwave11 ftgen 11,  0, 16384, 7,   0.65,    8192 ,   -0.5 ,   8182 ,   0.35	

;Rampoide
;giwave12 ftgen 12, 0,16384, 7, 1.000000, 16384, -1.000000,

;Rampoide controfase
;giwave13 ftgen 13,0,16384, 7, -1.000000, 16384, 1.000000

		
;----------------------- Sampled WAVES                           

;Juno1
giwave12 ftgen 12, 0, 4096, 1, "./Waves/juno1.wav" ,0, 0, 0

;Juno2
giwave13 ftgen 13, 0, 4096, 1, "./Waves/juno1.wav" ,0, 0, 0

;Juno3
giwave14 ftgen 14, 0, 4096, 1, "./Waves/juno1.wav" ,0, 0, 0

;Juno4
giwave15 ftgen 15, 0, 4096, 1, "./Waves/juno1.wav" ,0, 0, 0

;Juno5
giwave16 ftgen 16, 0, 4096, 1, "./Waves/juno1.wav" ,0, 0, 0

;Juno6
giwave17 ftgen 17, 0, 4096, 1, "./Waves/juno1.wav" ,0, 0, 0

;Juno7
giwave18 ftgen 18, 0, 4096, 1, "./Waves/juno1.wav" ,0, 0, 0

;Juno8
giwave19 ftgen 19, 0, 4096, 1, "./Waves/juno1.wav" ,0, 0, 0

;Juno9
giwave20 ftgen 20, 0, 4096, 1, "./Waves/juno1.wav" ,0, 0, 0

;Juno10
giwave21 ftgen 21, 0, 4096, 1, "./Waves/juno1.wav" ,0, 0, 0


;----------------------------------------------------

;======================= Creo le tabelle per l'FM

;morphing tables for FM modulating waveforms (OSC 1)
gimorfm1 ftgen 1010, 0, 8, -2, 2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007 
gidumfm1 ftgen 1011, 0, 256, 10, 1

;morphing tables for FM modulating waveforms (OSC 2)
gimorfm2 ftgen 1012, 0, 8, -2, 2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007 
gidumfm2 ftgen 1013, 0, 256, 10, 1

;FM modulating waveforms
giFM1 ftgen 2000, 0, 256, 10, 1                                                                            
giFM2 ftgen 2001,0, 256, 10, 1, 0, 0, 0.01, 0, 0.03, 0.02, 0, 0, 0, 0, 0, 0, 0, 0.01                            
giFM3 ftgen 2002,0, 256, 10, 1, 0, 0.1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.1, 0, 0, 0, 0, 0, 0.1                                        
giFM4 ftgen 2003,0, 256, 10, 1, 0, 0.1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0.1, 0, 0, 0, 0, 0, 0.1
giFM5 ftgen 2004,0, 256, 10, 1, 0, 0, 0, 0.025, 0.07, 1, 0.075, 0.11, 0, 0, 0, 0, 0.2, 0.1
giFM6 ftgen 2005,0, 256, 10, 1, 0 ,0, 0, 0, 0, 0, 0, 0.1, 0.2, 0, 0, 0 ,0, 0.3, 0.31, 0, 0, 0, 0, 0.1, 0, 0.05                             
giFM7 ftgen 2006,0, 256, 10, 1, 0, 0, 0 ,0, 0, 0, 0 ,0.1, 0.2, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0.1, 0, 0.05    
giFM8 ftgen 2007,0 ,256, 10, 1, 0, 0, 0, 0, 0, 0, 0, 0.4, 0.2, 0, 0, 0, 0, 2.5, 1, 0, 0, 0, 0, 0.5, 0, 0.2    

giTable_FIL ftgen 0, 0,1024, -8, 20, 184, 125, 328, 1000, 256, 4800, 256, 20000

instr 11 ;buttons state initializator 

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
gkFBASE_VCF_0 chnget "filt_freq" ; frequenza centrale del filtro
gkfco tablei gkFBASE_VCF_0, giTable_FIL,1		;Map filt. frequency to non linear table   
gkfco port gkfco, 0.02

  

gifco = i(gkfco)
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



    
;---------------------ENVELOPE (ADSR) sull'ampiezza di entrambi gli oscillatori che sono in uscita

    gkenv1a chnget "env1a"
    gkenv1d chnget "env1d"
    gkenv1s chnget "env1s"
    gkenv1r chnget "env1r"
       
    
                            
endin


;==============================
;===== MAIN AUDIO ENGINE =====
;==============================

instr 1	;


;--------------------------------------------------------------------------------------- INIZIO DEGLI LFO


kLFOamp = 1
kcps = 0
icps = p4; cpsmidi

;-----------------------------------------------------------------------------------------------Inizio 1° LFO


 ;klfo1 fastLFO gklfo1shape, gklfo1gain, gklfo1rate                  ; LFO 1 CON UDO
 
 ;if (gklfo1morph==1) then                                           ; LFO SUL MORPH
 ;          gkcarwave1 = gkcarwave1 +(klfo1*gklfo1amt*20)
 ;          gkcarwave1 limit gkcarwave1, 0, 66
; endif
 
 
;if (gklfo1filter==1) then                                          ;LFO SUL FILTRO
  ;         gkfco = gkfco +(klfo1*gklfo1amt*500) ; sistemare i valori
   ;        gkfco limit gkfco, 40, 18000
 ;endif
 
  ;if (gklfo1pitch==1) then                                          ;LFO SUL PITCH
    ;       kcps = kcps +(klfo1*gklfo1amt*10) ; da sistemare tutto
           
 ;endif
 
 




;------------------------------------------------------------------------------------------------------------------------------------------- FINE DEGLI  LFO !!!!!!!!!!!!!!

        
   ;gkenv1a chnget "env1a"    
aEnv madsr i(gkenv1a), i(gkenv1d), i(gkenv1s), i(gkenv1r);0.02, 0.08, 0.6, 0.02

aout1 fMorph gkwavemod1, gkcarwave1, icps+gkdetune1+kcps, gkmodfact1, gkmodindex1,  1010, 1011, 1000 , 1001, 1 ;OSC1

aout2 fMorph gkwavemod2, gkcarwave2, icps+gkdetune2+kcps, gkmodfact2, gkmodindex2,  1012, 1013, 1002 , 1003, 1  ;OSC2


avol interp gkvol
adrywet interp gkdrywet           

kmix chnget "drywet"

iamp = ampdbfs(0) 

aL sum (aout2*adrywet), (aout1*(1-adrywet))
aL = (aL*0.5*iamp)*aEnv

; ----------------------------------------------------------- FILTRI 


; Filter Exponential Envelope

ifilAttack chnget "filAttack"
ifilDecay chnget "env1r"
ifilEmphasis chnget "filEmphasis"
ifilDec chnget "filDec"
printk2 gkfco
acut = expseg:a(i(gkfco), ifilAttack, (i(gkfco)+ifilEmphasis), ifilDecay, ifilDec)

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

display	aoutLeft, .008, 2
dispfft aoutLeft, .008, 512

iamp1 = ampdbfs(-6)
outs aoutLeft*iamp1*avol , aoutRight*iamp1*avol

endin

;----------------------------------------------------
;Occhi reattivi al BPM dell'Host


instr 6 ; Ricevo le info di BPM e Play/Stop dall'Host
kplay chnget "IS_PLAYING"
kBPM chnget "HOST_BPM"
kTrig metro (kBPM/60)

kline linseg  0., 0.2, 1, 0.2, 0.

if kTrig == 1 && kplay == 1 then
;printk2 kTrig
cabbageSet kTrig,  "occhio", "alpha", kline
cabbageSet kTrig,  "occhio1", "alpha", kline

schedkwhen kTrig, 0, 1, 7, 0, 0.4; Triggero lo strumento 7 ogni ciclo
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


;----------------------------------------------------

i 11  0    z
i 10  0    [3600*24*365]  
;i2 0 3600

f0 z
e
</CsScore>