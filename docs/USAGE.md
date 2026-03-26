# Usage Guide

## 1. Basic Setup

```tex
\documentclass[10pt,aspectratio=169]{beamer}
\usetheme{gdue}

\title{Your Title}
\author{Your Name}
\date{\today}

\begin{document}
\maketitle
\end{document}
```

## 2. Theme Options

```tex
\usetheme[
  progressbar=true,
  sectionpage=true,
  darkmode=false,
  serif=true
]{gdue}
```

- `progressbar`: show or hide the bottom progress bar.
- `sectionpage`: show or hide section transition slides.
- `darkmode`: switch to a dark palette.
- `serif`: switch between serif and default beamer fonts.

## 3. Asset Configuration

Default assets are loaded from `source/`.

```tex
\gduesetresourcepath{./assets}
\gduesetlogoname{logo-name.png}
\gduesetheadlogo{logo-white.png}
\gduesetwatermark{logo-trans.png}
\gduesettagline{tagline.png}
\gduesetsilhouette{silhouette.pdf}
\gduesetlastframe{last-frame.png}
```

## 4. Code Blocks

The theme configures `listings` and provides `codeblock`:

```tex
\begin{frame}[fragile]{Code}
\begin{codeblock}[language=Python]{Example}
print("Hello, GDUE")
\end{codeblock}
\end{frame}
```

## 5. Final Slide

Use either command below (identical behavior):

```tex
\backmatter
% or
\makebottom
```

## 6. Build Commands

From repository root:

```bash
make main
make demo
make check
make clean
```
