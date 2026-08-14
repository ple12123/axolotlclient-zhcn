@echo off
REM 生成 Gradle Wrapper Jar
REM 运行方式：先确保 JAVA_HOME 指向 JDK 25，然后双击此文件或命令行运行
echo 正在生成 Gradle Wrapper...
echo 请确保已安装 JDK 25 并设置了 JAVA_HOME
echo.
pause
"%JAVA_HOME%\bin\java" -classpath "%~dp0gradle\wrapper\gradle-wrapper-generator.jar" org.gradle.wrapper.GradleWrapperMain wrapper --gradle-version 9.4.0
echo.
echo 如果上面报错，请手动执行：
echo gradle wrapper --gradle-version 9.4.0
echo （需要你电脑上已安装任意版本 Gradle）
pause
