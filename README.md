<div align="center">

[![gdue_logo](source/logo-name.png)](https://github.com/KevinGuo1007/GDUE-Beamer-Slides-Theme)

[简体中文](README.md) | [English](README.en.md)

# GDUE Beamer Slides Theme
[![LaTeX Build](https://github.com/KevinGuo1007/GDUE-Beamer-Slides-Theme/actions/workflows/latex.yml/badge.svg)](https://github.com/KevinGuo1007/GDUE-Beamer-Slides-Theme/actions/workflows/latex.yml)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://github.com/KevinGuo1007/GDUE-Beamer-Slides-Theme/blob/main/LICENSE)
[![Docs](https://img.shields.io/badge/docs-USAGE-blue)](https://github.com/KevinGuo1007/GDUE-Beamer-Slides-Theme/blob/main/docs/USAGE.md)
[![GitHub release](https://img.shields.io/github/v/release/KevinGuo1007/GDUE-Beamer-Slides-Theme)](https://github.com/KevinGuo1007/GDUE-Beamer-Slides-Theme/releases)

</div>

GDUE Beamer Slides Theme 是一个面向广东第二师范学院场景的 Beamer 幻灯片主题仓库，提供了可直接复用的主题包、默认视觉资源、示例文档，以及一套清晰的构建与维护流程。

## Features

- 标准 Beamer 主题入口：支持使用 `\usetheme{gdue}` 接入主题，同时保留 `gdue.sty` 兼容层。
- 完整页面样式：内置封面页、顶部页眉、底部进度条、章节目录过渡页和结束页。
- 可切换主题选项：支持 `progressbar`、`sectionpage`、`darkmode`、`serif` 四个开关。
- 可覆盖默认资源：支持自定义 logo、watermark、tagline、章节背景和结束页图片，无需改动主题源码。
- 内置代码展示能力：集成 `listings` 并提供统一风格的 `codeblock` 环境。
- 提供两套示例：`main.tex` 用于快速起步，`demo/demo.tex` 用于展示更完整的用法。
- 构建链路完整：提供 `Makefile` 本地构建命令，以及 GitHub Actions 持续编译检查。

## Quick Start

快速配置环境并构建 slide 。

### 1. 准备环境

第一次使用 LaTeX 时，最容易混淆的是“编辑器”和“TeX 发行版”：

- `VS Code`、`TeXstudio` 这类工具只是编辑器，用来写 `.tex` 文件。
- 真正负责编译 PDF 的是 TeX 发行版；只要装好一个完整发行版，通常就已经包含 `latexmk`，不需要再单独安装。

如果你想尽快把环境跑起来，按操作系统选一个安装即可：

- macOS：安装 `MacTeX`，通常最省事，装完即可直接使用。
- Windows：安装 `MiKTeX`，对新手比较友好，第一次编译时可以按提示自动补装缺失宏包。
- Linux：安装 `TeX Live`，优先使用发行版提供的完整包；如果不是完整安装，至少要确保包含 `latexmk`。

安装完成后，重新打开一个终端窗口，执行：

```bash
latexmk -v
```

如果终端能输出版本号，就说明 `latexmk` 已经安装成功，可以继续编译本项目。

如果提示 `command not found`，通常是下面几种情况：

- 你装的是编辑器，还没有安装真正的 TeX 发行版。
- 安装刚完成，但终端还没有重开。
- TeX 发行版的命令目录还没有加入 `PATH`。

### 2. 获取项目并编译示例

```bash
git clone https://github.com/KevinGuo1007/GDUE-Beamer-Slides-Theme.git
cd GDUE-Beamer-Slides-Theme
make main
```

执行后会在仓库根目录生成 `main.pdf`。

### 3. 修改你的第一页内容

直接编辑 [`main.tex`](main.tex) 里的标题信息：

```tex
\title{Your Title}
\subtitle{Your Subtitle}
\author{Your Name}
\institute{Guangdong University of Education}
\date{\today}
```

然后继续在正文里添加页面：

```tex
\begin{frame}{Hello}
  Hello, GDUE theme.
\end{frame}
```

修改完成后重新编译：

```bash
make main
```

### 4. 结束页

在文档最后保留：

```tex
\backmatter
```

它会生成主题内置的结束页。

## Usage

说明项目的构建方式、主题入口和常用代码，方便你基于仓库继续扩展。

### Build Workflow

仓库根目录提供了统一的 `Makefile` 工作流：

```bash
make main       # 编译根目录下的 main.tex
make demo       # 编译 demo/demo.tex
make check      # 一次性编译全部示例
make clean      # 清理中间文件
make distclean  # 清理中间文件和生成的 PDF
```

如果你希望把主题安装到本机 TeX 树中，便于在多个项目里复用：

```bash
make install
make uninstall
```

说明：

- `make install` 当前安装的是 `beamerthemegdue.sty` 和 `gdue.sty` 两个主题文件。
- 默认图片资源仍然建议随项目一起保存，或者在文档中显式覆盖资源路径。
- `make check` 与 CI 中的编译检查保持一致，适合作为提交前自检命令。

### Minimal Document Structure

一个最小可用的文档结构如下：

```tex
\documentclass[10pt,aspectratio=169]{beamer}
\usetheme{gdue}

\title{A minimal example}
\author{Your Name}
\date{\today}

\begin{document}
\maketitle

\section{Introduction}

\begin{frame}{Hello}
  Hello, GDUE theme.
\end{frame}

\backmatter
\end{document}
```

可以按下面的顺序理解这份结构：

- `\documentclass[...]{beamer}`：声明这是一个 Beamer 幻灯片文档。
- `\usetheme{gdue}`：启用本项目提供的主题。
- `\maketitle`：生成封面页。
- `\section{...}`：定义章节；如果开启 `sectionpage`，会自动插入章节目录过渡页。
- `\begin{frame}...\end{frame}`：定义普通内容页。
- `\backmatter`：生成结束页，`\makebottom` 也可达到相同效果。

### Theme Options

主题支持以下选项：

```tex
\usetheme[
  progressbar=true,
  sectionpage=true,
  darkmode=false,
  serif=true
]{gdue}
```

- `progressbar=true|false`：是否显示底部进度条，默认 `true`。
- `sectionpage=true|false`：是否在每个 section 开头插入目录过渡页，默认 `true`。
- `darkmode=true|false`：是否启用深色主题配色，默认 `false`。
- `serif=true|false`：是否启用衬线字体主题，默认 `true`。

### Asset Customization

默认资源位于 `source/` 目录。你可以通过公开命令覆盖资源目录或单个文件名：

```tex
\gduesetresourcepath{./assets}
\gduesetlogoname{school-logo.png}
\gduesetheadlogo{logo-light.png}
\gduesetwatermark{logo-bg.png}
\gduesettagline{tagline.png}
\gduesetsilhouette{campus.pdf}
\gduesetlastframe{thanks.png}
```

适合以下场景：

- 保留主题整体排版，只替换学校或学院 logo。
- 在不同报告里复用同一主题，但更换封面或结束页图片。
- 在独立项目目录中通过 `\gduesetresourcepath{...}` 指向自己的资源目录。

### Code Blocks

主题已经内置 `listings` 样式，并提供 `codeblock` 环境：

```tex
\begin{frame}[fragile]{Code}
\begin{codeblock}[language=Python]{Example}
print("Hello, GDUE")
\end{codeblock}
\end{frame}
```

当页面中包含代码时，请记得给 `frame` 增加 `[fragile]` 选项。

### Repository Layout

```text
.
├── beamerthemegdue.sty      # 主主题文件，包含颜色、字体、模板和公开命令
├── gdue.sty                 # 兼容层，转发旧入口到 beamerthemegdue.sty
├── main.tex                 # 最小起步示例
├── demo/
│   └── demo.tex             # 更完整的用法演示
├── source/                  # 默认图片资源
├── docs/
│   └── USAGE.md             # 补充使用说明
├── Makefile                 # 本地构建、清理、安装命令
└── .github/workflows/
    └── latex.yml            # GitHub Actions 编译检查
```

## Documentation

- 使用说明：[`docs/USAGE.md`](docs/USAGE.md)
- 贡献指南：[`CONTRIBUTING.md`](CONTRIBUTING.md)
- 变更记录：[`CHANGELOG.md`](CHANGELOG.md)

## Acknowledgements

- [matze/mtheme](https://github.com/matze/mtheme)
- [wurahara/PolyU-Beamer-Slides](https://github.com/wurahara/PolyU-Beamer-Slides)

## License

[MIT](LICENSE)
