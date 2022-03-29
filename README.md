# 👾 KlownWave

![plot](/img/img0.jpg)

AU / VST Plugin synth written in [Csound](https://csound.com/) and [Cabbage](https://cabbageaudio.com/)

"In this long period of pandemic, for about two years now, we have tried to commit our efforts, for something truly stimulating and of which 
we have always been passionate, and this is how, thanks to the collaboration with the BitNet01 collective, we have been able to develop in this
time, our virtual synthesizer, Vst, with our style and sound timbre that we have called KLOWNWAVE.

We are excited to introduce this new project to you, and we hope you will share our visionary initiative.
KlownWave will be distributed to the public 'by donation', will be open source and hackable"

*Kernel Panik Sound*

## Features
- 2 x Wavetable Oscillators 
- 6 x Wavetable Set with 16 morphable waves each 
- 2 x Analog-like Oscillators (Saw-Ramp-Triangle)
- 2 x FM module with morphable source (between different harmonics in sine waves)
- 1 x White Noise
- 1 x Filter module with envelope and types:
  - TB303-like lowpass filter with resonance
  - Moog-like lowpass filter with resonance
  - Steiner-Parker lowpass filter with resonance
  - Steiner-Parker highpass filter with resonance
  - Steiner-Parker bandpass filter with resonance
  - Sallen-Key lowpass filter with resonance
  - Sallen-Key highpass filter with resonance
- 1 x Sub oscillator (1 octave down) with different waves (sine, triangle, saw, square)
- 1 x Envelope with portamento
- 1 x Modulation matrix with:
  - 8 x LFOs (sine, triangle, saw, ramp, square, random)
  - 9 x Destinations (Morph WT1, FM Mod 1, FM Index 1, Morph WT2, FM Mod 2, FM Index 2, Cutoff, Resonance, Emphasis)
- 6 X Effects (in insert)
  - Distortion
  - Chorus
  - Flanger
  - Phaser
  - Delay
  - Reverb

## How to build
- Clone or download this repository
- Download and install [Cabbage](https://cabbageaudio.com/download/) (with CSound 6.16 at least)
- Open the .csd file in Cabbage
- Click File > Export Plugin > VST Plugin Synth
- Select your default VSTs folder
- Open the DAW and Enjoy!

## License
![plot](/img/cc.png)

*Developed by [cipp0](https://cipp0.github.io/) ([BitNet01](https://bitnet01.xyz/)) from an idea of [Kernel Panik Sound](https://www.facebook.com/kernelpaniksound)*

This work is licensed under a [Creative Commons Attribution-NonCommercial-ShareAlike 3.0 Unported License](https://creativecommons.org/licenses/by-nc-sa/3.0/)



