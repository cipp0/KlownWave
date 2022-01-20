# 👾 KernelNet
Multi Wavetable Synth with FM & FX - AU/VST Plugin

*by BitNet01 & Kernel Panik Sound*


## ToDo

- FARE ESPORTATO WINDOWS
- Prendere wavetables da Serum, ANA ecc. utilizzando [AutoCropWT](/Tool). Ricampionare tutte le forme d'onda a 4096 samples ---> FAUSTER (wavetables)

- Inserire sorgente Noise (Level, to Filter) vedi eu-MOOG
- Creare un instrument mixer per mettere gli FX in insert o in send e poterli ordinare (ora solo send)
- Assegnare Program Change al banco dei Preset
- Inserire sorgente da filtrare (es: Macro Oscillatore A, Macro Oscillatore B)

- Creare 8 LFO e altri 2 ADSR
- Fare matrice di modulazione (su Y LFO/ADSR su X le destinazioni con scaling )
   - Destinazioni:
      - Pitch
      - Morph - 1
      - FM mod - 1
      - FM Index - 1
      - Morph - 2
      - FM mod - 2
      - FM Index - 2
      - Cutoff
      - Resonance
      - Emphasis

- Dividere in due sezioni la grafica:
1) Sezione sopra:
    - Organizzare in due Tab (Plants) :
      1) Oscillatori
      2) FX a sinistra - Modulation matrix a destra  
2) Sezione sotto:
    -  Sub osc | Noise | Filter | Main Envelope

Futuri sviluppi:
- Inserire filtri: *mvmfilter comb e a formanti*
- Utilizzo di *midiarp* (arpeggiatore midi)
- Utilizzare le tabelle delle wavetable come sorgente dell'FM (oltre a quelle presenti)

*Ultimo update: 20/1/22*

## Issues
- Il suboscillatore viene filtrato, metterlo opzionale

## Tests
- Verificare consumo di CPU con varie configurazioni di buffer e samplerate.
  - Test 15/12/21
    - 5% consumo medio CPU con due istanze del synth
    - MOTU M4 - Buffer size: 128 samples - Sampling rate: 48kHz
    - Processore: 2,7 GHz Intel Core i5  
    - 8GB di RAM

- Verificare il funzionamento della release su PC senza aver CSound installato
  - Con MAC funziona

- Fare DMG con Package dentro

- Beta testing e fare presets


[Procedura distribuzione Plugin OSX](https://forum.cabbageaudio.com/t/distributing-plugins-on-macos/2274)

[Procedura distribuzione Plugin Windows](https://forum.cabbageaudio.com/t/distributing-plugins-on-windows/2275)


## How to build
*Spiegare procedura per buildare con Cabbage*

## Hacking
*Spiegare procedura per hackerare il Synth*

## Changelog

### Update 20/1/22 (cippo)
- Rinominati tutti i widget
- Inserito FX Delay
- Inseriti gli FX in una finestra secondaria
- Inserito test GUI su wavetable
- Issue fixed

### Update 15/12/21 (cippo)
  Struttura dell'algoritmo completamente rinnovata:

  - Riscritto totalmente l'[UDO](/SynthResources/MainOsc.udo)
    - Inserito *vco2* con forma d'onda Saw - Triangolo - Rampa (morphing tra le tre)
    - Inserito *oscilikt* suboscillatore 1° ottava sotto con forme d'onda a scelta tra Sinusoide, Triangolo, Saw, Quadra
    - Somme audio corrette con sum
    - Commentato tutto e riorganizzato input
  - Cambiato totalmente l'inviluppo del filtro e il main
    - Porting del sistema di inviluppi di Giordani (euMOOD)
  - Inserito l'andamento logaritmico per il cutoff del filtro
  - Inserito bypass del filtro
  - Spostate tutte le wavetable dallo score all'orchestra (ottimizzazione)
  - Inserito Glide
  - Inseriti tutti gli elementi GUI nuovi
  - Creata release moddata da distribuire

### Update 23/11/21 (cippo)

  - Inserito --limiter=0.8 (vedere se funziona)
  - Inseriti i filtri: vclpf, spf (ricordarsi di fare abp=0,..)
  - Inseriti gli occhi che lampeggiano a tempo col transport della DAW (verificare consumo CPU di schedkwhen)

### Update 18/11/21 (cippo)

  - Inserite wavetable calcolate con le GEN Routine (alcune di Giordani altre standard)
  - Inseriti widget per modificare l'ADSR
  - Inseriti filtro MOOG Ladder UDO di Giordani + diode_ladder (filtro 303)
  - Inserito inviluppo esponenziale sul filtro (attack ed emphasis) e widget relativi
  - Inserito opcode limit per limitare l'ampiezza tra -0.7 e 0.7 (ed evitare clipping)
  - Rimossi 4 LFO su 8 (non ne servono così tanti)
  - Inserito opcode balance2 per compensare i volumi prima e dopo il filtraggio
  - Inseriti elementi di GUI: Pagliaccio estetico, naso-knob tra i due Oscillatori, knob rotativi griffati KK

### Update 28/05/21 (fauster)

  - Aggiunti 8 LFO
  - Aggiunto inviluppo ADSR

### Update 27/05/21 (cippo)

  - Aggiunto Engine per presets
  - Rimosse forme d'onda a campioni

## Contributors

- Francesco Casanova
- Matteo Tomasetti
- Luis Braschi
