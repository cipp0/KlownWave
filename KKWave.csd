   ▄█   ▄█▄  ▄█        ▄██████▄   ▄█     █▄  ███▄▄▄▄    ▄█     █▄     ▄████████  ▄█    █▄     ▄████████ 
  ███ ▄███▀ ███       ███    ███ ███     ███ ███▀▀▀██▄ ███     ███   ███    ███ ███    ███   ███    ███ 
  ███▐██▀   ███       ███    ███ ███     ███ ███   ███ ███     ███   ███    ███ ███    ███   ███    █▀  
 ▄█████▀    ███       ███    ███ ███     ███ ███   ███ ███     ███   ███    ███ ███    ███  ▄███▄▄▄     
▀▀█████▄    ███       ███    ███ ███     ███ ███   ███ ███     ███ ▀███████████ ███    ███ ▀▀███▀▀▀     
  ███▐██▄   ███       ███    ███ ███     ███ ███   ███ ███     ███   ███    ███ ███    ███   ███    █▄  
  ███ ▀███▄ ███▌    ▄ ███    ███ ███ ▄█▄ ███ ███   ███ ███ ▄█▄ ███   ███    ███ ███    ███   ███    ███ 
  ███   ▀█▀ █████▄▄██  ▀██████▀   ▀███▀███▀   ▀█   █▀   ▀███▀███▀    ███    █▀   ▀██████▀    ██████████ 
  ▀         ▀                                                                                                                         

<Cabbage> 

#define sliderstyle outlineColour(58, 58, 58, 0) filmstrip("./SynthResources/knob.png", 128) visible(1),  textColour(255, 255, 255, 255) fontColour(255, 255, 255, 0) textBoxOutlineColour(0,0,0,0) trackerInsideRadius(0.67) popupText("") text("")
#define combostyle colour(120, 50, 5, 255) alpha(0.7)

bounds(0, 0, 0, 0)
form caption("KernelNet") size(1300, 640), openGL(1), pluginId("KW02") bundle("./SynthResources", "./KKWave.snaps", "./UDOs", "./Waves") guiMode("queue")

;-------------- Background e pagliaccio ----------------------------------------------------------------------------------------------------------------------------------------------------------------

image bounds(0, 0, 1300, 640) channel("ibg") file("./SynthResources/bg0.jpg")
image bounds(445, 270, 413, 252) channel("bocca") file("./SynthResources/boccaclow.png") visible(0)

keyboard bounds(493, 380, 320, 68) keysDownColour(255,30,50) mouseOverKeyColour(255,30,50) channel("key0") visible(0)
image bounds(474, 156, 200, 200) channel("occhio") file("./SynthResources/occhi.png") alpha(0)
image bounds(620, 156, 200, 200) channel("occhio1") file("./SynthResources/occhi.png") alpha(0)

rslider bounds(580, 272, 131, 130) channel("osc1osc2") range(0, 1, 0.5, 1, 0.001)  popupText("OSC1 / OSC2")  outlineColour(58, 58, 58, 0) filmstrip("./SynthResources/nasoknob.png", 128)  textColour(0, 0, 0, 255) fontColour(0, 0, 0, 255) trackerInsideRadius(0.67) 
;signaldisplay bounds(554, 80, 190, 117), colour("white") displayType("waveform"), backgroundColour(147, 210, 0,0), zoom(-1), signalVariable("adisplay", "adisplay"), channel("display")


button bounds(590, 110, 120, 120), channel("boccaON"), alpha(0) latched(1)

;-------------- Presets .snaps ----------------------------------------------------------------------------------------------------------------------------------------------------------------

label bounds(450, 6, 100, 16) channel("prest") fontColour(255, 255, 255, 255) text("Presets") 
combobox bounds(532, 2, 123, 25), populate("*.snaps"), channelType("string") channel("combo23") value("1") automatable(0) text("Default", "FM Detuned", "Riser", "Lead1", "Daft", "DNB", "GesùCristoBackInRave")
filebutton bounds(664, 2, 60, 25), text("Save", "Save"), populate("*.snaps", "test"), mode("named preset") channel("filebutton24")
filebutton bounds(730, 2, 60, 25), text("Remove", "Remove"), populate("*.snaps", "test"), mode("remove preset") channel("filebutton25")

;-------------- Oscillatore 1 ----------------------------------------------------------------------------------------------------------------------------------------------------------------

groupbox bounds(0, 80, 500, 360) channel("OSC1") lineThickness(0), popup(0) visible(1) outlineThickness(0)colour(0, 0, 0,0){

image bounds (35,30,434,270) channel("griglia2") file("./SynthResources/sezioni.png") alpha(1)
image bounds (284,70,160,160) channel("oblo") file("./SynthResources/oblo.png")alpha(0.9)


;wavetable
gentable bounds(302, 115, 120, 60),channel("gentable1")  tableNumber(1111) outlineThickness(2), tableGridColour(155, 155, 155, 0) tableBackgroundColour(0,0,0,0) tableColour:0(255, 255, 255, 2555) fill(0)

rslider bounds(271, 227, 70,70) range(0, 23, 3, 1, 0.001) channel("MorphWT1") $sliderstyle popupPrefix("WT Position: ") text("Morph") valueTextBox(1) filmstrip("./SynthResources/knob.png", 128) fontColour(255, 255, 255, 0) outlineColour(58, 58, 58, 0) textColour(255, 255, 255, 255) trackerInsideRadius(0.67)
rslider bounds(328, 227, 70,70) range(-24, 24, 0, 1, 0.001) channel("DetuneWT1") $sliderstyle popupPrefix("Detune: ") text("Detune") valueTextBox(1) filmstrip("./SynthResources/knob.png", 128) fontColour(255, 255, 255, 0) outlineColour(58, 58, 58, 0) textColour(255, 255, 255, 255) trackerInsideRadius(0.67)
rslider bounds(382, 227, 70,70) range(0, 1, 0.75, 1, 0.001) channel("AmpWT1")   $sliderstyle popupPrefix("Gain: ") text("Gain") valueTextBox(1) fontColour(255, 255, 255, 0) textColour(255, 255, 255, 255)

combobox bounds(290, 50, 150, 17) value(2)channelType("float") channel("WaveBankOSC1") text("Analog","Harmonics", "Acid", "Distech", "BasicMg", "Crest") $combostyle alpha(0.7) colour(120, 50, 5, 255)


;VCO
rslider bounds(26, 49, 90,90) range(0.0001, 0.99999, 0.0001, 1, 0.001) channel("PWM1") $sliderstyle popupPrefix("Wave: ") text("Wave") valueTextBox(1) filmstrip("./SynthResources/knob.png", 128) fontColour(255, 255, 255, 0) outlineColour(58, 58, 58, 0) textColour(255, 255, 255, 255) trackerInsideRadius(0.67)
rslider bounds(96, 49, 90,90) range(-24, 24, 0, 1, 0.01) channel("DetuneVCO1") $sliderstyle popupPrefix("Detune: ") text("Detune") valueTextBox(1)  
rslider bounds(166, 49, 90,90) range(0, 1, 0.75, 1, 0.001) channel("AmpVCO1") $sliderstyle popupPrefix("Gain: ") text("Gain") valueTextBox(1)  
;label bounds(8, 16, 100, 20) channel("VCO") fontColour(255, 255, 255, 0) text("VCO") alpha(0.6)

;FM
rslider bounds(26, 199, 90,90) range(0, 10, 0, 1, 0.001) channel("FMmod1") $sliderstyle popupPrefix("FM Modulator: ") text("FM Mod") valueTextBox(1) filmstrip("./SynthResources/knob.png", 128) fontColour(255, 255, 255, 0) outlineColour(58, 58, 58, 0) textColour(255, 255, 255, 255) trackerInsideRadius(0.67)
rslider bounds(96, 199, 90,90) range(0, 50, 0, 1, 0.001) channel("FMindx1") $sliderstyle popupPrefix("FM Index: ") text("FM Index") valueTextBox(1) filmstrip("./SynthResources/knob.png", 128) fontColour(255, 255, 255, 0) outlineColour(58, 58, 58, 0) textColour(255, 255, 255, 255) trackerInsideRadius(0.67)
rslider bounds(166, 199, 90,90) range(0, 7, 0, 1, 0.001) channel("FMwave1") $sliderstyle popupPrefix("FM Source: ") text("FM Source") valueTextBox(1) filmstrip("./SynthResources/knob.png", 128) fontColour(255, 255, 255, 0) outlineColour(58, 58, 58, 0) textColour(255, 255, 255, 255) trackerInsideRadius(0.67)

}



;-------------- Oscillatore 2 ----------------------------------------------------------------------------------------------------------------------------------------------------------------
groupbox bounds(794, 80, 500, 360) channel("OSC2") lineThickness(0), popup(0) visible(1) outlineThickness(0)colour(0, 0, 0,0){

image bounds (35,30,434,270) channel("griglia2") file("./SynthResources/sezioni2.png") alpha(1)
image bounds (59,70,160,160) channel("oblo") file("./SynthResources/oblo.png")alpha(0.9)

;wavetable
gentable bounds(78, 115, 120, 60), channel("gentable2"), tableNumber(2222) outlineThickness(2), tableGridColour(155, 155, 155, 0) tableBackgroundColour(0,0,0,0) tableColour:0(255, 255, 255, 255) fill(0)

rslider bounds(46, 227, 70,70) range(0, 9, 1, 1, 0.001) channel("MorphWT2") $sliderstyle popupPrefix("WT Position: ") text("Morph") valueTextBox(1) filmstrip("./SynthResources/knob.png", 128) fontColour(255, 255, 255, 0) outlineColour(58, 58, 58, 0) textColour(255, 255, 255, 255) trackerInsideRadius(0.67)
rslider bounds(106, 227, 70,70) range(-24, 24, 0, 1, 0.001) channel("DetuneWT2") $sliderstyle popupPrefix("Detune: ") text("Detune") valueTextBox(1) filmstrip("./SynthResources/knob.png", 128) fontColour(255, 255, 255, 0) outlineColour(58, 58, 58, 0) textColour(255, 255, 255, 255) trackerInsideRadius(0.67)
rslider bounds(166, 227, 70,70) range(0, 1, 0.75, 1, 0.001) channel("AmpWT2")   $sliderstyle popupPrefix("Gain: ") text("Gain") valueTextBox(1) fontColour(255, 255, 255, 0) textColour(255, 255, 255, 255)

combobox bounds(65, 50, 150,17) value(3)channel("WaveBankOSC2") text("Analog", "Harmonics", "Juno", "Acid", "Distech", "BasicMg", "Crest") $combostyle alpha(0.7) colour(120, 50, 5, 255)


;VCO
rslider bounds(245, 49, 90,90) range(0.0001, 0.99999, 0.0001, 1, 0.001) channel("PWM2") $sliderstyle popupPrefix("Wave: ") text("Wave") valueTextBox(1) filmstrip("./SynthResources/knob.png", 128) fontColour(255, 255, 255, 0) outlineColour(58, 58, 58, 0) textColour(255, 255, 255, 255) trackerInsideRadius(0.67)
rslider bounds(315, 49, 90,90) range(-24, 24, 0, 1, 0.01) channel("DetuneVCO2") $sliderstyle popupPrefix("Detune: ") text("Detune") valueTextBox(1)  
rslider bounds(385, 49, 90,90) range(0, 1, 0.75, 1, 0.001) channel("AmpVCO2") $sliderstyle popupPrefix("Gain: ") text("Gain") valueTextBox(1)  


;FM
rslider bounds(245, 199, 90,90) range(0, 10, 0, 1, 0.001) channel("FMmod2") $sliderstyle popupPrefix("FM Modulator: ") text("FM Mod") valueTextBox(1) filmstrip("./SynthResources/knob.png", 128) fontColour(255, 255, 255, 0) outlineColour(58, 58, 58, 0) textColour(255, 255, 255, 255) trackerInsideRadius(0.67)
rslider bounds(315, 199, 90,90) range(0, 50, 0, 1, 0.001) channel("FMindx2") $sliderstyle popupPrefix("FM Index: ") text("FM Index") valueTextBox(1) filmstrip("./SynthResources/knob.png", 128) fontColour(255, 255, 255, 0) outlineColour(58, 58, 58, 0) textColour(255, 255, 255, 255) trackerInsideRadius(0.67)
rslider bounds(385, 199, 90,90) range(0, 7, 0, 1, 0.001) channel("FMwave2") $sliderstyle popupPrefix("FM Source: ") text("FM Source") valueTextBox(1) filmstrip("./SynthResources/knob.png", 128) fontColour(255, 255, 255, 0) outlineColour(58, 58, 58, 0) textColour(255, 255, 255, 255) trackerInsideRadius(0.67)

}

;-------------- Parametri Filtro----------------------------------------------------------------------------------------------------------------------------------------------------------------


groupbox bounds(70, 430, 500, 360) channel("filtergroup") lineThickness(0), popup(0) visible(1) outlineThickness(0)colour(0, 0, 0,0){
image bounds (30,0,368,137) channel("griglia3") file("./SynthResources/griglia2.png") alpha(1)

rslider bounds(26, 50, 90,90) range(0, 1, 1, 1, 0.001) channel("filtfreq") $sliderstyle popupPrefix("Cutoff Frequency: ") text("Cutoff") valueTextBox(1) filmstrip("./SynthResources/knob.png", 128) fontColour(255, 255, 255, 0) outlineColour(58, 58, 58, 0) textColour(255, 255, 255, 255) trackerInsideRadius(0.67)
rslider bounds(96, 50, 90,90) range(0, 1, 0, 1, 0.001) channel("filtres") $sliderstyle popupPrefix("Resonance: ") text("Resonance") valueTextBox(1) filmstrip("./SynthResources/knob.png", 128) fontColour(255, 255, 255, 0) outlineColour(58, 58, 58, 0) textColour(255, 255, 255, 255) trackerInsideRadius(0.67)
rslider bounds(166, 50, 90,90) channel("filAmount") range(0, 1, 0.01, 0.5, 0.001) $sliderstyle popupPrefix("Emphasis: ") text("Emphasis") valueTextBox(1) filmstrip("./SynthResources/knob.png", 128) fontColour(255, 255, 255, 0) outlineColour(58, 58, 58, 0) textColour(255, 255, 255, 255) trackerInsideRadius(0.67)
rslider bounds(236, 50, 90,90) channel("filAttack") range(0.001, 2, 0.001, 1, 0.001) $sliderstyle popupPrefix("Attack: ") popupPostfix(" sec") text("Attack") valueTextBox(1) filmstrip("./SynthResources/knob.png", 128) fontColour(255, 255, 255, 0) outlineColour(58, 58, 58, 0) textColour(255, 255, 255, 255) trackerInsideRadius(0.67)
rslider bounds(306, 50, 90,90) channel("filDec") range(0, 4, 0.3, 1, 0.001) $sliderstyle popupPrefix("Decay: ") popupPostfix(" sec") text("Decay") valueTextBox(1) filmstrip("./SynthResources/knob.png", 128) fontColour(255, 255, 255, 0) outlineColour(58, 58, 58, 0) textColour(255, 255, 255, 255) trackerInsideRadius(0.67)


button bounds(203, 20, 55, 20), channel("filBypass"), text("Bypass", "Bypass"), colour:1(255, 0, 0, 255), alpha(0.8), , increment(1) value(1)
combobox bounds(46, 20, 153, 20)  channel("filtmenu")value(1) text("TB303 Ladder", "Moog Ladder", "Steiner-Parker LowPass", "Steiner-Parker HighPass", "Steiner-Parker BandPass", "Sallen-Key Highpass", "Sallen-Key Lowpass") $combostyle alpha(0.7) colour(120, 50, 5, 255)

;label bounds(28, 390, 100, 20) channel("Filter") fontColour(255, 255, 255, 0) text("Filter") alpha(0.6)
}



;--------------  1° LFO----------------------------------------------------------------------------------------------------------------------------------------------------------------

;chorus

button bounds(10, 6, 105, 20), channel("FX"),range(1) text("FX & Modulation", "Oscillators"),   colour:1(255, 0, 0, 255), alpha(0.8), , increment(1) 

groupbox bounds(0, 30, 600, 360) channel("effetti")  plant("pop1") lineThickness(0), popup(1) outlineThickness(0)colour(0, 0, 0, 0){
image bounds(0, 0, 600, 360) channel("ibg1") file("./SynthResources/bg.jpg")
rslider bounds(0, 0, 90, 90) channel("CHORUSsend") range(0.001, 1, 0.011, 1, 0.0001) $sliderstyle valueTextBox(1) popupPrefix("Send Chorus: ") text("Send Chorus") filmstrip("./SynthResources/knob.png", 128) fontColour(255, 255, 255, 0) outlineColour(58, 58, 58, 0) textColour(255, 255, 255, 255) trackerInsideRadius(0.67)
rslider bounds(120, 0, 90, 90) channel("CHORUSrate") range(0.001, 1, 0.032, 1, 0.0001) $sliderstyle valueTextBox(1) popupPrefix("Rate: ") text("Rate") filmstrip("./SynthResources/knob.png", 128) fontColour(255, 255, 255, 0) outlineColour(58, 58, 58, 0) textColour(255, 255, 255, 255) trackerInsideRadius(0.67)
rslider bounds(240, 0, 90, 90) channel("CHORUSdepth") range(0.001, 1, 1, 1, 0.0001) $sliderstyle valueTextBox(1) popupPrefix("Depth: ") text("Depth") filmstrip("./SynthResources/knob.png", 128) fontColour(255, 255, 255, 0) outlineColour(58, 58, 58, 0) textColour(255, 255, 255, 255) trackerInsideRadius(0.67)
rslider bounds(360, 0, 90, 90) channel("CHORUSwidth") range(0.001, 1, 1, 1, 0.0001) $sliderstyle valueTextBox(1) popupPrefix("Width: ") text("Width") filmstrip("./SynthResources/knob.png", 128) fontColour(255, 255, 255, 0) outlineColour(58, 58, 58, 0) textColour(255, 255, 255, 255) trackerInsideRadius(0.67)

;distortion
rslider bounds(0, 120,90, 90) channel("DISTORTIONsend") range(0.001, 1, 0.011, 1, 0.0001) $sliderstyle valueTextBox(1) popupPrefix("Send Dist: ") text("Send Dist") filmstrip("./SynthResources/knob.png", 128) fontColour(255, 255, 255, 0) outlineColour(58, 58, 58, 0) textColour(255, 255, 255, 255) trackerInsideRadius(0.67)
rslider bounds(120, 120, 90, 90) channel("DISTORTIONlev") range(0.001, 1, 0.032, 1, 0.0001) $sliderstyle valueTextBox(1) popupPrefix("Level: ") text("Level") filmstrip("./SynthResources/knob.png", 128) fontColour(255, 255, 255, 0) outlineColour(58, 58, 58, 0) textColour(255, 255, 255, 255) trackerInsideRadius(0.67)
rslider bounds(240, 120, 90, 90) channel("DISTORTIONdrive") range(0.001, 1, 1, 1, 0.0001) $sliderstyle valueTextBox(1) popupPrefix("Drive: ") text("Drive") filmstrip("./SynthResources/knob.png", 128) fontColour(255, 255, 255, 0) outlineColour(58, 58, 58, 0) textColour(255, 255, 255, 255) trackerInsideRadius(0.67)
rslider bounds(360, 120, 90, 90) channel("DISTORTIONtone") range(0.001, 1, 1, 1, 0.0001) $sliderstyle valueTextBox(1) popupPrefix("Tone: ") text("Tone") filmstrip("./SynthResources/knob.png", 128) fontColour(255, 255, 255, 0) outlineColour(58, 58, 58, 0) textColour(255, 255, 255, 255) trackerInsideRadius(0.67)

;delay
rslider bounds(0, 240, 90, 90) channel("DELAYsend") range(0.001, 1, 0.011, 1, 0.0001) $sliderstyle valueTextBox(1) popupPrefix("Send Delay: ") text("Send Delay") filmstrip("./SynthResources/knob.png", 128) fontColour(255, 255, 255, 0) outlineColour(58, 58, 58, 0) textColour(255, 255, 255, 255) trackerInsideRadius(0.67)
rslider bounds(120, 240, 90, 90) channel("DELAYtime") range(0.001, 1, 0.032, 1, 0.0001) $sliderstyle valueTextBox(1) popupPrefix("Time: ") popupPostfix(" sec")text("Time") filmstrip("./SynthResources/knob.png", 128) fontColour(255, 255, 255, 0) outlineColour(58, 58, 58, 0) textColour(255, 255, 255, 255) trackerInsideRadius(0.67)
rslider bounds(240, 240, 90, 90) channel("DELAYfback") range(0.001, 1, 0.032, 1, 0.0001) $sliderstyle valueTextBox(1) popupPrefix("Feedback: ") text("Feedback") filmstrip("./SynthResources/knob.png", 128) fontColour(255, 255, 255, 0) outlineColour(58, 58, 58, 0) textColour(255, 255, 255, 255) trackerInsideRadius(0.67)
rslider bounds(360, 240, 90, 90) channel("DELAYtone") range(0.001, 1, 1, 1, 0.0001) $sliderstyle valueTextBox(1) popupPrefix("Tone: ") text("Tone") filmstrip("./SynthResources/knob.png", 128) fontColour(255, 255, 255, 0) outlineColour(58, 58, 58, 0) textColour(255, 255, 255, 255) trackerInsideRadius(0.67)



}
     
;SubOSC
groupbox bounds(960, 360, 500, 360) channel("sub") lineThickness(0), popup(0) visible(1) outlineThickness(0)colour(0, 0, 0,0){
image bounds (70,40,230,90) channel("griglia5") file("./SynthResources/griglia2.png") alpha(1)

button bounds(226, 70, 45, 25), channel("SubONOFF1"), text("OFF", "ON"), colour:1(255, 0, 0, 255), alpha(0.8), , 
rslider bounds(66, 50, 90, 90) range(0, 3, 1, 1, 1) channel("SubWave1") $sliderstyle popupPrefix("Sub Wave: ") text("Sub Wave") valueTextBox(1) filmstrip("./SynthResources/knob.png", 128) fontColour(255, 255, 255, 0) outlineColour(58, 58, 58, 0) textColour(255, 255, 255, 255) trackerInsideRadius(0.67)
rslider bounds(136, 50, 90, 90) range(0, 1, 0.2, 1, 0.001) channel("SubAmp1") $sliderstyle popupPrefix("Sub Gain: ") text("Sub Gain") valueTextBox(1) filmstrip("./SynthResources/knob.png", 128) fontColour(255, 255, 255, 0) outlineColour(58, 58, 58, 0) textColour(255, 255, 255, 255) trackerInsideRadius(0.67)
}

; Noise
groupbox bounds(830, 360, 500, 360) channel("noise") lineThickness(0), popup(0) visible(1) outlineThickness(0)colour(0, 0, 0,0){
image bounds (20,40,160,90) channel("griglia6") file("./SynthResources/griglia2.png") alpha(1)

button bounds(120, 70, 45, 25), channel("noiseON"), text("OFF", "ON"), colour:1(255, 0, 0, 255), alpha(0.8),
rslider bounds(20, 50, 90, 90) range(0, 1, 0.2, 1, 0.001) channel("noiseVOL") $sliderstyle popupPrefix("Noise Gain: ") text("Noise Gain")  filmstrip("./SynthResources/knob.png", 128) valueTextBox(1) fontColour(255, 255, 255, 0) outlineColour(58, 58, 58, 0) textColour(255, 255, 255, 255) trackerInsideRadius(0.67)
}
;--------------  ADSR----------------------------------------------------------------------------------------------------------------------------------------------------------------

groupbox bounds(930, 460, 400, 360) channel("adsr") lineThickness(0), popup(0) visible(1) outlineThickness(0)colour(0, 0, 0,0){
image bounds (30,40,300,90) channel("griglia4") file("./SynthResources/griglia2.png") alpha(1)

rslider bounds(26, 50, 90,90) channel("Attack") range(0.001, 4, 0.011, 1, 0.0001) $sliderstyle  popupPrefix("Attack: ") valueTextBox(1) popupPostfix(" sec") text("Attack") filmstrip("./SynthResources/knob.png", 128) fontColour(255, 255, 255, 0) outlineColour(58, 58, 58, 0) textColour(255, 255, 255, 255) trackerInsideRadius(0.67)
rslider bounds(96, 50, 90,90) channel("Decay") range(0.001, 4, 0.032, 1, 0.0001) $sliderstyle  popupPrefix("Release: ") valueTextBox(1) popupPostfix(" sec") text("Release") filmstrip("./SynthResources/knob.png", 128) fontColour(255, 255, 255, 0) outlineColour(58, 58, 58, 0) textColour(255, 255, 255, 255) trackerInsideRadius(0.67)
rslider bounds(166, 50, 90,90) channel("Sustain") range(0.001, 1, 1, 1, 0.0001) $sliderstyle  popupPrefix("Sustain: ") valueTextBox(1) text("Sustain") filmstrip("./SynthResources/knob.png", 128) fontColour(255, 255, 255, 0) outlineColour(58, 58, 58, 0) textColour(255, 255, 255, 255) trackerInsideRadius(0.67)
rslider bounds(236, 50, 90,90) channel("Glide") range(0, 2000, 3, 0.4, 0.01) $sliderstyle  popupPrefix("Portamento:")  valueTextBox(1) popupPostfix(" msec") text("Portamento") filmstrip("./SynthResources/knob.png", 128) fontColour(255, 255, 255, 0) outlineColour(58, 58, 58, 0) textColour(255, 255, 255, 255) trackerInsideRadius(0.67)

}
;rslider bounds(1170, 236, 90, 90) channel("env1r") range(0.01, 2, 0.4, 1, 0.001) $sliderstyle valueTextBox(0) popupPrefix("Release") text("Release") filmstrip("./SynthResources/knob.png", 128) fontColour(255, 255, 255, 0) outlineColour(58, 58, 58, 0) textColour(255, 255, 255, 255) trackerInsideRadius(0.67)
rslider bounds(1255, 2, 30,30) channel("MAINVOLUME") range(0.001, 1, 1, 1, 0.0001)  valueTextBox(0) popupPrefix("Out Volume ") trackerColour(255,255,255,255)


</Cabbage>
<CsoundSynthesizer>

<CsOptions>
-n -d -+rtmidi=NULL -M0 -m0d --midi-key-cps=4 --midi-velocity-amp=5 --displays ;--limiter
</CsOptions>
<CsInstruments>
; Initialize the global variables. 
nchnls		= 	2
0dbfs		=	1

#include "./SynthResources/MainOSC.udo"    ;UDO Oscillatore
#include "./UDOs/StChorus.udo" ;UDO Chorus
#include "./UDOs/Distortion.udo" ; UDO Distortion
#include "./UDOs/AnalogDelay.udo" ; UDO AnalogDelay

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

giVEL_NOISE init 0

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

gkDELAY_send init 0
gkDELAY_mix init 0
gkDELAY_time init 0
gkDELAY_fback init 0
gkDELAY_tone init 0

;Create table to map freq. filter knob

giTable_FIL ftgen 0, 0,1024, -8, 20, 184, 125, 328, 1000, 256, 4800, 256, 20000
;Create table to map freq. filter knob

giTable_FIL2 ftgen 10000, 0,1024, -8, 20, 184, 125, 328, 1000, 256, 4800, 256, 20000
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

;gimorph1 ftgen 9999, 0, 10, -2, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11 ;elenco tabelle
gimorph2 ftgen 9999, 0, 24, -2, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33 ,34, 35, 36, 37,38,39,40,41,42,43,44,45
gimorph3 ftgen 99999, 0, 10, -2, 12, 13, 14, 15, 16, 17, 18 ,19, 20, 21
gimorph4 ftgen 999999, 0, 20, -2, 47, 48, 49,50, 51, 52, 53 ,54,55 , 56,57,58,59,60,61,62,63,64,65

;gidum1 ftgen 1111, 0, 16384, 10, 1;------------------------Tabella dummy Analog Waves
gidum2 ftgen 1111, 0, 4096, 10, 1 ;------------------------Tabella dummy Samples
gidum3 ftgen 2222, 0, 4096, 10, 1 ;------------------------Tabella dummy Samples
gidum4 ftgen 4444, 0, 4096, 10, 1 ;------------------------Tabella dummy Samples

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



;=============                            
;Sampled WAVES
;=============  

;Juno1
giwave12 ftgen 12, 0, 4096, 1, "./Waves/Juno/1.wav" ,0, 0, 0

;Juno2
giwave13 ftgen 13, 0, 4096, 1, "./Waves/Juno/2.wav" ,0, 0, 0

;Juno3
giwave14 ftgen 14, 0, 4096, 1, "./Waves/Juno/3.wav" ,0, 0, 0

;Juno4
giwave15 ftgen 15, 0, 4096, 1, "./Waves/Juno/4.wav" ,0, 0, 0

;Juno5
giwave16 ftgen 16, 0, 4096, 1, "./Waves/Juno/5.wav" ,0, 0, 0

;Juno6
giwave17 ftgen 17, 0, 4096, 1, "./Waves/Juno/6.wav" ,0, 0, 0

;Juno7
giwave18 ftgen 18, 0, 4096, 1, "./Waves/Juno/7.wav" ,0, 0, 0

;Juno8
giwave19 ftgen 19, 0, 4096, 1, "./Waves/Juno/8.wav" ,0, 0, 0

;Juno9
giwave20 ftgen 20, 0, 4096, 1, "./Waves/Juno/9.wav" ,0, 0, 0

;Juno10
giwave21 ftgen 21, 0, 4096, 1, "./Waves/Juno/10.wav" ,0, 0, 0

;------------------------------------------------------------------

;Harmonics1
giwave22 ftgen 22, 0, 4096, 1, "./Waves/Harmonics/1.wav" ,0, 0, 0

;Harmonics2
giwave23 ftgen 23, 0, 4096, 1, "./Waves/Harmonics/2.wav" ,0, 0, 0

;Harmonics3
giwave24 ftgen 24, 0, 4096, 1, "./Waves/Harmonics/3.wav" ,0, 0, 0

;Harmonics4
giwave25 ftgen 25, 0, 4096, 1, "./Waves/Harmonics/4.wav" ,0, 0, 0

;Harmonics5
giwave26 ftgen 26, 0, 4096, 1, "./Waves/Harmonics/5.wav" ,0, 0, 0

;Harmonics6
giwave27 ftgen 27, 0, 4096, 1, "./Waves/Harmonics/6.wav" ,0, 0, 0

;Harmonic7
giwave28 ftgen 28, 0, 4096, 1, "./Waves/Harmonics/7.wav" ,0, 0, 0

;Harmonics8
giwave29 ftgen 29, 0, 4096, 1, "./Waves/Harmonics/8.wav" ,0, 0, 0

;Harmonics9
giwave20 ftgen 30, 0, 4096, 1, "./Waves/Harmonics/9.wav" ,0, 0, 0

;Harmonics10
giwave31 ftgen 31, 0, 4096, 1, "./Waves/Harmonics/10.wav" ,0, 0, 0

;Harmonics11
giwave32 ftgen 32, 0, 4096, 1, "./Waves/Harmonics/11.wav" ,0, 0, 0

;Harmonics12
giwave33 ftgen 33, 0, 4096, 1, "./Waves/Harmonics/12.wav" ,0, 0, 0

;Harmonics13
giwave34 ftgen 34, 0, 4096, 1, "./Waves/Harmonics/13.wav" ,0, 0, 0

;Harmonics14
giwave35 ftgen 35, 0, 4096, 1, "./Waves/Harmonics/14.wav" ,0, 0, 0

;Harmonics15
giwave36 ftgen 36, 0, 4096, 1, "./Waves/Harmonics/15.wav" ,0, 0, 0

;Harmonics16
giwave37 ftgen 37, 0, 4096, 1, "./Waves/Harmonics/16.wav" ,0, 0, 0

;Harmonics17
giwave38 ftgen 38, 0, 4096, 1, "./Waves/Harmonics/17.wav" ,0, 0, 0

;Harmonics18
giwave39 ftgen 39, 0, 4096, 1, "./Waves/Harmonics/18.wav" ,0, 0, 0

;Harmonics19
giwave40 ftgen 40, 0, 4096, 1, "./Waves/Harmonics/19.wav" ,0, 0, 0

;Harmonics20
giwave41 ftgen 41, 0, 4096, 1, "./Waves/Harmonics/20.wav" ,0, 0, 0

;Harmonics21
giwave42 ftgen 42, 0, 4096, 1, "./Waves/Harmonics/21.wav" ,0, 0, 0

;Harmonics22
giwave43 ftgen 43, 0, 4096, 1, "./Waves/Harmonics/22.wav" ,0, 0, 0

;Harmonics23
giwave44 ftgen 44, 0, 4096, 1, "./Waves/Harmonics/23.wav" ,0, 0, 0

;Harmonics24
giwave45 ftgen 45, 0, 4096, 1, "./Waves/Harmonics/24.wav" ,0, 0, 0

;Harmonics25
giwave46 ftgen 46, 0, 4096, 1, "./Waves/Harmonics/25.wav" ,0, 0, 0

;------------------------------------------------------------------

;Acid1
giwave47 ftgen 47, 0, 4096, 1, "./Waves/Acid/1.wav" ,0, 0, 0

;Acid1
giwave48 ftgen 48, 0, 4096, 1, "./Waves/Acid/2.wav" ,0, 0, 0

;Acid1
giwave49 ftgen 49, 0, 4096, 1, "./Waves/Acid/3.wav" ,0, 0, 0

;Acid1
giwave50 ftgen 50, 0, 4096, 1, "./Waves/Acid/4.wav" ,0, 0, 0

;Acid1
giwave51 ftgen 51, 0, 4096, 1, "./Waves/Acid/5.wav" ,0, 0, 0

;Acid1
giwave52 ftgen 52, 0, 4096, 1, "./Waves/Acid/6.wav" ,0, 0, 0

;Acid1
giwave53 ftgen 53, 0, 4096, 1, "./Waves/Acid/7.wav" ,0, 0, 0

;Acid1
giwave54 ftgen 54, 0, 4096, 1, "./Waves/Acid/8.wav" ,0, 0, 0

;Acid1
giwave55 ftgen 55, 0, 4096, 1, "./Waves/Acid/9.wav" ,0, 0, 0

;Acid1
giwave56 ftgen 56, 0, 4096, 1, "./Waves/Acid/10.wav" ,0, 0, 0

;Acid1
giwave57 ftgen 57, 0, 4096, 1, "./Waves/Acid/11.wav" ,0, 0, 0

;Acid1
giwave58 ftgen 58, 0, 4096, 1, "./Waves/Acid/12.wav" ,0, 0, 0

;Acid1
giwave59 ftgen 59, 0, 4096, 1, "./Waves/Acid/13.wav" ,0, 0, 0

;Acid1
giwave60 ftgen 60, 0, 4096, 1, "./Waves/Acid/14.wav" ,0, 0, 0

;Acid1
giwave61 ftgen 61, 0, 4096, 1, "./Waves/Acid/15.wav" ,0, 0, 0

;Acid1
giwave62 ftgen 62, 0, 4096, 1, "./Waves/Acid/16.wav" ,0, 0, 0

;Acid1
giwave63 ftgen 63, 0, 4096, 1, "./Waves/Acid/17.wav" ,0, 0, 0

;Acid1
giwave64 ftgen 64, 0, 4096, 1, "./Waves/Acid/18.wav" ,0, 0, 0

;Acid1
giwave65 ftgen 65, 0, 4096, 1, "./Waves/Acid/19.wav" ,0, 0, 0

;Acid1
giwave66 ftgen 66, 0, 4096, 1, "./Waves/Acid/20.wav" ,0, 0, 0

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

gkCHORUS_SEND cabbageGetValue "CHORUSsend"
gkCHORUS_rate cabbageGetValue "CHORUSrate"
gkCHORUS_depth cabbageGetValue "CHORUSdepth"
gkCHORUS_width cabbageGetValue "CHORUSwidth"

gkDISTORTION_send cabbageGetValue "DISTORTIONsend"
gkDISTORTION_lev cabbageGetValue "DISTORTIONlev"
gkDISTORTION_drive cabbageGetValue "DISTORTIONdrive"
gkDISTORTION_tone cabbageGetValue "DISTORTIONtone"

gkDELAY_send cabbageGetValue "DELAYsend"
gkDELAY_mix cabbageGetValue "DELAYmix"
gkDELAY_time cabbageGetValue "DELAYtime"
gkDELAY_fback cabbageGetValue "DELAYfback"
gkDELAY_tone cabbageGetValue "DELAYtone"

gkMAIN_VOL cabbageGetValue "MAINVOLUME"

gkdrywet chnget "osc1osc2"
gkdrywet port gkdrywet, 0.02


gkboccaON cabbageGetValue "boccaON"

kboccatrig changed gkboccaON

if gkboccaON == 1 then

cabbageSet kboccatrig,"bocca", "visible", 1
cabbageSet kboccatrig,"key0", "visible", 1
else
cabbageSet kboccatrig,"bocca", "visible", 0
cabbageSet kboccatrig,"key0", "visible", 0

endif

gkdata2 init 1;		Init MIDI CC1  to 1  

gkstatus, gkchan, gkdata1, gkdata2     midiin ; Read incoming MIDI message

gkGLIDE_ON	= 1;	;Get switch for GLIDE On/Off
gkDECAY_ON	= 1			;Get switch for DECAY On/Off

gkVEL_SW	= 1	

gkporttime_0 	cabbageGetValue "Glide"			;Get port time (glide o portamento)

gkporttime_0 = (gkGLIDE_ON == 1? gkporttime_0 : 0)	;Test on GLIDE on/off

ktrig metro 40 ;							;Reduce widget reading rate to 40/sec
if ktrig == 1 then

;====== MODIFIERS ================
;Loudness Contour (VCA or amplitude envelope param.)
gkAmpAttTim		cabbageGetValue "Attack"		;Get Loudness Envelope Attack Time in [secs]
gkAmpRelTim		cabbageGetValue "Decay"		;Get Loudness Envelope Decay Time in [secs]
gkAmpLev		cabbageGetValue "Sustain"		;Get Loudness Envelope Sustain Lev
	
		
;Filter Contour (VCF envelope param.)
gkFiltAttTim	cabbageGetValue	"filAttack"	;Get Filter Envelope Attack Time in [secs]
gkFiltRelTim	cabbageGetValue	"filDec"	;Get Filter Envelope Decay Time in [secs]
gkFiltLev		cabbageGetValue	"filAmount"		;Get Filter Envelope Sustain Level

gknoise cabbageGetValue "noiseON"
gknoiseVol cabbageGetValue "noiseVOL"
;=======  MIDI KEY VELOCITY =======

gkVEL_TO_OSC1		cabbageGetValue  "VEL_TO_OSC1"		;Get checkbox (as a switch/led) for assign key vel. to OSC1
gkVEL_TO_OSC2		cabbageGetValue  "VEL_TO_OSC2"		;Get checkbox (as a switch/led) for assign key vel. to OSC2
gkVEL_TO_VCF		cabbageGetValue  "VEL_TO_VCF"		;Get checkbox (as a switch/led) for assign key vel. to VCF

endif			;End of widget scan at low rate

;-------------------------------------------------

gkFBASE_VCF_0	cabbageGetValue	"filtfreq" 	;Get the base CUT-OFF freq. [0 = 20hz : 0.99 = 20Khz]
gkRES_VCF		cabbageGetValue	"filtres"		;Get emphasis (resonance) [0 : 0.99]
gkRES_VCF  		port gkRES_VCF,0.01

gkAMOUNT_VCF	cabbageGetValue	"filAmount"	;Get amount of filter contour
gkAMOUNT_VCF    port gkAMOUNT_VCF, 0.08
gkmenu cabbageGetValue "filtmenu" ; menù scelta del filtro
gkFiltbypass cabbageGetValue "filBypass"

gkMAIN_VOLUME_0	cabbageGetValue "MAINVOLUME"	;Get Main Volume
gkMAIN_VOLUME port gkMAIN_VOLUME_0,0.05	;Smooth it


gkfil tablei gkFBASE_VCF_0, giTable_FIL,1		;Map filt. frequency to non linear table
chnset gkfil, "dispVCF_CUT"
gkfil port gkfil,0.01							;Smooth control..



; Widget macro oscillatore 1

gkWave_1 ,gkWave_1_trig       cabbageGetValue "MorphWT1"
gkWave_1        port gkWave_1, 0.02


gkWAVETamp_1    cabbageGetValue "AmpWT1"
gkWAVETamp_1    port gkWAVETamp_1, 0.02

gkWTDetune_1    cabbageGetValue "DetuneWT1"
gkWTDetune_1    port gkWTDetune_1, 0.02

gkVCOamp_1      cabbageGetValue "AmpVCO1"
gkVCOamp_1      port gkVCOamp_1, 0.02

gkPWM_1         cabbageGetValue "PWM1"
gkPWM_1         port gkPWM_1 , 0.02

gkVCOdetune_1   cabbageGetValue "DetuneVCO1"
gkVCOdetune_1   port gkVCOdetune_1, 0.02

gkFMwave_1      cabbageGetValue "FMwave1"
gkFMwave_1      port gkFMwave_1 , 0.02

gkFMfactor_1    cabbageGetValue "FMmod1"
gkFMfactor_1    port gkFMfactor_1, 0.02

gkFMIndex_1     cabbageGetValue "FMindx1"
gkFMIndex_1     port gkFMIndex_1, 0.02
   
gkSubONOFF_1    cabbageGetValue "SubONOFF1"

gkSubWave_1     cabbageGetValue "SubWave1"

gkSubAmp_1      cabbageGetValue "SubAmp1"
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

gkWave_2        cabbageGetValue "MorphWT2"
gkWave_2        port gkWave_2, 0.02

gkWAVETamp_2    cabbageGetValue "AmpWT2"
gkWAVETamp_2    port gkWAVETamp_2, 0.02

gkWTDetune_2    cabbageGetValue "DetuneWT2"
gkWTDetune_2    port gkWTDetune_2, 0.02

gkVCOamp_2      cabbageGetValue "AmpVCO2"
gkVCOamp_2      port gkVCOamp_2, 0.02

gkPWM_2         cabbageGetValue "PWM2"
gkPWM_2         port gkPWM_2 , 0.02

gkVCOdetune_2   cabbageGetValue "DetuneVCO2"
gkVCOdetune_2   port gkVCOdetune_2, 0.02

gkFMwave_2      cabbageGetValue "FMwave2"
gkFMwave_2      port gkFMwave_2 , 0.02

gkFMfactor_2    cabbageGetValue "FMmod2"
gkFMfactor_2    port gkFMfactor_2, 0.02

gkFMIndex_2     cabbageGetValue "FMindx2"
gkFMIndex_2     port gkFMIndex_2, 0.02
   
gkSubONOFF_2    cabbageGetValue "SubONOFF2"

gkSubWave_2     cabbageGetValue "SubWave2"

gkSubAmp_2      cabbageGetValue "SubAmp2"
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


 kChanged metro 40 

    if kChanged==1 then
        event "i", "UpdateTable", 0, .01 
    endif
gkWaveBank1Menu cabbageGetValue "WaveBankOSC1"
endin

instr 10; Main Audio Engine

;========= GLIDE /PORTAMENTO ============

gkporttime = gkporttime_0 * 0.001			;Scale port in sec

kvib init 0

kactive1	active	1						;Counts instances of instr 1 (the MIDI activated instr)

kNoteNum = octcps(gkcps)					;Get the notenum


kporttime	linseg	0.0,0.01,1				;Portamento Time rises quickly to a held value of '1'
kporttime	=	kporttime*gkporttime		;Portamento Time function scaled by value output by widget (knob)
kcps		portk	gkcps, kporttime		;Apply portamento to pitch changes

;========= INIT ENV K VARIABLE ============
kAmpEnv			init	0				;Init amp env. to zero	
kFiltEnv		init	0				;Init filt. env. to zero

;========= MODULATION WHEEL ============
kvib_ctrl = gkvib_ctrl/127.0		;Normalize to 1 the external MOD WHEEL (0-127 -->  0 - 1)


;========= WAVETABLE SYNTH 1 E 2============




aOsc1, aSub1 MainOsc kcps, kcps+gkWTDetune_1, kcps+gkVCOdetune_1, gkWave_1, gkWAVETamp_1, 9999, 1111, gkVCOamp_1, gkPWM_1, gkFMwave_1, gkFMfactor_1, gkFMIndex_1,  1010, 1011,  gkSubAmp_1, gkSubTable_1


aOsc2, aSub2 MainOsc kcps, kcps+gkWTDetune_2, kcps+gkVCOdetune_2, gkWave_2, gkWAVETamp_2, 99999, 2222, gkVCOamp_2, gkPWM_2, gkFMwave_2, gkFMfactor_2, gkFMIndex_2,  1012, 1013,  gkSubAmp_1, gkSubTable_1


;========= ENVELOPE ENGINE ============
		
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
        aFiltEnv interp kFiltEnv
;========= NOISE ===========

if gknoise == 1 then
agauss gauss 1
agauss= agauss*gknoiseVol
else 
agauss = 0
endif
	



gkSubtoFil_1 = 1
gkSubtoFil_2 = 1



    aSum1 sum aOsc1, agauss
    aSum2 sum aOsc2, agauss
;========= OSC1 / OSC2 =======

adrywet interp gkdrywet 

if gkSubONOFF_1	==1  then

  aL sum aSum1*(1-adrywet), aSum2*adrywet, aSub1

    
 else
     
   aL sum aSum1*(1-adrywet), aSum2*adrywet

endif





;========= FILTER SECTION =======


kfilt_delta = $MAX_FREQ - gkfil										;Compute Delta Freq. (difference from cutoff to NY freq.)
	kffilt_var = (kfilt_delta * kFiltEnv * gkAMOUNT_VCF)* giVEL_VCF		;Envelope/scale Delta Freq. and  scale to MIDI vel
	kfilt_freq = gkfil   ;Modulate this freq 

kfreq_VCF = kfilt_freq + kffilt_var	

;---KEY TRACKING SECTION -------------
		

kfreq_VCF = kfreq_VCF*$MULT_TRK1^gktrack_del	
	
	kfreq_VCF = (kfreq_VCF <= $MAX_FREQ? kfreq_VCF : $MAX_FREQ)						;Limit upper freq to 22 Khz
	acut interp kfreq_VCF
				
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
       
    elseif gkmenu == 7 then                              ;Sallen-Key LowPass Filter
        
       ares skf aL, acut, gkRES_VCF*3. ,0 
    elseif gkmenu == 8 then                              ;Sallen-Key HighPass Filter
        
       ares skf aL, acut, gkRES_VCF*3. ,1 
    
    endif
else 


ares =aL;, aSub1, aSub2

ares atone ares,16	
endif


;====== OUT SECTION ======

gilimit = ampdbfs(-6)

aoutLeft balance2 ares, (aL*0.5)
aoutRight balance2 ares, (aL*0.5)

aoutLeft dcblock aoutLeft
aoutRight dcblock aoutRight 

gaout = aoutLeft



;====== SEND TO FX ======

gaSEND_STCHORUS = (aoutLeft*aAmpEnv*gilimit)*gkCHORUS_SEND
gaSEND_DISTORTION = (aoutLeft*aAmpEnv*gilimit)*gkDISTORTION_send
gaSEND_DELAY = (aoutLeft*aAmpEnv*gilimit)*gkDELAY_send


outs aoutLeft*aAmpEnv*gilimit*gkMAIN_VOL , aoutLeft*aAmpEnv*gilimit*gkMAIN_VOL
endin

instr 29

adisplay = gaout*0.3
display	adisplay, .009, 0.01
dispfft adisplay, .009, 256

endin


instr 30 ;CHORUS
gkFX cabbageGetValue "FX"
if gkFX == 1 then
cabbageSet gkFX, "effetti", "visible(1), popup(1)"
else 
cabbageSet 1, "effetti", "visible(0), popup(0)"
endif
aoutL, aoutR StChorus gaSEND_STCHORUS,gaSEND_STCHORUS,gkCHORUS_rate,gkCHORUS_depth,gkCHORUS_width

outs aoutL*gkMAIN_VOL*gilimit,aoutR*gkMAIN_VOL

endin

instr 31 ;Distortion

aoutL Distortion gaSEND_DISTORTION,gkDISTORTION_lev,gkDISTORTION_drive,gkDISTORTION_tone

outs aoutL*gkMAIN_VOL*gilimit,aoutL*gkMAIN_VOL*gilimit

endin

instr 32 ; Analog Delay
aoutDel AnalogDelay gaSEND_DELAY,1,gkDELAY_time ,gkDELAY_fback,gkDELAY_tone
	outs aoutDel*gkMAIN_VOL*gilimit,aoutDel*gkMAIN_VOL
endin


;----------------------------------------------------
;Occhi reattivi al BPM dell'Host

instr 6 
kplay chnget "IS_PLAYING" ; Ricevo le info di BPM e Play/Stop dall'Host e se è in Play
kBPM chnget "HOST_BPM"
kTrig metro (kBPM/60)

kline linseg  0., 0.2, 1, 0.2, 0.

if kTrig == 1 && kplay == 1 then

cabbageSet kTrig,  "occhio", "alpha", kline
cabbageSet kTrig,  "occhio1", "alpha", kline

schedkwhen kTrig, 0, 1, 7, 0, 0.4; Triggero lo strumento 7 ogni ciclo
else
cabbageSet 1,  "occhio", "alpha", 0
cabbageSet 1,  "occhio1", "alpha", 0
endif

endin

instr 7 ; Inviluppo lineare sull'alpha del widget da 0 a 1

kline linseg  0., 0.01, 1,0.06, 1,0.001, 0
;printk2 kline
cabbageSet 1,  "occhio", "alpha", kline
cabbageSet 1,  "occhio1", "alpha", kline

endin


instr UpdateTable 
    cabbageSet	"gentable1", "tableNumber", 1111	; update table display
    cabbageSet	"gentable2", "tableNumber", 2222	; update table display
endin

</CsInstruments>
<CsScore>
i6 0 z

f1501 0 513	-7 0 512 1		;Linear (LIN) Curve for MIDI Vel.
i 100 0 [3600*24*7]
i 29 0 [3600*24*7]
i 30 0 [3600*24*7]
i 31 0 [3600*24*7]
i 32 0 [3600*24*7]
;i 999 0 [3600*24*7]
</CsScore>