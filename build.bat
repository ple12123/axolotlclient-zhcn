@echo off
REM AxolotlClient zhCN 一键编译脚本
REM 使用前请确认：
REM 1. 已安装 JDK 25
REM 2. 已设置 JAVA_HOME 指向 JDK 25 安装目录

echo ========================================
echo   AxolotlClient zhCN Injector - 编译脚本
echo ========================================
echo.

REM 检查 JAVA_HOME
if "%JAVA_HOME%"=="" (
    echo [错误] JAVA_HOME 未设置！
    echo 请先运行：set JAVA_HOME=C:\Program Files\Zulu\zulu-25
    echo 然后重新运行此脚本
    pause
    exit /b 1
)

echo [信息] 使用 JDK: %JAVA_HOME%
"%JAVA_HOME%\bin\java" -version 2>&1
echo.

REM 检查 wrapper jar 是否存在
if not exist "gradle\wrapper\gradle-wrapper.jar" (
    echo [警告] gradle-wrapper.jar 不存在
    echo 尝试用 Gradle 生成...
    echo.
    echo 如果你电脑上已安装 Gradle，请运行：
    echo   gradle wrapper --gradle-version 9.4.0
    echo.
    echo 如果没有安装 Gradle，请：
    echo   1. 下载 Gradle 9.4.0 zip 解压到任意目录
    echo   2. 把 gradle-9.4.0\lib\plugins\gradle-wrapper-* 里的 jar 复制到 gradle\wrapper\
    echo   3. 重命名为 gradle-wrapper.jar
    echo.
    pause
    exit /b 1
)

echo [信息] 开始编译...
echo.
call gradlew.bat --stop
call gradlew.bat build

if %ERRORLEVEL% neq 0 (
    echo.
    echo [错误] 编译失败！
    pause
    exit /b 1
)

echo.
echo ========================================
echo   编译成功！
echo   产物位置：build\libs\
echo ========================================
echo.
dir /b build\libs\*.jar 2>nul
echo.
echo 把这个 jar 文件复制到你的 .minecraft\mods\ 目录即可
echo.
pause
