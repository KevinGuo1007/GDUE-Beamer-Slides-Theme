# GDUE-Beamer-Slides-Theme

欢迎使用 GDUE Beamer Slides Theme! 🥳

GDUE Beamer Slides Theme 是广东第二师范学院的非官方 Beamer 模版。您可以使用该主题模板制作幻灯片，展示您的成果。

本主题基于 [PolyU-Beamer-Slides](https://github.com/wurahara/PolyU-Beamer-Slides?tab=readme-ov-file) 制作，支持现代化的排版风格、清晰的版面布局，帮助你快速制作高质量的幻灯片。

## 快速上手 👋

该仓库主要包含 'gdue.sty' 和 'main.tex'，项目结构如下：
```
.
├──.gitignore
├── gdue.sty
├── LICENSE
├── main.pdf
├── main.tex
├── README.md
└── source
    ├── last-frame.png
    ├── logo-name.png
    ├── logo-trans.png
    ├── logo-white.png
    ├── silhouette.pdf
    └── tagline.png
```

目前的 'main.tex' 是一个示例文档《如何使用 LaTeX 排版论文》。您可以将里面的内容替换掉。下面是一个最简示例：
<details>

<summary>点击展开代码片段</summary>

```latex
\documentclass[
    % draft,          % 草稿模式
    aspectratio=169,  % 使用 16:9 比例
]{ctexbeamer}
\mode<presentation>

\usetheme[min]{sjtubeamer}
% 使用 maxplus/max/min 切换标题页样式
% 使用 red/blue 切换主色调
% 使用 light/dark 切换亮/暗色模式
% 使用外样式关键词以获得不同的边栏样式
%   miniframes infolines  sidebar 
%   default    smoothbars split	 
%   shadow     tree       smoothtree
% 使用 topright/bottomright 切换徽标位置
% 使用逗号分隔列表以同时使用多种选项

% \tikzexternalize[prefix=build/]
% 如果您需要缓存 tikz 图像，请取消注释上一行，并在编译选项中添加 -shell-escape。

\usepackage[backend=biber,style=gb7714-2015]{biblatex}
\addbibresource{thesis.bib}

\institute[SJTUG]{上海交通大学 Linux 用户组} % 组织

\title{SJTUBeamer 幻灯片模板}         % 标题
\subtitle{SJTUBeamer Template}       % 副标题
\author{SJTUG}                       % 作者
\date{\today}                        % 日期  

\begin{document}

\maketitle                           % 创建标题页

\part{第一部分}

% 使用节目录
\AtBeginSection[]{
  \begin{frame}
    % \tableofcontents[currentsection,hideallsubsections]  % 传统节目录             
    \sectionpage                        % 节页
  \end{frame}
}

\section{第 1 节}

\begin{frame}
  \frametitle{标题}
  \paragraph{列表} 这个\alert{幻灯片}有下面几项：
  \begin{itemize}
    \item 第 1 项
    \item 第 2 项
    \item 第 3 项
  \end{itemize}
\end{frame}

\begin{frame}
  \frametitle{标题}
  \framesubtitle{子标题}
  \begin{equation}
    x^2+2x+1=(x+1)^2
  \end{equation}
\end{frame}

\section{第 2 节}
\begin{frame}
  \frametitle{一些盒子}
  \begin{block}{盒子}
    这是一个盒子\cite{thelegendofjiang}
  \end{block}
  \begin{alertblock}{注意}
    注意内容
  \end{alertblock}
  \begin{exampleblock}{示例}
    示例内容
  \end{exampleblock}
\end{frame}

\begin{frame}[fragile]          % 注意添加 fragile 标记
  \frametitle{代码块}
  % 代码块参数：语言，标题
  % 请减少代码初始的缩进
  \begin{codeblock}[language=c++]{C++代码}
#include<iostream>

int main(){
  // Console Output
  std::cout << "Hello, SJTU!" << std::endl;
  return 0;
}
  \end{codeblock}
\end{frame}

\part{参考文献}
\begin{frame}[allowframebreaks]
  \printbibliography[heading=none]
\end{frame}

\makebottom       % 创建结束页

\end{document}
```

</details>



> ⚠️ **caution**  
> 本 theme 中 slide 的背景里的建筑物为原 PolyU theme 的建筑物图片，如果有同学有相关合适的照片请在 discuss 中联系我。