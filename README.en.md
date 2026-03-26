<div align="center">

[![gdue_logo](source/logo-name.png)](https://github.com/KevinGuo1007/GDUE-Beamer-Slides-Theme)

[简体中文](README.md) | [English](README.en.md)

# GDUE Beamer Slides Theme
[![LaTeX Build](https://github.com/KevinGuo1007/GDUE-Beamer-Slides-Theme/actions/workflows/latex.yml/badge.svg)](https://github.com/KevinGuo1007/GDUE-Beamer-Slides-Theme/actions/workflows/latex.yml)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://github.com/KevinGuo1007/GDUE-Beamer-Slides-Theme/blob/main/LICENSE)
[![Docs](https://img.shields.io/badge/docs-USAGE-blue)](https://github.com/KevinGuo1007/GDUE-Beamer-Slides-Theme/blob/main/docs/USAGE.md)
[![GitHub release](https://img.shields.io/github/v/release/KevinGuo1007/GDUE-Beamer-Slides-Theme)](https://github.com/KevinGuo1007/GDUE-Beamer-Slides-Theme/releases)

</div>

GDUE Beamer Slides Theme is a Beamer theme repository tailored for Guangdong University of Education use cases. It includes a reusable theme package, default visual assets, example documents, and a straightforward build workflow for daily use and maintenance.

## Features

- Standard Beamer entrypoint: use the theme via `\usetheme{gdue}`, with `gdue.sty` kept as a compatibility wrapper.
- Complete page styling: built-in title page, headline, bottom progress bar, section transition page, and final slide.
- Configurable theme switches: supports `progressbar`, `sectionpage`, `darkmode`, `serif`, and `language`.
- English and Chinese content: English is the default; switch to `language=zh` when your deck contains Chinese text.
- Asset override hooks: replace logos, watermark, tagline, section background, and final-slide image without editing theme source.
- Built-in code presentation: integrates `listings` and provides a consistent `codeblock` environment.
- Two example decks: `main.tex` for quick onboarding and `demo/demo.tex` for broader usage coverage.
- Full build support: includes local `Makefile` targets and GitHub Actions compile checks.

## Quick Start

This section is only about getting your first slide deck compiled as quickly as possible.

### 1. Prepare the environment

If this is your first time using LaTeX, the most common confusion is the difference between an editor and a TeX distribution:

- Tools like `VS Code` and `TeXstudio` are just editors for writing `.tex` files.
- The program that actually compiles your PDF is the TeX distribution. Once you install one full distribution, it usually already includes `latexmk`, so you do not need to install `latexmk` separately.

To get started quickly, pick one based on your operating system:

- macOS: install `MacTeX`. It is usually the simplest option and works out of the box.
- Windows: install `MiKTeX`. It is beginner-friendly and can often install missing packages automatically during the first build.
- Linux: install `TeX Live`. Prefer your distribution's full package set; if you use a smaller install, make sure `latexmk` is included.

This repository builds with `XeLaTeX` by default so the same template can handle both English and Chinese content. After installation, reopen your terminal and run:

```bash
latexmk -v
xelatex --version
```

If both commands print a version number, the required tools for this project are installed correctly.

If you get `command not found`, it usually means one of these:

- You installed only an editor, not an actual TeX distribution.
- The installation just finished and the terminal has not been reopened yet.
- The TeX distribution's binary directory is not in your `PATH`.
- Your TeX installation is too minimal and does not include `xelatex`.

### 2. Clone the repository and build the starter deck

```bash
git clone https://github.com/KevinGuo1007/GDUE-Beamer-Slides-Theme.git
cd GDUE-Beamer-Slides-Theme
make main
```

This generates `main.pdf` in the repository root.

### 3. Edit the first slide deck

Update the metadata in [`main.tex`](main.tex):

```tex
\title{Your Title}
\subtitle{Your Subtitle}
\author{Your Name}
\institute{Guangdong University of Education}
\date{\today}
```

Add your own frame content:

```tex
\begin{frame}{Hello}
  Hello, GDUE theme.
\end{frame}
```

Then rebuild:

```bash
make main
```

### 4. Keep the final slide

At the end of the document, keep:

```tex
\backmatter
```

This generates the built-in closing slide.

## Usage

This section explains the build workflow, theme entry, and the most useful code patterns in the repository.

### Build Workflow

The repository root provides a unified `Makefile` workflow:

```bash
make main       # build main.tex in the repository root
make demo       # build demo/demo.tex
make check      # build all example decks
make clean      # remove intermediate build files
make distclean  # remove intermediate files and generated PDFs
```

If you want to install the theme into your local TeX tree for reuse across projects:

```bash
make install
make uninstall
```

Notes:

- `make install` currently installs the two theme files: `beamerthemegdue.sty` and `gdue.sty`.
- Default image assets are still best kept alongside your project, or explicitly overridden in your document.
- `make check` matches the CI compile check and is a good pre-commit verification command.

### Minimal Document Structure

A minimal working document looks like this:

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

You can read it in this order:

- `\documentclass[...]{beamer}` declares a Beamer slide deck.
- `\usetheme{gdue}` enables the GDUE theme.
- `\maketitle` renders the title page.
- `\section{...}` defines a section; if `sectionpage` is enabled, a section transition slide is inserted automatically.
- `\begin{frame}...\end{frame}` defines a normal content slide.
- `\backmatter` renders the final slide. `\makebottom` behaves the same way.

### Theme Options

The theme supports the following switches:

```tex
\usetheme[
  progressbar=true,
  sectionpage=true,
  darkmode=false,
  serif=true,
  language=en
]{gdue}
```

- `progressbar=true|false`: show or hide the bottom progress bar. Default: `true`.
- `sectionpage=true|false`: show or hide the section transition page. Default: `true`.
- `darkmode=true|false`: switch to the dark color palette. Default: `false`.
- `serif=true|false`: enable or disable the serif font theme. Default: `true`.
- `language=en|zh`: document language support. Default: `en`; set it to `zh` to enable Chinese content support.

### Language Support

By default, the theme behaves like an English-first template. These two forms are equivalent:

```tex
\usetheme{gdue}
% or
\usetheme[language=en]{gdue}
```

If your slide titles, body text, or table of contents contain Chinese, switch to Chinese mode:

```tex
\usetheme[
  progressbar=true,
  sectionpage=true,
  language=zh
]{gdue}
```

Notes:

- `language=zh` loads Chinese support inside the theme, so you do not need to add `\usepackage{ctex}` yourself.
- `make main` and `make demo` already use `XeLaTeX`, so you do not need a different build command for English vs. Chinese decks.
- English remains the default. If your deck is entirely in English, `\usetheme{gdue}` is enough.

### Asset Customization

Default assets are stored in `source/`. You can override either the resource directory or individual filenames:

```tex
\gduesetresourcepath{./assets}
\gduesetlogoname{school-logo.png}
\gduesetheadlogo{logo-light.png}
\gduesetwatermark{logo-bg.png}
\gduesettagline{tagline.png}
\gduesetsilhouette{campus.pdf}
\gduesetlastframe{thanks.png}
```

This is useful when you want to:

- keep the same layout but swap in a different school or department logo,
- reuse the theme across multiple decks with different cover or closing images,
- point the theme to an external asset folder in your own project.

### Code Blocks

The theme already configures `listings` and provides a `codeblock` environment:

```tex
\begin{frame}[fragile]{Code}
\begin{codeblock}[language=Python]{Example}
print("Hello, GDUE")
\end{codeblock}
\end{frame}
```

When a slide contains code, remember to mark the frame as `[fragile]`.

### Repository Layout

```text
.
├── beamerthemegdue.sty      # main theme implementation: colors, fonts, templates, public hooks
├── gdue.sty                 # compatibility wrapper for the legacy entrypoint
├── main.tex                 # minimal starter example
├── demo/
│   └── demo.tex             # broader usage demonstration
├── source/                  # default image assets
├── docs/
│   └── USAGE.md             # supplemental usage notes
├── Makefile                 # local build, clean, and install commands
└── .github/workflows/
    └── latex.yml            # GitHub Actions compile check
```

## Documentation

- Usage notes: [`docs/USAGE.md`](docs/USAGE.md)
- Contributing guide: [`CONTRIBUTING.md`](CONTRIBUTING.md)
- Changelog: [`CHANGELOG.md`](CHANGELOG.md)

## Acknowledgements

- Project repo structure & CI Action was inspired by [matze/mtheme](https://github.com/matze/mtheme)
- The design of beamer slide draws inspiration from [wurahara/PolyU-Beamer-Slides](https://github.com/wurahara/PolyU-Beamer-Slides)

## License

[MIT](LICENSE)
