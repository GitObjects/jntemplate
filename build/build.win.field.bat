@echo off

echo 开始生成 JNTemplate (支持字段版)...
set fdir=%WINDIR%\Microsoft.NET\Framework
set key_param=/warn:3 /nologo /o /recurse:*.cs

cd ../src/JinianNet.JNTemplate

if exist ../../tool/jiniannet.snk set key_param=/keyfile:../../tool/jiniannet.snk %key_param%

if exist %fdir%\v3.5\csc.exe goto BUILD20
if exist %fdir%\v4.0.30319\csc.exe goto BUILD40
goto SUCCESS

:BUILD20
if not exist ..\..\lib\2.0 md ..\..\lib\2.0
%fdir%\v3.5\csc.exe /target:library /out:../../lib/2.0/JinianNet.JNTemplate.dll /doc:../../lib/2.0/JinianNet.JNTemplate.xml %key_param% /define:NEEDFIELD,NET20
echo jntemplate for .net v2.0 生成完毕

:BUILD40
if not exist ..\..\lib\4.0 md ..\..\lib\4.0
%fdir%\v4.0.30319\csc.exe /target:library /out:../../lib/4.0/JinianNet.JNTemplate.dll /doc:../../lib/4.0/JinianNet.JNTemplate.xml %key_param% /define:NEEDFIELD,NET40
echo jntemplate for .net v4.0 生成完毕

:SUCCESS

cd ..
cd ..
cd build

if exist ..\src\JinianNet.JNTemplate.Test\dll\JinianNet.JNTemplate.dll del ..\src\JinianNet.JNTemplate.Test\dll\JinianNet.JNTemplate.dll
copy ..\lib\2.0\JinianNet.JNTemplate.dll ..\src\JinianNet.JNTemplate.Test\dll\JinianNet.JNTemplate.dll
echo 生成完成...
pause
