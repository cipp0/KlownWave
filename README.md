# 👾 KernelNet
Multi Wavetable Synth with FM & FX - AU/VST Plugin

*by BitNet01 & Kernel Panik Sound*


## ToDo

- Prendere wavetables da Serum, ANA ecc. utilizzando [AutoCropWT](/Tool). Ricampionare tutte le forme d'onda a 4096 samples ---> FAUSTER (wavetables)
- Capire il funzionamento dei filtri svn
- Reinserire gli LFO (Testare con LFO di Ableton)
- Inserire sends agli FX vari prendendo gli UDO dalla cartella UDOs
- Inserire 2 banchi di filtri (uno a sinistra del clown, uno a destra) - ???
- Organizzare graficamente le sezioni degli oscillatori, filtro ecc.

Da tenere in considerazione:
- Inserire filtri: *mvmfilter comb e a formanti*
- Utilizzo di *midiarp* (arpeggiatore midi)
- Inserire inviluppo sul morphing
- Utilizzare le tabelle delle wavetable come sorgente dell'FM (oltre a quelle presenti)

*Ultimo update: 15/12/21*

## Issues
- Il suboscillatore viene filtrato, metterlo opzionale
- il synth è monofonico, è un problema?
- L'FM fa solo sul Wavetable non col vco2
- Rinominare tutti i widget prima di distribuire

## Tests
- Verificare consumo di CPU con varie configurazioni di buffer e samplerate.
  - Test 15/12/21
    - 5% consumo medio CPU con due istanze del synth
    - MOTU M4 - Buffer size: 128 samples - Sampling rate: 48kHz
    - Processore: 2,7 GHz Intel Core i5  
    - 8GB di RAM

- Verificare il funzionamento della release su PC senza aver CSound installato

- Fare DMG con Package dentro

- Beta testing e fare presets


[Procedura distribuzione Plugin OSX](https://forum.cabbageaudio.com/t/distributing-plugins-on-macos/2274)

[Procedura distribuzione Plugin Windows](https://forum.cabbageaudio.com/t/distributing-plugins-on-windows/2275)


## How to build
*Spiegare procedura per buildare con Cabbage*

## Hacking
*Spiegare procedura per hackerare il Synth*

## Changelog
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
