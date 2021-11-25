<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
-odac     ;;;realtime audio out
;-iadc    ;;;uncomment -iadc if realtime audio input is needed too
; For Non-realtime ouput leave only the line below:
; -o ftmorf.wav -W ;;; for file output any platform
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 32
nchnls = 2
0dbfs   =1

instr 1

kmorf invalue "morf"

kndx  line   0, p3, 7


ftmorf kndx, 1, 3 ; 
ftmorf kndx, 2, 4

if kmorf == 1 then ; Se lo switch è acceso oscili legge la tabella 4 a 16384 valori
      asig  oscili .8, 440, 4
      
else	; Se lo switch è spento oscili legge la tabella 3 a 1024 valori


						asig  oscili .8, 440, 3
						
endif


      outs   asig, asig
endin

instr 2
endin
</CsInstruments>
<CsScore>

f1 0 8 -2 30 40 50 60 70 80 90 100 /* numeri delle tabelle a 1024 valori  */
f2 0 8 -2 400 300 1000 900 800 600 700 500 /* numeri delle tabelle a 16384 valori  */


f3 0 1024 10 1 /* tabella dummy a 1024 valori  */
f4 0 16384 10 1 /* tabella dummy a 16384 valori  */

f30 0 1024 10 1
f40 0 1024 10 0 1
f50 0 1024 10 0 0 1
f60 0 1024 10 0 0 0 1
f70 0 1024 10 0 0 0 0 1
f80 0 1024 10 0 0 0 0 0 1
f90 0 1024 10 0 0 0 0 0 0 1
f100 0 1024 10 1 1 1 1 1 1 1

f300 0 16384 10 1
f400 0 16384 10 0 1
f500 0 16384 10 0 0 1
f600 0 16384 10 0 0 0 1
f700 0 16384 10 0 0 0 0 1
f800 0 16384 10 0 0 0 0 0 1
f900 0 16384 10 0 0 0 0 0 0 1
f1000 0 16384 10 1 1 1 1 1 1 1

i2 0 36000
</CsScore>
</CsoundSynthesizer>
<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>100</x>
 <y>100</y>
 <width>320</width>
 <height>240</height>
 <visible>true</visible>
 <uuid/>
 <bgcolor mode="nobackground">
  <r>255</r>
  <g>255</g>
  <b>255</b>
 </bgcolor>
 <bsbObject type="BSBButton" version="2">
  <objectName>play</objectName>
  <x>7</x>
  <y>10</y>
  <width>100</width>
  <height>30</height>
  <uuid>{6b41579c-1710-48fa-9546-692463fed78f}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <type>event</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text>play</text>
  <image>/</image>
  <eventLine>i1 0 10</eventLine>
  <latch>false</latch>
  <latched>false</latched>
  <fontsize>10</fontsize>
 </bsbObject>
 <bsbObject type="BSBButton" version="2">
  <objectName>morf</objectName>
  <x>6</x>
  <y>45</y>
  <width>100</width>
  <height>30</height>
  <uuid>{9a6a439b-7f25-4e2b-8c01-574b411e0a5a}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <type>value</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text>ftable</text>
  <image>/</image>
  <eventLine/>
  <latch>true</latch>
  <latched>false</latched>
  <fontsize>10</fontsize>
 </bsbObject>
</bsbPanel>
<bsbPresets>
</bsbPresets>
