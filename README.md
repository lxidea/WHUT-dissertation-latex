# 武汉理工大学学位论文 LaTeX 模板（研究生 + 本科生）

> Wuhan University of Technology (WHUT) Thesis Templates
>
> 非官方模板，基于 `ctexbook` 与 XeLaTeX，开箱即用。包含：
> - **研究生学位论文**（`whut-thesis.cls`）：2024/2025 双版本，依官方《学位论文（印刷）
>   参考格式（2024/2025）》校准。
> - **本科生毕业设计（论文）**（`whut-bachelor.cls`）：依官方《本科生毕业设计（论文）
>   撰写规范和示例》校准。
>
> 两者共用内置的 GB/T 7714 参考文献宏包，参考文献遵循 **GB/T 7714** 数字制。

---

## 一、特性

- 🗂 **两个官方版本**：
  - **2024 版**（`main-2024.tex`）：学术学位博士 / 硕士、专业硕士。
  - **2025 版**（`main-2025-newform.tex`）：专业学位研究生**新形式**硕士
    （封面含专业学位类别 / 专业领域 / 论文形式 / 副指导教师）。
  - 两版排版格式完全一致，仅封面 / 字段措辞不同，由文档类选项切换。
- 📐 **学位通用**：`master` / `doctor` / `professional` / `newform` 选项切换，
  封面、题名页、页眉自动适配。
- 🧾 **完整结构**（官方顺序）：封面、题名页（分类号 / 密级 / UDC / 学校代码 /
  答辩委员会主席·委员）、独创性声明与授权书、中英文摘要、目录、正文、
  **致谢 → 参考文献 → 科研成果目录 → 附录**。
- 🔢 **规范排版（官方实测）**：版心上下 35mm、左右 32mm；正文小四号宋体、
  **行距固定值约 20 磅**；章标题小二号黑体居中（**第一章** 中文数字），节三号、
  小节四号；图表公式按章编号（图 1-1、式 (2-1)）；摘要小三号入目录；
  参考文献五号字；页眉灰色五号宋体。
- 📚 **GB/T 7714—2015 参考文献**：随仓库内置 `gbt7714` 宏包（v2.1.8），正文上标引用、
  连续引用自动压缩（[1-3]），**无需联网安装**。
- 🖋 **跨平台字体**：默认 `fandol`（Windows/macOS/Linux/Overleaf 皆可直接编译）；
  一键切换 macOS / Windows 系统字体。题名页校名用官方书法字标图。
- 🕵 **盲审模式**：`anonymous` 选项一键隐藏作者与导师信息。

---

## 二、环境要求

- **TeX 发行版**：TeX Live 2022+ / MacTeX / Overleaf 均可。
- **编译引擎**：**XeLaTeX**（务必使用 XeLaTeX，不要用 pdfLaTeX）。
- 已内置以下本应额外安装的文件，故 **TeX Live basic 精简版也能编译**：
  `gbt7714.sty`、`gbt7714-numerical.bst`、`gbt7714-author-year.bst`、`multirow.sty`。

> 在 Overleaf 上：新建项目并上传本仓库全部文件，菜单里把编译器设为 **XeLaTeX** 即可。

---

## 三、快速开始

```bash
# 用 make（推荐）
make            # 研究生 2024 版 -> main-2024.pdf
make V=2025     # 研究生 2025 新形式版 -> main-2025-newform.pdf
make both       # 两个研究生版本都编译
make bachelor   # 本科毕业设计（论文）-> main-bachelor.pdf
make clean      # 清理中间文件

# 或用 latexmk
latexmk -xelatex main-2024.tex
latexmk -xelatex main-2025-newform.tex

# 或手动四步（理解编译流程，以 2024 版为例）
xelatex main-2024
bibtex  main-2024
xelatex main-2024
xelatex main-2024
```

编译生成 `main-2024.pdf` / `main-2025-newform.pdf`。

---

## 四、目录结构

```
whut-dissertation-latex-template/
├── main-2024.tex            # 主文件【2024 版】学术博硕 / 专业硕士
├── main-2025-newform.tex    # 主文件【2025 版】专业学位新形式硕士
├── whut-thesis.cls          # 文档类（核心：版式、封面、题名页、声明…）
├── ref.bib                  # 参考文献数据库
├── tex/
│   ├── info.tex             # ★ 2024 版论文元信息（题目/作者/导师等）
│   ├── info-newform.tex     # ★ 2025 新形式论文元信息（专业学位字段）
│   ├── abstract.tex         # 中英文摘要
│   ├── chap01-intro.tex     # 第一章 绪论（含引用示例）
│   ├── chap02-method.tex    # 第二章（含公式、定理、插图示例）
│   ├── chap03-experiment.tex# 第三章（含三线表示例）
│   ├── chap04-conclusion.tex# 第四章 总结与展望
│   ├── acknowledgement.tex   # 致谢
│   ├── publications.tex      # 科研成果目录
│   └── appendix.tex          # 附录
├── figures/
│   ├── 武汉理工大学.png       # 题名页校名书法字标（官方字标）
│   └── example-figure.pdf/.tex  # 示例插图
├── official-format/         # 官方参考格式 docx 原件（2024/2025）
├── gbt7714.sty / *.bst      # 内置参考文献宏包（GB/T 7714，请勿删除）
├── multirow.sty             # 内置宏包（请勿删除）
├── latexmkrc / Makefile     # 编译脚本
└── styles/                  # 内置宏包的来源与版本说明
```

---

## 五、如何撰写自己的论文

1. **选版本**：2024 学术/专硕用 `main-2024.tex`；2025 专业学位新形式用
   `main-2025-newform.tex`。
2. **填写论文信息**：2024 版改 `tex/info.tex`，2025 版改 `tex/info-newform.tex`。
3. **选择学位类型**：改主文件第一行的文档类选项（见下表）。
4. **撰写正文**：在 `tex/chapXX-*.tex` 中写作，或新增章节文件并 `\input` 引入。
5. **管理参考文献**：把条目加入 `ref.bib`，正文用 `\cite{键名}` 引用。
6. **插入图片**：把图片放进 `figures/`，正文 `\includegraphics[width=...]{figures/你的图}`。

### 文档类选项

```latex
\documentclass[doctor]{whut-thesis}              % 2024 博士（学术学位）
\documentclass[master]{whut-thesis}              % 2024 硕士（学术学位，默认）
\documentclass[master,professional]{whut-thesis} % 2024 专业硕士
\documentclass[newform]{whut-thesis}             % 2025 专业学位新形式硕士
\documentclass[doctor,fontset=mac]{whut-thesis}  % 博士 + macOS 系统字体
\documentclass[master,anonymous]{whut-thesis}    % 硕士 + 盲审（隐藏姓名）
\documentclass[doctor,twoside]{whut-thesis}      % 双面印刷（章首另起右页）
```

| 选项 | 含义 |
|------|------|
| `master` / `doctor` | 硕士（默认）/ 博士 |
| `academic` / `professional` | 学术学位（默认）/ 专业学位 |
| `newform` | 2025 版「专业学位研究生新形式硕士」（蕴含专业硕士） |
| `anonymous` | 盲审，隐藏作者与导师信息 |
| `fontset=fandol` | 跨平台字体（默认） |
| `fontset=mac` | macOS 系统字体（宋体/黑体/楷体/仿宋） |
| `fontset=windows` | Windows 系统字体（SimSun/SimHei…） |
| `twoside` | 双面排版（默认 `oneside` 单面，无空白页） |

---

## 六、字体方案

默认使用 **fandol**（TeX Live 自带），保证任意平台开箱即用。若希望渲染效果更接近
Word（中易宋体/黑体），可切换为系统字体：

- **macOS**：`\documentclass[...,fontset=mac]{whut-thesis}`
- **Windows**：`\documentclass[...,fontset=windows]{whut-thesis}`
  （需系统装有 SimSun、SimHei、KaiTi、FangSong；Win 一般自带）

> `fontset` 由底层 `ctex` 宏包提供，更多取值见 ctex 文档。

---

## 七、常见问题（FAQ）

**Q：编译报错找不到 `gbt7714.sty` / `multirow.sty`？**
A：这些文件已随仓库放在根目录，请确保**在项目根目录编译**，且未删除它们。
若你的编辑器把编译目录设到了别处，请改回项目根目录。

**Q：参考文献没出来 / 引用显示为 `[?]`？**
A：参考文献需要「xelatex → bibtex → xelatex → xelatex」完整四步。用
`latexmk -xelatex` 或 `make` 可自动完成。

**Q：可以用 pdfLaTeX 吗？**
A：不可以。中文与字体配置依赖 XeLaTeX，请使用 XeLaTeX 编译。

**Q：参考文献想用「著者-出版年」制？**
A：把 `whut-thesis.cls` 中 `\RequirePackage[super,sort&compress]{gbt7714}`
改为 `\RequirePackage[authoryear]{gbt7714}`。

**Q：题名页的校名字标想换 / 图片找不到？**
A：题名页校名默认使用 `figures/武汉理工大学.png`（官方书法字标）。若该文件缺失，
会自动回退为楷书文字「武汉理工大学」。要换成自己的图片，在导言区用
`\schoollogo{figures/你的字标.png}`。

**Q：行距 / 页边距不符合院系要求？**
A：在 `whut-thesis.cls` 的「页面与行距」一节调整 `\geometry{...}` 与
`\linespread{...}`（已标注注释）。

**Q：图表标题字号 / 章节标题字号要改？**
A：见 `whut-thesis.cls` 中「标题层次格式」与 `\captionsetup`。

---

## 七·五、本科生毕业设计（论文）模板

本科模板为独立文档类 `whut-bachelor.cls`，主文件 `main-bachelor.tex`，与研究生模板
共用 `tex/` 章节、`ref.bib` 与内置宏包。

```bash
make bachelor          # 编译 -> main-bachelor.pdf
# 或 latexmk -xelatex main-bachelor.tex
```

- 选项：`\documentclass[design]{whut-bachelor}`（毕业设计）/ 默认毕业论文；
  `[fontset=mac]` 切换字体。
- 信息在 `tex/info-bachelor.tex` 填写（题目、学院、专业班级、姓名、指导教师、日期）。
- 与研究生模板的主要差异（依官方规范）：封面「武汉理工大学毕业设计（论文）」+ 题目
  + 学院/专业班级/姓名/指导教师；页边距上2.5/下2/左2.5/右2cm（左装订）；章节用
  **阿拉伯数字「第1章」**；图表公式用**点号**（图 3.1、表 3.1、式 (3.2)）；原创性声明
  为本科措辞（含保密/不保密勾选）；后置顺序 **参考文献 → 附录 → 致谢**。

## 八、关于格式依据与免责声明

- 版式参数依据**官方《武汉理工大学学位论文（印刷）参考格式（2024/2025 版）》**逐项
  校准（实测自官方 docx）：A4，版心上下 35mm、左右 32mm；正文小四号宋体、行距固定值
  约 20 磅；章标题小二号黑体居中（中文数字「第一章」），节三号、小节四号；摘要小三号
  入目录；参考文献五号字；后置顺序为致谢 → 参考文献 → 科研成果目录 → 附录。官方原件
  见 `official-format/` 目录。
- 官方来源：武汉理工大学研究生院 / 各学院"学籍学位—下载专区"
  （如 <http://sree.whut.edu.cn/yjsjy/xzzq/202502/t20250222_1319842.shtml>）。
- 实现细节亦参考了同源开源模板 [WUTthesis](https://github.com/Jiayin-Gu/WUTthesis)（顾加银）。
- 参考文献采用 **GB/T 7714—2015** 数字制。
- **本模板为非官方项目**，最终格式请以**所在院系 / 研究生院当年发布的最新规定**为准。
  正式提交前请仔细核对字体、字号、行距、页边距、参考文献等细节。

## 九、许可

- 模板代码（`whut-thesis.cls` 等）以 **LPPL v1.3c** 发布。
- 内置的 `gbt7714`、`multirow` 宏包版权归各自原作者所有，仅为方便编译而随附分发，
  其许可见 `styles/` 目录与各文件头部。
