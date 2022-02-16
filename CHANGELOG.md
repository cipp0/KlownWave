# 👾 KernelNet
Multi Wavetable Synth with FM & FX - AU/VST Plugin

*by BitNet01 & Kernel Panik Sound*

## Changelog

### Update 02/22 (cippo)
- Inserito sorgente Noise (Level, to Filter) 
- Sistemata leggermente la grafica

### Update 20/1/22 (cippo)
- Rinominati tutti i widget
- Inserito FX Analog Delay
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

  - Inserite wavetable calcolate con le GEN Routine 
  - Inseriti widget per modificare l'ADSR
  - Inseriti filtro MOOG Ladder UDO + diode_ladder (filtro 303)
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
