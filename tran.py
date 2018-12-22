# coding: u8

import re
from pathlib import Path


ROOT = Path(__file__).resolve().parent
MAIN = ROOT


# 将 iconfont 的 css 自动转换为 dart 代码

def translate():
    print('Begin translate...')

    code = """
import 'package:flutter/widgets.dart';


// 代码由程序自动生成。
// 请不要对此文件做任何修改。详细说明见本文件末尾


class MyIconFont {

    MyIconFont._();

    static const font_name = 'MyIconFont';

{icon_codes}

/*
如果你有新的图标需要导入到字体中：

1. 联系我，将你加入到 iconfont(http://www.iconfont.cn) 的 xxx 项目中
2. 在 iconfont 中选择需要的图标，加入购物车
3. 然后点击顶部的购物车，弹出右边栏，选择“添加到项目”，选择 xxx，点击“确定”
4. 最好修改一下每个新增图标的名称，然后下载至本地
5. 将压缩包内所有文件拷贝到 iconfont 目录下，形如：
iconfont
├── demo.css
├── demo_fontclass.html
├── demo_symbol.html
├── demo_unicode.html
├── iconfont.css
├── iconfont.eot
├── iconfont.js
├── iconfont.svg
├── iconfont.ttf
└── iconfont.woff

6. 拷贝完成后通过以下命令完成转换：
   $ python3 ./translate_icon_font_from_css_to_dart.py
7. 其中转换时需要 iconfont.ttf 和 iconfont.css 文件;实际项目运行时只需要 iconfont.ttf 文件。其余文件不需要。
8. 开发时，通过右键 demo_fontclass.html 使用 Chrome 打开来查看图标对应的 unicode 码，使用时，将中划线“-”替换为下划线“_”。
*/
}
""".strip()

    strings = []

    tmp = []
    p = re.compile(r'.icon-(.*?):.*?"\\(.*?)";')
    for line in open(MAIN / 'iconfont/iconfont.css'):
        line = line.strip()
        if line:
            res = p.findall(line)
            if res:
                name, value = res[0]
                name = name.replace('-', '_')
                tmp.append((name.lower(), value))

    tmp.sort()
    for name, value in tmp:
        string = f'    static const IconData {name} = const IconData(0x{value}, fontFamily: font_name);'
        strings.append(string)

    strings = '\n'.join(strings)
    code = code.replace('{icon_codes}', strings)

    open(MAIN / 'lib/iconfont.dart', 'w').write(code)

    print('Finish translate...')


if __name__ == "__main__":
    translate()