# 哈尔滨工业大学（深圳）硕士开题及中期报告latex模板

本模板在[hitszthesis](https://github.com/YangLaTeX/hitszthesis)基础上修改得到

参考教务部给出的[word版本](http://due.hitsz.edu.cn/info/1210/1827.htm)实现

## 快速开始

### 1. 安装 LaTeX 环境

**Ubuntu/Debian:**
```bash
sudo apt update
sudo apt install -y texlive-xetex texlive-lang-chinese texlive-bibtex-extra \
                     texlive-latex-extra texlive-fonts-extra texlive-science \
                     fonts-noto-cjk
```

**其他系统:** 安装完整 TeX Live，确保包含 XeLaTeX、中文支持、BibTeX 及常用宏包。

### 2. 编译论文

```bash
git clone <repository-url>
cd hitszthesis_master_template
make pdf              # 编译并生成 PDF
```

类文件（`.cls`, `.cfg`, `.ist`）将在首次编译时自动生成。

## 使用方法

- `make pdf` - 编译论文并复制 PDF 到根目录
- `make thesis` - 仅编译（输出在 build/ 目录）
- `make clean` - 清理编译文件
- `make help` - 查看所有可用命令

## Roadmap

- [x] 删去hitszthesis中开题报告不需要的内容
- [x] 修改页眉文本
- [x] 删去页脚中的横线
- [x] 修改封面（与word版本字体不完全一致，建议单独导出word封面，再使用PDF工具拼接）
