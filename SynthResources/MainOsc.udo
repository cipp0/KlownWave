; ----------------------------------------------------------------------------------
; Oscillatore principale

; Inputs:

; 1) kFreq = Frequenza della nota principale (in HZ)
; 2) kFreqWT = Frequenza principale + detune Wavetable (in HZ)
; 3) kFreqVCO = Frequenza principale + detune VCO (in HZ)
; 4) kWave = Valore di morphing tra le tabelle
; 5) kWAVETamp = Valore di ampiezza dell'oscillatore wavetable
; 6) iMorphTable = Numero della tabella dove sono elencate le tabelle tra cui fare morphing
; 7) iDummyTable = Tabella dummy da inserire nell'oscillatore
; 8) kVCOamp =  Valore di ampiezza del VCO
; 9) kPWM =  Valori di pulse-width-modulation del VCO
; 10) kFMwave = Valore di morphing tra le tabelle dell'FM (varie sinusoidi)
; 11) kFMfactor = Frequenza dell' onda modulante
; 12) kFMIndex = Indice della modulazione FM
; 13) iFMmorphTable = Numero della tabella dove sono elencate le tabelle tra cui fare morphing nell'FM
; 14) iFMDummyTable = Tabella dummy da inserire nell'oscillatore FM
; 15) kSubWave = Selettore di forma d'onda per il sub Oscillatore
; 16) kSubAmp =  Volume del sub Oscillatore
; 17) kSubTable =  Volume del sub Oscillatore

; Outputs: somma Mono output

; ----------------------------------------------------------------------------------

opcode MainOsc, aa, kkkkkiikkkkkiikk

;============================   
;==== VARIABILI DI INPUT ==== 
;============================

kFreq, kFreqWT, kFreqVCO, kWave,kWAVETamp, iMorphTable, iDummyTable, kVCOamp, kPWM, kFMwave, kFMfactor, kFMIndex, iFMmorphTable, iFMDummyTable, kSubAmp,kSubTable  xin


;============    
;==== FM ==== 
;============ 
  
kmodamp = kFMIndex*kFMfactor*kFreq
         
kfreqmod = kFMfactor+kFreq         
                    
ftmorf kFMwave, iFMmorphTable, iFMDummyTable 
amod poscil3 kmodamp, kfreqmod, iFMDummyTable       
    
    
;==============================     
;==== WAVETABLE OSCILLATOR ==== 
;==============================     
     
ftmorf  kWave, iMorphTable, iDummyTable             

awavetable poscil3 kWAVETamp, kFreqWT+amod, iDummyTable 

;=====================     
;==== CLASSIC VCO ==== 
;=====================

;kmod = k(amod)
avco vco2 kVCOamp, kFreqVCO , 4 , kPWM


;========================    
;==== SUB OSCILLATOR ==== 
;========================  

ksubFreq = kFreq/2. ; Ottava sotto
 
asubOSC oscilikt kSubAmp, ksubFreq, kSubTable


;===========================   
;==== SOMME AUDIO E OUT ==== 
;===========================

            
aOsc sum awavetable, avco

xout aOsc, asubOSC

endop


