# 👾 KernelNet
Multi Wavetable Synth with FM & FX
AU/VST Plugin
by BitNet01 & Kernel Panik Sound


# ToDo

Ultimo update: 15/12/21

🔴 Prendere wavetables da Serum, ANA ecc. Utilizzare  [AutoCropWT](/Tool). Tutte le forme d'onda a 4096 samples ---> FAUSTER (wavetables)

- Assolutamente da fare il bypass dei filtri, l'andamento logaritmico del cutoff e inviluppo transeg anche nel filtro!
- sistemare il filtro svn e inserire mvmfilter
- Inserire 2 filtri (uno a sinistra del clown, uno a destra)

-  ADSR (guardare eu-moog) - Usa Transeg per Attack/Sustain e un altro Transeg per il Release (tramite UDO) ---> LUIS


- opcode da tenere in considerazione: midiarp (arpeggiatore midi), GEN05 per generare funzioni con curve a seconda dei punti, GEN07 per generare funzioni con segmenti a seconda dei punti, GEN9 e GEN10 Per generare forme d'onda composite con somma di sinusoidi, GEN18 per mixare due forme d'onda,
- rendere logaritmico l'andamento del knob del filtro (vedi eu-moog)

🔴 Inserire FX vari prendendo gli UDO dalla cartella UDOs

🔴 Testare con LFO di Ableton e capire dove sono funzionali gli LFO e quindi direzionarli dove sono più musicali

🔴 Organizzare graficamente le sezioni degli oscillatori, filtro ecc.

🔴 Utilizzare le tabelle delle wavetable come sorgente dell'FM (oltre a quelle presenti)

# Test
- Verificare consumo di CPU con varie configurazioni di buffer e samplerate.
  - Test 15/12/21 | 5% di CPU con due istanze del synth | MOTU M4 - Buffer size: 128 samples - Sampling rate: 48kHz | Processore: 2,7 GHz Intel Core i5  | 8GB di RAM
- Beta testing e fare presets
- verificare il funzionamento della release su PC senza aver CSound installato

Procedura OSX: https://forum.cabbageaudio.com/t/distributing-plugins-on-macos/2274

Procedura Windows: https://forum.cabbageaudio.com/t/distributing-plugins-on-windows/2275

🔴 fare DMG con Package dentro

# How to build
🔴 Spiegare procedura per buildare con Cabbage

# Hacking
🔴 Spiegare procedura per hackerare il Synth

# Changelog
🚨 Update 15/12/21 (cippo)--------------------------------------
  Struttura dell'algoritmo completamente rinnovata:

  ✔️ Riscritto totalmente l'[UDO]('/SynthResources/MainOsc.udo')
    - Inserito vco2 con forma d'onda Saw - Triangolo - Rampa (morphing tra le tre)
    - Inserito oscilikt suboscillatore 1° ottava sotto con forme d'onda a scelta tra Sinusoide, Triangolo, Saw, Quadra
    - Somme audio corrette con sum
    - Commentato tutto e riorganizzato inputs

  ✔️ Cambiato totalmente l'inviluppo
    - Porting del sistema di inviluppi di Giordani (euMOOD) | Issue: è monofonico

🚨 Update 23/11/21 (cippo)--------------------------------------

  ✔️ Inserito --limiter=0.8 (vedere se funziona)

  ✔️ Inseriti i filtri: vclpf, spf (ricordarsi di fare abp=0,..)

  ✔️ Inseriti gli occhi che lampeggiano a tempo col transport della DAW (verificare consumo CPU di schedkwhen)

🚨 Update 18/11/21 (cippo)--------------------------------------

  ✔️ Inserite wavetable calcolate con le GEN Routine (alcune di Giordani altre standard)

  ✔️ Inseriti widget per modificare l'ADSR

  ✔️ Inseriti filtro MOOG Ladder UDO di Giordani + diode_ladder (filtro 303)

  ✔️ Inserito inviluppo esponenziale sul filtro (attack ed emphasis) e widget relativi

  ✔️ Inserito opcode limit per limitare l'ampiezza tra -0.7 e 0.7 (ed evitare clipping)

  ✔️ Rimossi 4 LFO su 8 (non ne servono così tanti)

  ✔️ Inserito opcode balance2 per compensare i volumi prima e dopo il filtraggio

  ✔️ Inseriti elementi di GUI: Pagliaccio estetico, naso-knob tra i due Oscillatori, knob rotativi griffati KK

🚨 Update 28/05/21 (fauster)--------------------------------------------

  ✔️ Aggiunti 8 LFO

  ✔️ Aggiunto inviluppo ADSR

🚨 Update 27/05/21 (cippo)--------------------------------------------

  ✔️ Aggiunto Engine per presets

  ✔️ Rimosse forme d'onda a campioni

# Contributors

- Francesco Casanova
- Matteo Tomasetti
- Luis Braschi
