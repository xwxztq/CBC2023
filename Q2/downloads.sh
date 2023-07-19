echo Downloading cluster pdb files...
wget -nc https://scop.berkeley.edu/downloads/pdbstyle/pdbstyle-sel-gs-bib-40-2.08.tgz
tar -xzvf pdbstyle-sel-gs-bib-40-2.08.tgz

echo Downloading cluster sequences...
# wget -nc https://scop.berkeley.edu/downloads/scopseq-1.75/astral-scopdom-seqres-gd-sel-gs-bib-40-1.75.fa
wget -nc https://scop.berkeley.edu/downloads/scopeseq-2.08/astral-scopedom-seqres-gd-sel-gs-bib-40-2.08.fa

echo Downloading and Compiling TM-align...
wget -nc https://zhanggroup.org/TM-align/TMalign.cpp
g++ -static -O3 -ffast-math -lm -o TMalign TMalign.cpp
