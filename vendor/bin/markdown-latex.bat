@ECHO OFF
SET BIN_TARGET=%~dp0/../cebe/markdown-latex/bin/markdown-latex
php "%BIN_TARGET%" %*
