@echo off
cd ./%version%/
move /Y ./man.aux ./auxgen/ 
::move /Y ./man.dvi ./auxgen/ 
move /Y ./man.idx ./auxgen/ 
move /Y ./man.ilg ./auxgen/ 
move /Y ./man.ind ./auxgen/
move /Y ./man.lof ./auxgen/ 
move /Y ./man.lot ./auxgen/ 
move /Y ./man.out ./auxgen/ 
move /Y ./man.sub ./auxgen/ 
move /Y ./man.suc ./auxgen/ 
move /Y ./man.syc ./auxgen/ 
move /Y ./man.sym ./auxgen/ 
move /Y ./man.synctex.gz ./auxgen/ 
::move /Y ./man.synctex.gz(busy) ./auxgen/ 
move /Y ./man.toc ./auxgen/ 
move /Y ./man.bbl ./auxgen/ 
move /Y ./man.blg ./auxgen/ 
move /Y ./man.glg ./auxgen/ 
move /Y ./man.glo ./auxgen/ 
move /Y ./man.gls ./auxgen/ 
move /Y ./man.xdy ./auxgen/
cd ../ 