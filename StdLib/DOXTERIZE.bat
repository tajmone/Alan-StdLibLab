:: -----------------------------------------------------------------------------
:: "DOXTERIZE.bat"                    | v0.0.1 | 2019/06/17 | by Tristano Ajmone
:: -----------------------------------------------------------------------------
@ECHO OFF & CLS
CHCP 65001 > nul &:: (UTF-8 Unicode)
ECHO.
ECHO Creating StdLib Fork modules documentation ...
ECHO.

ECHO +---------------------+
ECHO ^| 1. Delete old files ^|
ECHO +---------------------+
DEL /Q lib*.asciidoc lib*.adoc > NUL 2>&1

ECHO +------------------------------+
ECHO ^| 2. Doxterize library modules ^|
ECHO +------------------------------+
FOR %%i IN (lib*.i) DO CALL :doxterize %%i

ECHO +----------------------------------+
ECHO ^| 3. Convert from AsciiDoc to HTML ^|
ECHO +----------------------------------+
FOR %%i IN (*.asciidoc) DO CALL :convHTML %%i

EXIT /B

:: =============================================================================
:: func                    Doxterizza Sorgenti Libreria                         
:: =============================================================================
:doxterize
ECHO    Doxterizza: %~nx1
CALL doxter %~nx1 > nul
EXIT /B
:: ==============================================================================
:: func                     Converti da AsciiDoc a HTML                          
:: ==============================================================================
:convHTML
ECHO    Converti: %~nx1
CALL asciidoctor^
  --verbose^
  -S unsafe^
  -a data-uri^
  -a experimental^
  -a icons=font^
  -a linkattrs^
  -a reproducible^
  -a sectanchors^
  -a toc=left^
  -a toclevels=5^
  -a source-highlighter=highlight^
  --template-dir ..\docs_src\adoc\haml^
  --require ..\docs_src\adoc\highlight-treeprocessor_mod.rb^
  -a docinfodir=..\docs_src\adoc^
  -a docinfo=shared-head^
  %~nx1
EXIT /B

:: EOF ::
