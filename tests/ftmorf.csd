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

kndx  invalue "index";line   0, p3, 7
kndx port kndx, 0.2; [, isig]

ftmorf kndx, 1, 3 ; 
ftmorf kndx, 2, 4
kfreq invalue "freq"

if kmorf == 1 then ; Se lo switch è acceso oscili legge la tabella 4 a 16384 valori
      asig  oscili .8, kfreq, 4
      
else	; Se lo switch è spento oscili legge la tabella 3 a 1024 valori


						asig  oscili .8, kfreq, 3
						
endif


      outs   asig, asig
endin

instr 2
endin
</CsInstruments>
<CsScore>

f1 0 16 -2 30 40 50 60 70 80 90 100 110 120 130 140 150 160 170 180 /* numeri delle tabelle a 1024 valori  */
f2 0 8 -2 400 300 1000 900 800 600 700 500 /* numeri delle tabelle a 16384 valori  */


f3 0 4096 10 1 /* tabella dummy a 1024 valori  */
f4 0 16384 10 1 /* tabella dummy a 16384 valori  */

f30 0 4096 1 "./Waves/1_SickBass__A#.wav" 0 0 0
f40 0 4096 1 "./Waves/2_KernelTable.wav" 0 0 0
f50 0 4096 1 "./Waves/3_Dancefloor.wav" 0 0 0 
f60 0 4096 1 "./Waves/4_InnerState.wav" 0 0 0
f70 0 4096 1 "./Waves/5_BitNetRocking.wav" 0 0 0
f80 0 4096 1 "./Waves/6_.UndergroundTable.wav" 0 0 0
f90 0 4096 1 "./Waves/7_VocRider.wav" 0 0 0
f100 0 4096 1 "./Waves/8_OpenBreakSaw.wav" 0 0 0
f110 0 4096 1 "./Waves/9_DarkGrind23.wav" 0 0 0
f120 0 4096 1 "./Waves/10_Hallucination.wav" 0 0 0
f130 0 4096 1 "./Waves/11_RaveBells.wav" 0 0 0
f140 0 4096 1 "./Waves/12_TAZTable.wav" 0 0 0
f150 0 4096 1 "./Waves/13_CuttingEdge.wav" 0 0 0
f160 0 4096 1 "./Waves/14_ChainsawKK.wav" 0 0 0
f170 0 4096 1 "./Waves/15_Elekktro.wav" 0 0 0
f180 0 4096 1 "./Waves/16_BitNetTable.wav" 0 0 0

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
  <eventLine>i1 0 60</eventLine>
  <latch>false</latch>
  <latched>false</latched>
  <fontsize>10</fontsize>
 </bsbObject>
 <bsbObject type="BSBButton" version="2">
  <objectName>morf</objectName>
  <x>175</x>
  <y>10</y>
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
  <text>ftable switch</text>
  <image>/</image>
  <eventLine/>
  <latch>true</latch>
  <latched>true</latched>
  <fontsize>10</fontsize>
 </bsbObject>
 <bsbObject type="BSBHSlider" version="2">
  <objectName>index</objectName>
  <x>40</x>
  <y>98</y>
  <width>270</width>
  <height>27</height>
  <uuid>{d7c1bc17-9e30-4087-9b28-66a9b5b4c550}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <minimum>0.00000000</minimum>
  <maximum>15.00000000</maximum>
  <value>0.88888889</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBHSlider" version="2">
  <objectName>freq</objectName>
  <x>37</x>
  <y>163</y>
  <width>273</width>
  <height>23</height>
  <uuid>{87e7cbd8-2d7f-4a0a-a7b8-4207e6f4cf7a}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <minimum>20.00000000</minimum>
  <maximum>600.00000000</maximum>
  <value>28.49816850</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBScrollNumber" version="2">
  <objectName>index</objectName>
  <x>40</x>
  <y>125</y>
  <width>80</width>
  <height>25</height>
  <uuid>{bcc52413-1a09-4f1e-9a3e-9ce598ea3c56}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <value>0.88888889</value>
  <resolution>0.00100000</resolution>
  <minimum>-999999999999.00000000</minimum>
  <maximum>999999999999.00000000</maximum>
  <bordermode>true</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject type="BSBScrollNumber" version="2">
  <objectName>freq</objectName>
  <x>41</x>
  <y>186</y>
  <width>80</width>
  <height>25</height>
  <uuid>{4535832d-031e-4920-9401-3eae6e383a64}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <value>28.49816850</value>
  <resolution>0.00100000</resolution>
  <minimum>-999999999999.00000000</minimum>
  <maximum>999999999999.00000000</maximum>
  <bordermode>true</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>2</x>
  <y>98</y>
  <width>42</width>
  <height>26</height>
  <uuid>{feb5acac-5b56-4d39-844e-decf7f700437}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>Morph</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>3</x>
  <y>162</y>
  <width>36</width>
  <height>24</height>
  <uuid>{e6deca20-cdc6-45a1-9719-7239873a2443}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>Freq</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
</bsbPanel>
<bsbPresets>
</bsbPresets>
