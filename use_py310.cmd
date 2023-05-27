:::::  Requires to have Environment Variable PY_HOME with %PY_HOME% added to path :::::::::::::

@echo off
echo setting PY_HOME ="C:\Python310;C:\Python310"
set PY_HOME="C:\Python310;C:\Python310"
echo setting PATH = %PY_HOME%; PATH
set PATH=%PY_HOME%;%PATH%
