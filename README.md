# 👾 KlownWave
Multi Wavetable Synth with FM & FX - AU / VST Plugin based on Csound and Cabbage

![plot](/Old-dev/img.jpg)

*Developed by Francesco Casanova ([BitNet01](https://www.facebook.com/BitNet001)) from an idea of [Kernel Panik Sound](https://www.facebook.com/kernelpaniksound)*

[(ITA README)](/README_ita.md)

#### Everything is still in development

## ToDo

- Export for Windows
- Finish the graphics with panels
- Create Wavetable change mechanism - see csoundQT example on [tests](/tests)
- Create a mixer to put the FX in inserts and be able to sort them (now only send)

- Insert 2 filters per Oscillator bank

- Make modulation matrix (on Y 8 LFO / 2 ADSR on X the destinations with scaling)
   - Destinations:
      - Pitch
      - Morph - OSC1
      - FM mod - OSC1
      - FM Index - OSC1
      - Morph - OSC2
      - FM mod - OSC2
      - FM Index - OSC2
      - Cutoff
      - Resonance
      - Emphasis

- Divide the graphics into two sections:
1) Section above:
    - Organize in two Tabs (Plants):
      1) Oscillators
      2) FX on the left - Modulation matrix on the right
2) Section below:
    - Sub osc | Noise | Filter | Main Envelope

Future developments:
- Assign Program Changes to the Preset Bank
- Insert filters: *mvmfilter comb and a formants*
- Using *midiarp* (midi arpeggiator)
- Use the wavetable tables as the source of the FM (in addition to those present)

*Last update: 16/2/22*

## Issues
- linking libcsound64 on windows, DAW crashes

## Tests
- Check CPU consumption with various buffer and samplerate configurations.
  - Test 15/12/21
    - 5% average CPU consumption with two instances of the synth
    - MOTU M4 - Buffer size: 128 samples - Sampling rate: 48kHz
    - Processor: 2.7 GHz Intel Core i5
    - 8GB of RAM

- Check the release on PC without having CSound installed
  - With MAC it works

- Doing DMG with Package inside

- Beta testing and making presets


[OSX Plugin Distribution Procedure](https://forum.cabbageaudio.com/t/distributing-plugins-on-macos/2274)

[Windows Plugin distribution procedure](https://forum.cabbageaudio.com/t/distributing-plugins-on-windows/2275)


## How to build
*Explain how to build with Cabbage*

## Hacking
*Explain procedure to hack the Synth*

## License
![plot](/Old-dev/cc.png)

This work is licensed under a [Creative Commons Attribution-NonCommercial-ShareAlike 3.0 Unported License](https://creativecommons.org/licenses/by-nc-sa/3.0/)

## Contributors

- Francesco Casanova
- Matteo Tomasetti
- Luis Braschi
