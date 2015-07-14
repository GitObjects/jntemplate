@echo off

:: 本文件供官方发布版本专用，发布时会对程序进行强命名，用以与网友自行发布的DLL进行区分。
:: 普通用户需要发布自己的版本，可以直接使用build
:: 或者生成密钥后，再使用本文件。

echo 开始生成 JNTemplate ...

if not exist ..\lib\2.0 md ..\lib\2.0

if not exist ..\lib\4.0 md ..\lib\4.0

set fdir=%WINDIR%\Microsoft.NET\Framework

cd ../src/JinianNet.JNTemplate

%fdir%\v3.5\csc.exe /target:library /out:../../lib/2.0/JinianNet.JNTemplate.dll /doc:../../lib/2.0/JinianNet.JNTemplate.xml /keyfile:../../tool/jiniannet.snk /warn:3 /nologo /o /define:NET20 /recurse:*.cs

echo jntemplate for .net v2.0 生成完毕

%fdir%\v4.0.30319\csc.exe /target:library /out:../../lib/4.0/JinianNet.JNTemplate.dll /doc:../../lib/4.0/JinianNet.JNTemplate.xml /keyfile:../../tool/jiniannet.snk /warn:3 /nologo /o /define:NET40 /recurse:*.cs

echo jntemplate for .net v4.0 生成完毕

cd ..

cd ..

cd build

if exist ..\src\JinianNet.JNTemplate.Test\dll\JinianNet.JNTemplate.dll del ..\src\JinianNet.JNTemplate.Test\dll\JinianNet.JNTemplate.dll
copy ..\lib\2.0\JinianNet.JNTemplate.dll ..\src\JinianNet.JNTemplate.Test\dll\JinianNet.JNTemplate.dll

echo 生成完成...

pause