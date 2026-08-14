> ⚠️ 本项目已归档，不再更新。MC 26.1.2 / AxolotlClient 3.2.1 可用。
# AxolotlClient zhCN Injector

通过 Fabric Mixin 在运行时把简体中文翻译注入 AxolotlClient 3.2.x（MC 26.1.2）。

## 环境要求
- JDK 25（推荐 Zulu 25）
- Gradle 9.4.0（wrapper 配置已内置，缺 jar 时见下方说明）
- Minecraft 26.1.2 + Fabric Loader 0.19.3
- AxolotlClient 3.2.1+26.1（建议）

## 首次使用：生成 gradle-wrapper.jar

项目里的 `gradle/wrapper/gradle-wrapper.jar` 需要你本地生成（因为网络原因无法自动下载）。

**最简单的方法：** 如果你电脑上已经装了任意版本 Gradle：
```powershell
cd axolotlclient-zhcn
gradle wrapper --gradle-version 9.4.0
```
这会自动下载 Gradle 9.4.0 并生成 `gradle-wrapper.jar`。

**如果没有装 Gradle：**
1. 去 https://gradle.org/releases/ 下载 Gradle 9.4.0 bin.zip
2. 解压到任意目录（如 `C:\Gradle\gradle-9.4.0`）
3. 把 `C:\Gradle\gradle-9.4.0\bin` 加到系统 PATH
4. 重新打开 PowerShell，运行上面的 `gradle wrapper` 命令

## 编译
```powershell
# 设置 JDK 25（仅当前窗口有效）
$env:JAVA_HOME="C:\Program Files\Zulu\zulu-25"
$env:PATH="$env:JAVA_HOME\bin;$env:PATH"

# 进入项目目录
cd F:\Downloads\axolotlclient-zhcn

# 一键编译（或直接双击 build.bat）
.\gradlew.bat build
```

成功后在 `build\libs\` 里找到 `axolotlclient-zhcn-1.0.0+26.1.jar`。

## 使用
把 jar 丢进 `.minecraft\mods\` 目录，启动游戏即可。

- 此 mod 只负责补充 AxolotlClient 自身的翻译键

## 自定义翻译
编辑 `src\main\resources\assets\axolotlclient\lang\zh_cn.json`，
添加/修改键值对后重新编译即可。

## 工作原理
Mixin 切入 `net.minecraft.client.resources.language.ClientLanguage` 的构造方法，
在其创建翻译 Map 后、游戏使用之前，把我们的 zh_cn.json 键值对塞进去。
这样 AxolotlClient 调用 `Text.translatable("axolotlclient.xxx")` 时就能取到中文。

## 日志确认
启动游戏后查看 `logs/latest.log`，搜索 `AxolotlClient-zhCN`：
- 看到 `成功注入 xxx 条简体中文翻译` → 成功
- 看到 `zh_cn.json not found` → zh_cn.json 路径不对
- 看到其他错误 → 把日志贴给“有用的AI”

## 许可证
- 原始英文文本版权归 AxolotlClient 团队所有
