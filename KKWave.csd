   ▄█   ▄█▄    ▄████████    ▄████████ ███▄▄▄▄      ▄████████  ▄█       ███▄▄▄▄      ▄████████     ███     
  ███ ▄███▀   ███    ███   ███    ███ ███▀▀▀██▄   ███    ███ ███       ███▀▀▀██▄   ███    ███ ▀█████████▄ 
  ███▐██▀     ███    █▀    ███    ███ ███   ███   ███    █▀  ███       ███   ███   ███    █▀     ▀███▀▀██ 
 ▄█████▀     ▄███▄▄▄      ▄███▄▄▄▄██▀ ███   ███  ▄███▄▄▄     ███       ███   ███  ▄███▄▄▄         ███   ▀ 
▀▀█████▄    ▀▀███▀▀▀     ▀▀███▀▀▀▀▀   ███   ███ ▀▀███▀▀▀     ███       ███   ███ ▀▀███▀▀▀         ███     
  ███▐██▄     ███    █▄  ▀███████████ ███   ███   ███    █▄  ███       ███   ███   ███    █▄      ███     
  ███ ▀███▄   ███    ███   ███    ███ ███   ███   ███    ███ ███▌    ▄ ███   ███   ███    ███     ███     
  ███   ▀█▀   ██████████   ███    ███  ▀█   █▀    ██████████ █████▄▄██  ▀█   █▀    ██████████    ▄████▀   
  ▀                        ███    ███                        ▀                                            

<Cabbage> 

#define sliderstyle outlineColour(58, 58, 58, 0) filmstrip("./SynthResources/knob.png", 128)  textColour(255, 255, 255, 200) fontColour(255, 255, 255, 255) textBoxOutlineColour(0,0,0,0) trackerInsideRadius(0.67) popupText("") text("")
#define combostyle colour(120, 50, 5, 255) alpha(0.7)

bounds(0, 0, 0, 0)
form caption("KernelNet") size(1300, 600), openGL(1), pluginId("KKW3") bundle("./SynthResources", "./KKWave.snaps", "./UDOs", "./Waves") guiMode("queue")

;-------------- Background e pagliaccio ----------------------------------------------------------------------------------------------------------------------------------------------------------------

image bounds(0, 0, 1300, 600) channel("ibg") file("./SynthResources/bg0.jpg")


image bounds(518, 474, 238, 131) channel("image1") file("./SynthResources/scritta.png")

;image bounds(0, 2, 505, 182) channel("ooscil1") file("./SynthResources/cornice.png")
;image bounds(794, 16, 505, 182) channel("ooscil2") file("./SynthResources/cornice.png")

;image bounds(0, 182, 505, 182) channel("filter1") file("./SynthResources/cornice.png")
;image bounds(794, 200, 505, 182) channel("filter2") file("./SynthResources/cornice.png")

image bounds(474, 116, 200, 200) channel("occhio") file("./SynthResources/occhi.png") alpha(0)
image bounds(620, 116, 200, 200) channel("occhio1") file("./SynthResources/occhi.png") alpha(0)
rslider bounds(580, 232, 131, 130) channel("ampdrywet") range(0, 1, 0.5, 1, 0.001)  outlineColour(58, 58, 58, 0) filmstrip("./SynthResources/nasoknob.png", 128)  textColour(0, 0, 0, 255) fontColour(0, 0, 0, 255) trackerInsideRadius(0.67) 


;-------------- Presets .snaps ----------------------------------------------------------------------------------------------------------------------------------------------------------------

combobox bounds(592, 404, 123, 25), populate("*.snaps"), channelType("string") channel("combo23") value("1") automatable(0) text("Growling01", "303")
filebutton bounds(592, 430, 60, 25), text("Save", "Save"), populate("*.snaps", "test"), mode("named preset") channel("filebutton24")
filebutton bounds(654, 430, 60, 25), text("Remove", "Remove"), populate("*.snaps", "test"), mode("remove preset") channel("filebutton25")

signaldisplay bounds(524, 70, 239, 117), colour("white") displayType("waveform"), backgroundColour(147, 210, 0,0), zoom(-1), signalVariable("adisplay", "adisplay"), channel("display")

;-------------- Oscillatore 1 ----------------------------------------------------------------------------------------------------------------------------------------------------------------
;wavetable
rslider bounds(232, 58, 60, 60) range(0, 10, 3, 1, 0.001) channel("MorphWT_1") $sliderstyle popupText("Wavetable Morph") text("Morph") valueTextBox(0) 
rslider bounds(292, 58, 60, 60) range(-20, 20, 0, 1, 0.001) channel("DetuneWT_1") $sliderstyle popupText("Detune") text("Detune") valueTextBox(0) 
rslider bounds(352, 58, 60, 60) range(0, 1, 0.75, 1, 0.001) channel("AmpWT_1") $sliderstyle popupText("Gain") text("Gain") valueTextBox(0) 
label bounds(238, 38, 100, 20) channel("WT") fontColour(255, 255, 255, 255) text("Wavetable") alpha(0.60)

;VCO
rslider bounds(32, 58, 60, 60) range(0.0001, 0.99999, 0.0001, 1, 0.001) channel("PWM_1") $sliderstyle popupText("Wave") text("Wave") valueTextBox(0) 
rslider bounds(92, 58, 60, 60) range(-20, 20, 0, 1, 0.001) channel("DetuneVCO_1") $sliderstyle popupText("Detune") text("Detune") valueTextBox(0) 
rslider bounds(152, 58, 60, 60) range(0, 1, 0.75, 1, 0.001) channel("AmpVCO_1") $sliderstyle popupText("Gain") text("Gain") valueTextBox(0) 
label bounds(10, 38, 100, 20) channel("VCO") fontColour(255, 255, 255, 255) text("VCO") alpha(0.60)

;FM
rslider bounds(32, 150, 60, 60) range(0, 10, 0, 1, 0.001) channel("FMmod_1") $sliderstyle popupText("FM Mod") text("FM Mod") valueTextBox(0) 
rslider bounds(92, 150, 60, 60) range(0, 50, 0, 1, 0.001) channel("FMindx_1") $sliderstyle popupText("FM Index") text("FM Index") valueTextBox(0) 
rslider bounds(152, 150, 60, 60) range(0, 7, 0, 1, 0.001) channel("FMwave_1") $sliderstyle popupText("FM Source") text("FM Source") valueTextBox(0) 
label bounds(10, 130, 100, 20) channel("FM") fontColour(255, 255, 255, 255) text("FM") alpha(0.60)

;SubOSC

button bounds(358, 163, 45, 25), channel("SubONOFF_1"), text("OFF", "ON"), colour:1(255, 0, 0, 255), alpha(0.8), , 
rslider bounds(232, 150, 60, 60) range(0, 3, 1, 1, 1) channel("SubWave_1") $sliderstyle popupText("Sub Wave") text("Sub Wave") valueTextBox(0) 
rslider bounds(292, 150, 60, 60) range(0, 1, 0.2, 1, 0.001) channel("SubAmp_1") $sliderstyle popupText("Sub Gain") text("Sub Gain") valueTextBox(0) 
label bounds(232, 130, 150, 20) channel("sub") fontColour(255, 255, 255, 255) text("Sub Oscillator") alpha(0.60)


;-------------- Oscillatore 2 ----------------------------------------------------------------------------------------------------------------------------------------------------------------
;wavetable
rslider bounds(832, 58, 60, 60) range(0, 10, 3, 1, 0.001) channel("MorphWT_2") $sliderstyle popupText("Wavetable Morph") text("Morph") valueTextBox(0) 
rslider bounds(892, 58, 60, 60) range(-20, 20, 0, 1, 0.001) channel("DetuneWT_2") $sliderstyle popupText("Detune") text("Detune") valueTextBox(0) 
rslider bounds(952, 58, 60, 60) range(0, 1, 0.75, 1, 0.001) channel("AmpWT_2") $sliderstyle popupText("Gain") text("Gain") valueTextBox(0) 
label bounds(838, 38, 100, 20) channel("WT") fontColour(255, 255, 255, 255) text("Wavetable") alpha(0.60)

;VCO
rslider bounds(1032, 58, 60, 60) range(0.0001, 0.99999, 0.0001, 1, 0.001) channel("PWM_2") $sliderstyle popupText("Wave") text("Wave") valueTextBox(0) 
rslider bounds(1092, 58, 60, 60) range(-20, 20, 0, 1, 0.001) channel("DetuneVCO_2") $sliderstyle popupText("Detune") text("Detune") valueTextBox(0) 
rslider bounds(1152, 58, 60, 60) range(0, 1, 0.75, 1, 0.001) channel("AmpVCO_2") $sliderstyle popupText("Gain") text("Gain") valueTextBox(0) 
label bounds(1010, 38, 100, 20) channel("VCO") fontColour(255, 255, 255, 255) text("VCO") alpha(0.60)

;FM
rslider bounds(832, 150, 60, 60) range(0, 10, 0, 1, 0.001) channel("FMmod_2") $sliderstyle popupText("FM Mod") text("FM Mod") valueTextBox(0) 
rslider bounds(892, 150, 60, 60) range(0, 50, 0, 1, 0.001) channel("FMindx_2") $sliderstyle popupText("FM Index") text("FM Index") valueTextBox(0) 
rslider bounds(952, 150, 60, 60) range(0, 7, 0, 1, 0.001) channel("FMwave_2") $sliderstyle popupText("FM Source") text("FM Source") valueTextBox(0) 
label bounds(800, 130, 100, 20) channel("FM") fontColour(255, 255, 255, 255) text("FM") alpha(0.60)

;SubOSC

button bounds(1158, 163, 45, 25), channel("SubONOFF_2"), text("OFF", "ON"), colour:1(255, 0, 0, 255), alpha(0.8), , 
rslider bounds(1032, 150, 60, 60) range(0, 3, 1, 1, 1) channel("SubWave_2") $sliderstyle popupText("Sub Wave") text("Sub Wave") valueTextBox(0) 
rslider bounds(1092, 150, 60, 60) range(0, 1, 0.2, 1, 0.001) channel("SubAmp_2") $sliderstyle popupText("Sub Gain") text("Sub Gain") valueTextBox(0) 
label bounds(1032, 130, 150, 20) channel("sub") fontColour(255, 255, 255, 255) text("Sub Oscillator") alpha(0.60)


;-------------- Parametri Filtro----------------------------------------------------------------------------------------------------------------------------------------------------------------

button bounds(102, 220, 55, 20), channel("filBypass"),range(0, 1, 1, 1, 1) text("Bypass", "Bypass"), colour:1(255, 0, 0, 255), alpha(0.8), , 
rslider bounds(242, 246, 60, 60) channel("filAttack") range(0.001, 2, .001, 1, 0.001) $sliderstyle popupText("Attack") text("Attack") valueTextBox(0) 
rslider bounds(170, 246, 60, 60) channel("filAmount") range(0, 1, 0.01, 1, 0.001) $sliderstyle popupText("Emphasis") text("Emphasis") valueTextBox(0) 
rslider bounds(316, 246, 60, 60) channel("filDec") range(0, 4, 0.3, 1, 0.001) $sliderstyle popupText("Decay") text("Decay") valueTextBox(0) 
combobox bounds(244, 226, 153, 20) channel("filt_menu") text("TB303 Ladder", "Moog Ladder", "Steiner-Parker LowPass", "Steiner-Parker HighPass", "Steiner-Parker BandPass", "svn Highpass", "svn Lowpass", "svn Bandpass", "svn Band Reject", "Sallen-Key Lowpass", "Sallen-Key Highpass") $combostyle alpha(0.7) colour(120, 50, 5, 255)
rslider bounds(32, 248, 60, 60) range(0, 1, 1, 1, 0.001) channel("filt_freq") $sliderstyle popupText("Cutoff Frequency") text("Cutoff") valueTextBox(0) 
rslider bounds(100, 248, 60, 60) range(0, 1, 0, 1, 0.001) channel("filt_res") $sliderstyle popupText("Resonance") text("Resonance") valueTextBox(0) 
;rslider bounds(2, 478, 120, 120) range(0, 1, 0, 1, 0.001) channel("filt_dist") $sliderstyle popupText("Distortion") text("Distortion") valueTextBox(1) filmstrip("./SynthResources/knob.png", 128) fontColour(255, 255, 255, 255) outlineColour(58, 58, 58, 0) textColour(255, 255, 255, 200) trackerInsideRadius(0.67)
label bounds(10, 220, 100, 20) channel("FM") fontColour(255, 255, 255, 255) text("Filter") alpha(0.60)

;--------------  1° LFO----------------------------------------------------------------------------------------------------------------------------------------------------------------
button bounds(102, 520, 55, 20), channel("ARP"),range(0, 1, 1, 1, 1) text("ARP", "ARP"), colour:1(255, 0, 0, 255), alpha(0.8), , 

;chorus
rslider bounds(700, 364, 60, 60) channel("CHORUSsend") range(0.001, 4, 0.0110, 1, 0.0001) $sliderstyle valueTextBox(0) popupText("Send Chorus") text("Send Chorus") 
rslider bounds(784, 364, 60, 60) channel("CHORUSrate") range(0.001, 1, 0.0320, 1, 0.0001) $sliderstyle valueTextBox(0) popupText("Rate") text("Rate") 
rslider bounds(850, 364, 60, 60) channel("CHORUSdepth") range(0.001, 1, 1, 1, 0.0001) $sliderstyle valueTextBox(0) popupText("Depth") text("Depth") 
rslider bounds(900, 364, 60, 60) channel("CHORUSwidth") range(0.001, 1, 1, 1, 0.0001) $sliderstyle valueTextBox(0) popupText("Width") text("Width") 

;distortion
rslider bounds(700, 464, 60, 60) channel("DISTORTIONsend") range(0.001, 4, 0.0110, 1, 0.0001) $sliderstyle valueTextBox(0) popupText("Send Dist") text("Send Dist") 
rslider bounds(784, 464, 60, 60) channel("DISTORTIONlev") range(0.001, 1, 0.0320, 1, 0.0001) $sliderstyle valueTextBox(0) popupText("Level") text("Level") 
rslider bounds(850, 464, 60, 60) channel("DISTORTIONdrive") range(0.001, 1, 1, 1, 0.0001) $sliderstyle valueTextBox(0) popupText("Drive") text("Drive") 
rslider bounds(900, 464, 60, 60) channel("DISTORTIONtone") range(0.001, 1, 1, 1, 0.0001) $sliderstyle valueTextBox(0) popupText("Tone") text("Tone") 

     

;--------------  ADSR----------------------------------------------------------------------------------------------------------------------------------------------------------------

rslider bounds(30, 364, 60, 60) channel("env1a") range(0.001, 4, 0.0110, 1, 0.0001) $sliderstyle valueTextBox(0) popupText("Attack") text("Attack") 
rslider bounds(184, 364, 60, 60) channel("env1d") range(0.001, 4, 0.0320, 1, 0.0001) $sliderstyle valueTextBox(0) popupText("Decay") text("Decay") 
rslider bounds(106, 364, 60, 60) channel("env1s") range(0.001, 1, 1, 1, 0.0001) $sliderstyle valueTextBox(0) popupText("Sustain") text("Sustain") 
;rslider bounds(1170, 236, 120, 120) channel("env1r") range(0.01, 2, 0.4, 1, 0.001) $sliderstyle valueTextBox(1) popupText("Release") text("Release") filmstrip("./SynthResources/knob.png", 128) fontColour(255, 255, 255, 255) outlineColour(58, 58, 58, 0) textColour(255, 255, 255, 200) trackerInsideRadius(0.67)
rslider bounds(30, 504, 60, 60) channel("porttime") range(0, 2000, 3,0.4,0.01) $sliderstyle valueTextBox(0) popupText("Glide") text("Glide") 
rslider bounds(940, 504, 60, 60) channel("MAIN_VOLUME") range(0.001, 1, 1, 1, 0.0001) $sliderstyle valueTextBox(0) popupText("VOLUME") text("VOLUME") 

keyboard bounds(240, 480, 400, 100) channel("keyboard10079")

</Cabbage>
<CsoundSynthesizer>

<CsOptions>
-n -d -+rtmidi=NULL -M0 -m0d --midi-key-cps=4 --midi-velocity-amp=5 --displays --limiter
</CsOptions>
<CsInstruments>
; Initialize the global variables. 
nchnls		= 	2
0dbfs		=	1

#include "./SynthResources/MainOSC.udo"    ;UDO Oscillatore
#include "./UDOs/StChorus.udo" ;UDO Chorus
#include "./UDOs/Distortion.udo" ; UDO Distortion

#define MAX_FREQ #20000#
#define MULT_TRK1 #1.019440643702146#  ; 2^(1/36) : key track coefficient for SW1 On / SW2 Off  (1 octave/36 half-steps)
#define MULT_TRK2 #1.037155044446193#  ; 2^(1/19) : key track coefficient for SW2 Off / SW2 On  (1 octave/19 half-steps)
#define MULT_TRK12 #1.059463094359293# ; 2^(1/12) : key track coefficient for SW2 On / SW2 On   (1 octave/12 half-steps)


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





maxalloc	10,1		;Instr 10 is allocated for one time max
gkZERO init 0			;Init useful k-variable (0)
gkUNO init 1			;Init   "        "      (1) 
gaAmpEnv init 0			;Init global amp. evelope

gkcps		init 0      ;Init global cps (seems no essential)
giMIDIvel	init 0

gkvib_ctrl	init 1

giNoteNum	init 0

gkVEL_TO_OSC1 		init 0
gkVEL_TO_OSC2 		init 0

gkVEL_TO_VCF 		init 0
gkVEL_CURVE_TYPE 	init 1

;FX init
gaSEND_STCHORUS init 0
gkCHORUS_send init 0
gkCHORUS_rate init 0
gkCHORUS_depth init 0
gkCHORUS_width init 0

gaSEND_DISTORTION init 0
gkDISTORTION_send init 0
gkDISTORTION_lev init 0
gkDISTORTION_drive init 0
gkDISTORTION_tone init 0


;Create table to map freq. filter knob

giTable_FIL ftgen 0, 0,1024, -8, 20, 184, 125, 328, 1000, 256, 4800, 256, 20000

;==============================    
;==== SUB OSCILLATOR WAVES ==== 
;============================== 


giSine ftgen 996, 0, 2^16+1, 10, 1  ;sinusoide 
giTriangle ftgen 997, 0, 2^16+1, 7,0,16384,1,32768,-1,16384,0   ;triangle
giSaw ftgen 998, 0,2^16+1, 7, 0., 0, 1., 2^16+1, -1., 0, 0. ;saw
giSquare ftgen 999,0,2^16+1, 7, 0., 0, 1., 32768, 1., 0, -1., 32768, -1., 0, 0. ;square

;=============================
;=== MAIN AUDIO WAVETABLES ===
;=============================

;================================================================== 
;Elenco di tabelle tra cui fare il morphing per l'oscillatore 1 & 2
;================================================================== 

gimorph1 ftgen 1000, 0, 10, -2, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11
gidum1 ftgen 1001, 0, 16384, 10, 1;------------------------Tabella dummy OSC 1 

gimorph2 ftgen 1002, 0, 10, -2, 12, 13, 14, 15, 16, 17, 18 ,19, 20, 21
gidum2 ftgen 1003, 0, 4096, 10, 1 ;------------------------Tabella dummy OSC 2 

;(NB: la lunghezzza in samples della dummy deve essere uguale a quella delle waves)


;====================  
;Analog-inspred WAVES
;==================== 


;Sawtooth up and down
giwave1 ftgen 1, 0, 16384,7,0,16384,1,0,-1,16384,0	

;Ramp 
giwave2 ftgen 2, 0, 16384, 7 ,0,8192,1,0,-1,8192,0  

;Sinusoide
giwave3 ftgen 3, 0, 16384, 10, 1  

;Square (slightly asym)                    
giwave4 ftgen 4, 0, 16384,  7,1,7936,1,0,-1,8448,-1

;Square
giwave5 ftgen 5, 0, 16384,  7,0,0,1,8192,1,0,-1,8192, -1,  0,  0  

;PW1
giwave6 ftgen 6, 0, 16384,  7,1,4772,1,0,-1,11612,-1

;PW2								               
giwave7 ftgen 7, 0, 16384,  7,1,2810,1,0,-1,13574,-1                             

;Pulse
giwave8 ftgen 8, 0, 16384,  7,0,0,1,1024,1,0,-1, 15360,   -1,  0,0     	
	                      
;Triangle
giwave9 ftgen 9, 0, 16384, 7,0,4096,1,8192,-1,4096,0                              

;Slightly asymmetric triangle
giwave10 ftgen 10, 0, 16384, 7,0, 3968,1,8320,-1,4096,0                             

;Peaked Triangle
giwave11 ftgen 11,  0, 16384, 7,0.65,8192 ,   -0.5 ,   8182 ,   0.35	

;Rampoide
;giwave12 ftgen 12, 0,16384, 7, 1.000000, 16384, -1.000000,

;Rampoide controfase
;giwave13 ftgen 13,0,16384, 7, -1.000000, 16384, 1.000000

		
;=============                            
;Sampled WAVES
;=============  

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

;=================================================================================================== 

;======================== 
;Creo le tabelle per l'FM
;======================== 

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

; -----------------------------------------------------------------------------------------------------------



instr	1	;===== NOTE ON/OFF Scheduler (Triggered by MIDI)



gkCHORUS_SEND cabbageGetValue "CHORUSsend"
gkCHORUS_rate cabbageGetValue "CHORUSrate"
gkCHORUS_depth cabbageGetValue "CHORUSdepth"
gkCHORUS_width cabbageGetValue "CHORUSwidth"

gkDISTORTION_send cabbageGetValue "DISTORTIONsend"
gkDISTORTION_lev cabbageGetValue "DISTORTIONlev"
gkDISTORTION_drive cabbageGetValue "DISTORTIONdrive"
gkDISTORTION_tone cabbageGetValue "DISTORTIONtone"

gkMAIN_VOL cabbageGetValue "MAIN_VOLUME"

gkdrywet chnget "ampdrywet"
gkdrywet port gkdrywet, 0.02

giMIDIvel veloc 0.15, 1.0						;Read MIDI velocity and scale to 0. - 1

giVEL_OSC1 = (i(gkVEL_TO_OSC1) == 1?  giMIDIvel : 1)	;Assign (or not) MIDI vel. to OSC1
giVEL_OSC2 = (i(gkVEL_TO_OSC2) == 1?  giMIDIvel : 1)	;							  OSC2


giVEL_VCF = (i(gkVEL_TO_VCF) == 1?  giMIDIvel : 1)			;Assign (or not) MIDI vel. to VCF

;Select the MIDI velocity to some curve map depending on related combobox(function table 1501 / 1502) 
					;Select a EXP curve (HARD on combobox)-
giMIDIvel table3 giMIDIvel,1501,1					

	
	iNN notnum			; Get the MIDI note number value from keyboard  (es:  C4 = 261.,.Hz ==> NN= 60). It is used in key tracking
 
	
	gktrack_del = k(iNN-41)		;Compute number of half steps difference in respect to F2 (41), the track ref. note
	
	
	gkcps cpsmidib				;Read in the pitch from MIDI keyb (icps in Hz or cps) + pitch bender
	
	
	gkNoteOn	init	1		;Set this flag to 1 . It will be cleared at bottom of instr 2	

    

																																																																																								
        schedule 10,0,-1				;Invoke INSTR 10 
    
endin


instr 100; Inizializzazione widget

gkdata2 init 1;		Init MIDI CC1  to 1  

gkstatus, gkchan, gkdata1, gkdata2     midiin ; Read incoming MIDI message

gkGLIDE_ON	= 1;	;Get switch for GLIDE On/Off
gkDECAY_ON	= 1			;Get switch for DECAY On/Off

gkVEL_SW	= 1	

gkporttime_0 	cabbageGetValue "porttime"			;Get port time (glide o portamento)

gkporttime_0 = (gkGLIDE_ON == 1? gkporttime_0 : 0)	;Test on GLIDE on/off

ktrig metro 40 ;							;Reduce widget reading rate to 40/sec
if ktrig == 1 then

;====== MODIFIERS ================
;Loudness Contour (VCA or amplitude envelope param.)
gkAmpAttTim		cabbageGetValue "env1a"		;Get Loudness Envelope Attack Time in [secs]
gkAmpRelTim		cabbageGetValue "env1d"		;Get Loudness Envelope Decay Time in [secs]
gkAmpLev		cabbageGetValue "env1s"		;Get Loudness Envelope Sustain Lev
	
		
;Filter Contour (VCF envelope param.)
gkFiltAttTim	cabbageGetValue	"filAttack"	;Get Filter Envelope Attack Time in [secs]
gkFiltRelTim	cabbageGetValue	"filDec"	;Get Filter Envelope Decay Time in [secs]
gkFiltLev		cabbageGetValue	"filAmount"		;Get Filter Envelope Sustain Level


;=======  MIDI KEY VELOCITY =======

gkVEL_TO_OSC1		cabbageGetValue  "VEL_TO_OSC1"		;Get checkbox (as a switch/led) for assign key vel. to OSC1
gkVEL_TO_OSC2		cabbageGetValue  "VEL_TO_OSC2"		;Get checkbox (as a switch/led) for assign key vel. to OSC2
gkVEL_TO_VCF		cabbageGetValue  "VEL_TO_VCF"		;Get checkbox (as a switch/led) for assign key vel. to VCF

endif			;End of widget scan at low rate

;-------------------------------------------------

gkFBASE_VCF_0	cabbageGetValue	"filt_freq" 	;Get the base CUT-OFF freq. [0 = 20hz : 0.99 = 20Khz]
gkRES_VCF		cabbageGetValue	"filt_res"		;Get emphasis (resonance) [0 : 0.99]
gkRES_VCF  		port gkRES_VCF,0.01

gkAMOUNT_VCF	cabbageGetValue	"filAmount"	;Get amount of filter contour
gkAMOUNT_VCF    port gkAMOUNT_VCF, 0.08
gkmenu cabbageGetValue "filt_menu" ; menù scelta del filtro
gkFiltbypass cabbageGetValue "filBypass"

gkMAIN_VOLUME_0	cabbageGetValue "MAIN_VOLUME"	;Get Main Volume
gkMAIN_VOLUME port gkMAIN_VOLUME_0,0.05	;Smooth it


gkfil tablei gkFBASE_VCF_0, giTable_FIL,1		;Map filt. frequency to non linear table
chnset gkfil, "dispVCF_CUT"
gkfil port gkfil,0.01							;Smooth control..



; Widget macro oscillatore 1

gkWave_1        cabbageGetValue "MorphWT_1"
gkWave_1        port gkWave_1, 0.02

gkWAVETamp_1    cabbageGetValue "AmpWT_1"
gkWAVETamp_1    port gkWAVETamp_1, 0.02

gkWTDetune_1    cabbageGetValue "DetuneWT_1"
gkWTDetune_1    port gkWTDetune_1, 0.02

gkVCOamp_1      cabbageGetValue "AmpVCO_1"
gkVCOamp_1      port gkVCOamp_1, 0.02

gkPWM_1         cabbageGetValue "PWM_1"
gkPWM_1         port gkPWM_1 , 0.02

gkVCOdetune_1   cabbageGetValue "DetuneVCO_1"
gkVCOdetune_1   port gkVCOdetune_1, 0.02

gkFMwave_1      cabbageGetValue "FMwave_1"
gkFMwave_1      port gkFMwave_1 , 0.02

gkFMfactor_1    cabbageGetValue "FMmod_1"
gkFMfactor_1    port gkFMfactor_1, 0.02

gkFMIndex_1     cabbageGetValue "FMindx_1"
gkFMIndex_1     port gkFMIndex_1, 0.02
   
gkSubONOFF_1    cabbageGetValue "SubONOFF_1"

gkSubWave_1     cabbageGetValue "SubWave_1"

gkSubAmp_1      cabbageGetValue "SubAmp_1"
gkSubAmp_1      port gkSubAmp_1 , 0.02


if gkSubWave_1 == 0 then
    gkSubTable = 996
elseif gkSubWave_1 == 1 then
    gkSubTable_1 = 997
elseif gkSubWave_1 == 2 then
    gkSubTable_1 =  998
elseif gkSubWave_1 == 3 then
    gkSubTable_1 = 999
endif



; Widget macro oscillatore 2

gkWave_2        cabbageGetValue "MorphWT_2"
gkWave_2        port gkWave_2, 0.02

gkWAVETamp_2    cabbageGetValue "AmpWT_2"
gkWAVETamp_2    port gkWAVETamp_2, 0.02

gkWTDetune_2    cabbageGetValue "DetuneWT_2"
gkWTDetune_2    port gkWTDetune_2, 0.02

gkVCOamp_2      cabbageGetValue "AmpVCO_2"
gkVCOamp_2      port gkVCOamp_2, 0.02

gkPWM_2         cabbageGetValue "PWM_2"
gkPWM_2         port gkPWM_2 , 0.02

gkVCOdetune_2   cabbageGetValue "DetuneVCO_2"
gkVCOdetune_2   port gkVCOdetune_2, 0.02

gkFMwave_2      cabbageGetValue "FMwave_2"
gkFMwave_2      port gkFMwave_2 , 0.02

gkFMfactor_2    cabbageGetValue "FMmod_2"
gkFMfactor_2    port gkFMfactor_2, 0.02

gkFMIndex_2     cabbageGetValue "FMindx_2"
gkFMIndex_2     port gkFMIndex_2, 0.02
   
gkSubONOFF_2    cabbageGetValue "SubONOFF_2"

gkSubWave_2     cabbageGetValue "SubWave_2"

gkSubAmp_2      cabbageGetValue "SubAmp_2"
gkSubAmp_2      port gkSubAmp_2 , 0.02


if gkSubWave_2 == 0 then
    gkSubTable = 996
elseif gkSubWave_2 == 1 then
    gkSubTable_2 = 997
elseif gkSubWave_2 == 2 then
    gkSubTable_2 =  998
elseif gkSubWave_2 == 3 then
    gkSubTable_2 = 999
endif


endin

instr 10; Main Audio Engine


gkporttime = gkporttime_0 * 0.001			;Scale port in sec

kvib init 0

kactive1	active	1						;Counts instances of instr 1 (the MIDI activated instr)

kNoteNum = octcps(gkcps)					;Get the notenum


kporttime	linseg	0.0,0.01,1				;Portamento Time rises quickly to a held value of '1'
kporttime	=	kporttime*gkporttime		;Portamento Time function scaled by value output by widget (knob)
kcps		portk	gkcps, kporttime		;Apply portamento to pitch changes


kAmpEnv			init	0				;Init amp env. to zero	
kFiltEnv		init	0				;Init filt. env. to zero
kNoiseEnv		init 	0				;Init Noise env. to zero
kRMEnv			init 	0				;Init RM env. to zero
kFMEnv			init 	0				;Init FM amp. env to zero
kFM_IndexEnv	init	0				;Init FM index env to zero

kvib_ctrl = gkvib_ctrl/127.0		;Normalize to 1 the external MOD WHEEL (0-127 -->  0 - 1)

aOsc1, aSub1 MainOsc kcps, kcps+gkWTDetune_1, kcps+gkVCOdetune_1, gkWave_1, gkWAVETamp_1, 1000, 1001, gkVCOamp_1, gkPWM_1, gkFMwave_1, gkFMfactor_1, gkFMIndex_1,  1010, 1011,  gkSubAmp_1, gkSubTable_1
aOsc2, aSub2 MainOsc kcps, kcps+gkWTDetune_2, kcps+gkVCOdetune_2, gkWave_2, gkWAVETamp_2, 1002, 1003, gkVCOamp_2, gkPWM_2, gkFMwave_2, gkFMfactor_2, gkFMIndex_2,  1012, 1013,  gkSubAmp_2, gkSubTable_2



if gkNoteOn=1&&kactive1=1 then		;If a new legato phrase has begun (A NEW NOTE pressed and no older are held ...
	  reinit	RestartLegEnvs		;...Restart the 'legato phrase' envelopes (AMPLITUDE AND FILTER)
	endif	

	
			
RestartLegEnvs:					;A label: start a reinit pass to restart the legato phrase ENVELOPES
	
	
if	kactive1 >0 then			;If almost one note is existing ...

kAmpEnv AMP_ON i(kAmpEnv),i(gkAmpAttTim),-2,i(gkAmpRelTim),i(gkAmpLev)	;Move AMPLITUDE Env. (Attack & Decay to Sustain) 	
kAmpSus	=	kAmpEnv 													;Save current amp


kFiltEnv FILT_ON i(kFiltEnv),i(gkFiltAttTim),-2, i(gkFiltRelTim),i(gkFiltLev) 	;Move FILTER Env. (Attack & Decay to Sustain)
kFiltSus =	kFiltEnv															;Save current Filter envelope value


elseif kactive1 = 0 then
		
kAmpEnv  AMP_OFF    1,i(gkAmpRelTim)*i(gkDECAY_ON)+0.01,-2,0		;Move normalized Amplitude Env. to release 
kAmpEnv	   =	kAmpEnv*kAmpSus								;Scale to actual sus value

kFiltEnv  FILT_OFF    1,i(gkFiltRelTim)*i(gkDECAY_ON)+0.01,-2,0	;Move normalized FILTER Env. to release 
kFiltEnv	=	kFiltEnv*kFiltSus							;Scale to actual sus value

	endif									;End of test
rireturn

	aAmpEnv		interp	kAmpEnv				;Smoother amp.env - (useful for fast changing envelope segments)	
	

adrywet interp gkdrywet 

gkSubtoFil_1 = 1
gkSubtoFil_2 = 1

if gkSubONOFF_1	==1  then

    aSum1 sum aOsc1, aSub1
 else
     
    aSum1 = aOsc1
endif


if gkSubONOFF_2	==1 then ;&& gkSubtoFil_2

    aSum2 sum aOsc2, aSub2
 else
     
    aSum2 = aOsc2
endif




aL sum aSum1*(1-adrywet), aSum2*adrywet

;Filter


kfilt_delta = $MAX_FREQ - gkfil										;Compute Delta Freq. (difference from cutoff to NY freq.)
	kffilt_var = (kfilt_delta * kFiltEnv * gkAMOUNT_VCF)* giVEL_VCF		;Envelope/scale Delta Freq. and  scale to MIDI vel
	kfilt_freq = gkfil   ;Modulate this freq 

kfreq_VCF = kfilt_freq + kffilt_var	

;---KEY TRACKING SECTION -------------
		

kfreq_VCF = kfreq_VCF*$MULT_TRK1^gktrack_del	
	
	kfreq_VCF = (kfreq_VCF <= $MAX_FREQ? kfreq_VCF : $MAX_FREQ)						;Limit upper freq to 22 Khz
	acut interp kfreq_VCF
	


    
		
; 15) kSubONOFF = Selettore se accendere o spegnere il sub Oscillatore			
				
					
							
if gkFiltbypass == 0 then	
	
    if gkmenu == 1  then

        ares diode_ladder aL, acut, gkRES_VCF*17., 1, 4 ; TB303 Filter
    elseif gkmenu == 2 then

        ares vclpf aL, k(acut), gkRES_VCF;                MOOG Ladder
    elseif gkmenu == 3 then

        abp = 0
        ahp = 0
        alp  = aL
        ares spf alp,ahp,abp,acut,(1-gkRES_VCF)*2 ;       Steiner-Parker  LowPass Filter
    elseif gkmenu == 4 then
        abp = 0
        alp = 0
        ahp  = aL
        ares spf alp,ahp,abp,acut,(1-gkRES_VCF)*2 ;       Steiner-Parker HighPass Filter
    elseif gkmenu == 5 then
        ahp = 0
        alp = 0
        abp  = aL
        ares spf alp,ahp,abp,acut,(1-gkRES_VCF)*2 ;       Steiner-Parker BandPass Filter
    elseif gkmenu == 6 then                 
        gkres limit gkRES_VCF, 0.5, 1.
        ares,alp1,abp1,abr1 svn aL, acut, gkRES_VCF , 0
    
    elseif gkmenu == 7 then                              ;svn LowPass
        gkres limit gkRES_VCF, 0.5, 1.
        ahp1,ares,abp1,abr1 svn aL, acut, gkRES_VCF ,0  
    
    elseif gkmenu == 8 then                              ;svn BandPass
        gkres limit gkRES_VCF, 0.5, 1.
        ahp1,alp1,ares,abr1 svn aL, acut, gkRES_VCF ,0  
    elseif gkmenu == 9 then                              ;svn HighPass
        gkres limit gkRES_VCF, 0.5, 1.
       ahp1,alp1,abp1,ares svn aL, acut, gkRES_VCF ,0 
    
    elseif gkmenu == 10 then                              ;Sallen-Key LowPass Filter
        
       ares skf aL, acut, gkRES_VCF*3. ,0 
    elseif gkmenu == 11 then                              ;Sallen-Key HighPass Filter
        
       ares skf aL, acut, gkRES_VCF*3. ,1 
    
    endif
else 


ares =aL;, aSub1, aSub2


endif


; OUT
gilimit = ampdbfs(-9)
aoutLeft balance2 ares, (aL*0.5)
aoutRight balance2 ares, (aL*0.5)

aoutLeft dcblock aoutLeft
aoutRight dcblock aoutRight 

adisplay = aoutLeft*0.3
display	adisplay, .009, 0.01
dispfft adisplay, .009, 256



;SEND
gaSEND_STCHORUS = (aoutLeft*aAmpEnv*gilimit)*gkCHORUS_SEND
gaSEND_DISTORTION = (aoutLeft*aAmpEnv*gilimit)*gkDISTORTION_send


outs aoutLeft*aAmpEnv*gilimit*gkMAIN_VOL , aoutLeft*aAmpEnv*gilimit*gkMAIN_VOL
endin

;----------------------------------------------------
;Occhi reattivi al BPM dell'Host

instr 30 ;CHORUS

aoutL, aoutR StChorus gaSEND_STCHORUS,gaSEND_STCHORUS,gkCHORUS_rate,gkCHORUS_depth,gkCHORUS_width

outs aoutL*gkMAIN_VOL*gilimit,aoutR*gkMAIN_VOL*gilimit

endin

instr 31 ;Distortion

aoutL Distortion gaSEND_DISTORTION,gkDISTORTION_lev,gkDISTORTION_drive,gkDISTORTION_tone

outs aoutL*gkMAIN_VOL*gilimit,aoutL*gkMAIN_VOL*gilimit

endin


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

kline linseg  0., 0.08, 1
;printk2 kline
cabbageSet 1,  "occhio", "alpha", kline
cabbageSet 1,  "occhio1", "alpha", kline

endin

</CsInstruments>
<CsScore>
i6 0 z
f1501 0 513	-7 0 512 1		;Linear (LIN) Curve for MIDI Vel.
i 100 0 [3600*24*7]
i 30 0 [3600*24*7]
i 31 0 [3600*24*7]
</CsScore>