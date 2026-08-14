如何获取 gradle-wrapper.jar
================================

方案一：用本地已安装的 Gradle（推荐）
1. 确保电脑上装了任意版本 Gradle（没有就去 https://gradle.org/install/ 下一个）
2. 打开 CMD，cd 到 axolotlclient-zhcn 目录
3. 运行：gradle wrapper --gradle-version 9.4.0
4. 会自动生成 gradle/wrapper/gradle-wrapper.jar

方案二：手动下载
1. 去 https://services.gradle.org/distributions/ 下载 gradle-9.4.0-bin.zip
2. 解压后进入 lib/plugins/ 目录
3. 找到 gradle-wrapper-*.jar
4. 复制到项目中 gradle/wrapper/ 目录
5. 重命名为 gradle-wrapper.jar

方案三：用 IDE 生成
1. 用 IntelliJ IDEA 打开此项目文件夹
2. IDEA 会自动检测 Gradle 项目并生成 wrapper

完成后双击 build.bat 即可一键编译
