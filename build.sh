# Arch
#BLOCKZ_HOME=/home/marc/git/blockz
#KICKASS_HOME=/home/marc/_marc/c64/tools/KickAssembler-5.24

# Mac
KICKASS_HOME=/Users/vzteufem/64/KickAssembler-5.24
BLOCKZ_HOME=/Users/vzteufem/64/blockz
VICE_PATH=/Applications/vice-arm64-gtk3-3.6.1/bin

yes | rm $BLOCKZ_HOME/build/*
java -jar $KICKASS_HOME/KickAss.jar -odir $BLOCKZ_HOME/build -log $BLOCKZ_HOME/build/buildlog.txt -showmem -debugdump -vicesymbols $BLOCKZ_HOME/src/start.asm

# Execute on Arch
#flatpak run --branch=stable --arch=x86_64 --command=x64sc net.sf.VICE +drive8truedrive $BLOCKZ_HOME/build/start.prg
#u64-prg.sh $BLOCKZ_HOME/build/start.prg

# Execute on Mac
$VICE_PATH/x64sc +drive8truedrive $BLOCKZ_HOME/build/start.prg