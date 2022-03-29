   ▄█   ▄█▄  ▄█        ▄██████▄   ▄█     █▄  ███▄▄▄▄    ▄█     █▄     ▄████████  ▄█    █▄     ▄████████ 
  ███ ▄███▀ ███       ███    ███ ███     ███ ███▀▀▀██▄ ███     ███   ███    ███ ███    ███   ███    ███ 
  ███▐██▀   ███       ███    ███ ███     ███ ███   ███ ███     ███   ███    ███ ███    ███   ███    █▀  
 ▄█████▀    ███       ███    ███ ███     ███ ███   ███ ███     ███   ███    ███ ███    ███  ▄███▄▄▄     
▀▀█████▄    ███       ███    ███ ███     ███ ███   ███ ███     ███ ▀███████████ ███    ███ ▀▀███▀▀▀     
  ███▐██▄   ███       ███    ███ ███     ███ ███   ███ ███     ███   ███    ███ ███    ███   ███    █▄  
  ███ ▀███▄ ███▌    ▄ ███    ███ ███ ▄█▄ ███ ███   ███ ███ ▄█▄ ███   ███    ███ ███    ███   ███    ███ 
  ███   ▀█▀ █████▄▄██  ▀██████▀   ▀███▀███▀   ▀█   █▀   ▀███▀███▀    ███    █▀   ▀██████▀    ██████████ 
  ▀         ▀                                                                                                                         


AU / VST Plugin synth written in Csound and Cabbage

Developed by Francesco Casanova (BitNet01) from an idea of Kernel Panik Sound

In this long period of pandemic, for about two years now, we have tried to commit our efforts, for something truly stimulating and of which 
we have always been passionate, and this is how, thanks to the collaboration with the Bitnet01 collective, we have been able to develop in this
time, our virtual synthesizer, Vst, with our style and sound timbre that we have called KLOWNWAVE,

(WAVETABLE SYNTHESIZER, AKA KERNELPANIK SYNTHESIZER).

We are excited to introduce this new project to you, and we hope you will share our visionary initiative.
KlownWave will be distributed to the public 'by donation', will be open source and hackable.

Features:

    2 x Wavetable Oscillators
    6 x Wavetable Set with 16 morphable waves each
    2 x Analog-like Oscillators (Saw-Ramp-Triangle)
    2 x FM module with morphable source (between different harmonics in sine waves)
    1 x White Noise
    1 x Filter module with envelope and types:
        TB303-like lowpass filter with resonance
        Moog-like lowpass filter with resonance
        Steiner-Parker lowpass filter with resonance
        Steiner-Parker highpass filter with resonance
        Steiner-Parker bandpass filter with resonance
        Sallen-Key lowpass filter with resonance
        Sallen-Key highpass filter with resonance
    1 x Sub oscillator (1 octave down) with different waves (sine, triangle, saw, square)
    1 x Envelope with portamento
    1 x Modulation matrix with:
        8 x LFOs (sine, triangle, saw, ramp, square, random)
        9 x Destinations (Morph WT1, FM Mod 1, FM Index 1, Morph WT2, FM Mod 2, FM Index 2, Cutoff, Resonance, Emphasis)
    6 X Effects (in insert) 
        Distortion
        Chorus
        Flanger
        Phaser
        Delay
        Reverb

    FX Code copyright Ian McCurdy
    
<Cabbage> 

#define sliderstyle outlineColour(58, 58, 58, 0) filmstrip("./GUI/knob.png", 128) visible(1),  textColour(255, 255, 255, 255) fontColour(255, 255, 255, 0) textBoxOutlineColour(0,0,0,0) trackerInsideRadius(0.67) popupText("") text("")
#define combostyle colour(120, 50, 5, 255) alpha(0.7)

bounds(0, 0, 0, 0)
form caption("KlownWave") size(1300, 640), openGL(1), pluginId("KW00") bundle("./GUI", "./KlownWave.snaps", "./UDOs", "./Waves") guiMode("queue")

;-------------- Background e pagliaccio ----------------------------------------------------------------------------------------------------------------------------------------------------------------

image bounds(0, 0, 1300, 640) channel("ibg") file("./GUI/bg1.jpg")
image bounds(0, 0, 1300, 640) channel("tubi") file("./GUI/tubi.png")


image bounds(445, 270, 413, 252) channel("bocca") file("./GUI/boccaclow.png") visible(0)

keyboard bounds(493, 380, 320, 68)  mouseOverKeyColour(255,30,50) channel("key0") visible(0)
image bounds(474, 156, 200, 200) channel("occhio") file("./GUI/occhi.png") alpha(0)
image bounds(620, 156, 200, 200) channel("occhio1") file("./GUI/occhi.png") alpha(0)

rslider bounds(580, 272, 131, 130) channel("osc1osc2") range(0, 1, 0.5, 1, 0.001)  popupText("OSC1 / OSC2")  outlineColour(58, 58, 58, 0) filmstrip("./GUI/nasoknob.png", 128)  textColour(0, 0, 0, 255) fontColour(0, 0, 0, 255) trackerInsideRadius(0.67) 
;signaldisplay bounds(554, 80, 190, 117), colour("white") displayType("waveform"), backgroundColour(147, 210, 0,0), zoom(-1), signalVariable("adisplay", "adisplay"), channel("display")


button bounds(590, 110, 120, 120), channel("boccaON"), alpha(0) latched(1)

;-------------- Presets .snaps ----------------------------------------------------------------------------------------------------------------------------------------------------------------

label bounds(450, 6, 100, 16) channel("prest") fontColour(255, 255, 255, 255) text("Presets") 
combobox bounds(532, 2, 123, 25), populate("*.snaps"), channelType("string") channel("combo23") value("1") automatable(0) text("Default", "FM Detuned", "Riser", "Lead1", "Daft", "DNB", "GesùCristoBackInRave")
filebutton bounds(664, 2, 60, 25), text("Save", "Save"), populate("*.snaps", "test"), mode("named preset") channel("filebutton24")
filebutton bounds(730, 2, 60, 25), text("Remove", "Remove"), populate("*.snaps", "test"), mode("remove preset") channel("filebutton25")


;-------------- Oscillatore 1 ----------------------------------------------------------------------------------------------------------------------------------------------------------------

groupbox bounds(0, 80, 500, 360) channel("OSC1") lineThickness(0), popup(0) visible(1) outlineThickness(0)colour(0, 0, 0,0){

image bounds (35,30,434,270) channel("griglia2") file("./GUI/sezioni.png") alpha(1)
image bounds (284,70,160,160) channel("oblo") file("./GUI/oblo.png")alpha(0.9)


;wavetable
gentable bounds(302, 115, 120, 60),channel("gentable1")  tableNumber(1234) outlineThickness(2), tableGridColour(155, 155, 155, 0) tableBackgroundColour(0,0,0,0) tableColour:0(255, 255, 255, 2555) fill(0)

rslider bounds(271, 227, 70,70) range(0, 15, 3, 1, 0.001) channel("Wavetable1Morph") $sliderstyle popupPrefix("WT Position: ") text("Morph") valueTextBox(1) filmstrip("./GUI/knob.png", 128) fontColour(255, 255, 255, 0) outlineColour(58, 58, 58, 0) textColour(255, 255, 255, 255) trackerInsideRadius(0.67)
rslider bounds(328, 227, 70,70) range(-24, 24, 0, 1, 0.001) channel("Wavetable1Detune") $sliderstyle popupPrefix("Detune: ") text("Detune") valueTextBox(1) filmstrip("./GUI/knob.png", 128) fontColour(255, 255, 255, 0) outlineColour(58, 58, 58, 0) textColour(255, 255, 255, 255) trackerInsideRadius(0.67)
rslider bounds(382, 227, 70,70) range(0, 1, 0.75, 1, 0.001) channel("Wavetable1Gain")   $sliderstyle popupPrefix("Gain: ") text("Gain") valueTextBox(1) fontColour(255, 255, 255, 0) textColour(255, 255, 255, 255)

combobox bounds(290, 50, 150, 17) value(1)channelType("float") channel("WaveBankOSC1") text("Juno","Harmonics", "Acid",  "BasicMg", "Crest","Distech") $combostyle alpha(0.7) colour(120, 50, 5, 255)


;VCO
rslider bounds(26, 49, 90,90) range(0.0001, 0.99999, 0.0001, 1, 0.001) channel("Oscillator1PWM") $sliderstyle popupPrefix("Wave: ") text("Wave") valueTextBox(1) filmstrip("./GUI/knob.png", 128) fontColour(255, 255, 255, 0) outlineColour(58, 58, 58, 0) textColour(255, 255, 255, 255) trackerInsideRadius(0.67)
rslider bounds(96, 49, 90,90) range(-24, 24, 0, 1, 0.01) channel("Oscillator1Detune") $sliderstyle popupPrefix("Detune: ") text("Detune") valueTextBox(1)  
rslider bounds(166, 49, 90,90) range(0, 1, 0.75, 1, 0.001) channel("Oscillator1Gain") $sliderstyle popupPrefix("Gain: ") text("Gain") valueTextBox(1)  
;label bounds(8, 16, 100, 20) channel("VCO") fontColour(255, 255, 255, 0) text("VCO") alpha(0.6)

;FM
rslider bounds(26, 199, 90,90) range(0, 10, 0, 1, 0.001) channel("FMmodulator1") $sliderstyle popupPrefix("FM Modulator: ") text("FM Mod") valueTextBox(1) filmstrip("./GUI/knob.png", 128) fontColour(255, 255, 255, 0) outlineColour(58, 58, 58, 0) textColour(255, 255, 255, 255) trackerInsideRadius(0.67)
rslider bounds(96, 199, 90,90) range(0, 50, 0, 1, 0.001) channel("FMindex1") $sliderstyle popupPrefix("FM Index: ") text("FM Index") valueTextBox(1) filmstrip("./GUI/knob.png", 128) fontColour(255, 255, 255, 0) outlineColour(58, 58, 58, 0) textColour(255, 255, 255, 255) trackerInsideRadius(0.67)
rslider bounds(166, 199, 90,90) range(0, 7, 0, 1, 0.001) channel("FMwavetable1") $sliderstyle popupPrefix("FM Source: ") text("FM Source") valueTextBox(1) filmstrip("./GUI/knob.png", 128) fontColour(255, 255, 255, 0) outlineColour(58, 58, 58, 0) textColour(255, 255, 255, 255) trackerInsideRadius(0.67)

}



;-------------- Oscillatore 2 ----------------------------------------------------------------------------------------------------------------------------------------------------------------
groupbox bounds(794, 80, 500, 360) channel("OSC2") lineThickness(0), popup(0) visible(1) outlineThickness(0)colour(0, 0, 0,0){

image bounds (35,30,434,270) channel("griglia2") file("./GUI/sezioni2.png") alpha(1)
image bounds (59,70,160,160) channel("oblo") file("./GUI/oblo.png")alpha(0.9)

;wavetable
gentable bounds(78, 115, 120, 60), channel("gentable2"), tableNumber(5678) outlineThickness(2), tableGridColour(155, 155, 155, 0) tableBackgroundColour(0,0,0,0) tableColour:0(255, 255, 255, 255) fill(0)

rslider bounds(46, 227, 70,70) range(0, 15, 1, 1, 0.001) channel("Wavetable2Morph") $sliderstyle popupPrefix("WT Position: ") text("Morph") valueTextBox(1) filmstrip("./GUI/knob.png", 128) fontColour(255, 255, 255, 0) outlineColour(58, 58, 58, 0) textColour(255, 255, 255, 255) trackerInsideRadius(0.67)
rslider bounds(106, 227, 70,70) range(-24, 24, 0, 1, 0.001) channel("Wavetable2Detune") $sliderstyle popupPrefix("Detune: ") text("Detune") valueTextBox(1) filmstrip("./GUI/knob.png", 128) fontColour(255, 255, 255, 0) outlineColour(58, 58, 58, 0) textColour(255, 255, 255, 255) trackerInsideRadius(0.67)
rslider bounds(166, 227, 70,70) range(0, 1, 0.75, 1, 0.001) channel("Wavetable2Gain")   $sliderstyle popupPrefix("Gain: ") text("Gain") valueTextBox(1) fontColour(255, 255, 255, 0) textColour(255, 255, 255, 255)

combobox bounds(65, 50, 150,17) value(1)channel("WaveBankOSC2") text("Juno","Harmonics", "Acid",  "BasicMg", "Crest","Distech") $combostyle alpha(0.7) colour(120, 50, 5, 255)


;VCO
rslider bounds(245, 60, 90,90) range(0.0001, 0.99999, 0.0001, 1, 0.001) channel("Oscillator2PWM") $sliderstyle popupPrefix("Wave: ") text("Wave") valueTextBox(1) filmstrip("./GUI/knob.png", 128) fontColour(255, 255, 255, 0) outlineColour(58, 58, 58, 0) textColour(255, 255, 255, 255) trackerInsideRadius(0.67)
rslider bounds(315, 60, 90,90) range(-24, 24, 0, 1, 0.01) channel("Oscillator2Detune") $sliderstyle popupPrefix("Detune: ") text("Detune") valueTextBox(1)  
rslider bounds(385, 60, 90,90) range(0, 1, 0.75, 1, 0.001) channel("Oscillator2Gain") $sliderstyle popupPrefix("Gain: ") text("Gain") valueTextBox(1)  


;FM
rslider bounds(245, 199, 90,90) range(0, 10, 0, 1, 0.001) channel("FMmodulator2") $sliderstyle popupPrefix("FM Modulator: ") text("FM Mod") valueTextBox(1) filmstrip("./GUI/knob.png", 128) fontColour(255, 255, 255, 0) outlineColour(58, 58, 58, 0) textColour(255, 255, 255, 255) trackerInsideRadius(0.67)
rslider bounds(315, 199, 90,90) range(0, 50, 0, 1, 0.001) channel("FMindex2") $sliderstyle popupPrefix("FM Index: ") text("FM Index") valueTextBox(1) filmstrip("./GUI/knob.png", 128) fontColour(255, 255, 255, 0) outlineColour(58, 58, 58, 0) textColour(255, 255, 255, 255) trackerInsideRadius(0.67)
rslider bounds(385, 199, 90,90) range(0, 7, 0, 1, 0.001) channel("FMwave2") $sliderstyle popupPrefix("FM Source: ") text("FM Source") valueTextBox(1) filmstrip("./GUI/knob.png", 128) fontColour(255, 255, 255, 0) outlineColour(58, 58, 58, 0) textColour(255, 255, 255, 255) trackerInsideRadius(0.67)

}

;-------------- Parametri Filtro----------------------------------------------------------------------------------------------------------------------------------------------------------------


groupbox bounds(70, 430, 500, 360) channel("filtergroup") lineThickness(0), popup(0) visible(1) outlineThickness(0)colour(0, 0, 0,0){
image bounds (30,0,368,137) channel("griglia3") file("./GUI/griglia2.png") alpha(1)

rslider bounds(26, 50, 90,90) range(0, 1, 1, 1, 0.001) channel("FilterCutoff") $sliderstyle popupPrefix("Cutoff Frequency: ") text("Cutoff") valueTextBox(1) filmstrip("./GUI/knob.png", 128) fontColour(255, 255, 255, 0) outlineColour(58, 58, 58, 0) textColour(255, 255, 255, 255) trackerInsideRadius(0.67)
rslider bounds(96, 50, 90,90) range(0, 1, 0, 1, 0.001) channel("FilterResonance") $sliderstyle popupPrefix("Resonance: ") text("Resonance") valueTextBox(1) filmstrip("./GUI/knob.png", 128) fontColour(255, 255, 255, 0) outlineColour(58, 58, 58, 0) textColour(255, 255, 255, 255) trackerInsideRadius(0.67)
rslider bounds(166, 50, 90,90) channel("FilterEmphasis") range(0, 1, 0.01, 0.5, 0.001) $sliderstyle popupPrefix("Emphasis: ") text("Emphasis") valueTextBox(1) filmstrip("./GUI/knob.png", 128) fontColour(255, 255, 255, 0) outlineColour(58, 58, 58, 0) textColour(255, 255, 255, 255) trackerInsideRadius(0.67)
rslider bounds(236, 50, 90,90) channel("FilterAttack") range(0.001, 2, 0.001, 1, 0.001) $sliderstyle popupPrefix("Attack: ") popupPostfix(" sec") text("Attack") valueTextBox(1) filmstrip("./GUI/knob.png", 128) fontColour(255, 255, 255, 0) outlineColour(58, 58, 58, 0) textColour(255, 255, 255, 255) trackerInsideRadius(0.67)
rslider bounds(306, 50, 90,90) channel("FilterDecay") range(0, 4, 0.3, 1, 0.001) $sliderstyle popupPrefix("Decay: ") popupPostfix(" sec") text("Decay") valueTextBox(1) filmstrip("./GUI/knob.png", 128) fontColour(255, 255, 255, 0) outlineColour(58, 58, 58, 0) textColour(255, 255, 255, 255) trackerInsideRadius(0.67)


button bounds(203, 20, 85, 30), channel("FilterBypass"), text("Bypass", "Bypass"), colour:1(255, 0, 0, 255), alpha(0.8), , increment(1) value(1) imgFile("on", "./GUI/toggleON.png") , imgFile("off", "./GUI/toggleOFF.png")
combobox bounds(46, 20, 153, 20)  channel("filtmenu")value(1) text("TB303 Ladder", "Moog Ladder", "Steiner-Parker LowPass", "Steiner-Parker HighPass", "Steiner-Parker BandPass", "Sallen-Key Highpass", "Sallen-Key Lowpass") $combostyle alpha(0.7) colour(120, 50, 5, 255)

;label bounds(28, 390, 100, 20) channel("Filter") fontColour(255, 255, 255, 0) text("Filter") alpha(0.6)
}


;--------------   LFO----------------------------------------------------------------------------------------------------------------------------------------------------------------

groupbox bounds(817, 90, 460, 157) channel("LFOs") lineThickness(0),visible(0) popup(0)  outlineThickness(0)colour(0, 0, 0,0){

image bounds (0,0,440,147) channel("griglia3") file("./GUI/griglia2.png") alpha(1)
label bounds(4, 0, 435, 142) channel("label") colour("black") text("") alpha(0.2)

groupbox bounds(20, 12, 50, 120) channel("LFO1") lineThickness(0), popup(0) visible(1) outlineThickness(0)colour(0, 0, 0,0){
{
label bounds(4, 0, 38, 16) channel("LFO1label") fontColour(255, 255, 255, 255) text("LFO1") 
combobox bounds(0, 20, 46, 19) channel("LFO1type") text("Sine", "Triangle", "Square", "Ramp", "Ramp Down", "Random")
nslider bounds(4, 40, 35, 25) channel("LFO1rate") range(0, 2, 0, 1, 0.01) text("Rate") textColour(255, 255, 255, 255)
nslider bounds(4, 65, 35, 25) channel("LFO1min") range(0, 20, 0, 1, 0.01) text("Min")textColour(255, 255, 255, 255)
nslider bounds(4, 90, 35, 25) channel("LFO1max") range(0, 20, 0, 1, 0.01) text("Max")textColour(255, 255, 255, 255)
}

groupbox bounds(70, 12, 50, 120) channel("LFO2") lineThickness(0), popup(0) visible(1) outlineThickness(0)colour(0, 0, 0,0){
{
label bounds(4, 0, 38, 16) channel("LFO2label") fontColour(255, 255, 255, 255) text("LFO2") 
combobox bounds(0, 20, 46, 19) channel("LFO2type") text("Sine", "Triangle", "Square", "Ramp", "Ramp Down", "Random")
nslider bounds(4, 40, 35, 25) channel("LFO2rate") range(0, 2, 0, 1, 0.01) text("Rate") textColour(255, 255, 255, 255)
nslider bounds(4, 65, 35, 25) channel("LFO2min") range(0, 20, 0, 1, 0.01) text("Min")textColour(255, 255, 255, 255)
nslider bounds(4, 90, 35, 25) channel("LFO2max") range(0, 20, 0, 1, 0.01) text("Max")textColour(255, 255, 255, 255)
}

groupbox bounds(120, 12, 50, 120) channel("LFO3") lineThickness(0), popup(0) visible(1) outlineThickness(0)colour(0, 0, 0,0){
{
label bounds(4, 0, 38, 16) channel("LFO3label") fontColour(255, 255, 255, 255) text("LFO3") 
combobox bounds(0, 20, 46, 19) channel("LFO3type") text("Sine", "Triangle", "Square", "Ramp", "Ramp Down", "Random")
nslider bounds(4, 40, 35, 25) channel("LFO3rate") range(0, 2, 0, 1, 0.01) text("Rate") textColour(255, 255, 255, 255)
nslider bounds(4, 65, 35, 25) channel("LFO3min") range(0, 20, 0, 1, 0.01) text("Min")textColour(255, 255, 255, 255)
nslider bounds(4, 90, 35, 25) channel("LFO3max") range(0, 20, 0, 1, 0.01) text("Max")textColour(255, 255, 255, 255)
}

groupbox bounds(170,12, 50, 120) channel("LFO4") lineThickness(0), popup(0) visible(1) outlineThickness(0)colour(0, 0, 0,0){
{
label bounds(4, 0, 38, 16) channel("LFO4label") fontColour(255, 255, 255, 255) text("LFO4") 
combobox bounds(0, 20, 46, 19) channel("LFO4type") text("Sine", "Triangle", "Square", "Ramp", "Ramp Down", "Random")
nslider bounds(4, 40, 35, 25) channel("LFO4rate") range(0, 2, 0, 1, 0.01) text("Rate") textColour(255, 255, 255, 255)
nslider bounds(4, 65, 35, 25) channel("LFO4min") range(0, 20, 0, 1, 0.01) text("Min")textColour(255, 255, 255, 255)
nslider bounds(4, 90, 35, 25) channel("LFO4max") range(0, 20, 0, 1, 0.01) text("Max")textColour(255, 255, 255, 255)
}

groupbox bounds(220, 12, 50, 120) channel("LFO5") lineThickness(0), popup(0) visible(1) outlineThickness(0)colour(0, 0, 0,0){
{
label bounds(4, 0, 38, 16) channel("LFO5label") fontColour(255, 255, 255, 255) text("LFO5") 
combobox bounds(0, 20, 46, 19) channel("LFO5type") text("Sine", "Triangle", "Square", "Ramp", "Ramp Down", "Random")
nslider bounds(4, 40, 35, 25) channel("LFO5rate") range(0, 2, 0, 1, 0.01) text("Rate") textColour(255, 255, 255, 255)
nslider bounds(4, 65, 35, 25) channel("LFO5min") range(0, 20, 0, 1, 0.01) text("Min")textColour(255, 255, 255, 255)
nslider bounds(4, 90, 35, 25) channel("LFO5max") range(0, 20, 0, 1, 0.01) text("Max")textColour(255, 255, 255, 255)
}

groupbox bounds(270, 12, 50, 120) channel("LFO6") lineThickness(0), popup(0) visible(1) outlineThickness(0)colour(0, 0, 0,0){
{
label bounds(4, 0, 38, 16) channel("LFO6label") fontColour(255, 255, 255, 255) text("LFO6") 
combobox bounds(0, 20, 46, 19) channel("LFO6type") text("Sine", "Triangle", "Square", "Ramp", "Ramp Down", "Random")
nslider bounds(4, 40, 35, 25) channel("LFO6rate") range(0, 2, 0, 1, 0.01) text("Rate") textColour(255, 255, 255, 255)
nslider bounds(4, 65, 35, 25) channel("LFO6min") range(0, 20, 0, 1, 0.01) text("Min")textColour(255, 255, 255, 255)
nslider bounds(4, 90, 35, 25) channel("LFO6max") range(0, 20, 0, 1, 0.01) text("Max")textColour(255, 255, 255, 255)
}

groupbox bounds(320, 12, 50, 120) channel("LFO7") lineThickness(0), popup(0) visible(1) outlineThickness(0)colour(0, 0, 0,0){
{
label bounds(4, 0, 38, 16) channel("LFO7label") fontColour(255, 255, 255, 255) text("LFO7") 
combobox bounds(0, 20, 46, 19) channel("LFO7type") text("Sine", "Triangle", "Square", "Ramp", "Ramp Down", "Random")
nslider bounds(4, 40, 35, 25) channel("LFO7rate") range(0, 2, 0, 1, 0.01) text("Rate") textColour(255, 255, 255, 255)
nslider bounds(4, 65, 35, 25) channel("LFO7min") range(0, 20, 0, 1, 0.01) text("Min")textColour(255, 255, 255, 255)
nslider bounds(4, 90, 35, 25) channel("LFO7max") range(0, 20, 0, 1, 0.01) text("Max")textColour(255, 255, 255, 255)
}

groupbox bounds(370, 12, 50, 120) channel("LFO8") lineThickness(0), popup(0) visible(1) outlineThickness(0)colour(0, 0, 0,0){
{
label bounds(4, 0, 38, 16) channel("LFO8label") fontColour(255, 255, 255, 255) text("LFO8") 
combobox bounds(0, 20, 46, 19) channel("LFO8type") text("Sine", "Triangle", "Square", "Ramp", "Ramp Down", "Random")
nslider bounds(4, 40, 35, 25) channel("LFO8rate") range(0, 2, 0, 1, 0.01) text("Rate") textColour(255, 255, 255, 255)
nslider bounds(4, 65, 35, 25) channel("LFO8min") range(0, 20, 0, 1, 0.01) text("Min")textColour(255, 255, 255, 255)
nslider bounds(4, 90, 35, 25) channel("LFO8max") range(0, 20, 0, 1, 0.01) text("Max")textColour(255, 255, 255, 255)
}
}


;image bounds(810, 170, 470, 460) channel("tubi2") file("./GUI/tubi2.png")


groupbox bounds(890, 255, 425, 428) channel("matrix") lineThickness(0),  visible(0) outlineThickness(0)colour(0, 0, 0, 0){


image bounds (0,0,325,328) channel("griglia4") file("./GUI/griglia3.png") alpha(1)
image bounds (23,10,286,309) channel("griglia3") file("./GUI/matrix.png") alpha(1)
groupbox bounds(23, 80, 400, 820) channel("buttons") lineThickness(0),   outlineThickness(0)colour(0, 0, 0, 0){

checkbox bounds(40, 16, 19, 19) channel("check1")colour:1("255,255,25, 180")colour:0("0, 0, 0, 0")
checkbox bounds(65, 16, 19, 19) channel("check2")colour:1("255,255,25, 180")colour:0("0, 0, 0, 0")
checkbox bounds(90, 16, 19, 19) channel("check3")colour:1("255,255,25, 180")colour:0("0, 0, 0, 0")
checkbox bounds(115, 16, 19, 19) channel("check4")colour:1("255,255,25, 180")colour:0("0, 0, 0, 0")
checkbox bounds(140, 16, 19, 19) channel("check5")colour:1("255,255,25, 180")colour:0("0, 0, 0, 0")
checkbox bounds(165, 16, 19, 19) channel("check6")colour:1("255,255,25, 180")colour:0("0, 0, 0, 0")
checkbox bounds(190, 16, 19, 19) channel("check7")colour:1("255,255,25, 180")colour:0("0, 0, 0, 0")
checkbox bounds(215, 16, 19, 19) channel("check8")colour:1("255,255,25, 180")colour:0("0, 0, 0, 0")
checkbox bounds(240, 16, 19, 19) channel("check9")colour:1("255,255,25, 180")colour:0("0, 0, 0, 0")

checkbox bounds(40, 42, 19, 19) channel("check10")colour:1("255,255,25, 180")colour:0("0, 0, 0, 0")
checkbox bounds(65, 42, 19, 19) channel("check11")colour:1("255,255,25, 180")colour:0("0, 0, 0, 0")
checkbox bounds(90, 42, 19, 19) channel("check12")colour:1("255,255,25, 180")colour:0("0, 0, 0, 0")
checkbox bounds(115, 42, 19, 19) channel("check13")colour:1("255,255,25, 180")colour:0("0, 0, 0, 0")
checkbox bounds(140, 42, 19, 19) channel("check14")colour:1("255,255,25, 180")colour:0("0, 0, 0, 0")
checkbox bounds(165, 42, 19, 19) channel("check15")colour:1("255,255,25, 180")colour:0("0, 0, 0, 0")
checkbox bounds(190, 42, 19, 19) channel("check16")colour:1("255,255,25, 180")colour:0("0, 0, 0, 0")
checkbox bounds(215, 42, 19, 19) channel("check17")colour:1("255,255,25, 180")colour:0("0, 0, 0, 0")
checkbox bounds(240, 42, 19, 19) channel("check18")colour:1("255,255,25, 180")colour:0("0, 0, 0, 0")

checkbox bounds(40, 67, 19, 19) channel("check19")colour:1("255,255,25, 180")colour:0("0, 0, 0, 0")
checkbox bounds(65, 67, 19, 19) channel("check20")colour:1("255,255,25, 180")colour:0("0, 0, 0, 0")
checkbox bounds(90, 67, 19, 19) channel("check21")colour:1("255,255,25, 180")colour:0("0, 0, 0, 0")
checkbox bounds(115, 67, 19, 19) channel("check22")colour:1("255,255,25, 180")colour:0("0, 0, 0, 0")
checkbox bounds(140, 67, 19, 19) channel("check23")colour:1("255,255,25, 180")colour:0("0, 0, 0, 0")
checkbox bounds(165, 67, 19, 19) channel("check24")colour:1("255,255,25, 180")colour:0("0, 0, 0, 0")
checkbox bounds(190, 67, 19, 19) channel("check25")colour:1("255,255,25, 180")colour:0("0, 0, 0, 0")
checkbox bounds(215, 67, 19, 19) channel("check26")colour:1("255,255,25, 180")colour:0("0, 0, 0, 0")
checkbox bounds(240, 67, 19, 19) channel("check27")colour:1("255,255,25, 180")colour:0("0, 0, 0, 0")

checkbox bounds(40, 92, 19, 19) channel("check28")colour:1("255,255,25, 180")colour:0("0, 0, 0, 0")
checkbox bounds(65, 92, 19, 19) channel("check29")colour:1("255,255,25, 180")colour:0("0, 0, 0, 0")
checkbox bounds(90, 92, 19, 19) channel("check30")colour:1("255,255,25, 180")colour:0("0, 0, 0, 0")
checkbox bounds(115, 92, 19, 19) channel("check31")colour:1("255,255,25, 180")colour:0("0, 0, 0, 0")
checkbox bounds(140, 92, 19, 19) channel("check32")colour:1("255,255,25, 180")colour:0("0, 0, 0, 0")
checkbox bounds(165, 92, 19, 19) channel("check33")colour:1("255,255,25, 180")colour:0("0, 0, 0, 0")
checkbox bounds(190, 92, 19, 19) channel("check34")colour:1("255,255,25, 180")colour:0("0, 0, 0, 0")
checkbox bounds(215, 92, 19, 19) channel("check35")colour:1("255,255,25, 180")colour:0("0, 0, 0, 0")
checkbox bounds(240, 92, 19, 19) channel("check36")colour:1("255,255,25, 180")colour:0("0, 0, 0, 0")

checkbox bounds(40, 116, 19, 19) channel("check37")colour:1("255,255,25, 180")colour:0("0, 0, 0, 0")
checkbox bounds(65, 116, 19, 19) channel("check38")colour:1("255,255,25, 180")colour:0("0, 0, 0, 0")
checkbox bounds(90, 116, 19, 19) channel("check39")colour:1("255,255,25, 180")colour:0("0, 0, 0, 0")
checkbox bounds(115, 116, 19, 19) channel("check40")colour:1("255,255,25, 180")colour:0("0, 0, 0, 0")
checkbox bounds(140, 116, 19, 19) channel("check41")colour:1("255,255,25, 180")colour:0("0, 0, 0, 0")
checkbox bounds(165, 116, 19, 19) channel("check42")colour:1("255,255,25, 180")colour:0("0, 0, 0, 0")
checkbox bounds(190, 116, 19, 19) channel("check43")colour:1("255,255,25, 180")colour:0("0, 0, 0, 0")
checkbox bounds(215, 116, 19, 19) channel("check44")colour:1("255,255,25, 180")colour:0("0, 0, 0, 0")
checkbox bounds(240, 116, 19, 19) channel("check45")colour:1("255,255,25, 180")colour:0("0, 0, 0, 0")

checkbox bounds(40, 142, 19, 19) channel("check46")colour:1("255,255,25, 180")colour:0("0, 0, 0, 0")
checkbox bounds(65, 142, 19, 19) channel("check47")colour:1("255,255,25, 180")colour:0("0, 0, 0, 0")
checkbox bounds(90, 142, 19, 19) channel("check48")colour:1("255,255,25, 180")colour:0("0, 0, 0, 0")
checkbox bounds(115, 142, 19, 19) channel("check49")colour:1("255,255,25, 180")colour:0("0, 0, 0, 0")
checkbox bounds(140, 142, 19, 19) channel("check50")colour:1("255,255,25, 180")colour:0("0, 0, 0, 0")
checkbox bounds(165, 142, 19, 19) channel("check51")colour:1("255,255,25, 180")colour:0("0, 0, 0, 0")
checkbox bounds(190, 142, 19, 19) channel("check52")colour:1("255,255,25, 180")colour:0("0, 0, 0, 0")
checkbox bounds(215, 142, 19, 19) channel("check53")colour:1("255,255,25, 180")colour:0("0, 0, 0, 0")
checkbox bounds(240, 142, 19, 19) channel("check54")colour:1("255,255,25, 180")colour:0("0, 0, 0, 0")

checkbox bounds(40, 167, 19, 19) channel("check55")colour:1("255,255,25, 180")colour:0("0, 0, 0, 0")
checkbox bounds(65, 167, 19, 19) channel("check56")colour:1("255,255,25, 180")colour:0("0, 0, 0, 0")
checkbox bounds(90, 167, 19, 19) channel("check57")colour:1("255,255,25, 180")colour:0("0, 0, 0, 0")
checkbox bounds(115, 167, 19, 19) channel("check58")colour:1("255,255,25, 180")colour:0("0, 0, 0, 0")
checkbox bounds(140, 167, 19, 19) channel("check59")colour:1("255,255,25, 180")colour:0("0, 0, 0, 0")
checkbox bounds(165, 167, 19, 19) channel("check60")colour:1("255,255,25, 180")colour:0("0, 0, 0, 0")
checkbox bounds(190, 167, 19, 19) channel("check61")colour:1("255,255,25, 180")colour:0("0, 0, 0, 0")
checkbox bounds(215, 167, 19, 19) channel("check62")colour:1("255,255,25, 180")colour:0("0, 0, 0, 0")
checkbox bounds(240, 167, 19, 19) channel("check63")colour:1("255,255,25, 180")colour:0("0, 0, 0, 0")

checkbox bounds(40, 192, 19, 19) channel("check64")colour:1("255,255,25, 180")colour:0("0, 0, 0, 0")
checkbox bounds(65, 192, 19, 19) channel("check65")colour:1("255,255,25, 180")colour:0("0, 0, 0, 0")
checkbox bounds(90, 192, 19, 19) channel("check66")colour:1("255,255,25, 180")colour:0("0, 0, 0, 0")
checkbox bounds(115, 192, 19, 19) channel("check67")colour:1("255,255,25, 180")colour:0("0, 0, 0, 0")
checkbox bounds(140, 192, 19, 19) channel("check68")colour:1("255,255,25, 180")colour:0("0, 0, 0, 0")
checkbox bounds(165, 192, 19, 19) channel("check69")colour:1("255,255,25, 180")colour:0("0, 0, 0, 0")
checkbox bounds(190, 192, 19, 19) channel("check70")colour:1("255,255,25, 180")colour:0("0, 0, 0, 0")
checkbox bounds(215, 192, 19, 19) channel("check71")colour:1("255,255,25, 180")colour:0("0, 0, 0, 0")
checkbox bounds(240, 192, 19, 19) channel("check72")colour:1("255,255,25, 180")colour:0("0, 0, 0, 0")

}
}

;--------------  EFFECTS ----------------------------------------------------------------------------------------------------------------------------------------------------------------

button bounds(10, 6, 105, 20), channel("FX"),range(1) text("FX & Modulation", "Oscillators"),   colour:1(255, 0, 0, 255), alpha(0.8), , increment(1) 

groupbox bounds(25, 45, 600, 660) channel("effetti")  plant("pop1") lineThickness(0), popup(0) outlineThickness(0)colour(0, 0, 0, 0){


;distortion
groupbox bounds(30, 30, 360, 90) channel("distort")  lineThickness(0), popup(0) outlineThickness(0)colour(0, 0, 0, 0){
    image bounds (0,0,360,80) channel("grigliaChorus") file("./GUI/griglia2.png") alpha(1)

    rslider bounds(90, 9, 80, 80) channel("DISTORTIONlev") range(0, 1, 0.75, 1, 0.0001) $sliderstyle valueTextBox(1) popupPrefix("Level: ") text("Level") filmstrip("./GUI/knob.png", 128) fontColour(255, 255, 255, 0) outlineColour(58, 58, 58, 0) textColour(255, 255, 255, 255) trackerInsideRadius(0.67)
    rslider bounds(160, 9, 80, 80) channel("DISTORTIONdrive") range(0, 1, 1, 1, 0.0001) $sliderstyle valueTextBox(1) popupPrefix("Drive: ") text("Drive") filmstrip("./GUI/knob.png", 128) fontColour(255, 255, 255, 0) outlineColour(58, 58, 58, 0) textColour(255, 255, 255, 255) trackerInsideRadius(0.67)
    rslider bounds(230, 9, 80, 80) channel("DISTORTIONtone") range(0, 1, 1, 1, 0.0001) $sliderstyle valueTextBox(1) popupPrefix("Tone: ") text("Tone") filmstrip("./GUI/knob.png", 128) fontColour(255, 255, 255, 0) outlineColour(58, 58, 58, 0) textColour(255, 255, 255, 255) trackerInsideRadius(0.67)
    button bounds(300, 9,32, 62), channel("distortON"), text("", ""), alpha(1) increment(1) value(0) imgFile("on", "./GUI/raveonoff1.png") , imgFile("off", "./GUI/raveonoff.png")

}

;chorus
groupbox bounds(30, 110, 360, 90) channel("chorus")  lineThickness(0), popup(0) outlineThickness(0)colour(0, 0, 0, 0){
    image bounds (0,0,360,80) channel("grigliaChorus") file("./GUI/griglia2.png") alpha(1)
    rslider bounds(90, 9, 80, 80) channel("CHORUSrate") range(0, 1, 0, 1, 0.0001) $sliderstyle valueTextBox(1) popupPrefix("Rate: ") text("Rate") filmstrip("./GUI/knob.png", 128) fontColour(255, 255, 255, 0) outlineColour(58, 58, 58, 0) textColour(255, 255, 255, 255) trackerInsideRadius(0.67)
    rslider bounds(160, 9, 80, 80) channel("CHORUSdepth") range(0, 1, 0, 1, 0.0001) $sliderstyle valueTextBox(1) popupPrefix("Depth: ") text("Depth") filmstrip("./GUI/knob.png", 128) fontColour(255, 255, 255, 0) outlineColour(58, 58, 58, 0) textColour(255, 255, 255, 255) trackerInsideRadius(0.67)
    rslider bounds(230, 9, 80, 80) channel("CHORUSwidth") range(0, 1, 0, 1, 0.0001) $sliderstyle valueTextBox(1) popupPrefix("Width: ") text("Width") filmstrip("./GUI/knob.png", 128) fontColour(255, 255, 255, 0) outlineColour(58, 58, 58, 0) textColour(255, 255, 255, 255) trackerInsideRadius(0.67)
    button bounds(300, 9,32, 62), channel("chorusON"), text("", ""), alpha(1) increment(1) value(0) imgFile("on", "./GUI/raveonoff1.png") , imgFile("off", "./GUI/raveonoff.png")
}

;flanger
groupbox bounds(30, 190, 360, 90) channel("flanger")  lineThickness(0), popup(0) outlineThickness(0)colour(0, 0, 0, 0){
    image bounds (0,0,360,80) channel("grigliaFlang") file("./GUI/griglia2.png") alpha(1)

    rslider bounds(60, 9, 80, 80) channel("FLANGERrate") range(0, 1, 0, 1, 0.0001) $sliderstyle valueTextBox(1) popupPrefix("Rate: ") text("Rate") filmstrip("./GUI/knob.png", 128) fontColour(255, 255, 255, 0) outlineColour(58, 58, 58, 0) textColour(255, 255, 255, 255) trackerInsideRadius(0.67)
    rslider bounds(120, 9, 80, 80) channel("FLANGERdepth") range(0, 1, 0, 1, 0.0001) $sliderstyle valueTextBox(1) popupPrefix("Depth: ") text("Depth") filmstrip("./GUI/knob.png", 128) fontColour(255, 255, 255, 0) outlineColour(58, 58, 58, 0) textColour(255, 255, 255, 255) trackerInsideRadius(0.67)
    rslider bounds(180, 9, 80, 80) channel("FLANGERdel") range(0, 1, 0, 1, 0.0001) $sliderstyle valueTextBox(1) popupPrefix("Delay: ") text("Delay") filmstrip("./GUI/knob.png", 128) fontColour(255, 255, 255, 0) outlineColour(58, 58, 58, 0) textColour(255, 255, 255, 255) trackerInsideRadius(0.67)
    rslider bounds(240, 9, 80, 80) channel("FLANGERfback") range(0, 1, 0, 1, 0.0001) $sliderstyle valueTextBox(1) popupPrefix("Feedback: ") text("FBack") filmstrip("./GUI/knob.png", 128) fontColour(255, 255, 255, 0) outlineColour(58, 58, 58, 0) textColour(255, 255, 255, 255) trackerInsideRadius(0.67)
    button bounds(300, 9,32, 62), channel("flangerON"), text("", ""), alpha(1) increment(1) value(0) imgFile("on", "./GUI/raveonoff1.png") , imgFile("off", "./GUI/raveonoff.png")

}

;phaser
groupbox bounds(30, 270, 360, 90) channel("phaser")  lineThickness(0), popup(0) outlineThickness(0)colour(0, 0, 0, 0){
    image bounds (0,0,360,80) channel("grigliaFlang") file("./GUI/griglia2.png") alpha(1)

    rslider bounds(60, 9, 80, 80) channel("PHASERrate") range(0, 1, 0, 1, 0.0001) $sliderstyle valueTextBox(1) popupPrefix("Rate: ") text("Rate") filmstrip("./GUI/knob.png", 128) fontColour(255, 255, 255, 0) outlineColour(58, 58, 58, 0) textColour(255, 255, 255, 255) trackerInsideRadius(0.67)
    rslider bounds(120, 9, 80, 80) channel("PHASERdepth") range(0, 1, 0, 1, 0.0001) $sliderstyle valueTextBox(1) popupPrefix("Depth: ") text("Depth") filmstrip("./GUI/knob.png", 128) fontColour(255, 255, 255, 0) outlineColour(58, 58, 58, 0) textColour(255, 255, 255, 255) trackerInsideRadius(0.67)
    rslider bounds(180, 9, 80, 80) channel("PHASERfreq") range(6, 11, 6, 1, 0.0001) $sliderstyle valueTextBox(1) popupPrefix("Frequency: ") text("Freq") filmstrip("./GUI/knob.png", 128) fontColour(255, 255, 255, 0) outlineColour(58, 58, 58, 0) textColour(255, 255, 255, 255) trackerInsideRadius(0.67)
    rslider bounds(240, 9, 80, 80) channel("PHASERfback") range(0, 1, 0, 1, 0.0001) $sliderstyle valueTextBox(1) popupPrefix("Feedback: ") text("FBack") filmstrip("./GUI/knob.png", 128) fontColour(255, 255, 255, 0) outlineColour(58, 58, 58, 0) textColour(255, 255, 255, 255) trackerInsideRadius(0.67)
    button bounds(300, 9,32, 62), channel("phaserON"), text("", ""), alpha(1) increment(1) value(0) imgFile("on", "./GUI/raveonoff1.png") , imgFile("off", "./GUI/raveonoff.png")

}



;delay
groupbox bounds(30, 350, 360, 100) channel("delay")  lineThickness(0), popup(0) outlineThickness(0)colour(0, 0, 0, 0){
    image bounds (0,0,360,80) channel("grigliaDel") file("./GUI/griglia2.png") alpha(1)

    rslider bounds(90, 9, 80, 80) channel("DELAYtime") range(0, 1, 0, 1, 0.0001) $sliderstyle valueTextBox(1) popupPrefix("Time: ") popupPostfix(" sec")text("Time") filmstrip("./GUI/knob.png", 128) fontColour(255, 255, 255, 0) outlineColour(58, 58, 58, 0) textColour(255, 255, 255, 255) trackerInsideRadius(0.67)
    rslider bounds(160, 9, 80, 80) channel("DELAYfback") range(0, 1, 0, 1, 0.0001) $sliderstyle valueTextBox(1) popupPrefix("Feedback: ") text("Feedback") filmstrip("./GUI/knob.png", 128) fontColour(255, 255, 255, 0) outlineColour(58, 58, 58, 0) textColour(255, 255, 255, 255) trackerInsideRadius(0.67)
    rslider bounds(230, 9, 80, 80) channel("DELAYtone") range(0, 1, 1, 1, 0.0001) $sliderstyle valueTextBox(1) popupPrefix("Tone: ") text("Tone") filmstrip("./GUI/knob.png", 128) fontColour(255, 255, 255, 0) outlineColour(58, 58, 58, 0) textColour(255, 255, 255, 255) trackerInsideRadius(0.67)
    button bounds(300, 9,32, 62), channel("delayON"), text("", ""), alpha(1) increment(1) value(0) imgFile("on", "./GUI/raveonoff1.png") , imgFile("off", "./GUI/raveonoff.png")

}

;reverb
groupbox bounds(30, 430, 360, 100) channel("reverb")  lineThickness(0), popup(0) outlineThickness(0)colour(0, 0, 0, 0){
    image bounds (0,0,360,80) channel("grigliaDel") file("./GUI/griglia2.png") alpha(1)

    rslider bounds(90, 9, 80, 80) channel("REVtype") range(0, 1, 0, 1, 1) $sliderstyle valueTextBox(1) popupPrefix("Type: ") popupPostfix(" sec")text("Time") filmstrip("./GUI/knob.png", 128) fontColour(255, 255, 255, 0) outlineColour(58, 58, 58, 0) textColour(255, 255, 255, 255) trackerInsideRadius(0.67)
    rslider bounds(160, 9, 80, 80 channel("REVroom") range(0.001, 1, 0.032, 1, 0.0001) $sliderstyle valueTextBox(1) popupPrefix("Room: ") text("Room") filmstrip("./GUI/knob.png", 128) fontColour(255, 255, 255, 0) outlineColour(58, 58, 58, 0) textColour(255, 255, 255, 255) trackerInsideRadius(0.67)
    rslider bounds(230, 9, 80, 80) channel("REVdamp") range(0.001, 1, 1, 1, 0.0001) $sliderstyle valueTextBox(1) popupPrefix("Damp: ") text("Damp") filmstrip("./GUI/knob.png", 128) fontColour(255, 255, 255, 0) outlineColour(58, 58, 58, 0) textColour(255, 255, 255, 255) trackerInsideRadius(0.67)
    button bounds(300, 9,32, 62), channel("reverbON"), text("", ""), alpha(1) increment(1) value(0) imgFile("on", "./GUI/raveonoff1.png") , imgFile("off", "./GUI/raveonoff.png")

}

}
image bounds (55,80,120,470) channel("fxlabel") file("./GUI/FX.png") alpha(0.9)
     
;SubOSC
groupbox bounds(960, 360, 500, 360) channel("sub") lineThickness(0), popup(0) visible(1) outlineThickness(0)colour(0, 0, 0,0){
image bounds (70,40,230,90) channel("griglia5") file("./GUI/griglia2.png") alpha(1)

button bounds(232, 60, 50, 50), channel("SubONOFF1"), text("OFF", "ON"), colour:1(255, 0, 0, 255), alpha(0.8),imgFile("on", "./GUI/toggleON.png") , imgFile("off", "./GUI/toggleOFF.png")
rslider bounds(66, 50, 90, 90) range(0, 3, 1, 1, 1) channel("SubWave1") $sliderstyle popupPrefix("Sub Wave: ") text("Sub Wave") valueTextBox(1) filmstrip("./GUI/knob.png", 128) fontColour(255, 255, 255, 0) outlineColour(58, 58, 58, 0) textColour(255, 255, 255, 255) trackerInsideRadius(0.67)
rslider bounds(143, 50, 90, 90) range(0, 1, 0.2, 1, 0.001) channel("SubAmp1") $sliderstyle popupPrefix("Sub Gain: ") text("Sub Gain") valueTextBox(1) filmstrip("./GUI/knob.png", 128) fontColour(255, 255, 255, 0) outlineColour(58, 58, 58, 0) textColour(255, 255, 255, 255) trackerInsideRadius(0.67)
}

; Noise
groupbox bounds(830, 360, 500, 360) channel("noise") lineThickness(0), popup(0) visible(1) outlineThickness(0)colour(0, 0, 0,0){
image bounds (20,40,160,90) channel("griglia6") file("./GUI/griglia2.png") alpha(1)

button bounds(110, 60, 50, 50), channel("noiseON"), text("OFF", "ON"), colour:1(255, 0, 0, 255), alpha(0.8),imgFile("on", "./GUI/toggleON.png") , imgFile("off", "./GUI/toggleOFF.png")
rslider bounds(20, 50, 90, 90) range(0, 1, 0.2, 1, 0.001) channel("noiseVOL") $sliderstyle popupPrefix("Noise Gain: ") text("Noise Gain")  filmstrip("./GUI/knob.png", 128) valueTextBox(1) fontColour(255, 255, 255, 0) outlineColour(58, 58, 58, 0) textColour(255, 255, 255, 255) trackerInsideRadius(0.67)
}
;--------------  ADSR----------------------------------------------------------------------------------------------------------------------------------------------------------------

groupbox bounds(820, 460, 400, 360) channel("adsr") lineThickness(0), popup(0) visible(1) outlineThickness(0)colour(0, 0, 0,0){
image bounds (30,40,300,90) channel("griglia4") file("./GUI/griglia2.png") alpha(1)

rslider bounds(26, 50, 90,90) channel("Attack") range(0.001, 4, 0.011, 1, 0.0001) $sliderstyle  popupPrefix("Attack: ") valueTextBox(1) popupPostfix(" sec") text("Attack") filmstrip("./GUI/knob.png", 128) fontColour(255, 255, 255, 0) outlineColour(58, 58, 58, 0) textColour(255, 255, 255, 255) trackerInsideRadius(0.67)
rslider bounds(96, 50, 90,90) channel("Decay") range(0.001, 4, 0.032, 1, 0.0001) $sliderstyle  popupPrefix("Release: ") valueTextBox(1) popupPostfix(" sec") text("Release") filmstrip("./GUI/knob.png", 128) fontColour(255, 255, 255, 0) outlineColour(58, 58, 58, 0) textColour(255, 255, 255, 255) trackerInsideRadius(0.67)
rslider bounds(166, 50, 90,90) channel("Sustain") range(0.001, 1, 1, 1, 0.0001) $sliderstyle  popupPrefix("Sustain: ") valueTextBox(1) text("Sustain") filmstrip("./GUI/knob.png", 128) fontColour(255, 255, 255, 0) outlineColour(58, 58, 58, 0) textColour(255, 255, 255, 255) trackerInsideRadius(0.67)
rslider bounds(236, 50, 90,90) channel("Glide") range(0, 2000, 3, 0.4, 0.01) $sliderstyle  popupPrefix("Portamento:")  valueTextBox(1) popupPostfix(" msec") text("Portamento") filmstrip("./GUI/knob.png", 128) fontColour(255, 255, 255, 0) outlineColour(58, 58, 58, 0) textColour(255, 255, 255, 255) trackerInsideRadius(0.67)

}
;rslider bounds(1170, 236, 90, 90) channel("env1r") range(0.01, 2, 0.4, 1, 0.001) $sliderstyle valueTextBox(0) popupPrefix("Release") text("Release") filmstrip("./GUI/knob.png", 128) fontColour(255, 255, 255, 0) outlineColour(58, 58, 58, 0) textColour(255, 255, 255, 255) trackerInsideRadius(0.67)
rslider bounds(1255, 2, 30,30) channel("MAINVOLUME") range(0.001, 1, 1, 1, 0.0001)  valueTextBox(0) popupPrefix("Out Volume ") trackerColour(255,255,255,255)
groupbox bounds(350,100,600,400) channel("about") colour("0,0,0,0")visible(0)  {
label bounds(0,0,600,400) channel("about") colour("black")alpha (0.65) text("")

label bounds(0,220,600,14) channel("scritta") colour("0,0,0,0") fontColour("255,255,255,255") text("KlownWave is a DIY Wavetable Synth developed in CSound, is open source and hackable")
label bounds(0,250,600,14) channel("scritta3") colour("0,0,0,0") fontColour("255,255,255,255") text("Thanks to the collaboration with the Bitnet01 collective")
label bounds(0,270,600,14) channel("scritta3") colour("0,0,0,0") fontColour("255,255,255,255") text("we have been able to develop our virtual synthesizer with our style and sound timbre")

image bounds (140,40,150,150) channel("logokk") file("./GUI/logokk.png") alpha(1)
image bounds (300,40,150,150) channel("logo_bitnet") file("./GUI/logo_bitnet.png") alpha(1)


image bounds (200,310,180,50) channel("kkso") file("./GUI/kksound.png") alpha(0.9)

}

button bounds(1140, 6, 105, 20), channel("info"),range(1) text("About", "About"),   colour:1(255, 0, 0, 255), alpha(0.8), , increment(1) 

</Cabbage>
<CsoundSynthesizer>

<CsOptions>
-n -d -+rtmidi=NULL -M0 -m0d --midi-key-cps=4 --midi-velocity-amp=5 --displays ;--limiter
</CsOptions>
<CsInstruments>
; Initialize the global variables. 
nchnls		= 	2
0dbfs		=	1
;ksmps = 16

#include "./UDOs/MainOSC.udo"    ;UDO Oscillatore
#include "./UDOs/fastLFO.udo"    ;UDO LFO
#include "./UDOs/Distortion.udo" ; UDO Distortion
#include "./UDOs/StChorus.udo" ;UDO Chorus
#include "./UDOs/Flanger.udo" ; UDO Flanger
#include "./UDOs/Phaser.udo" ; UDO Phaser
#include "./UDOs/Reverb.udo" ; UDO Reverb
#include "./UDOs/AnalogDelay.udo" ; UDO AnalogDelay


#define MAX_FREQ #20000#
#define MULT_TRK1 #1.019440643702146#  ; 2^(1/36) : key track coefficient for SW1 On / SW2 Off  (1 octave/36 half-steps)


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
gimorph1 ftgen 11111, 0, 16, -2, 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16
gimorph2 ftgen 22222, 0, 16, -2, 17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32
gimorph3 ftgen 33333, 0, 16, -2, 33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48
gimorph4 ftgen 44444, 0, 16, -2, 49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64
gimorph5 ftgen 55555, 0, 16, -2, 65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80
gimorph6 ftgen 66666, 0, 16, -2, 81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96

gimorph7 ftgen 77777, 0, 16, -2, 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16
gimorph8 ftgen 88888, 0, 16, -2, 17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32
gimorph9 ftgen 99999, 0, 16, -2, 33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48
gimorph10 ftgen 111111, 0, 16, -2, 49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64
gimorph11 ftgen 222222, 0, 16, -2, 65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80
gimorph12 ftgen 333333, 0, 16, -2, 81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96


;gidum1 ftgen 1111, 0, 16384, 10, 1;------------------------Tabella dummy Analog Waves
gidum1 ftgen 1111, 0, 4096, 10, 1 ;------------------------Tabella dummy Juno
gidum2 ftgen 2222, 0, 4096, 10, 1 ;------------------------Tabella dummy Harmonics
gidum3 ftgen 3333, 0, 4096, 10, 1 ;------------------------Tabella dummy Acid
gidum4 ftgen 4444, 0, 4096, 10, 1 ;------------------------Tabella dummy BasicMg
gidum5 ftgen 5555, 0, 4096, 10, 1 ;------------------------Tabella dummy Crest
gidum6 ftgen 6666, 0, 4096, 10, 1 ;------------------------Tabella dummy Distech

gidum7 ftgen 7777, 0, 4096, 10, 1 ;------------------------Tabella dummy Juno
gidum8 ftgen 8888, 0, 4096, 10, 1 ;------------------------Tabella dummy Harmonics
gidum9 ftgen 9999, 0, 4096, 10, 1 ;------------------------Tabella dummy Acid
gidum10 ftgen 101111, 0, 4096, 10, 1 ;------------------------Tabella dummy BasicMg
gidum11 ftgen 112222, 0, 4096, 10, 1 ;------------------------Tabella dummy Crest
gidum13 ftgen 1234567, 0, 4096, 10, 1 ;------------------------Tabella dummy Distech


;(NB: la lunghezzza in samples della dummy deve essere uguale a quella delle waves)


;====================  
;Analog-inspred WAVES
;==================== 


;Sawtooth up and down
;giwave1 ftgen 1, 0, 16384,7,0,16384,1,0,-1,16384,0	

;Ramp 
;giwave2 ftgen 1, 0, 16384, 7 ,0,8192,1,0,-1,8192,0  

;Sinusoide
;giwave3 ftgen 2, 0, 16384, 10, 1  

;Square (slightly asym)                    
;giwave4 ftgen 3, 0, 16384,  7,1,7936,1,0,-1,8448,-1

;Square
;giwave5 ftgen 4, 0, 16384,  7,0,0,1,8192,1,0,-1,8192, -1,  0,  0  

;PW1
;giwave6 ftgen 5, 0, 16384,  7,1,4772,1,0,-1,11612,-1

;PW2								               
;giwave7 ftgen 6, 0, 16384,  7,1,2810,1,0,-1,13574,-1                             

;Pulse
;giwave8 ftgen 7, 0, 16384,  7,0,0,1,1024,1,0,-1, 15360,   -1,  0,0     	
	                      
;Triangle
;giwave9 ftgen 8, 0, 16384, 7,0,4096,1,8192,-1,4096,0                              

;Slightly asymmetric triangle
;giwave10 ftgen 9, 0, 16384, 7,0, 3968,1,8320,-1,4096,0                             

;Peaked Triangle
;giwave11 ftgen 10,  0, 16384, 7,0.65,8192 ,   -0.5 ,   8182 ,   0.35	



;=============                            
;Sampled WAVES
;=============  

;Juno1
giwave1 ftgen 1, 0, 4096, 1, "./Waves/Juno/1.wav" ,0, 0, 0

;Juno2
giwave2 ftgen 2, 0, 4096, 1, "./Waves/Juno/2.wav" ,0, 0, 0

;Juno3
giwave3 ftgen 3, 0, 4096, 1, "./Waves/Juno/3.wav" ,0, 0, 0

;Juno4
giwave4 ftgen 4, 0, 4096, 1, "./Waves/Juno/4.wav" ,0, 0, 0

;Juno5
giwave5 ftgen 5, 0, 4096, 1, "./Waves/Juno/5.wav" ,0, 0, 0

;Juno6
giwave6 ftgen 6, 0, 4096, 1, "./Waves/Juno/6.wav" ,0, 0, 0

;Juno7
giwave7 ftgen 7, 0, 4096, 1, "./Waves/Juno/7.wav" ,0, 0, 0

;Juno8
giwave8 ftgen 8, 0, 4096, 1, "./Waves/Juno/8.wav" ,0, 0, 0

;Juno9
giwave9 ftgen 9, 0, 4096, 1, "./Waves/Juno/9.wav" ,0, 0, 0

;Juno10
giwave10 ftgen 10, 0, 4096, 1, "./Waves/Juno/10.wav" ,0, 0, 0

;Juno11
giwave11 ftgen 11, 0, 4096, 1, "./Waves/Juno/11.wav" ,0, 0, 0

;Juno12
giwave12 ftgen 12, 0, 4096, 1, "./Waves/Juno/12.wav" ,0, 0, 0

;Juno13
giwave13 ftgen 13, 0, 4096, 1, "./Waves/Juno/13.wav" ,0, 0, 0

;Juno14
giwave14 ftgen 14, 0, 4096, 1, "./Waves/Juno/14.wav" ,0, 0, 0

;Juno15
giwave15 ftgen 15, 0, 4096, 1, "./Waves/Juno/15.wav" ,0, 0, 0

;Juno16
giwave16 ftgen 16, 0, 4096, 1, "./Waves/Juno/16.wav" ,0, 0, 0

;------------------------------------------------------------------

;Harmonics1
giwave17 ftgen 17, 0, 4096, 1, "./Waves/Harmonics/1.wav" ,0, 0, 0

;Harmonics2
giwave18 ftgen 18, 0, 4096, 1, "./Waves/Harmonics/2.wav" ,0, 0, 0

;Harmonics3
giwave19 ftgen 19, 0, 4096, 1, "./Waves/Harmonics/3.wav" ,0, 0, 0

;Harmonics4
giwave20 ftgen 20, 0, 4096, 1, "./Waves/Harmonics/4.wav" ,0, 0, 0

;Harmonics5
giwave21 ftgen 21, 0, 4096, 1, "./Waves/Harmonics/5.wav" ,0, 0, 0

;Harmonics6
giwave22 ftgen 22, 0, 4096, 1, "./Waves/Harmonics/6.wav" ,0, 0, 0

;Harmonic7
giwave23 ftgen 23, 0, 4096, 1, "./Waves/Harmonics/7.wav" ,0, 0, 0

;Harmonics8
giwave24 ftgen 24, 0, 4096, 1, "./Waves/Harmonics/8.wav" ,0, 0, 0

;Harmonics9
giwave25 ftgen 25, 0, 4096, 1, "./Waves/Harmonics/9.wav" ,0, 0, 0

;Harmonics10
giwave26 ftgen 26, 0, 4096, 1, "./Waves/Harmonics/10.wav" ,0, 0, 0

;Harmonics11
giwave27 ftgen 27, 0, 4096, 1, "./Waves/Harmonics/11.wav" ,0, 0, 0

;Harmonics12
giwave28 ftgen 28, 0, 4096, 1, "./Waves/Harmonics/12.wav" ,0, 0, 0

;Harmonics13
giwave29 ftgen 29, 0, 4096, 1, "./Waves/Harmonics/13.wav" ,0, 0, 0

;Harmonics14
giwave30 ftgen 30, 0, 4096, 1, "./Waves/Harmonics/14.wav" ,0, 0, 0

;Harmonics15
giwave31 ftgen 31, 0, 4096, 1, "./Waves/Harmonics/15.wav" ,0, 0, 0

;Harmonics16
giwave32 ftgen 32, 0, 4096, 1, "./Waves/Harmonics/16.wav" ,0, 0, 0


;------------------------------------------------------------------

;Acid1
giwave33 ftgen 33, 0, 4096, 1, "./Waves/Acid/1.wav" ,0, 0, 0

;Acid2
giwave34 ftgen 34, 0, 4096, 1, "./Waves/Acid/2.wav" ,0, 0, 0

;Acid3
giwave35 ftgen 35, 0, 4096, 1, "./Waves/Acid/3.wav" ,0, 0, 0

;Acid4
giwave36 ftgen 36, 0, 4096, 1, "./Waves/Acid/4.wav" ,0, 0, 0

;Acid5
giwave37 ftgen 37, 0, 4096, 1, "./Waves/Acid/5.wav" ,0, 0, 0

;Acid6
giwave38 ftgen 38, 0, 4096, 1, "./Waves/Acid/6.wav" ,0, 0, 0

;Acid7
giwave39 ftgen 39, 0, 4096, 1, "./Waves/Acid/7.wav" ,0, 0, 0

;Acid8
giwave40 ftgen 40, 0, 4096, 1, "./Waves/Acid/8.wav" ,0, 0, 0

;Acid9
giwave41 ftgen 41, 0, 4096, 1, "./Waves/Acid/9.wav" ,0, 0, 0

;Acid10
giwave42 ftgen 42, 0, 4096, 1, "./Waves/Acid/10.wav" ,0, 0, 0

;Acid11
giwave43 ftgen 43, 0, 4096, 1, "./Waves/Acid/11.wav" ,0, 0, 0

;Acid12
giwave44 ftgen 44, 0, 4096, 1, "./Waves/Acid/12.wav" ,0, 0, 0

;Acid13
giwave45 ftgen 45, 0, 4096, 1, "./Waves/Acid/13.wav" ,0, 0, 0

;Acid14
giwave46 ftgen 46, 0, 4096, 1, "./Waves/Acid/14.wav" ,0, 0, 0

;Acid15
giwave47 ftgen 47, 0, 4096, 1, "./Waves/Acid/15.wav" ,0, 0, 0

;Acid16
giwave48 ftgen 48, 0, 4096, 1, "./Waves/Acid/16.wav" ,0, 0, 0


;------------------------------------------------------------------

;BasicMg1
giwave49 ftgen 49, 0, 4096, 1, "./Waves/BasicMg/1.wav" ,0, 0, 0

;BasicMg2
giwave50 ftgen 50, 0, 4096, 1, "./Waves/BasicMg/2.wav" ,0, 0, 0

;BasicMg3
giwave51 ftgen 51, 0, 4096, 1, "./Waves/BasicMg/3.wav" ,0, 0, 0

;BasicMg4
giwave52 ftgen 52, 0, 4096, 1, "./Waves/BasicMg/4.wav" ,0, 0, 0

;BasicMg5
giwave53 ftgen 53, 0, 4096, 1, "./Waves/BasicMg/5.wav" ,0, 0, 0

;BasicMg6
giwave54 ftgen 54, 0, 4096, 1, "./Waves/BasicMg/6.wav" ,0, 0, 0

;BasicMg7
giwave55 ftgen 55, 0, 4096, 1, "./Waves/BasicMg/7.wav" ,0, 0, 0

;BasicMg8
giwave56 ftgen 56, 0, 4096, 1, "./Waves/BasicMg/8.wav" ,0, 0, 0

;BasicMg9
giwave57 ftgen 57, 0, 4096, 1, "./Waves/BasicMg/9.wav" ,0, 0, 0

;BasicMg10
giwave58 ftgen 58, 0, 4096, 1, "./Waves/BasicMg/10.wav" ,0, 0, 0

;BasicMg11
giwave59 ftgen 59, 0, 4096, 1, "./Waves/BasicMg/11.wav" ,0, 0, 0

;BasicMg12
giwave60 ftgen 60, 0, 4096, 1, "./Waves/BasicMg/12.wav" ,0, 0, 0

;BasicMg13
giwave61 ftgen 61, 0, 4096, 1, "./Waves/BasicMg/13.wav" ,0, 0, 0

;BasicMg14
giwave62 ftgen 62, 0, 4096, 1, "./Waves/BasicMg/14.wav" ,0, 0, 0

;BasicMg15
giwave63 ftgen 63, 0, 4096, 1, "./Waves/BasicMg/15.wav" ,0, 0, 0

;BasicMg16
giwave64 ftgen 64, 0, 4096, 1, "./Waves/BasicMg/16.wav" ,0, 0, 0


;------------------------------------------------------------------

;Crest1
giwave65 ftgen 65, 0, 4096, 1, "./Waves/Crest/1.wav" ,0, 0, 0

;Crest2
giwave66 ftgen 66, 0, 4096, 1, "./Waves/Crest/2.wav" ,0, 0, 0

;Crest3
giwave67 ftgen 67, 0, 4096, 1, "./Waves/Crest/3.wav" ,0, 0, 0

;Crest4
giwave68 ftgen 68, 0, 4096, 1, "./Waves/Crest/4.wav" ,0, 0, 0

;Crest5
giwave69 ftgen 69, 0, 4096, 1, "./Waves/Crest/5.wav" ,0, 0, 0

;Crest6
giwave70 ftgen 70, 0, 4096, 1, "./Waves/Crest/6.wav" ,0, 0, 0

;Crest7
giwave71 ftgen 71, 0, 4096, 1, "./Waves/Crest/7.wav" ,0, 0, 0

;Crest8
giwave72 ftgen 72, 0, 4096, 1, "./Waves/Crest/8.wav" ,0, 0, 0

;Crest9
giwave73 ftgen 73, 0, 4096, 1, "./Waves/Crest/9.wav" ,0, 0, 0

;Crest10
giwave74 ftgen 74, 0, 4096, 1, "./Waves/Crest/10.wav" ,0, 0, 0

;Crest11
giwave75 ftgen 75, 0, 4096, 1, "./Waves/Crest/11.wav" ,0, 0, 0

;Crest12
giwave76 ftgen 76, 0, 4096, 1, "./Waves/Crest/12.wav" ,0, 0, 0

;Crest13
giwave77 ftgen 77, 0, 4096, 1, "./Waves/Crest/13.wav" ,0, 0, 0

;Crest14
giwave78 ftgen 78, 0, 4096, 1, "./Waves/Crest/14.wav" ,0, 0, 0

;Crest15
giwave79 ftgen 79, 0, 4096, 1, "./Waves/Crest/15.wav" ,0, 0, 0

;Crest16
giwave80 ftgen 80, 0, 4096, 1, "./Waves/Crest/16.wav" ,0, 0, 0


;------------------------------------------------------------------

;Distech1
giwave81 ftgen 81, 0, 4096, 1, "./Waves/Distech/1.wav" ,0, 0, 0

;Distech2
giwave82 ftgen 82, 0, 4096, 1, "./Waves/Distech/2.wav" ,0, 0, 0

;Distech3
giwave83 ftgen 83, 0, 4096, 1, "./Waves/Distech/3.wav" ,0, 0, 0

;Distech4
giwave84 ftgen 84, 0, 4096, 1, "./Waves/Distech/4.wav" ,0, 0, 0

;Distech5
giwave85 ftgen 85, 0, 4096, 1, "./Waves/Distech/5.wav" ,0, 0, 0

;Distech6
giwave86 ftgen 86, 0, 4096, 1, "./Waves/Distech/6.wav" ,0, 0, 0

;Distech7
giwave87 ftgen 87, 0, 4096, 1, "./Waves/Distech/7.wav" ,0, 0, 0

;Distech8
giwave88 ftgen 88, 0, 4096, 1, "./Waves/Distech/8.wav" ,0, 0, 0

;Distech9
giwave89 ftgen 89, 0, 4096, 1, "./Waves/Distech/9.wav" ,0, 0, 0

;Distech10
giwave90 ftgen 90, 0, 4096, 1, "./Waves/Distech/10.wav" ,0, 0, 0

;Distech11
giwave91 ftgen 91, 0, 4096, 1, "./Waves/Distech/11.wav" ,0, 0, 0

;Distech12
giwave92 ftgen 92, 0, 4096, 1, "./Waves/Distech/12.wav" ,0, 0, 0

;Distech13
giwave93 ftgen 93, 0, 4096, 1, "./Waves/Distech/13.wav" ,0, 0, 0

;Distech14
giwave94 ftgen 94, 0, 4096, 1, "./Waves/Distech/14.wav" ,0, 0, 0

;Distech15
giwave95 ftgen 95, 0, 4096, 1, "./Waves/Distech/15.wav" ,0, 0, 0

;Distech16
giwave96 ftgen 96, 0, 4096, 1, "./Waves/Distech/16.wav" ,0, 0, 0
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
        schedule 7,0,-1
endin


instr 100; Inizializzazione widget
gkFX cabbageGetValue "FX"
gkinfo cabbageGetValue "info"


if gkinfo == 1 then
cabbageSet 1, "about", "visible(1)";, gkinfo
else
cabbageSet 1, "about", "visible(0)"
endif

if gkFX == 1 then
cabbageSet gkFX, "effetti", "visible(1)"
cabbageSet gkFX, "LFOs", "visible(1)"
cabbageSet gkFX, "matrix", "visible(1)"
cabbageSet gkFX, "fxlabel","visible(1)"

cabbageSet gkFX, "tubi", "visible(0)"
cabbageSet gkFX, "OSC1", "visible(0)"
cabbageSet gkFX, "OSC2", "visible(0)"
cabbageSet gkFX, "sub", "visible(0)"
cabbageSet gkFX, "noise", "visible(0)"
cabbageSet gkFX, "adsr", "visible(0)"
cabbageSet gkFX, "filtergroup", "visible(0)"


else 
cabbageSet 1, "effetti", "visible(0), popup(0)"
cabbageSet 1, "LFOs", "visible(0)"
cabbageSet 1, "matrix", "visible(0)"
cabbageSet 1, "fxlabel","visible(0)"

cabbageSet 1, "tubi", "visible(1)"
cabbageSet 1, "OSC1", "visible(1)"
cabbageSet 1, "OSC2", "visible(1)"
cabbageSet 1, "sub", "visible(1)"
cabbageSet 1, "noise", "visible(1)"
cabbageSet 1, "adsr", "visible(1)"
cabbageSet 1, "filtergroup", "visible(1)"

endif

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

ktrig metro 30 ;							;Reduce widget reading rate to 30/sec
if ktrig == 1 then

gkdistON cabbageGetValue "distortON"
gkchorusON cabbageGetValue "chorusON"
gkflangerON cabbageGetValue "flangerON"
gkphaserON cabbageGetValue "phaserON"
gkdelayON cabbageGetValue "delayON"
gkreverbON cabbageGetValue "reverbON"

gkFlangerRate cabbageGetValue "FLANGERrate"
gkFlangerDepth cabbageGetValue "FLANGERdepth"
gkFlangerDelay cabbageGetValue "FLANGERdelay"
gkFlangerFback cabbageGetValue "FLANGERfback"

gkPhaserRate cabbageGetValue "PHASERrate"
gkPhaserDepth cabbageGetValue "PHASERdepth"
gkPhaserFreq cabbageGetValue "PHASERfreq"
gkPhaserFback cabbageGetValue "PHASERfback"

gkReverbRoom cabbageGetValue "REVroom"
gkReverbDamp cabbageGetValue "REVdamp"
gkReverbType cabbageGetValue "REVtype"

gkdrywet cabbageGetValue "osc1osc2"

gkCHORUS_mix cabbageGetValue "CHORUSsend"
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




;====== MODIFIERS ================
;Loudness Contour (VCA or amplitude envelope param.)
gkAmpAttTim		cabbageGetValue "Attack"		;Get Loudness Envelope Attack Time in [secs]
gkAmpRelTim		cabbageGetValue "Decay"		;Get Loudness Envelope Decay Time in [secs]
gkAmpLev		cabbageGetValue "Sustain"		;Get Loudness Envelope Sustain Lev
	
		
;Filter Contour (VCF envelope param.)
gkFiltAttTim	cabbageGetValue	"FilterAttack"	;Get Filter Envelope Attack Time in [secs]
gkFiltRelTim	cabbageGetValue	"FilterDecay"	;Get Filter Envelope Decay Time in [secs]
gkFiltLev		cabbageGetValue	"FilterEmphasis"		;Get Filter Envelope Sustain Level

gknoise cabbageGetValue "noiseON"
gknoiseVol cabbageGetValue "noiseVOL"
;=======  MIDI KEY VELOCITY =======

gkVEL_TO_OSC1		cabbageGetValue  "VEL_TO_OSC1"		;Get checkbox (as a switch/led) for assign key vel. to OSC1
gkVEL_TO_OSC2		cabbageGetValue  "VEL_TO_OSC2"		;Get checkbox (as a switch/led) for assign key vel. to OSC2
gkVEL_TO_VCF		cabbageGetValue  "VEL_TO_VCF"		;Get checkbox (as a switch/led) for assign key vel. to VCF

endif			;End of widget scan at low rate

;-------------------------------------------------

gkFBASE_VCF_0	cabbageGetValue	"FilterCutoff" 	;Get the base CUT-OFF freq. [0 = 20hz : 0.99 = 20Khz]
gkRES_VCF		cabbageGetValue	"FilterResonance"		;Get emphasis (resonance) [0 : 0.99]
gkRES_VCF  		port gkRES_VCF,0.01

gkAMOUNT_VCF	cabbageGetValue	"FilterEmphasis"	;Get amount of filter contour
gkAMOUNT_VCF    port gkAMOUNT_VCF, 0.08
gkmenu cabbageGetValue "filtmenu" ; menù scelta del filtro
gkFiltbypass cabbageGetValue "FilterBypass"

gkMAIN_VOLUME_0	cabbageGetValue "MAINVOLUME"	;Get Main Volume
gkMAIN_VOLUME port gkMAIN_VOLUME_0,0.05	;Smooth it


gkfil tablei gkFBASE_VCF_0, giTable_FIL,1		;Map filt. frequency to non linear table
chnset gkfil, "dispVCF_CUT"
gkfil port gkfil,0.01							;Smooth control..



; Widget macro oscillatore 1

gkWave_1 ,gkWave_1_trig       cabbageGetValue "Wavetable1Morph"
gkWave_1        port gkWave_1, 0.02


gkWAVETamp_1    cabbageGetValue "Wavetable1Gain"
gkWAVETamp_1    port gkWAVETamp_1, 0.02

gkWTDetune_1    cabbageGetValue "Wavetable1Detune"
gkWTDetune_1    port gkWTDetune_1, 0.02

gkVCOamp_1      cabbageGetValue "Oscillator1Gain"
gkVCOamp_1      port gkVCOamp_1, 0.02

gkPWM_1         cabbageGetValue "Oscillator1PWM"
gkPWM_1         port gkPWM_1 , 0.02

gkVCOdetune_1   cabbageGetValue "Oscillator1Detune"
gkVCOdetune_1   port gkVCOdetune_1, 0.02

gkFMwave_1      cabbageGetValue "FMwave1"
gkFMwave_1      port gkFMwave_1 , 0.02

gkFMfactor_1    cabbageGetValue "FMmodulator1"
gkFMfactor_1    port gkFMfactor_1, 0.02

gkFMIndex_1     cabbageGetValue "FMindex1"
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

gkWave_2        cabbageGetValue "Wavetable2Morph"
gkWave_2        port gkWave_2, 0.02

gkWAVETamp_2    cabbageGetValue "Wavetable2Gain"
gkWAVETamp_2    port gkWAVETamp_2, 0.02

gkWTDetune_2    cabbageGetValue "Wavetable2Detune"
gkWTDetune_2    port gkWTDetune_2, 0.02

gkVCOamp_2      cabbageGetValue "Oscillator2Gain"
gkVCOamp_2      port gkVCOamp_2, 0.02

gkPWM_2         cabbageGetValue "Oscillator2PWM"
gkPWM_2         port gkPWM_2 , 0.02

gkVCOdetune_2   cabbageGetValue "Oscillator2Detune"
gkVCOdetune_2   port gkVCOdetune_2, 0.02

gkFMwave_2      cabbageGetValue "FMwave2"
gkFMwave_2      port gkFMwave_2 , 0.02

gkFMfactor_2    cabbageGetValue "FMmodulator2"
gkFMfactor_2    port gkFMfactor_2, 0.02

gkFMIndex_2     cabbageGetValue "FMindex2"
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

gkWaveBank2Menu cabbageGetValue "WaveBankOSC2"




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


if gkWaveBank1Menu == 1 then

    aOsc1, aSub1 MainOsc kcps, kcps+gkWTDetune_1, kcps+gkVCOdetune_1, gkWave_1, gkWAVETamp_1, 11111, 1111, gkVCOamp_1, gkPWM_1, gkFMwave_1, gkFMfactor_1, gkFMIndex_1,  1010, 1011,  gkSubAmp_1, gkSubTable_1

    tablecopy 1234, 1111

elseif gkWaveBank1Menu == 2 then

    aOsc1, aSub1 MainOsc kcps, kcps+gkWTDetune_1, kcps+gkVCOdetune_1, gkWave_1, gkWAVETamp_1, 22222, 2222, gkVCOamp_1, gkPWM_1, gkFMwave_1, gkFMfactor_1, gkFMIndex_1,  1010, 1011,  gkSubAmp_1, gkSubTable_1

    tablecopy 1234, 2222

elseif gkWaveBank1Menu == 3 then

    aOsc1, aSub1 MainOsc kcps, kcps+gkWTDetune_1, kcps+gkVCOdetune_1, gkWave_1, gkWAVETamp_1, 33333, 3333, gkVCOamp_1, gkPWM_1, gkFMwave_1, gkFMfactor_1, gkFMIndex_1,  1010, 1011,  gkSubAmp_1, gkSubTable_1

    tablecopy 1234, 3333

elseif gkWaveBank1Menu == 4 then

    aOsc1, aSub1 MainOsc kcps, kcps+gkWTDetune_1, kcps+gkVCOdetune_1, gkWave_1, gkWAVETamp_1, 44444, 4444, gkVCOamp_1, gkPWM_1, gkFMwave_1, gkFMfactor_1, gkFMIndex_1,  1010, 1011,  gkSubAmp_1, gkSubTable_1

    tablecopy 1234, 4444

elseif gkWaveBank1Menu == 5 then

    aOsc1, aSub1 MainOsc kcps, kcps+gkWTDetune_1, kcps+gkVCOdetune_1, gkWave_1, gkWAVETamp_1, 55555, 5555, gkVCOamp_1, gkPWM_1, gkFMwave_1, gkFMfactor_1, gkFMIndex_1,  1010, 1011,  gkSubAmp_1, gkSubTable_1

    tablecopy 1234, 5555
elseif gkWaveBank1Menu == 6 then

    aOsc1, aSub1 MainOsc kcps, kcps+gkWTDetune_1, kcps+gkVCOdetune_1, gkWave_1, gkWAVETamp_1, 66666, 6666, gkVCOamp_1, gkPWM_1, gkFMwave_1, gkFMfactor_1, gkFMIndex_1,  1010, 1011,  gkSubAmp_1, gkSubTable_1

    tablecopy 1234, 6666

endif


if gkWaveBank2Menu == 1 then

    aOsc2, aSub2 MainOsc kcps, kcps+gkWTDetune_2, kcps+gkVCOdetune_2, gkWave_2, gkWAVETamp_2, 77777, 7777, gkVCOamp_2, gkPWM_2, gkFMwave_2, gkFMfactor_2, gkFMIndex_2,  1012, 1013,  gkSubAmp_1, gkSubTable_1

    tablecopy 5678, 7777

elseif gkWaveBank2Menu == 2 then
    
    aOsc2, aSub2 MainOsc kcps, kcps+gkWTDetune_2, kcps+gkVCOdetune_2, gkWave_2, gkWAVETamp_2, 88888, 8888, gkVCOamp_2, gkPWM_2, gkFMwave_2, gkFMfactor_2, gkFMIndex_2,  1012, 1013,  gkSubAmp_1, gkSubTable_1
    tablecopy 5678, 8888

elseif gkWaveBank2Menu == 3 then

    aOsc2, aSub2 MainOsc kcps, kcps+gkWTDetune_2, kcps+gkVCOdetune_2, gkWave_2, gkWAVETamp_2, 99999, 9999, gkVCOamp_2, gkPWM_2, gkFMwave_2, gkFMfactor_2, gkFMIndex_2,  1012, 1013,  gkSubAmp_1, gkSubTable_1

    tablecopy 5678, 9999

elseif gkWaveBank2Menu == 4 then

    aOsc2, aSub2 MainOsc kcps, kcps+gkWTDetune_2, kcps+gkVCOdetune_2, gkWave_2, gkWAVETamp_2, 111111, 101111, gkVCOamp_2, gkPWM_2, gkFMwave_2, gkFMfactor_2, gkFMIndex_2,  1012, 1013,  gkSubAmp_1, gkSubTable_1

    tablecopy 5678, 101111

elseif gkWaveBank2Menu == 5 then

    aOsc2, aSub2 MainOsc kcps, kcps+gkWTDetune_2, kcps+gkVCOdetune_2, gkWave_2, gkWAVETamp_2, 222222, 112222, gkVCOamp_2, gkPWM_2, gkFMwave_2, gkFMfactor_2, gkFMIndex_2,  1012, 1013,  gkSubAmp_1, gkSubTable_1

    tablecopy 5678, 112222

elseif gkWaveBank2Menu == 6 then

    aOsc2, aSub2 MainOsc kcps, kcps+gkWTDetune_2, kcps+gkVCOdetune_2, gkWave_2, gkWAVETamp_2, 333333,1234567, gkVCOamp_2, gkPWM_2, gkFMwave_2, gkFMfactor_2, gkFMIndex_2,  1012, 1013,  gkSubAmp_1, gkSubTable_1

tablecopy 5678, 1234567

endif



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
	

;========= OSC1 / OSC2 =======

adrywet interp gkdrywet 

    aPreFilter sum aOsc1*adrywet, aOsc2*(1-adrywet), agauss


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

        ares diode_ladder aPreFilter, acut, gkRES_VCF*17., 1, 4 ; TB303 Filter
    elseif gkmenu == 2 then

        ares vclpf aPreFilter, k(acut), gkRES_VCF;                MOOG Ladder
    elseif gkmenu == 3 then

        abp = 0
        ahp = 0
        alp  = aPreFilter
        ares spf alp,ahp,abp,acut,(1-gkRES_VCF)*2 ;       Steiner-Parker  LowPass Filter
    elseif gkmenu == 4 then
        abp = 0
        alp = 0
        ahp  = aPreFilter
        ares spf alp,ahp,abp,acut,(1-gkRES_VCF)*2 ;       Steiner-Parker HighPass Filter
    elseif gkmenu == 5 then
        ahp = 0
        alp = 0
        abp  = aPreFilter
        ares spf alp,ahp,abp,acut,(1-gkRES_VCF)*2 ;       Steiner-Parker BandPass Filter
    elseif gkmenu == 6 then                 
        gkres limit gkRES_VCF, 0.5, 1.
        ares,alp1,abp1,abr1 svn aPreFilter, acut, gkRES_VCF , 0
       
    elseif gkmenu == 7 then                              ;Sallen-Key LowPass Filter
        
       ares skf aPreFilter, acut, gkRES_VCF*3. ,0 
    elseif gkmenu == 8 then                              ;Sallen-Key HighPass Filter
        
       ares skf aPreFilter, acut, gkRES_VCF*3. ,1 
    
    endif
else 


ares = aPreFilter

ares atone ares,16	
endif



;====== OUT SECTION ======

if gkSubONOFF_1	==1  then

  aPostFilter sum ares,  aSub1

    
 else
     
   aPostFilter =ares

endif


gilimit = ampdbfs(-6)

aoutLeft balance2 aPostFilter, (aPreFilter*0.8)
aoutRight balance2 aPostFilter, (aPreFilter*0.8)

aoutLeft dcblock aoutLeft
aoutRight dcblock aoutRight 

gaSynthClean = aoutLeft*aAmpEnv;*gilimit

endin


;====== MIXER ======
instr 30

;Distortion

if gkdistON == 1 then
    adist Distortion gaSynthClean ,gkDISTORTION_lev,gkDISTORTION_drive,gkDISTORTION_tone
     aoutDistort = adist*0.7*gilimit
else
    aoutDistort = gaSynthClean 
endif



;Chorus

if gkchorusON == 1 then
    aoutChorusL, aoutChorusR StChorus aoutDistort,aoutDistort,gkCHORUS_rate,gkCHORUS_depth,gkCHORUS_width
    aoutChorus sum aoutChorusL,aoutChorusR
   
else
    aoutChorus = aoutDistort 
endif


;Flanger
if gkflangerON == 1 then
    aoutFlanger  Flanger  aoutChorus,gkFlangerRate,gkFlangerDepth,gkFlangerDelay ,gkFlangerFback
else
    aoutFlanger = aoutChorus
    
endif    

;Phaser
if gkphaserON == 1 then
    aPhaserout Phaser aoutChorus,gkPhaserRate,gkPhaserDepth,gkPhaserFreq, gkPhaserFback 
else
    aPhaserout =aoutChorus
endif

; Analog Delay
if gkdelayON == 1 then
   
    aoutDelay1 AnalogDelay aPhaserout,1,gkDELAY_time ,gkDELAY_fback,gkDELAY_tone 
    aoutDelay sum aoutDelay1, aPhaserout
else 
    aoutDelay = aPhaserout
endif

; Reverb
if gkreverbON == 1 then
    aoutReverbL1, aoutReverbR1 Reverb aoutDelay, gkReverbRoom, gkReverbDamp, gkReverbType
    aoutReverbL sum aoutReverbL1,aoutDelay
    aoutReverbR sum aoutReverbL1,aoutDelay
else
    aoutReverbL = aoutDelay
    aoutReverbR = aoutDelay
endif
aPostFxL = aoutReverbL
aPostFxR = aoutReverbR

aPostFxL dcblock aPostFxL
aPostFxR dcblock aPostFxR

outs aPostFxL*gilimit*gkMAIN_VOL, aPostFxR*gilimit*gkMAIN_VOL
;outs aoutLeft*gilimit*gkMAIN_VOL, aoutRight*gilimit*gkMAIN_VOL
endin



;----------------------------------------------------
;Occhi reattivi quando si clicca una nota

instr 7 

kactive1	active	1
ktrig metro 20 ;							;Reduce widget reading rate to 20/sec
if ktrig == 1 then

    if kactive1 == 1 then

        cabbageSet 1,  "occhio", "alpha", 1
        cabbageSet 1,  "occhio1", "alpha", 1
    else
        cabbageSet 1,  "occhio", "alpha", 0
        cabbageSet 1,  "occhio1", "alpha", 0
    endif
endif
endin
;

instr UpdateTable   
    ktrig metro 30 ;							;Reduce widget reading rate to 30/sec
if ktrig == 1 then

    cabbageSet	"gentable1", "tableNumber", 1234	; update table display
    cabbageSet	"gentable2", "tableNumber", 5678	; update table display
   endif
endin


instr 99 ; LFO
ktrig metro 20 ;							;Reduce widget reading rate to 20/sec

if ktrig == 1 then
    klfo1type cabbageGetValue "LFO1type"
    klfo1rate cabbageGetValue"LFO1rate"
    klfo1min cabbageGetValue"LFO1min"
    klfo1max cabbageGetValue"LFO1max"

    klfo2type cabbageGetValue "LFO2type"
    klfo2rate cabbageGetValue"LFO2rate"
    klfo2min cabbageGetValue"LFO2min"
    klfo2max cabbageGetValue"LFO2max"

    klfo3type cabbageGetValue "LFO3type"
    klfo3rate cabbageGetValue"LFO3rate"
    klfo3min cabbageGetValue"LFO3min"
    klfo3max cabbageGetValue"LFO3max"

    klfo4type cabbageGetValue "LFO4type"
    klfo4rate cabbageGetValue"LFO4rate"
    klfo4min cabbageGetValue"LFO4min"
    klfo4max cabbageGetValue"LFO4max"

    klfo5type cabbageGetValue "LFO5type"
    klfo5rate cabbageGetValue"LFO5rate"
    klfo5min cabbageGetValue"LFO5min"
    klfo5max cabbageGetValue"LFO5max"

    klfo6type cabbageGetValue "LFO6type"
    klfo6rate cabbageGetValue"LFO6rate"
    klfo6min cabbageGetValue"LFO6min"
    klfo6max cabbageGetValue"LFO6max"

    klfo7type cabbageGetValue "LFO7type"
    klfo7rate cabbageGetValue"LFO7rate"
    klfo7min cabbageGetValue"LFO7min"
    klfo7max cabbageGetValue"LFO7max"

    klfo8type cabbageGetValue "LFO8type"
    klfo8rate cabbageGetValue"LFO8rate"
    klfo8min cabbageGetValue"LFO8min"
    klfo8max cabbageGetValue"LFO8max"

    kcheck1 cabbageGetValue "check1"
    kcheck2 cabbageGetValue "check2"
    kcheck3 cabbageGetValue "check3"
    kcheck4 cabbageGetValue "check4"
    kcheck5 cabbageGetValue "check5"
    kcheck6 cabbageGetValue "check6"
    kcheck7 cabbageGetValue "check7"
    kcheck8 cabbageGetValue "check8"
    kcheck9 cabbageGetValue "check9"

    kcheck10 cabbageGetValue "check10"
    kcheck11 cabbageGetValue "check11"
    kcheck12 cabbageGetValue "check12"
    kcheck13 cabbageGetValue "check13"
    kcheck14 cabbageGetValue "check14"
    kcheck15 cabbageGetValue "check15"
    kcheck16 cabbageGetValue "check16"
    kcheck17 cabbageGetValue "check17"
    kcheck18 cabbageGetValue "check18"

    kcheck19 cabbageGetValue "check19"
    kcheck20 cabbageGetValue "check20"
    kcheck21 cabbageGetValue "check21"
    kcheck22 cabbageGetValue "check22"
    kcheck23 cabbageGetValue "check23"
    kcheck24 cabbageGetValue "check24"
    kcheck25 cabbageGetValue "check25"
    kcheck26 cabbageGetValue "check26"
    kcheck27 cabbageGetValue "check27"

    kcheck28 cabbageGetValue "check28"
    kcheck29 cabbageGetValue "check29"
    kcheck30 cabbageGetValue "check30"
    kcheck31 cabbageGetValue "check31"
    kcheck32 cabbageGetValue "check32"
    kcheck33 cabbageGetValue "check33"
    kcheck34 cabbageGetValue "check34"
    kcheck35 cabbageGetValue "check35"
    kcheck36 cabbageGetValue "check36"

    kcheck37 cabbageGetValue "check37"
    kcheck38 cabbageGetValue "check38"
    kcheck39 cabbageGetValue "check39"
    kcheck40 cabbageGetValue "check40"
    kcheck41 cabbageGetValue "check41"
    kcheck42 cabbageGetValue "check42"
    kcheck43 cabbageGetValue "check43"
    kcheck44 cabbageGetValue "check44"
    kcheck45 cabbageGetValue "check45"

    kcheck46 cabbageGetValue "check46"
    kcheck47 cabbageGetValue "check47"
    kcheck48 cabbageGetValue "check48"
    kcheck49 cabbageGetValue "check49"
    kcheck50 cabbageGetValue "check50"
    kcheck51 cabbageGetValue "check51"
    kcheck52 cabbageGetValue "check52"
    kcheck53 cabbageGetValue "check53"
    kcheck54 cabbageGetValue "check54"

    kcheck55 cabbageGetValue "check55"
    kcheck56 cabbageGetValue "check56"
    kcheck57 cabbageGetValue "check57"
    kcheck58 cabbageGetValue "check58"
    kcheck59 cabbageGetValue "check59"
    kcheck60 cabbageGetValue "check60"
    kcheck61 cabbageGetValue "check61"
    kcheck62 cabbageGetValue "check62"
    kcheck63 cabbageGetValue "check63"

    kcheck64 cabbageGetValue "check64"
    kcheck65 cabbageGetValue "check65"
    kcheck66 cabbageGetValue "check66"
    kcheck67 cabbageGetValue "check67"
    kcheck68 cabbageGetValue "check68"
    kcheck69 cabbageGetValue "check69"
    kcheck70 cabbageGetValue "check70"
    kcheck71 cabbageGetValue "check71"
    kcheck72 cabbageGetValue "check72"

endif

klfo1 fastLFO klfo1type, klfo1rate,klfo1min, klfo1max
klfo2 fastLFO klfo2type, klfo2rate,klfo2min, klfo2max
klfo3 fastLFO klfo3type, klfo3rate,klfo3min, klfo3max
klfo4 fastLFO klfo4type, klfo4rate,klfo4min, klfo4max
klfo5 fastLFO klfo5type, klfo5rate,klfo5min, klfo5max
klfo6 fastLFO klfo6type, klfo6rate,klfo6min, klfo6max
klfo7 fastLFO klfo7type, klfo7rate,klfo7min, klfo7max
klfo8 fastLFO klfo8type, klfo8rate,klfo8min, klfo8max 


if ktrig == 1 then

  if kcheck1 == 1 then
    cabbageSetValue "Wavetable1Morph", klfo1
  endif
  
  if  kcheck2 == 1  then
    cabbageSetValue "FMmodulator1", klfo1
  endif
  
  if  kcheck3 == 1  then
    cabbageSetValue "FMindex1", klfo1
  endif
  
  if  kcheck4 == 1  then
    cabbageSetValue "Wavetable2Morph", klfo1
  endif
  
  if  kcheck5 == 1  then
    cabbageSetValue "FMindex2", klfo1
  endif
  
  if  kcheck6 == 1  then
    cabbageSetValue "FMmodulator2", klfo1
  endif
  
  if  kcheck7 == 1  then
    cabbageSetValue "FilterCutoff", klfo1   
  endif
  
  if  kcheck8 == 1  then
    cabbageSetValue "FilterResonance", klfo1  
  endif
  
  if  kcheck9 == 1  then
    cabbageSetValue "FilterEmphasis", klfo1
  endif

  if kcheck10 == 1 then
    cabbageSetValue "Wavetable1Morph", klfo2
  endif
  
  if  kcheck11 == 1  then
    cabbageSetValue "FMmodulator1", klfo2
  endif
  
  if  kcheck12 == 1  then
    cabbageSetValue "FMindex1", klfo2
  endif
  
  if  kcheck13 == 1  then
    cabbageSetValue "Wavetable2Morph", klfo2
  endif
  
  if  kcheck14 == 1  then
    cabbageSetValue "FMindex2", klfo2
  endif
  
  if  kcheck15 == 1  then
    cabbageSetValue "FMmodulator2", klfo2
  endif
  
  if  kcheck16 == 1  then
    cabbageSetValue "FilterCutoff", klfo2   
  endif
  
  if  kcheck17 == 1  then
    cabbageSetValue "FilterResonance", klfo2  
  endif
  
  if  kcheck18 == 1  then
    cabbageSetValue "FilterEmphasis", klfo2
  endif

  if kcheck19 == 1 then
    cabbageSetValue "Wavetable1Morph", klfo3
  endif
  
  if  kcheck20 == 1  then
    cabbageSetValue "FMmodulator1", klfo3
  endif
  
  if  kcheck21 == 1  then
    cabbageSetValue "FMindex1", klfo3
  endif
  
  if  kcheck22 == 1  then
    cabbageSetValue "Wavetable2Morph", klfo3
  endif
  
  if  kcheck23 == 1  then
    cabbageSetValue "FMindex2", klfo3
  endif
  
  if  kcheck24 == 1  then
    cabbageSetValue "FMmodulator2", klfo3
  endif
  
  if  kcheck25 == 1  then
    cabbageSetValue "FilterCutoff", klfo3   
  endif
  
  if  kcheck26 == 1  then
    cabbageSetValue "FilterResonance", klfo3  
  endif
  
  if  kcheck27 == 1  then
    cabbageSetValue "FilterEmphasis", klfo3
  endif
  
  if kcheck28 == 1 then
    cabbageSetValue "Wavetable1Morph", klfo4
  endif
  
  if  kcheck29 == 1  then
    cabbageSetValue "FMmodulator1", klfo4
  endif
  
  if  kcheck30 == 1  then
    cabbageSetValue "FMindex1", klfo4
  endif
  
  if  kcheck31 == 1  then
    cabbageSetValue "Wavetable2Morph", klfo4
  endif
  
  if  kcheck32 == 1  then
    cabbageSetValue "FMindex2", klfo4
  endif
  
  if  kcheck33 == 1  then
    cabbageSetValue "FMmodulator2", klfo4
  endif
  
  if  kcheck34 == 1  then
    cabbageSetValue "FilterCutoff", klfo4   
  endif
  
  if  kcheck35 == 1  then
    cabbageSetValue "FilterResonance", klfo4 
  endif
  
  if  kcheck36 == 1  then
    cabbageSetValue "FilterEmphasis", klfo4
  endif

  if kcheck37 == 1 then
    cabbageSetValue "Wavetable1Morph", klfo5
  endif
  
  if  kcheck38 == 1  then
    cabbageSetValue "FMmodulator1", klfo5
  endif
  
  if  kcheck39 == 1  then
    cabbageSetValue "FMindex1", klfo5
  endif
  
  if  kcheck40 == 1  then
    cabbageSetValue "Wavetable2Morph", klfo5
  endif
  
  if  kcheck41 == 1  then
    cabbageSetValue "FMindex2", klfo5
  endif
  
  if  kcheck42 == 1  then
    cabbageSetValue "FMmodulator2", klfo5
  endif
  
  if  kcheck43 == 1  then
    cabbageSetValue "FilterCutoff", klfo5   
  endif
  
  if  kcheck44 == 1  then
    cabbageSetValue "FilterResonance", klfo5  
  endif
  
  if  kcheck45 == 1  then
    cabbageSetValue "FilterEmphasis", klfo5
  endif

  if kcheck46 == 1 then
    cabbageSetValue "Wavetable1Morph", klfo6
  endif
  
  if  kcheck47 == 1  then
    cabbageSetValue "FMmodulator1", klfo6
  endif
  
  if  kcheck48 == 1  then
    cabbageSetValue "FMindex1", klfo6
  endif
  
  if  kcheck49 == 1  then
    cabbageSetValue "Wavetable2Morph", klfo6
  endif
  
  if  kcheck50 == 1  then
    cabbageSetValue "FMindex2", klfo6
  endif
  
  if  kcheck51 == 1  then
    cabbageSetValue "FMmodulator2", klfo6
  endif
  
  if  kcheck52 == 1  then
    cabbageSetValue "FilterCutoff", klfo6   
  endif
  
  if  kcheck53 == 1  then
    cabbageSetValue "FilterResonance", klfo6  
  endif
  
  if  kcheck54 == 1  then
    cabbageSetValue "FilterEmphasis", klfo6
  endif

  if kcheck55 == 1 then
    cabbageSetValue "Wavetable1Morph", klfo7
  endif
  
  if  kcheck56 == 1  then
    cabbageSetValue "FMmodulator1", klfo7
  endif
  
  if  kcheck57 == 1  then
    cabbageSetValue "FMindex1", klfo7
  endif
  
  if  kcheck58 == 1  then
    cabbageSetValue "Wavetable2Morph", klfo7
  endif
  
  if  kcheck59 == 1  then
    cabbageSetValue "FMindex2", klfo7
  endif
  
  if  kcheck60 == 1  then
    cabbageSetValue "FMmodulator2", klfo7
  endif
  
  if  kcheck61 == 1  then
    cabbageSetValue "FilterCutoff", klfo7  
  endif
  
  if  kcheck62 == 1  then
    cabbageSetValue "FilterResonance", klfo7  
  endif
  
  if  kcheck63 == 1  then
    cabbageSetValue "FilterEmphasis", klfo7
  endif
  
  if kcheck64 == 1 then
    cabbageSetValue "Wavetable1Morph", klfo8
  endif
  
  if  kcheck65 == 1  then
    cabbageSetValue "FMmodulator1", klfo8
  endif
  
  if  kcheck66 == 1  then
    cabbageSetValue "FMindex1", klfo8
  endif
  
  if  kcheck67 == 1  then
    cabbageSetValue "Wavetable2Morph", klfo8
  endif
  
  if  kcheck68 == 1  then
    cabbageSetValue "FMindex2", klfo8
  endif
  
  if  kcheck69 == 1  then
    cabbageSetValue "FMmodulator2", klfo8
  endif
  
  if  kcheck70 == 1  then
    cabbageSetValue "FilterCutoff", klfo8   
  endif
  
  if  kcheck71 == 1  then
    cabbageSetValue "FilterResonance", klfo8 
  endif
  
  if  kcheck72 == 1  then
    cabbageSetValue "FilterEmphasis", klfo8
  endif
endif


endin
</CsInstruments>
<CsScore>
f1234 0 4096 10 1
f5678 0 4096 10 1
i 99 0 [3600*24*7]
f1501 0 513	-7 0 512 1		;Linear (LIN) Curve for MIDI Vel.
i 100 0 [3600*24*7]
i 30 0 [3600*24*7]
;i 31 0 [3600*24*7]
;i 999 0 [3600*24*7]
</CsScore>