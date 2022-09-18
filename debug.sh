# Arch
BLOCKZ_HOME=/home/marc/git/blockz
KICKASS_HOME=/home/marc/_marc/c64/tools/KickAssembler-5.24
C64_DEBUGGER_HOME=/home/marc/_marc/c64/tools/C64Debugger-0.64.58.6

yes | rm $BLOCKZ_HOME/build/*
java -jar $KICKASS_HOME/KickAss.jar -odir $BLOCKZ_HOME/build -log $BLOCKZ_HOME/build/buildlog.txt -showmem -debugdump -vicesymbols $BLOCKZ_HOME/src/start.asm

# Execute on Arch
#flatpak run --branch=stable --arch=x86_64 --command=x64sc net.sf.VICE +drive8truedrive -moncomman
ds $BLOCKZ_HOME/build/start.vs  $BLOCKZ_HOME/build/start.prg
$C64_DEBUGGER_HOME/c64debugger -wait 3000 -layout 13 -vicesymbols $BLOCKZ_HOME/build/start.vs -autojmp -prg $BLOCKZ_HOME/build/start.prg