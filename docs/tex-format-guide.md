# slide.tex 排版约定

> 该文件用于维护 `slide.tex` 的格式标准，方便后续协作保持一致的排版习惯。若有新增需求，请补充或修订此文档后再在 `slide.tex` 中实践。

## 基本规范
- **编译环境**：统一使用 `latexmk -xelatex slide.tex`（参照 `build_slide.sh`），确保中文字体由 ctex 正确加载。
- **编码与字符集**：所有文本使用 UTF-8，优先使用 ASCII 字符；若需箭头等符号，使用 `$\rightarrow$` 这类数学命令，避免字体缺失。
- **中文字体**：正文通过 `\kaishu` 设置为楷体；若需修改字体，请在 `XMU.sty` 中统一调整。

## 结构约定
- **章节划分**：按“背景 → 方法 → 实验 → 讨论 → 计划 → 参考文献”结构组织，新增章节需同步更新目录、`content-change-log.md` 与该文档。
- **段落与列表**：每个 `frame` 内应保持条目数量适中（≤6条），使用 `\begin{itemize}` 或 `\begin{block}` 表达重点。
- **图表引用**：
  - 图片放在 `pic/` 目录，统一使用 `\includegraphics[]{pic/...}`。
  - 表格使用 `booktabs` 套件，包含 `\toprule`/`\midrule`/`\bottomrule`。
- **导航与超链接**：
  - 章节顺序固定为“课题背景与目标、数据与方法、实验设计与结果、问题与讨论、下一步计划、参考文献”。
  - 点击每页顶部的章节标题时，应跳转到对应章节第一页，可通过 `\AtBeginSection` 配合 `\tableofcontents[currentsection]` 或自定义导航模板实现，需要在 `XMU.sty` 中同步维护。
  - 每页PDF顶部的小圆圈数量必须严格等于该章节的页数，高亮的小圆圈代表当前页，点击后能跳转到对应页；修改章节内容数量时，需同步更新导航模板中的小圆圈配置，确保序号与跳转目标一致。
  - 检查 `\hyperlink` / `\hypertarget` 等命令是否配置正确，保证 PDF 中的超链接可用；如使用 `beamer` 的默认导航条，需验证 `\setbeamertemplate{headline}` / `\setbeamertemplate{footline}` 的跳转逻辑。

## 代码与公式
- **Listings**：沿用 `\lstset` 定义的样式；若需新增语言，请在导言区扩展配置。
- **数学公式**：使用 `equation` 或 `align` 环境；多行对齐时务必对齐符 `&` 合理摆放。

## 格式检查
- 新增内容前先运行 `./build_slide.sh`，确认无字体或引用警告。
- 提交前请再次编译，排查 `Missing character`、`Empty thebibliography` 等警告；引用缺失时在正文补充 `\cite{}`。

## 维护流程
- 每次调整 `slide.tex` 排版规则，请同步更新此文件并在 `content-change-log.md` 的“维护指引”部分标注。
- 如需大规模重构，请先在本文件记录变动计划，再进行代码修改。
