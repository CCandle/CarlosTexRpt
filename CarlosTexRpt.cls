\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{CarlosTexRpt}[2026/08/13 v0.1.0 Compact engineering report class by Carlos QU]

% CarlosTexRpt intentionally targets XeLaTeX for predictable CJK typography.
\RequirePackage{iftex}
\RequireXeTeX

\LoadClass[UTF8,zihao=-4,openany]{ctexrep}

% -----------------------------------------------------------------------------
% Compact page geometry and body typography
% -----------------------------------------------------------------------------
\RequirePackage[a4paper,top=1.85cm,bottom=1.85cm,left=2.05cm,right=2.05cm,headheight=24pt,headsep=0.55cm,footskip=0.85cm]{geometry}
\RequirePackage{setspace}
\setstretch{1.10}
\setlength{\parindent}{1.75em}
\setlength{\parskip}{0.18em}
\setcounter{secnumdepth}{3}
\setcounter{tocdepth}{2}
\raggedbottom

% -----------------------------------------------------------------------------
% Mathematics, tables, figures and code
% -----------------------------------------------------------------------------
\RequirePackage{amsmath,amssymb,mathtools}
\RequirePackage{graphicx}
\RequirePackage{booktabs}
\RequirePackage{longtable}
\RequirePackage{tabularx}
\RequirePackage{array}
\RequirePackage{multirow}
\RequirePackage{siunitx}
\RequirePackage{enumitem}
\RequirePackage{caption}
\RequirePackage{subcaption}
\RequirePackage{float}
\RequirePackage[table]{xcolor}
\RequirePackage{listings}
\RequirePackage{microtype}
\RequirePackage{needspace}
\RequirePackage{etoolbox}
\RequirePackage{tcolorbox}
\tcbuselibrary{skins,breakable}

% -----------------------------------------------------------------------------
% Headings, contents, links and page furniture
% -----------------------------------------------------------------------------
\RequirePackage{titlesec}
\RequirePackage{titletoc}
\RequirePackage{fancyhdr}
\RequirePackage{xurl}
\RequirePackage[unicode,colorlinks=true]{hyperref}
\RequirePackage{bookmark}

% -----------------------------------------------------------------------------
% Palette: calm technical blue + teal, with a warm secondary accent
% -----------------------------------------------------------------------------
\definecolor{CarlosNavy}{HTML}{18384F}
\definecolor{CarlosBlue}{HTML}{236A91}
\definecolor{CarlosTeal}{HTML}{2A9D8F}
\definecolor{CarlosGold}{HTML}{E9A23B}
\definecolor{CarlosInk}{HTML}{26323B}
\definecolor{CarlosMuted}{HTML}{667681}
\definecolor{CarlosRule}{HTML}{D7E0E5}
\definecolor{CarlosPanel}{HTML}{F3F7F8}
\definecolor{CarlosCode}{HTML}{F6F8FA}
\definecolor{CarlosString}{HTML}{8B4A68}
\definecolor{CarlosComment}{HTML}{6D7F73}

\color{CarlosInk}
\hypersetup{
  linkcolor=CarlosBlue,
  citecolor=CarlosTeal,
  urlcolor=CarlosBlue,
  pdfborder={0 0 0}
}

% -----------------------------------------------------------------------------
% Compact title block: title, author and date share the first page with abstract
% -----------------------------------------------------------------------------
\makeatletter
\renewcommand{\maketitle}{%
  \thispagestyle{empty}%
  \noindent
  \begin{tcolorbox}[
    enhanced,
    colback=CarlosNavy,
    colframe=CarlosNavy,
    boxrule=0pt,
    arc=2.2mm,
    left=8mm,right=8mm,top=7mm,bottom=6.5mm,
    borderline west={3mm}{0pt}{CarlosTeal},
    before skip=0pt,after skip=0.85em
  ]
    {\color{white}\sffamily\bfseries\small ENGINEERING REPORT\hfill
     \color{white!78}\normalfont\@date\par}
    \vspace{3.5mm}
    {\color{white}\sffamily\bfseries\fontsize{25}{31}\selectfont\@title\par}
    \vspace{4mm}
    {\color{white!80}\sffamily\large\@author\par}
  \end{tcolorbox}%
}
\makeatother

% Abstract as an information-dense lead panel.
\renewenvironment{abstract}{%
  \begin{tcolorbox}[
    enhanced,breakable,
    colback=CarlosPanel,
    colframe=CarlosRule,
    boxrule=0.45pt,
    arc=1.5mm,
    left=5mm,right=5mm,top=3.5mm,bottom=3.5mm,
    borderline west={1.6mm}{0pt}{CarlosGold},
    before skip=0.25em,after skip=0.6em
  ]
  {\sffamily\bfseries\color{CarlosNavy}\abstractname}\par\smallskip
  \small
}{%
  \end{tcolorbox}
}

% -----------------------------------------------------------------------------
% Chapters behave as compact report sections instead of always starting a page.
% -----------------------------------------------------------------------------
\titleclass{\chapter}{straight}
\ctexset{
  % Keep the visible chapter label compact (1, 2, 3, ...) while retaining
  % the number in bookmarks and the table of contents.  Setting number={}
  % suppresses the TOC number in ctex, even when titlesec prints \thechapter.
  chapter={name={},number=\arabic{chapter},beforeskip=0pt,afterskip=0pt,afterindent=true},
  % Appendix numbering is automatic.  After \appendix, write
  %   \chapter{阶段角色速查}
  % rather than manually prefixing "附录 A：".
  appendix={name={附录\ },number=\Alph{chapter}},
  section={format=\large\bfseries,afterindent=true},
  subsection={format=\normalsize\bfseries,afterindent=true},
  subsubsection={afterindent=true}
}

\titleformat{\chapter}[block]
  {\normalfont\sffamily\bfseries\color{CarlosNavy}\LARGE}
  {\colorbox{CarlosTeal}{\color{white}\strut\hspace{0.2em}\thechapter\hspace{0.2em}}}
  {0.7em}
  {}
  [\vspace{0.25em}{\color{CarlosRule}\titlerule[0.8pt]}]
\titlespacing{\chapter}{0pt}{1.35em}{0.7em}

\titleformat{\section}[hang]
  {\normalfont\sffamily\bfseries\color{CarlosBlue}\large}
  {\thesection}
  {0.7em}
  {}
\titlespacing{\section}{0pt}{1.05em}{0.38em}

\titleformat{\subsection}[hang]
  {\normalfont\sffamily\bfseries\color{CarlosNavy}\normalsize}
  {\thesubsection}
  {0.65em}
  {}
\titlespacing{\subsection}{0pt}{0.85em}{0.25em}

\titleformat{\subsubsection}[hang]
  {\normalfont\sffamily\bfseries\color{CarlosMuted}\normalsize}
  {\thesubsubsection}
  {0.6em}
  {}
\titlespacing{\subsubsection}{0pt}{0.7em}{0.2em}

\pretocmd{\chapter}{\Needspace{7\baselineskip}}{}{}
\pretocmd{\section}{\Needspace{4\baselineskip}}{}{}
\pretocmd{\subsection}{\Needspace{3\baselineskip}}{}{}

% -----------------------------------------------------------------------------
% Compact table of contents
% -----------------------------------------------------------------------------
\titlecontents{chapter}
  [4.8em]
  {\addvspace{0.35em}\sffamily\bfseries\color{CarlosNavy}}
  % 4.8em fits both two-digit chapter numbers and "附录 A" without overlap.
  {\contentslabel{4.8em}}
  {}
  {\titlerule*[0.55pc]{.}\contentspage}
\titlecontents{section}
  [2.0em]
  {\small\color{CarlosInk}}
  {\contentslabel{2.7em}}
  {}
  {\titlerule*[0.55pc]{.}\contentspage}
\titlecontents{subsection}
  [4.7em]
  {\small\color{CarlosMuted}}
  {\contentslabel{3.3em}}
  {}
  {\titlerule*[0.55pc]{.}\contentspage}

% -----------------------------------------------------------------------------
% Headers and footers
% -----------------------------------------------------------------------------
\pagestyle{fancy}
\fancyhf{}
\fancyhead[L]{\small\sffamily\bfseries\color{CarlosMuted}CARLOS TEX RPT}
\fancyhead[R]{\small\sffamily\color{CarlosMuted}ENGINEERING DOCUMENT}
\fancyfoot[R]{\sffamily\bfseries\color{CarlosTeal}\thepage}
\renewcommand{\headrulewidth}{0.35pt}
\renewcommand{\footrulewidth}{0pt}
\makeatletter
\renewcommand{\headrule}{\hbox to\headwidth{\color{CarlosRule}\leaders\hrule height \headrulewidth\hfill}}
\makeatother

% -----------------------------------------------------------------------------
% Captions, tables and lists
% -----------------------------------------------------------------------------
\captionsetup{
  font=small,
  labelfont={bf,color=CarlosBlue},
  textfont={color=CarlosInk},
  labelsep=quad,
  skip=5pt
}
\renewcommand{\arraystretch}{1.12}
\AtBeginEnvironment{table}{\small}
\AtBeginEnvironment{longtable}{\small}

\setlist[itemize,1]{
  label=\textcolor{CarlosTeal}{\small$\blacktriangleright$},
  leftmargin=1.75em,
  topsep=0.28em,itemsep=0.12em,parsep=0pt,partopsep=0pt
}
\setlist[itemize,2]{
  label=\textcolor{CarlosGold}{\scriptsize$\blacktriangleright$},
  leftmargin=1.55em,
  topsep=0.2em,itemsep=0.08em,parsep=0pt
}
\setlist[enumerate,1]{
  label=\textcolor{CarlosBlue}{\bfseries\arabic*.},
  leftmargin=2em,
  topsep=0.28em,itemsep=0.12em,parsep=0pt,partopsep=0pt
}

\sisetup{
  detect-all,
  per-mode=symbol,
  range-phrase=--,
  range-units=single
}

% -----------------------------------------------------------------------------
% Listings: JSON is provided by the class; all code blocks share one visual style.
% -----------------------------------------------------------------------------
\lstdefinelanguage{json}{
  sensitive=true,
  morestring=[b]",
  morecomment=[l]{//},
  morecomment=[s]{/*}{*/},
  morekeywords={true,false,null}
}
\lstalias{JSON}{json}

\lstset{
  basicstyle=\ttfamily\small\color{CarlosInk},
  keywordstyle=\bfseries\color{CarlosBlue},
  stringstyle=\color{CarlosString},
  commentstyle=\itshape\color{CarlosComment},
  numbers=left,
  numberstyle=\scriptsize\color{CarlosMuted},
  backgroundcolor=\color{CarlosCode},
  frame=single,
  rulecolor=\color{CarlosRule},
  framerule=0.45pt,
  framesep=4pt,
  xleftmargin=0.6em,
  xrightmargin=0.15em,
  framexleftmargin=0.5em,
  breaklines=true,
  columns=fullflexible,
  keepspaces=true,
  showstringspaces=false,
  tabsize=2,
  aboveskip=0.55em,
  belowskip=0.55em
}
