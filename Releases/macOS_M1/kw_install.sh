echo -n "downloading Csound ... "
curl -fSsL https://github.com/cipp0/KlownWave/raw/main/Releases/macOS_M1/Csound.zip -o Csound.zip || exit 255
echo "done"
echo -n "downloading KlownWave ... "
curl -fSsL https://github.com/cipp0/KlownWave/raw/main/Releases/macOS_M1/KlownWave.zip -o KlownWave.zip || exit 255
echo "done"
echo -n "moving contents ... "
unzip -qq -o -d /Library/Audio/Plug-Ins/VST KlownWave.zip || exit 255
unzip -qq -o -d /Library/Frameworks Csound.zip || exit 255
echo "done"