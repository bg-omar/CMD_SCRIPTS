:::::  Requires to have Environment Variable PY_HOME with %PY_HOME% added to path :::::::::::::

@echo off
echo setting PY_HOME ="C:\Python27;C:\Python27"
set PY_HOME="C:\Python27;C:\Python27"
echo setting PATH = %PY_HOME%; PATH
set PATH=%PY_HOME%;%PATH%
