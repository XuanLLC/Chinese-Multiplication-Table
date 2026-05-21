# Learn Chinese Numbers through Multiplication Table without Learning their pronunciations

思路源于：
- [Use multiplication table to practice pronunciation](https://www.reddit.com/r/ChineseLanguage/comments/1i91d34/use_multiplication_table_to_practice_pronunciation/)
- [1-week mini-experiment: learn the character without learning pronunciation](https://www.reddit.com/r/ChineseLanguage/comments/1hjoaf3/1week_miniexperiment_learn_the_character_without/)

代码从 [Complete a game with logic](https://developer.apple.com/tutorials/develop-in-swift/complete-a-game-with-logic) 修改而来.

每个tab是不同的练习方式：

1. 由中文数字得到阿拉伯数字的积，如看三、四得到 12
2. 由中文数字得到中文数字的积，如看三、四得到 一十二
3. 看中文数字的积以及两个中文数字，按先小后大点击后通过，如看 一十二，四、三，需先点三，后点四
4. 看中文数字的积在九个数字中选取对应的几个，如看 一十二 选 三、四 或者 二、六；四三、六二都允许，（彩蛋）甚至三、二、二
5. 方阵找连线，在五乘五方阵中，找到任一横、竖、对角线中能够达成 甲乘乙 得到 丙 的排列，并按甲、乙、丙顺序点击（甲乙无需先小后大，也支持省略十的快速读法）。
6. 待定：俄罗斯方块？


## 开发笔记

如通过wifi加载app，copy shared cache symbols 很慢，至少需要几十分钟

You’re all set.
We’ll send confirmation and activation details to: f••••••••••••••••••••••e@gmail.com
Return to Apple Developer.
Order #W1582406705 还需激活？

Team "Xuan Wu (Personal Team)" is not enrolled in the Apple Developer Program.
Distribution requires enrollment in the Apple Developer Program. Visit https://developer.apple.com/account to enroll.
- 据说要48小时才激活，当前5/9 9:00
