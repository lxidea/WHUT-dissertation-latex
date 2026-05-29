%%==============================================================================
%% whut-bachelor.cls
%% 武汉理工大学本科生毕业设计（论文）LaTeX 模板（非官方）
%% Wuhan University of Technology Undergraduate Thesis/Design Template
%%
%% 依据：《武汉理工大学本科生毕业设计（论文）撰写规范和示例》
%% 引擎：XeLaTeX（推荐）
%% 参考文献：GB/T 7714（内置 gbt7714 v2.1.8，与研究生模板共用）
%%
%% 用法：
%%   \documentclass{whut-bachelor}                 % 默认（毕业论文）
%%   \documentclass[design]{whut-bachelor}         % 毕业设计
%%   \documentclass[fontset=mac]{whut-bachelor}    % 切换中文字体
%%==============================================================================
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{whut-bachelor}[2026/05/29 v1.0 WHUT Undergraduate Thesis Template]

%%------------------------------------------------------------------------------
%% 1. 类选项
%%------------------------------------------------------------------------------
\newif\ifwhut@design  \whut@designfalse   % 毕业设计？默认毕业论文
\DeclareOption{design}{\whut@designtrue}
\DeclareOption{thesis}{\whut@designfalse}
\PassOptionsToClass{fontset=fandol}{ctexbook}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessOptions\relax

\LoadClass[UTF8,a4paper,zihao=-4,scheme=chinese,oneside,openany]{ctexbook}

%%------------------------------------------------------------------------------
%% 2. 宏包
%%------------------------------------------------------------------------------
\RequirePackage{geometry}
\RequirePackage{fancyhdr}
\RequirePackage{setspace}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{amsthm}
\RequirePackage{graphicx}
\RequirePackage{booktabs}
\RequirePackage{array}
\RequirePackage{longtable}
\RequirePackage{multirow}
\RequirePackage{enumitem}
\RequirePackage{xcolor}
\RequirePackage{caption}
\RequirePackage{subcaption}
\RequirePackage{calc}
\RequirePackage[super,sort&compress]{gbt7714}   % GB/T 7714 数字制，上标引用
\RequirePackage{hyperref}
\hypersetup{colorlinks=true,linkcolor=black,citecolor=black,urlcolor=blue,
  bookmarksnumbered=true,bookmarksopen=true,pdfborder={0 0 0}}

%%------------------------------------------------------------------------------
%% 3. 页面与行距
%%   页边距：上 2.5cm，下 2cm，左 2.5cm，右 2cm（左装订）；正文行距固定值约 20 磅。
%%------------------------------------------------------------------------------
\geometry{
  paper=a4paper,
  top=2.5cm, bottom=2cm, left=2.5cm, right=2cm,
  headheight=15pt, headsep=5mm, footskip=10mm,
}
\linespread{1.389}                  % 小四号正文行距 ≈ 20 磅（固定值）
\setlength{\parindent}{2\ccwd}
\setlength{\parskip}{0pt}

%%------------------------------------------------------------------------------
%% 4. 华文中宋（封面用）：默认回退为宋体，mac/win 可改为 STZhongsong/华文中宋
%%------------------------------------------------------------------------------
\providecommand{\zhongsong}{\songti}

%%------------------------------------------------------------------------------
%% 5. 论文信息字段
%%------------------------------------------------------------------------------
\def\whut@define#1{\expandafter\gdef\csname whut@#1\endcsname{}%
  \expandafter\gdef\csname #1\endcsname##1{\expandafter\gdef\csname whut@#1\endcsname{##1}}}
\whut@define{ctitle}      % 中文题目
\whut@define{etitle}      % 英文题目
\whut@define{school}      % 学院（系）
\whut@define{classmajor}  % 专业班级
\whut@define{cauthor}     % 学生姓名
\whut@define{cadvisor}    % 指导教师
\whut@define{cdate}       % 日期，如 二〇二六年六月
\gdef\whut@headtext{武汉理工大学毕业设计（论文）}

%%------------------------------------------------------------------------------
%% 6. 标题层次：章=黑体小二、节=黑体三号、二级=黑体四号、三级=黑体小四
%%   章节用阿拉伯数字（第1章 / 1.1 / 1.1.1）；段前段后约 0.5 行。
%%------------------------------------------------------------------------------
\ctexset{
  chapter={
    name={第,章},
    number=\arabic{chapter},
    format=\centering\heiti\zihao{-2},
    beforeskip=10pt, afterskip=10pt, fixskip=true,
  },
  section={format=\heiti\zihao{3}\raggedright, beforeskip=10pt, afterskip=10pt},
  subsection={format=\heiti\zihao{4}\raggedright, beforeskip=10pt, afterskip=10pt},
  subsubsection={format=\heiti\zihao{-4}\raggedright, beforeskip=8pt, afterskip=8pt},
}
\setcounter{secnumdepth}{3}
\setcounter{tocdepth}{2}

%%------------------------------------------------------------------------------
%% 7. 图表公式按章编号，用点号：图 3.1、表 3.1、式 (3.2)
%%------------------------------------------------------------------------------
\counterwithin{figure}{chapter}
\counterwithin{table}{chapter}
\counterwithin{equation}{chapter}
% 默认即为 \thechapter.\arabic{...}（点号），无需重定义
\captionsetup{font={small},labelsep=quad,skip=6pt}
\captionsetup[figure]{name=图}
\captionsetup[table]{name=表}
\renewcommand{\figurename}{图}
\renewcommand{\tablename}{表}

%%------------------------------------------------------------------------------
%% 8. 页眉页脚：页眉「武汉理工大学毕业设计（论文）」五号宋体居中；页码底端居中
%%------------------------------------------------------------------------------
\pagestyle{fancy}
\fancyhf{}
\fancyhead[C]{\zihao{5}\songti\whut@headtext}
\fancyfoot[C]{\zihao{5}\thepage}
\renewcommand{\headrulewidth}{0.5pt}
\renewcommand{\footrulewidth}{0pt}
\fancypagestyle{plain}{%
  \fancyhf{}
  \fancyhead[C]{\zihao{5}\songti\whut@headtext}
  \fancyfoot[C]{\zihao{5}\thepage}
  \renewcommand{\headrulewidth}{0.5pt}
  \renewcommand{\footrulewidth}{0pt}
}

%%------------------------------------------------------------------------------
%% 9. 定理类环境
%%------------------------------------------------------------------------------
\theoremstyle{definition}
\newtheorem{definition}{定义}[chapter]
\newtheorem{theorem}{定理}[chapter]
\newtheorem{lemma}{引理}[chapter]
\newtheorem{corollary}{推论}[chapter]
\newtheorem{example}{例}[chapter]
\renewcommand{\proofname}{\heiti 证明}

%%------------------------------------------------------------------------------
%% 10. 封面
%%------------------------------------------------------------------------------
\newcommand{\makecover}{%
  \begin{titlepage}
  \pagestyle{empty}
  \begin{center}
    \vspace*{2.0cm}
    {\zhongsong\zihao{1} 武汉理工大学毕业设计（论文）}\par
    \vspace{3.0cm}
    {\heiti\zihao{2} \whut@ctitle\par}
    \vspace{3.5cm}
    {\zhongsong\zihao{3}
      \begin{tabular}{@{}l@{}l@{}}
        学院（系）： & \underline{\makebox[12em][c]{\whut@school}} \\[14pt]
        专业班级： & \underline{\makebox[12em][c]{\whut@classmajor}} \\[14pt]
        学生姓名： & \underline{\makebox[12em][c]{\whut@cauthor}} \\[14pt]
        指导教师： & \underline{\makebox[12em][c]{\whut@cadvisor}} \\
      \end{tabular}\par}
    \vfill
    {\zhongsong\zihao{3} \whut@cdate\par}
    \vspace{1.5cm}
  \end{center}
  \end{titlepage}
}

%%------------------------------------------------------------------------------
%% 11. 学位论文原创性声明 + 版权使用授权书（本科官方措辞）
%%------------------------------------------------------------------------------
\newcommand{\makedeclaration}{%
  \clearpage
  \thispagestyle{empty}
  \vspace*{1em}
  \begin{center}{\zihao{-2}\heiti 学位论文原创性声明}\end{center}
  \vspace{1em}
  {\zihao{-4}\songti
  \begin{spacing}{1.4}
  \par\hangindent=0pt 本人郑重声明：所呈交的论文是本人在导师的指导下独立进行研究所
  取得的研究成果。除了文中特别加以标注引用的内容外，本论文不包括任何其他个人或集体
  已经发表或撰写的成果作品。本人完全意识到本声明的法律后果由本人承担。\par
  \end{spacing}}
  \vspace{2em}
  {\zihao{-4}\songti\noindent\hspace*{4em}作者签名：\underline{\makebox[7em]{}}\hfill
    \makebox[8em][l]{年\quad 月\quad 日}}
  \vspace{3em}
  \begin{center}{\zihao{-2}\heiti 学位论文版权使用授权书}\end{center}
  \vspace{1em}
  {\zihao{-4}\songti
  \begin{spacing}{1.4}
  \par 本学位论文作者完全了解学校有关保障、使用学位论文的规定，同意学校保留并向有关
  学位论文管理部门或机构送交论文的复印件和电子版，允许论文被查阅和借阅。本人授权
  省级优秀学士论文评选机构将本学位论文的全部或部分内容编入有关数据进行检索，可以
  采用影印、缩印或扫描等复制手段保存和汇编本学位论文。\par
  \vspace{0.5em}
  \par 本学位论文属于\quad 1、保密\,$\square$\,，在\underline{\makebox[3em]{}}年解密后
  适用本授权书\quad 2、不保密\,$\square$\,。\par
  \par\hspace*{2em}（请在以上相应方框内打“√”）\par
  \end{spacing}}
  \vspace{1.5em}
  {\zihao{-4}\songti\noindent\hspace*{4em}作者签名：\underline{\makebox[7em]{}}\hfill
    \makebox[8em][l]{年\quad 月\quad 日}\par
    \vspace{1em}
    \hspace*{4em}导师签名：\underline{\makebox[7em]{}}\hfill
    \makebox[8em][l]{年\quad 月\quad 日}}
  \clearpage
}

%%------------------------------------------------------------------------------
%% 12. 中英文摘要（标题黑体小二；关键词标题黑体四号）
%%------------------------------------------------------------------------------
\newcommand{\whut@tocchapter}[1]{%
  \clearpage\phantomsection
  \chapter*{#1}\addcontentsline{toc}{chapter}{#1}\markboth{#1}{#1}}
\newenvironment{cabstract}{%
  \chapter*{\zihao{-2}摘\hspace{0.5em}要}%
  \addcontentsline{toc}{chapter}{摘要}\markboth{摘要}{摘要}%
}{}
\newcommand{\ckeywords}[1]{%
  \par\vspace{1em}\noindent{\heiti\zihao{4}关键词：}{\songti\zihao{-4}#1}\par}
\newenvironment{eabstract}{%
  \chapter*{\zihao{-2}\bfseries Abstract}%
  \addcontentsline{toc}{chapter}{Abstract}\markboth{Abstract}{Abstract}%
}{}
\newcommand{\ekeywords}[1]{%
  \par\vspace{1em}\noindent{\bfseries\zihao{4}Key Words: }{\zihao{-4}#1}\par}

%%------------------------------------------------------------------------------
%% 13. 目录 / 参考文献 / 致谢 / 附录
%%   后置顺序：参考文献 → 附录 → 致谢
%%------------------------------------------------------------------------------
\renewcommand{\contentsname}{目\hspace{1em}录}
% 参考文献：标题黑体小二，内容五号
\renewcommand{\bibname}{参考文献}
\renewcommand{\bibfont}{\zihao{5}}
\let\whut@oldbibliography\bibliography
\renewcommand{\bibliography}[1]{%
  \clearpage\phantomsection
  \addcontentsline{toc}{chapter}{\bibname}%
  \whut@oldbibliography{#1}}
% 致谢
\newenvironment{acknowledgement}{\whut@tocchapter{致\hspace{1em}谢}}{}
% 附录（附录A、附录B…）
\newenvironment{appendixpart}{\whut@tocchapter{附\hspace{1em}录}}{}

\endinput
%%==============================================================================
%% End of file `whut-bachelor.cls'.
%%==============================================================================
