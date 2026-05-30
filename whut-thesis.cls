%%==============================================================================
%% whut-thesis.cls
%% 武汉理工大学研究生学位论文 LaTeX 模板（非官方）
%% Wuhan University of Technology (WHUT) Graduate Thesis Template
%%
%% 适用：学术学位 / 专业学位，硕士 / 博士
%% 引擎：XeLaTeX（推荐）
%% 依赖：ctex, geometry, fancyhdr, titlesec(经 ctexset), caption, setspace,
%%       amsmath, amssymb, amsthm, graphicx, booktabs, array, longtable,
%%       multirow, enumitem, xcolor, hyperref, gbt7714(随仓库提供)
%%
%% 用法示例：
%%   \documentclass[doctor]{whut-thesis}            % 博士，默认 fandol 字体
%%   \documentclass[master,professional]{whut-thesis}
%%   \documentclass[doctor,fontset=mac]{whut-thesis}% 切换为 macOS 系统字体
%%   \documentclass[master,fontset=windows]{whut-thesis}
%%   \documentclass[master,anonymous]{whut-thesis}  % 盲审：隐藏作者/导师信息
%%
%% 许可：本模板代码以 LPPL v1.3c 发布；gbt7714 宏包版权归原作者所有。
%%==============================================================================
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{whut-thesis}[2026/05/29 v1.0 WHUT Graduate Thesis Template]

%%------------------------------------------------------------------------------
%% 1. 类选项
%%------------------------------------------------------------------------------
\newif\ifwhut@doctor        \whut@doctorfalse      % 博士？默认硕士
\newif\ifwhut@professional  \whut@professionalfalse% 专业学位？默认学术学位
\newif\ifwhut@anonymous     \whut@anonymousfalse   % 盲审？默认否
\newif\ifwhut@newform       \whut@newformfalse     % 2025 专业学位新形式？默认否

\DeclareOption{master}{\whut@doctorfalse}
\DeclareOption{doctor}{\whut@doctortrue}
\DeclareOption{academic}{\whut@professionalfalse}
\DeclareOption{professional}{\whut@professionaltrue}
\DeclareOption{anonymous}{\whut@anonymoustrue}
% newform：2025 版"专业学位研究生新形式硕士"，蕴含专业硕士
\DeclareOption{newform}{\whut@newformtrue\whut@professionaltrue\whut@doctorfalse}

% 默认字体集 fandol（跨平台）。用户可用 fontset=mac / windows / ubuntu 覆盖，
% 因后处理的选项会覆盖先传入的同名键值，故此处先给默认值。
\PassOptionsToClass{fontset=fandol}{ctexbook}
% 其余未知选项（fontset=、oneside、draft 等）转发给 ctexbook
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessOptions\relax

% 默认单面排版（oneside），避免 \cleardoublepage 产生空白页；
% 如需双面印刷，使用 \documentclass[twoside]{whut-thesis}。
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
\RequirePackage{tabularx}
\RequirePackage{calc}                 % 计算下划线宽度
\RequirePackage[normalem]{ulem}       % normalem：不改写 \emph；用 \uline 做多行下划线
\RequirePackage{xeCJKfntef}           % 提供 \CJKunderline（中文可断行下划线）
% 参考文献：GB/T 7714-2015 数字制，随仓库提供 gbt7714 v2.1.8（稳定版）
% super=正文引用为上标 [1]；sort&compress=连续引用压缩为 [1-3]
% 如需行内 [1]（非上标），改为 \RequirePackage[sort&compress]{gbt7714}
\RequirePackage[super,sort&compress]{gbt7714}
% hyperref 通常最后加载
\RequirePackage{hyperref}
\hypersetup{
  colorlinks=true,
  linkcolor=black,
  citecolor=black,
  urlcolor=blue,
  bookmarksnumbered=true,
  bookmarksopen=true,
  pdfborder={0 0 0},
}

%%------------------------------------------------------------------------------
%% 3. 页面与行距
%%   页边距：上下 35mm，左右 32mm；正文行距固定值约 20 磅。
%%------------------------------------------------------------------------------
% 依官方《武汉理工大学学位论文(印刷)参考格式(2024/2025)》实测：
% A4，上下边距 35mm，左右边距 32mm（对称）。
\geometry{
  paper=a4paper,
  top=35mm, bottom=35mm, left=32mm, right=32mm,
  headheight=15pt, headsep=4mm, footskip=10mm,
}
% 正文行距：官方要求固定值 20 磅。小四号(12bp)正文下经标定 \linespread=1.389
% 使行距约合 20 磅(≈20.08pt)。
\linespread{1.389}
\setlength{\parindent}{2\ccwd}      % 首行缩进 2 字符
\setlength{\parskip}{0pt}

%%------------------------------------------------------------------------------
%% 4. 学位 / 门类相关文字（随选项变化）
%%------------------------------------------------------------------------------
\ifwhut@doctor
  \def\whut@degree{博士}
\else
  \def\whut@degree{硕士}
\fi
% 页眉文字：武汉理工大学{硕士/博士}学位论文
\def\whut@headtext{武汉理工大学\whut@degree 学位论文}

%%------------------------------------------------------------------------------
%% 5. 论文信息字段（在 main.tex 中用对应命令设置）
%%------------------------------------------------------------------------------
\def\whut@define#1{\expandafter\gdef\csname whut@#1\endcsname{}%
  \expandafter\gdef\csname #1\endcsname##1{\expandafter\gdef\csname whut@#1\endcsname{##1}}}
% 题名与作者
\whut@define{ctitle}      % 中文题目
\whut@define{etitle}      % 英文题目
\whut@define{cauthor}     % 研究生姓名
\whut@define{eauthor}     % 作者英文名
\whut@define{studentid}   % 学号
% 学科信息
\whut@define{cmajor}      % 学科专业（中文）
\whut@define{emajor}      % 学科专业（英文）
\whut@define{cdepartment} % 培养单位 / 学院
\whut@define{cfield}      % 研究方向
\whut@define{discipline}  % 学科门类，如 工学 / 理学 / 艺术学
% 导师
\whut@define{cadvisor}        % 导师姓名
\whut@define{advisortitle}    % 导师职称
\whut@define{advisordegree}   % 导师学位
\whut@define{advisordept}     % 导师单位名称
\whut@define{advisorzip}      % 导师单位邮编
\whut@define{csubadvisor}     % 副导师姓名（可空）
\whut@define{subadvisortitle}
\whut@define{subadvisordegree}
\whut@define{subadvisordept}
\whut@define{subadvisorzip}
% 题名页其它字段
\whut@define{classification}  % 分类号
\whut@define{secretlevel}     % 密级
\whut@define{udc}             % UDC
\whut@define{chairman}        % 答辩委员会主席
\whut@define{reviewer}        % 评阅人
\whut@define{committee}       % 答辩委员会委员（官方题名页字段，可多人顿号分隔）
\whut@define{degreecategory}  % 专业学位类别（2025 新形式专硕用）
\whut@define{cfieldarea}      % 专业领域（2025 新形式专硕用）
\whut@define{thesisform}      % 论文形式（2025 新形式专硕封面用，如：应用研究）
\whut@define{submitdate}      % 论文提交日期，如 2023.03.16
\whut@define{defenddate}      % 论文答辩日期，如 2023.05.19
\whut@define{cdate}           % 封面日期，如 2023 年 5 月
% 带默认值的字段
\gdef\whut@schoolcode{10497}
\def\schoolcode#1{\gdef\whut@schoolcode{#1}}
\gdef\whut@cuniversity{武汉理工大学}
\gdef\whut@secretlevel{公开}
% 校名书法字标图片（题名页用）；如无此文件则回退为楷书文字
\gdef\whut@schoollogo{figures/武汉理工大学.png}
\newcommand{\schoollogo}[1]{\gdef\whut@schoollogo{#1}}

%%------------------------------------------------------------------------------
%% 6. 标题层次格式（章 / 节 / 小节）
%%------------------------------------------------------------------------------
% 标题字号依官方规范：章=小二号黑体，节=三号黑体，小节=四号黑体
\ctexset{
  chapter={
    name={第,章},
    number=\chinese{chapter},
    format=\centering\heiti\zihao{-2},
    nameformat={},
    titleformat={},
    beforeskip=10pt,
    afterskip=33pt,
    fixskip=true,
  },
  section={
    format=\heiti\zihao{3}\raggedright,
    beforeskip=12pt,
    afterskip=21pt,
  },
  subsection={
    format=\heiti\zihao{4}\raggedright,
    beforeskip=10pt,
    afterskip=7pt,
  },
  subsubsection={
    format=\heiti\zihao{-4}\raggedright,
    beforeskip=8pt,
    afterskip=4pt,
  },
}
% 目录中显示到三级标题
\setcounter{secnumdepth}{3}
\setcounter{tocdepth}{2}

%%------------------------------------------------------------------------------
%% 7. 图表与公式编号：按章编号，形如 图1-1 表2-3 式(3-1)
%%------------------------------------------------------------------------------
\counterwithin*{figure}{chapter}
\counterwithin*{table}{chapter}
\counterwithin*{equation}{chapter}
\renewcommand{\thefigure}{\thechapter-\arabic{figure}}
\renewcommand{\thetable}{\thechapter-\arabic{table}}
\renewcommand{\theequation}{\thechapter-\arabic{equation}}

% 题注：五号字，标签与内容间空格分隔；图题在下、表题在上由排版者决定
\captionsetup{
  font={small},
  labelsep=quad,
  skip=6pt,
}
\captionsetup[figure]{name=图}
\captionsetup[table]{name=表}
\renewcommand{\figurename}{图}
\renewcommand{\tablename}{表}

%%------------------------------------------------------------------------------
%% 8. 页眉页脚
%%------------------------------------------------------------------------------
\pagestyle{fancy}
\fancyhf{}
\fancyhead[C]{\textcolor{gray}{\zihao{5}\songti\whut@headtext}}
\fancyfoot[C]{\zihao{5}\thepage}
\renewcommand{\headrulewidth}{0.5pt}
\renewcommand{\footrulewidth}{0pt}
% 章首页（plain 样式）也保持同样页眉页脚
\fancypagestyle{plain}{%
  \fancyhf{}
  \fancyhead[C]{\textcolor{gray}{\zihao{5}\songti\whut@headtext}}
  \fancyfoot[C]{\zihao{5}\thepage}
  \renewcommand{\headrulewidth}{0.5pt}
  \renewcommand{\footrulewidth}{0pt}
}

%%------------------------------------------------------------------------------
%% 9. 定理类环境（中文名）
%%------------------------------------------------------------------------------
\theoremstyle{definition}
\newtheorem{definition}{定义}[chapter]
\newtheorem{theorem}{定理}[chapter]
\newtheorem{lemma}{引理}[chapter]
\newtheorem{corollary}{推论}[chapter]
\newtheorem{proposition}{命题}[chapter]
\newtheorem{example}{例}[chapter]
\newtheorem{remark}{注}[chapter]
\renewcommand{\proofname}{\heiti 证明}

%%------------------------------------------------------------------------------
%% 10. 封面
%%------------------------------------------------------------------------------
\newcommand{\makecover}{%
  \begin{titlepage}
  \pagestyle{empty}
  \begin{center}
  \ifwhut@newform
    %% ===== 2025 版：专业学位研究生新形式硕士学位论文 =====
    \vspace*{0.6cm}
    {\zihao{3}\heiti 专业学位研究生硕士学位论文}\par
    \vspace{1.0cm}
    {\zihao{4}\songti （申请\whut@degree 专业学位论文）}\par
    \vspace{1.8cm}
    {\zihao{2}\heiti \whut@ctitle\par}
    \vspace{0.6cm}
    {\zihao{3}\heiti （\whut@thesisform）\par}
    \vspace{2.4cm}
    {\zihao{4}\songti
      \begin{tabular}{@{}l@{\hspace{0.5em}}l@{}}
        培\ 养\ 单\ 位： & \whut@cdepartment \\[10pt]
        专业学位类别： & \whut@degreecategory \\[10pt]
        专\ 业\ 领\ 域： & \whut@cfieldarea \\[10pt]
        论\ 文\ 作\ 者： & \ifwhut@anonymous\makebox[4em]{}\else\whut@cauthor\fi \\[10pt]
        指\ 导\ 教\ 师： & \ifwhut@anonymous\makebox[4em]{}\else\whut@cadvisor\quad\whut@advisortitle\fi \\[10pt]
        副指导教师： & \ifwhut@anonymous\makebox[4em]{}\else\whut@csubadvisor\fi \\
      \end{tabular}\par}
  \else
    %% ===== 2024 版：学术学位（博士/硕士）与专业硕士 =====
    \vspace*{1.5cm}
    {\zihao{4}\songti （申请\whut@discipline\whut@degree 学位论文）}\par
    \vspace{2.2cm}
    {\zihao{2}\heiti \whut@ctitle\par}
    \vspace{3.5cm}
    {\zihao{4}\songti
      \begin{tabular}{@{}l@{\hspace{0.5em}}l@{}}
        培\ 养\ 单\ 位： & \whut@cdepartment \\[10pt]
        学\ 科\ 专\ 业： & \whut@cmajor \\[10pt]
        论\ 文\ 作\ 者： & \ifwhut@anonymous\makebox[4em]{}\else\whut@cauthor\fi \\[10pt]
        指\ 导\ 教\ 师： & \ifwhut@anonymous\makebox[4em]{}\else\whut@cadvisor\quad\whut@advisortitle\fi \\
      \end{tabular}\par}
  \fi
    \vfill
    {\zihao{4}\songti \whut@cdate\par}
    \vspace{1.5cm}
  \end{center}
  \end{titlepage}
}

%%------------------------------------------------------------------------------
%% 11. 题名页（无边框表单：标签 + 下划线填空）
%%------------------------------------------------------------------------------
% 下划线填空：#1=下划线宽度，#2=内容（居中置于线上）
\newcommand{\whut@blank}[2]{\underline{\makebox[#1][c]{#2}}}
% 行间距与测量用临时长度（题名页较密，使整页含日期单页排下）
\newcommand{\whut@frowsep}{\par\vspace{0.65em}}
\newlength{\whut@lwi}\newlength{\whut@lwii}
% 单值整行：标签紧跟，下划线填满到右边距，值居中
\newcommand{\whut@frow}[2]{%
  \settowidth{\whut@lwi}{#1\,}%
  \noindent#1\,\whut@blank{\dimexpr\textwidth-\whut@lwi\relax}{#2}\whut@frowsep}
% 顶对齐整行（用于可换行的英文题目，下划线随文字逐行）
\newcommand{\whut@frowtop}[2]{%
  \settowidth{\whut@lwi}{#1\,}%
  \noindent#1\,\parbox[t]{\dimexpr\textwidth-\whut@lwi\relax}{\raggedright #2}\whut@frowsep}
% 一行两组“标签+填空”：左右各占半幅
\newcommand{\whut@frowtwo}[4]{%
  \settowidth{\whut@lwi}{#1\,}\settowidth{\whut@lwii}{#3\,}%
  \noindent
  #1\,\whut@blank{\dimexpr0.5\textwidth-\whut@lwi\relax}{#2}%
  #3\,\whut@blank{\dimexpr0.5\textwidth-\whut@lwii\relax}{#4}\whut@frowsep}
% 导师块：左标签纵向居中，右侧两行子字段
\newcommand{\whut@advrow}[3]{%
  \noindent
  \makebox[5.5em][l]{\raisebox{-1.0em}[0pt][0pt]{#1}}%
  \begin{minipage}[t]{\dimexpr\textwidth-5.5em\relax}
    #2\par\vspace{0.65em}#3
  \end{minipage}\whut@frowsep}

\newcommand{\maketitlepage}{%
  \cleardoublepage
  \thispagestyle{empty}
  % ---- 顶部：分类号 / 密级 / UDC / 学校代码（标签 + 下划线填空，无边框）----
  {\zihao{4}\songti
  \noindent
  分类号\,\whut@blank{0.26\textwidth}{\whut@classification}\hfill
  密\hspace{1em}级\,\whut@blank{0.20\textwidth}{\whut@secretlevel}\par
  \vspace{0.9em}
  \noindent
  UDC\,\whut@blank{0.26\textwidth}{\whut@udc}\hfill
  学校代码\,\whut@blank{0.20\textwidth}{\whut@schoolcode}\par}
  % ---- 校名 + 学位论文 ----
  \vspace{1.0cm}
  \begin{center}
    \IfFileExists{\whut@schoollogo}
      {\includegraphics[width=0.42\textwidth]{\whut@schoollogo}}
      {\kaishu\zihao{-1}\whut@cuniversity}\par
    \vspace{0.5cm}
    {\heiti\zihao{1} 学\hspace{0.5em}位\hspace{0.5em}论\hspace{0.5em}文}\par
  \end{center}
  \vspace{0.9cm}
  % ---- 表单主体（标签 + 下划线填空，无边框）----
  {\zihao{-4}\songti
  \whut@frow{题\hspace{1em}目}{\whut@ctitle}%
  % 英文题目：可换行，逐行下划线（先展开宏，使 ulem 能在词间断行）
  \whut@frowtop{英文题目}{\expandafter\uline\expandafter{\whut@etitle}}%
  \whut@frow{论文作者}{\ifwhut@anonymous\else\whut@cauthor\fi}%
  % 指导教师：左标签纵向居中，右侧两行
  \whut@advrow{指导教师}%
    {\ifwhut@anonymous\else 姓名\,\whut@blank{6em}{\whut@cadvisor}职称\,\whut@blank{4em}{\whut@advisortitle}学位\,\whut@blank{4em}{\whut@advisordegree}\fi}%
    {单位名称\,\whut@blank{9em}{\whut@advisordept}邮编\,\whut@blank{5em}{\whut@advisorzip}}%
  \whut@advrow{副指导教师}%
    {姓名\,\whut@blank{6em}{\ifwhut@anonymous\else\whut@csubadvisor\fi}职称\,\whut@blank{4em}{\whut@subadvisortitle}学位\,\whut@blank{4em}{\whut@subadvisordegree}}%
    {单位名称\,\whut@blank{9em}{\whut@subadvisordept}邮编\,\whut@blank{5em}{\whut@subadvisorzip}}%
  \whut@frowtwo{申请学位级别}{\whut@degree}{学科专业名称}{\whut@cmajor}%
  \whut@frowtwo{论文提交日期}{\whut@submitdate}{论文答辩日期}{\whut@defenddate}%
  \whut@frowtwo{学位授予单位}{\whut@cuniversity}{学位授予日期}{}%
  \whut@frowtwo{答辩委员会主席}{\ifwhut@anonymous\else\whut@chairman\fi}{评\hspace{0.5em}阅\hspace{0.5em}人}{\ifwhut@anonymous\else\whut@reviewer\fi}%
  \whut@frowtop{答辩委员会委员}{\ifwhut@anonymous\else\CJKunderline{\whut@committee}\fi}%
  }
  \vfill
  \begin{center}{\zihao{-4}\songti \whut@cdate}\end{center}
  \clearpage
}

%%------------------------------------------------------------------------------
%% 12. 独创性声明与版权使用授权书
%%------------------------------------------------------------------------------
% 声明措辞依官方《统一要求(2009)》，标题小二号黑体，正文四号
\newcommand{\makedeclaration}{%
  \cleardoublepage
  \thispagestyle{empty}
  \vspace*{1em}
  \begin{center}{\zihao{-2}\heiti 独创性声明}\end{center}
  \vspace{1em}
  {\zihao{4}\songti
  \begin{spacing}{1.4}
  \par\hangindent=0pt 本人声明，所呈交的论文是本人在导师指导下进行的研究工作及取得的
  研究成果。尽我所知，除了文中特别加以标注和致谢的地方外，论文中不包含其他人已经
  发表或撰写过的研究成果，也不包含为获得武汉理工大学或其他教育机构的学位或证书而
  使用过的材料。与我一同工作的同志对本研究所做的任何贡献均已在论文中作了明确的
  说明并表示了谢意。\par
  \end{spacing}}
  \vspace{2em}
  {\zihao{4}\songti\noindent\hspace*{6em}签\hspace{1em}名：\underline{\makebox[7em]{}}\quad 日期：\underline{\makebox[7em]{}}}
  \vspace{4em}
  \begin{center}{\zihao{-2}\heiti 学位论文使用授权书}\end{center}
  \vspace{1em}
  {\zihao{4}\songti
  \begin{spacing}{1.4}
  \par 本人完全了解武汉理工大学有关保留、使用学位论文的规定，即学校有权保留并向
  国家有关部门或机构送交论文的复印件和电子版，允许论文被查阅和借阅。本人授权武汉
  理工大学可以将本学位论文的全部内容编入有关数据库进行检索，可以采用影印、缩印或
  其他复制手段保存或汇编本学位论文。同时授权经武汉理工大学认可的国家有关机构或
  论文数据库使用或收录本学位论文，并向社会公众提供信息服务。\par
  \end{spacing}}
  \vspace{0.5em}
  {\zihao{4}\songti\noindent\hspace*{8em}（保密的论文在解密后应遵守此规定）\par}
  \vspace{3em}
  {\zihao{4}\songti\noindent
    研究生（签名）：\underline{\makebox[4em]{}}\hfill
    导师（签名）：\underline{\makebox[4em]{}}\hfill
    日期：\underline{\makebox[4em]{}}\par}
  \clearpage
}

%%------------------------------------------------------------------------------
%% 13. 中文摘要 / 英文摘要环境
%%------------------------------------------------------------------------------
% 摘要/Abstract 标题为小三号黑体，并计入目录
\newcommand{\whut@chapterlike}[1]{%
  \chapter*{\zihao{-3}#1}%
  \addcontentsline{toc}{chapter}{#1}%
  \markboth{#1}{#1}%
}
% 中文摘要
\newenvironment{cabstract}{%
  \whut@chapterlike{摘\hspace{0.5em}要}%
}{}
\newcommand{\ckeywords}[1]{%
  \par\vspace{1.5em}\noindent{\heiti 关键词：}#1\par}
% 英文摘要
\newenvironment{eabstract}{%
  \whut@chapterlike{Abstract}%
}{}
\newcommand{\ekeywords}[1]{%
  \par\vspace{1.5em}\noindent{\bfseries Keywords: }#1\par}

%%------------------------------------------------------------------------------
%% 14. 目录标题
%%------------------------------------------------------------------------------
\renewcommand{\contentsname}{目\hspace{1em}录}
\renewcommand{\listfigurename}{插图目录}
\renewcommand{\listtablename}{表格目录}
% 目录行距统一：去掉 book 类章级条目前的额外段前距，章级也用点线引导，
% 使各级条目保持相同的行间距。
\renewcommand*\l@chapter[2]{%
  \ifnum \c@tocdepth >\m@ne
    \begingroup
      \setlength\@tempdima{4.0em}%        容纳“第一章”等中文章号
      \parindent\z@ \rightskip\@pnumwidth
      \parfillskip-\@pnumwidth
      \leavevmode\heiti
      \advance\leftskip\@tempdima \hskip-\leftskip
      #1\nobreak
      \leaders\hbox{$\m@th\mkern\@dotsep mu\hbox{.}\mkern\@dotsep mu$}\hfill
      \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
    \endgroup
  \fi}

%%------------------------------------------------------------------------------
%% 15. 参考文献：作为不编号章节并计入目录
%%------------------------------------------------------------------------------
\renewcommand{\bibname}{参考文献}
\renewcommand{\bibfont}{\zihao{5}}   % 参考文献正文五号字（依官方规范）
% gbt7714 在 book 类下默认以 \chapter* 排版参考文献；将其加入目录与页眉
\let\whut@oldbibliography\bibliography
\renewcommand{\bibliography}[1]{%
  \cleardoublepage
  \phantomsection
  \addcontentsline{toc}{chapter}{\bibname}%
  \whut@oldbibliography{#1}%
}

%%------------------------------------------------------------------------------
%% 16. 后置部分：致谢 / 科研成果目录 / 附录
%%   官方顺序：致谢 → 参考文献 → 科研成果目录 → 附录
%%------------------------------------------------------------------------------
% 计入目录的不编号章节
\newcommand{\whut@tocchapter}[1]{%
  \cleardoublepage
  \phantomsection
  \chapter*{#1}%
  \addcontentsline{toc}{chapter}{#1}%
  \markboth{#1}{#1}%
}
% 致谢（正文用楷体，依官方示例；建议 200 字内）
\newenvironment{acknowledgement}{%
  \whut@tocchapter{致\hspace{1em}谢}\kaishu
}{}
% 科研成果目录（含学术论文、著作、科研奖项及发明专利等）
\newenvironment{publications}{%
  \whut@tocchapter{科研成果目录}%
  \begin{enumerate}[label={[\arabic*]},leftmargin=*,itemsep=4pt]
}{\end{enumerate}}
% 附录（论文主体的补充项目）。可在其内用 \section 分多个附录。
\newenvironment{appendixpart}{%
  \whut@tocchapter{附\hspace{1em}录}%
}{}

%%------------------------------------------------------------------------------
%% 17. 中英文摘要也计入目录（可选，多数学校不计入；此处不计入）
%%   如需计入，可在摘要后手动 \addcontentsline。
%%------------------------------------------------------------------------------

\endinput
%%==============================================================================
%% End of file `whut-thesis.cls'.
%%==============================================================================
