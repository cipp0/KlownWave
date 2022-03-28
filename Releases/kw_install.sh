vstdir=/Library/Audio/Plug-Ins/VST
libdir=/Library/Frameworks
tmpdir=/tmp
repo_m1="https://github.com/cipp0/KlownWave/raw/main/Releases/macOS_M1"
repo_x86="https://github.com/cipp0/KlownWave/raw/main/Releases/macOS_x86"
pkgs="Csound.tar.gz KlownWave.tar.gz"

function die {
  echo "$1" && exit 255
}

[ "$(uname -m)" == "arm64" ] && echo "arm64 arch detected" && repo=${repo_m1}
[ "$(uname -m)" == "x86_64" ] && echo "x86_64 arch detected" && repo=${repo_x86}

for pkg in ${pkgs}; do
  curl -fSsL "${repo}/${pkg}" -o "${tmpdir}/${pkg}" || die "error downloading ${pkg}"
done

$(tar -C ${libdir} -xzpf ${tmpdir}/Csound.tar.gz && rm -f "${tmpdir}/Csound.tar.gz") || die "error moving framework"
$(tar -C ${vstdir} -xzpf ${tmpdir}/KlownWave.tar.gz && rm -f "${tmpdir}/KlownWave.tar.gz") || die "error moving VST"

echo "all done!"