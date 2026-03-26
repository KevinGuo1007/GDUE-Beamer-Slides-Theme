# GDUE Beamer Slides Theme

GDUE Beamer Slides Theme 是一个面向广东第二师范学院场景的 Beamer 幻灯片主题。
本仓库参考了 [matze/mtheme](https://github.com/matze/mtheme) 的工程组织方式，目标是做到：

- 易上手：新用户几分钟内可编译出第一份幻灯片
- 易维护：主题代码、示例、文档、构建流程清晰分离
- 易扩展：支持主题选项与资源覆盖，不需要频繁改主题源码

## Features

- 标准 Beamer 主题入口：`\usetheme{gdue}`
- 可配置主题选项：`progressbar`、`sectionpage`、`darkmode`、`serif`
- 内置封面、章节过渡页、结束页
- 内置代码高亮风格与 `codeblock` 环境
- 提供最小示例（`main.tex`）和完整示例（`demo/demo.tex`）
- 提供 `Makefile` 与 CI 编译流程

## Installation

### 1) 在单个项目中使用（推荐新手）

将以下文件复制到你的幻灯片工程目录：

- `beamerthemegdue.sty`
- `gdue.sty`（兼容层，可选）
- `source/` 目录（默认图片资源）

然后在 tex 文件中使用：

```tex
\documentclass{beamer}
\usetheme{gdue}
```

### 2) 安装到本机 TeX 树（复用到多个项目）

```bash
make install
```

卸载：

```bash
make uninstall
```

## Usage

### Minimal example

```tex
\documentclass[aspectratio=169]{beamer}
\usetheme{gdue}

\title{A minimal example}
\author{Your Name}
\date{\today}

\begin{document}
\maketitle

\begin{frame}{Hello}
  Hello, GDUE theme.
\end{frame}

\backmatter
\end{document}
```

### Theme options

```tex
\usetheme[
  progressbar=true,
  sectionpage=true,
  darkmode=false,
  serif=true
]{gdue}
```

可用选项：

- `progressbar=true|false`：是否显示底部进度条（默认 `true`）
- `sectionpage=true|false`：是否在每个 section 开头展示目录过渡页（默认 `true`）
- `darkmode=true|false`：是否启用深色模式（默认 `false`）
- `serif=true|false`：是否使用衬线字体主题（默认 `true`）

### Asset override

你可以不修改主题源码，直接覆盖资源路径或文件名：

```tex
\gduesetresourcepath{./assets}
\gduesetlogoname{school-logo.png}
\gduesetheadlogo{logo-light.png}
\gduesetwatermark{logo-bg.png}
\gduesetsilhouette{campus.pdf}
\gduesetlastframe{thanks.png}
```

## Repository Layout

```text
.
├── beamerthemegdue.sty      # 主主题文件（推荐入口：\usetheme{gdue}）
├── gdue.sty                 # 兼容层（旧用法 \usepackage{gdue}）
├── main.tex                 # 最小可运行示例
├── demo/
│   └── demo.tex             # 完整示例
├── source/                  # 默认图片资源
├── docs/
│   └── USAGE.md             # 详细使用说明
├── Makefile                 # 构建与安装命令
└── .github/workflows/
    └── latex.yml            # CI 编译检查
```

## Development

编译所有示例：

```bash
make check
```

只编译最小示例：

```bash
make main
```

只编译完整示例：

```bash
make demo
```

清理中间文件：

```bash
make clean
```

彻底清理（包含 PDF）：

```bash
make distclean
```

## Documentation

- 详细使用说明：[`docs/USAGE.md`](docs/USAGE.md)
- 贡献指南：[`CONTRIBUTING.md`](CONTRIBUTING.md)
- 变更记录：[`CHANGELOG.md`](CHANGELOG.md)

## Acknowledgements

- [matze/mtheme](https://github.com/matze/mtheme)
- [wurahara/PolyU-Beamer-Slides](https://github.com/wurahara/PolyU-Beamer-Slides)

## License

[MIT](LICENSE)
