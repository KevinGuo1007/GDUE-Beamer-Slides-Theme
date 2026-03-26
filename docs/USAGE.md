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
  serif=true,
  language=en
]{gdue}
```

- `progressbar`: show or hide the bottom progress bar.
- `sectionpage`: show or hide section transition slides.
- `darkmode`: switch to a dark palette.
- `serif`: switch between serif and default beamer fonts.
- `language`: use `en` for the default English setup, or `zh` for Chinese content support.

## 3. Language Support

English is the default:

```tex
\usetheme{gdue}
% or
\usetheme[language=en]{gdue}
```

For Chinese content, switch the theme option:

```tex
\usetheme[language=zh]{gdue}
```

When `language=zh` is enabled, the theme loads `ctex` with the `fandol` fontset, so you do not need to add `\usepackage{ctex}` manually. Repository `make` targets compile with `XeLaTeX` by default, which works for both English and Chinese decks.

## 4. Asset Configuration

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

## 5. Code Blocks

The theme configures `listings` and provides `codeblock`:

```tex
\begin{frame}[fragile]{Code}
\begin{codeblock}[language=Python]{Example}
print("Hello, GDUE")
\end{codeblock}
\end{frame}
```

## 6. Final Slide

Use either command below (identical behavior):

```tex
\backmatter
% or
\makebottom
```

## 7. Build Commands

From repository root:

```bash
make main
make demo
make check
make clean
```
