BLOCKZ_HOME=/home/marc/git/blockz
KICKASS_HOME=/home/marc/_marc/c64/tools/KickAssembler-5.24

yes | rm $BLOCKZ_HOME/build/*
java -jar $KICKASS_HOME/KickAss.jar -odir $BLOCKZ_HOME/build -log $BLOCKZ_HOME/build/buildlog.txt -showmem -debugdump -vicesymbols $BLOCKZ_HOME/src/start.asm
flatpak run --branch=stable --arch=x86_64 --command=x64sc net.sf.VICE +drive8truedrive $BLOCKZ_HOME/build/start.prg