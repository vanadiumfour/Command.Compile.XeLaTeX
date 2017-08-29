@echo off
@ECHO LaTeX Compile Script
@ECHO =                   = 
@ECHO Compile using XeLaTeX
@ECHO Runtime from MiKTeX
@ECHO =                   = 
@ECHO Written by
@ECHO vanadiumfour
@ECHO =                   = 
@ECHO =                   = 
::@echo off
GOTO VERSELECT
::========================FILE VERSION SELECT=========================::
::==========TAKES VERSION AND CREATES RELDIR PATH FOR SCRPT===========::
:VERSELECT
    set /p ver="Enter Version: "
    set version=v%ver%
    set /p correctversion="Version = %version%. Is this correct? (Y/N): "
IF NOT "%correctversion%"=="Y" (
    GOTO VERSELECT
)   else (
    GOTO MNTNCE
)
::=============================MAINTENANCE=============================::
:MNTNCE
IF ./%Version%/
::===========================COMPILE SCRIPT============================::
:COMPSCRPT
@ECHO =                   = 
@echo off
@echo off
call findaux> ./%version%/logs/findaux.log
set /p ls="Long or Short Compile? (L/S): "
:ISLNG
IF "%ls%"=="L" (
    GOTO :COMPSCRPTLNG
) else (
    GOTO ISSHT
)
:ISSHT
IF "%ls%"=="S" (
    GOTO :COMPSCRPTSHT
) else (
    ECHO You did not make a valid choice.
    @echo off
    GOTO :COMPSCRPT
)
::===========================COMPILE SCRIPT SHT========================::
:COMPSCRPTSHT
    @echo off 
    CD .\%version%
    xelatex .\man.ltx > "./logs/man.cmd.run1.short.log"
    del man.mw
    CD ..\
    @echo off
GOTO OPPDF
::===========================COMPILE SCRIPT LNG========================::
:COMPSCRPTLNG
    @echo off 
    CD .\%version%
    xelatex .\man.ltx > "./logs/man.cmd.run1.log"
    del man.mw
    makeglossaries .\man,ltx > "./logs/man.cmd.run2.log"
    xelatex .\man.ltx > "./logs/man.cmd.run3.log"
    del man.mw
    makeindex .\man.idx > "./logs/man.cmd.run4.log"
    xelatex .\man.ltx > "./logs/man.cmd.run5.log"
    del man.mw
    texify --pdf --engine=xetex --synctex=1 --clean .\man.ltx > "man.cmd.run6.log"
    del man.mw
    CD ..\ 
    
    @echo off 
    GOTO OPPDF
::======================OPEN PDF DECISION SCRIPT=======================::
:OPPDF
call hideaux > ./%version%/logs/hideaux.log
@ECHO =                   = 
@ECHO off
set /p printpdf="Open PDF on Compile Termination? (Y/N): "
IF NOT "%printpdf%"=="" (
    GOTO DISP
)   else (
        GOTO ERROR
        )
:DISP
IF "%printpdf%"=="Y" (
    GOTO PDF
)   else (
    GOTO END
)
::============================OPEN PDF FILE============================::
:PDF
    @ECHO Initializing PDF using default PDF viewer.  
    @ECHO Program will terminate upon PDF display.  
    ::  ECHO Goodbye!
    start "" /max .\%version%\man.pdf
GOTO END
::================ERROR MESSAGE AND RETURN TO OPEN PDF=================::
:ERROR
    @ECHO Invalid Entry!
GOTO OPPDF
::===========================TERMINATION OF SCRIPT=====================::
:END
    @ECHO Terminating Program.
    @ECHO Logs have been written to "./%version%/logs/"
    @ECHO Goodbye!
::=======================Return to Command Line========================::

