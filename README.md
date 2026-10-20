# CarlosTexRpt

轻量、紧凑、工程友好的中文 XeLaTeX 小型报告类。

`CarlosTexRpt` 用于快速编写实验报告、设计说明、测试记录、技术分析、阶段总结和项目内部文档。它延续 `carlosreport` 的紧凑工程视觉，但刻意保持仓库和使用方式简单。

## 特性

- 基于 `ctexrep`，面向 A4 中文工程报告
- 固定使用 XeLaTeX，避免不同引擎造成 CJK 排版差异
- 标题、摘要、目录和正文共享同一紧凑页面，不生成“大论文式”独立封面
- `chapter` 不强制另起一页，适合约数页到数十页的技术文档
- 内置数学、`siunitx`、三线表、长表、子图、代码清单和交叉引用基础能力
- 可通过 `circuit` 类选项按需启用 CircuitikZ，默认采用矩形电阻与线圈形电感符号
- 蓝 / 青绿色工程视觉和简洁页眉页脚
- `chapter` / `section` / `subsection` / `subsubsection` 后的第一段均保持正常首行缩进
- 提供 VS Code + LaTeX Workshop 的最小 XeLaTeX 配置

## 目录

```text
.
├── .gitignore
├── .vscode/
│   └── settings.json
├── CarlosTexRpt.cls
├── LICENSE
├── README.md
└── main.tex
```

## 快速开始

克隆仓库后直接修改 `main.tex`：

```tex
\documentclass{CarlosTexRpt}

\title{项目阶段报告}
\author{Carlos QU}
\date{\today}

\begin{document}
\maketitle

\begin{abstract}
这里写摘要。
\end{abstract}

\tableofcontents

\chapter{概述}
标题后的第一段会正常首行缩进。

\section{设计}
正文内容。

\end{document}
```

### VS Code

安装 **LaTeX Workshop**，打开 `main.tex` 后使用默认的 `latexmk-xelatex` recipe。输出位于：

```text
build/main.pdf
```

### 命令行

```bash
latexmk -xelatex -outdir=build main.tex
```

也可以手动运行两次 XeLaTeX：

```bash
mkdir -p build
xelatex -output-directory=build main.tex
xelatex -output-directory=build main.tex
```

## 适用范围

推荐用于：

- 工程设计说明
- 实验与测试报告
- 技术调研与分析
- 项目阶段总结
- 内部评审材料
- 小型课程或研究报告

如果需要完整论文结构、GB/T 7714 参考文献工作流、复杂封面或更完整的模板工程，请使用 [CarlosTexArt](https://github.com/CCandle/CarlosTexArt)。

## 排版约定

正文默认首行缩进。标题后的第一段同样缩进，不需要 `\indent`、空命令或其他手工补丁。

章节使用标准 LaTeX 命令即可：

```tex
\chapter{系统设计}
\section{硬件结构}
\subsection{采样链路}
```

单位建议使用 `siunitx`：

```tex
\SI{200}{\kilo\hertz}
\SI{24}{\volt}
\SI{5}{\micro\second}
```

编译产物统一写入 `build/`，并由 `.gitignore` 排除。

## CircuitikZ 电路图（可选）

基础模板默认不加载 CircuitikZ，以保持轻量。需要绘制电路图时，将文档类声明写为 `\\documentclass[circuit]{CarlosTexRpt}`；该选项会加载 CircuitikZ，并采用矩形电阻（`europeanresistors`）与线圈形电感（`cuteinductors`）的混合风格。不要使用全局 `european` 选项，否则电感会变成矩形块。

示例环境直接写 `\\begin{circuitikz} ... \\end{circuitikz}` 即可，不需要在环境上重复指定 `american` 或 `european`。

## License

MIT License. See [LICENSE](LICENSE).
