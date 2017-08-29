@echo off
cd ./%version%/auxgen/
move /Y ./man.aux ../ 
::move /Y ./man.dvi ../ 
move /Y ./man.idx ../ 
move /Y ./man.ilg ../ 
move /Y ./man.ind ../
move /Y ./man.lof ../ 
move /Y ./man.lot ../ 
move /Y ./man.out ../ 
move /Y ./man.sub ../ 
move /Y ./man.suc ../ 
move /Y ./man.syc ../ 
move /Y ./man.sym ../ 
move /Y ./man.synctex.gz ../ 
::move /Y ./man.synctex.gz(busy) ../ 
move /Y ./man.toc ../ 
move /Y ./man.bbl ../ 
move /Y ./man.blg ../ 
move /Y ./man.glg ../ 
move /Y ./man.glo ../ 
move /Y ./man.gls ../ 
move /Y ./man.xdy ../
cd ../ 
cd ../