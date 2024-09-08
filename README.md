# 哈尔滨工业大学（深圳）硕士开题报告latex模板

本模板在[hitszthesis](https://github.com/YangLaTeX/hitszthesis)基础上修改得到。

参考教务部给出的[word版本](http://due.hitsz.edu.cn/info/1210/1827.htm)实现。

## 使用方法

- 使用方法与hitszthesis基本一致。请先确保所用环境可以正确编译hitszthesis。

- 本项目只保留Makefile编译。建议在unix环境安装texlive组件，环境需求与hitszthesis相同。

- 使用`make cleanall`清理文件，使用`make thesis`编译文档。

## Roadmap

- [x] 删去hitszthesis中开题报告不需要的内容
- [x] 修改页眉文本
- [x] 删去页脚中的横线
- [x] 修改封面（与word版本字体不完全一致，也可单独导出word封面在使用PDF工具拼接）
