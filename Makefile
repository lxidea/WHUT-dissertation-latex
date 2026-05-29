# 武汉理工大学学位论文模板 Makefile
# 研究生：make            -> 2024 版（学术学位/专业硕士）
#         make V=2025     -> 2025 版（专业学位研究生新形式硕士）
# 本科生：make bachelor   -> 本科毕业设计（论文）
V    = 2024
MAIN = $(if $(filter 2025,$(V)),main-2025-newform,main-2024)
LATEX = xelatex -interaction=nonstopmode -file-line-error
BIBTEX = bibtex

.PHONY: all both bachelor clean cleanall view lm

# 总是执行完整四步编译（含参考文献、目录、交叉引用），避免因时间戳跳过重编
all:
	$(LATEX) $(MAIN)
	-$(BIBTEX) $(MAIN)
	$(LATEX) $(MAIN)
	$(LATEX) $(MAIN)

# 一次编译两个研究生版本
both:
	$(MAKE) V=2024 all
	$(MAKE) V=2025 all

# 本科毕业设计（论文）
bachelor:
	$(LATEX) main-bachelor
	-$(BIBTEX) main-bachelor
	$(LATEX) main-bachelor
	$(LATEX) main-bachelor

# 若已安装 latexmk： make lm  /  make lm V=2025
lm:
	latexmk -xelatex $(MAIN).tex

view: all
	open $(MAIN).pdf

clean:
	rm -f *.aux *.log *.out *.toc *.lof *.lot *.bbl *.blg *.xdv *.synctex.gz \
	      tex/*.aux

cleanall: clean
	rm -f main-2024.pdf main-2025-newform.pdf main-bachelor.pdf
