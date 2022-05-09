BLOCKZ_HOME=/home/marc/_marc/c64/projects/blockz
yes | rm $BLOCKZ_HOME/build/*
java -jar /home/marc/_marc/c64/tools/KickAssembler-5.24/KickAss.jar -odir $BLOCKZ_HOME/build -log $BLOCKZ_HOME/build/buildlog.txt -showmem -debugdump -vicesymbols $BLOCKZ_HOME/src/start.asm
flatpak run --branch=stable --arch=x86_64 --command=x64sc net.sf.VICE +drive8truedrive -moncommands $BLOCKZ_HOME/build/start.vs  $BLOCKZ_HOME/build/start.prg