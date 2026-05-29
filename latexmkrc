# latexmk 配置：默认使用 XeLaTeX + BibTeX 全流程编译
# 用法： latexmk        （编译 main-2024.tex）
#        latexmk -c     （清理中间文件）
#        latexmk -C     （清理含 PDF）
$pdf_mode        = 5;          # 5 = xelatex
$xelatex         = 'xelatex -interaction=nonstopmode -file-line-error -shell-escape %O %S';
$bibtex_use      = 2;          # 总是运行 bibtex
$default_files   = ('main-2024.tex');
$out_dir         = '.';

# 让 TeX 在当前目录查找随附的 .sty / .bst（本仓库已置于根目录，通常无需额外设置）
$clean_ext       = 'bbl run.xml synctex.gz nav snm vrb xdv';
