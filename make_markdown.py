# -*- coding: utf-8 -*-
# pandoc コマンドを利用して全てのmarkdownにhtmlファイルを用意する
# python 2.7.6 (Macデフォルト) で動作確認済み
# 引数がひとつある場合にはそのファイルのみを、そうでない場合は全て
import sys
import glob
import commands

param = sys.argv
if (len(param) == 2):
    f = param[1]
    h = f[0:-3] + '.html'
    command = "pandoc %s -s -o %s" % (f, h)
    commands.getoutput(command)
    quit()

markdowns = glob.glob('*.md')

for m in markdowns:
    h = m[0:-3] + '.html'
    command = "pandoc %s -s -o %s" % (m, h)
    print(command)
    output = commands.getoutput(command)
    print(output)
