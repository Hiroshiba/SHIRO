set -eux -o pipefail
shopt -s inherit_errexit

if [ ! -d ciglet ]; then
    git clone https://github.com/Sleepwalking/ciglet.git
fi
(
    cd ciglet
    make single-file
)
rsync -av ciglet/single-file/ external/ciglet/

if [ ! -d liblrhsmm ]; then
    git clone https://github.com/Sleepwalking/liblrhsmm.git
fi
(
    cd liblrhsmm
    make
)
rsync -av liblrhsmm/ external/liblrhsmm/

mkdir -p build
make

rm -rf ciglet
rm -rf liblrhsmm
rm -rf build
