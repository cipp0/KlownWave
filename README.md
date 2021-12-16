# 👾 KernelNet
VST Plugin
Bassline Wavetable Synth with FM & FX

# ToDo

25/11/21

- L'idea finale è quella di fare 4 oscillatori: 2 con VCO2 (forme d'onda classiche) + 2 Poscil3 con varie wavetables prese da Serum, GRP, ANA ecc. che si possono mixare tra di loro a piacimento. Tutte le forme d'onda a 4096 samples ---> FAUSTER (wavetables)

- Assolutamente da fare il bypass dei filtri, l'andamento logaritmico del cutoff e inviluppo transeg anche nel filtro!
- sistemare il filtro svn e inserire mvmfilter
- Inserire 2 filtri (uno a sinistra del clown, uno a destra)

-  ADSR (guardare eu-moog) - Usa Transeg per Attack/Sustain e un altro Transeg per il Release (tramite UDO) ---> LUIS


- opcode da tenere in considerazione: midiarp (arpeggiatore midi), GEN05 per generare funzioni con curve a seconda dei punti, GEN07 per generare funzioni con segmenti a seconda dei punti, GEN9 e GEN10 Per generare forme d'onda composite con somma di sinusoidi, GEN18 per mixare due forme d'onda,
- rendere logaritmico l'andamento del knob del filtro (vedi eu-moog)

- Inserire FX vari prendendo gli UDO dalla cartella UDOs
- Testare con LFO di Ableton e capire dove sono funzionali gli LFO e quindi direzionarli dove sono più musicali
- Organizzare graficamente le sezioni degli oscillatori, filtro ecc.
- Utilizzare le tabelle delle wavetable come sorgente dell'FM (oltre a quelle presenti)


Una volta fatto tutto questo:
- verificare consumo di CPU con varie configurazioni di buffer e samplerate.
- Beta testing e fare presets (lo famo tutti compresi Kernel e Spiral Tribe)
- verificare come distribuire il plugin e farlo visualizzare benbene dall'host
Mac: https://forum.cabbageaudio.com/t/distributing-plugins-on-macos/2274


# Changelog

🚨 Update 23/11/21 --------------------------------------

- ✅ Inserito --limiter=0.8 (vedere se funziona)
- ✅ Inseriti i filtri: vclpf, spf (ricordarsi di fare abp=0,..)
- ✅ Inseriti gli occhi che lampeggiano a tempo col transport della DAW (verificare consumo CPU di schedkwhen)

🚨 Major Update 18/11/21 --------------------------------------

- ✅ Inserite wavetable calcolate con le GEN Routine (alcune di Giordani altre standard)
- ✅ Inseriti widget per modificare l'ADSR
- ✅ Inseriti filtro MOOG Ladder UDO di Giordani + diode_ladder (filtro 303)
- ✅ Inserito inviluppo esponenziale sul filtro (attack ed emphasis) e widget relativi
- ✅ Inserito opcode limit per limitare l'ampiezza tra -0.7 e 0.7 (ed evitare clipping)
- ✅ Rimossi 4 LFO su 8 (non ne servono così tanti)
- ✅ Inserito opcode balance2 per compensare i volumi prima e dopo il filtraggio
- ✅ Inseriti elementi di GUI: Pagliaccio estetico, naso-knob tra i due Oscillatori, knob rotativi griffati KK

🚨 Update 28/05/21 --------------------------------------------

- ✅ Aggiunti 8 LFO
- ✅ Aggiunto inviluppo ADSR

🚨 Update 27/05/21 --------------------------------------------

- ✅ Aggiunto Engine per presets
- ✅ Rimosse forme d'onda a campioni

# Contributors

- Francesco Casanova
- Matteo Tomasetti
- Luis Braschi
