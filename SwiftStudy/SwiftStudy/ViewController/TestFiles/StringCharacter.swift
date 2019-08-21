//
//  StringCharacter.swift
//  SwiftStudy
//
//  Created by gao on 2018/6/27.
//  Copyright © 2018年 gao. All rights reserved.
//  字符串和字符

/*
  字符串连接操作只需要简单地通过+符号将两个字符串相连即可。与 Swift 中其他值一样，能否更改字符串的值，取决于其被定义为常量还是变量。你也可以在字符串内插过程中使用字符串插入常量、变量、字面量表达成更长的字符串，这样可以很容易的创建自定义的字符串值，进行展示、存储以及打印。
 */

import UIKit

class StringCharacter: NSObject {
    
    //字符串字面量可以用于为常量和变量提供初始值：
    let someString = "Some string literal value"
    //注意someString常量通过字符串字面量进行初始化，Swift 会推断该常量为String类型。

    /* 多行字符串字面量
     如果你需要一个字符串是跨越多行的，那就使用多行字符串字面量 —— 由一对三个双引号包裹着的具有固定顺序的文本字符集：
     */
    let quotation = """
                    The White Rabbit put on his spectacles.  "Where shall I begin,
                    please your Majesty?" he asked.

                    "Begin at the beginning," the King said gravely, "and go on
                    till you come to the end; then stop."
                    """
    /* 一个多行字符串字面量包含了所有的在开启和关闭引号（"""）中的行。这个字符从开启引号(""")之后的第一行开始，到关闭引号(""")之前为止。这就意味着字符串开启引号之后(""")或者结束引号(""")之前都没有换行符号。（译者：下面两个字符串其实是一样的，虽然第二个使用了多行字符串的形式）
     */
    let singleLineString = "These are the same."
    let multilineString = """
                        These are the same.
                        adsfsf
                        asdsdfa \
                        afadfadf
                        """
    //如果你的代码中，多行字符串字面量包含换行符的话，则多行字符串字面量中也会包含换行符。如果你想换行，以便加强代码的可读性，但是你又不想在你的多行字符串字面量中出现换行符的话，你可以用在行尾写一个  反斜杠(\)作为续行符。
    
    let softWrappedQuotation = """
                                The White Rabbit put on his spectacles.  "Where shall I begin, \
                                please your Majesty?" he asked.
                                
                                "Begin at the beginning," the King said gravely, "and go on \
                                till you come to the end; then stop."
                                """
    //为了让一个多行字符串字面量开始和结束于换行符，请将换行写在第一行和最后一行，例如：
    let lineBreaks = """
    
    This string starts with a line break.
    It also ends with a line break.
    
    """
    //一个多行字符串字面量能够缩进来匹配周围的代码。关闭引号(""")之前的空白字符串告诉Swift编译器其他各行多少空白字符串需要忽略。然而，如果你在某行的前面写的空白字符串超出了关闭引号(""")之前的空白字符串，则超出部分将被包含在多行字符串字面量中。
    //在上面的例子中，尽管整个多行字符串字面量都是缩进的（源代码缩进），第一行和最后一行没有以空白字符串开始（实际的变量值）。中间一行的缩进用空白字符串（源代码缩进）比关闭引号(""")之前的空白字符串多，所以，它的行首将有4个空格。
    
    //MARK: 字符串字面量的特殊字符
    /*     字符串字面量的特殊字符
     字符串字面量可以包含以下特殊字符：
     
     转义字符\0(空字符)、\\(反斜线)、\t(水平制表符)、\n(换行符)、\r(回车符)、\"(双引号)、\'(单引号)。
     Unicode 标量，写成\u{n}(u为小写)，其中n为任意一到八位十六进制数且可用的 Unicode 位码。
     下面的代码为各种特殊字符的使用示例。 wiseWords常量包含了两个双引号。 dollarSign、blackHeart和sparklingHeart常量演示了三种不同格式的 Unicode 标量：
     */
    func specialCharacter() -> Void {
        
        let wiseWords = "\"Imagination is more important than knowledge\" - Einstein"
        // "Imageination is more important than knowledge" - Enistein
        let dollarSign = "\u{24}"             // $, Unicode 标量 U+0024
        let blackHeart = "\u{2665}"           // ♥, Unicode 标量 U+2665
        let sparklingHeart = "\u{1F496}"      // 💖, Unicode 标量 U+1F496
        //由于多行字符串字面量使用了三个双引号，而不是一个，所以你可以在多行字符串字面量里直接使用双引号（"）而不必加上转义符（\）。要在多行字符串字面量中使用 """ 的话，就需要使用至少一个转义符（\）：
        
        let threeDoubleQuotes = """
                            Escaping the first quote \"""
                            Escaping all three quotes \"\"\"
                            """
    }

    //MARK: 字符串操作
    func actionString() -> Void {
        /*
         初始化空字符串
         要创建一个空字符串作为初始值，可以将空的字符串字面量赋值给变量，也可以初始化一个新的String实例：
         */
        var emptyString = ""               // 空字符串字面量
        var anotherEmptyString = String()  // 初始化方法
        // 两个字符串均为空并等价。
        
        //您可以通过检查其Bool类型的isEmpty属性来判断该字符串是否为空：
        if emptyString.isEmpty {
            print("Nothing to see here")
        }
        // 打印输出："Nothing to see here"
        
        /* 字符串可变性
         您可以通过将一个特定字符串分配给一个变量来对其进行修改，或者分配给一个常量来保证其不会被修改.
         Swift 的String类型是值类型。 如果您创建了一个新的字符串，那么当其进行常量、变量赋值操作，或在函数/方法中传递时，会进行值拷贝。 任何情况下，都会对已有字符串值创建新副本，并对该新副本进行传递或赋值操作。
         */
        var variableString = "Horse"
        variableString += " and carriage"
        // variableString 现在为 "Horse and carriage"
        
        let constantString = "Highlander"
//        constantString += "and another Highlander"
        // 这会报告一个编译错误 (compile-time error) - 常量字符串不可以被修改。
        
        //您可通过for-in循环来遍历字符串，获取字符串中每一个字符的值：
        for character in "Dog!🐶" {
            print(character)
        }
        // D 
        // o
        // g
        // !
        // 🐶
        
        //另外，通过标明一个Character类型并用字符字面量进行赋值，可以建立一个独立的字符常量或变量：
        let exclamationMark: Character = "!"
        
        //字符串可以通过传递一个值类型为Character的数组作为自变量来初始化：
        let catCharacters: [Character] = ["C", "a", "t", "!", "🐱"]
        let catString = String(catCharacters)
        print(catString)
        // 打印输出："Cat!🐱"
        
        /* 连接字符串和字符
         字符串可以通过加法运算符（+）相加在一起（或称“连接”）创建一个新的字符串：
         */
        let string1 = "hello"
        let string2 = " there"
        var welcome = string1 + string2
        // welcome 现在等于 "hello there"
        
        //您也可以通过加法赋值运算符 (+=) 将一个字符串添加到一个已经存在字符串变量上：
        var instruction = "look over"
        instruction += string2
        // instruction 现在等于 "look over there"
        
        //您可以用append()方法将一个字符附加到一个字符串变量的尾部：
//        let exclamationMark: Character = "!"
        welcome.append(exclamationMark)
        // welcome 现在等于 "hello there!"
        
        /* 注意：
         您不能将一个字符串或者字符添加到一个已经存在的字符变量上，因为字符变量只能包含一个字符。
         */
        
        //如果你需要使用多行字符串字面量来拼接字符串，并且你需要字符串每一行都以换行符结尾，包括最后一行：
        let badStart = """
                        one
                        two
                        """
        let end = """
                three
                """
        print(badStart + end)
        // 打印两行:
        // one
        // twothree
        
        let goodStart = """
                        one
                        two

                        """
        print(goodStart + end)
        // 打印三行:
        // one
        // two
        // three
        //上面的代码，把 badStart 和 end 拼接起来的字符串非我们想要的结果。因为 badStart 最后一行没有换行符，它与 end 的第一行结合到了一起。相反的，goodStart 的每一行都以换行符结尾，所以它与 end 拼接的字符串总共有三行，正如我们期望的那样。
        
        /* 字符串插值
         字符串插值是一种构建新字符串的方式，可以在其中包含常量、变量、字面量和表达式。字符串字面量和多行字符串字面量都可以使用字符串插值。 您插入的字符串字面量的每一项都在以反斜线为前缀的圆括号中：
         */
        let multiplier = 3
        let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"
        // message 是 "3 times 2.5 is 7.5"
        /*
         在上面的例子中，multiplier作为\(multiplier)被插入到一个字符串常量量中。 当创建字符串执行插值计算时此占位符会被替换为multiplier实际的值。
         multiplier的值也作为字符串中后面表达式的一部分。 该表达式计算Double(multiplier) * 2.5的值并将结果 (7.5) 插入到字符串中。 在这个例子中，表达式写为\(Double(multiplier) * 2.5)并包含在字符串字面量中。
         注意：
         插值字符串中写在括号中的表达式不能包含非转义反斜杠 (\)，并且不能包含回车或换行符。不过，插值字符串可以包含其他字面量。
         */
    }

    //MARK: 访问和修改字符串
    func actionString2() -> Void {
        /*  字符串索引
         每一个String值都有一个关联的索引(index)类型，String.Index，它对应着字符串中的每一个Character的位置。
         前面提到，不同的字符可能会占用不同数量的内存空间，所以要知道Character的确定位置，就必须从String开头遍历每一个 Unicode 标量直到结尾。因此，Swift 的字符串不能用整数(integer)做索引。
         
         使用startIndex属性可以获取一个String的第一个Character的索引。使用endIndex属性可以获取最后一个Character的后一个位置的索引。因此，endIndex属性不能作为一个字符串的有效下标。如果String是空串，startIndex和endIndex是相等的。
         
         通过调用 String 的 index(before:) 或 index(after:) 方法，可以立即得到前面或后面的一个索引。您还可以通过调用 index(_:offsetBy:) 方法来获取对应偏移量的索引，这种方式可以避免多次调用  index(before:) 或 index(after:) 方法。
         你可以使用下标语法来访问 String 特定索引的 Character。
         */
        
        let greeting = "Guten Tag!"
        greeting[greeting.startIndex]
        // G
        greeting[greeting.index(before: greeting.endIndex)]
        // !
        greeting[greeting.index(after: greeting.startIndex)]
        // u
        let index = greeting.index(greeting.startIndex, offsetBy: 7)
        greeting[index]
        // a
        //试图获取越界索引对应的 Character，将引发一个运行时错误。
        
//        greeting[greeting.endIndex] // error
//        greeting.index(after: endIndex) // error
        
        //使用 indices 属性会创建一个包含全部索引的范围(Range)，用来在一个字符串中访问单个字符。
        for index in greeting.indices {
            print("\(greeting[index]) ", terminator: "")
        }
        // 打印输出 "G u t e n T a g ! "
        /*
         注意：
         您可以使用 startIndex 和 endIndex 属性或者 index(before:) 、index(after:) 和  index(_:offsetBy:) 方法在任意一个确认的并遵循 Collection 协议的类型里面，如上文所示是使用在  String 中，您也可以使用在 Array、Dictionary 和 Set中。
         */
        
        /* 插入和删除
         调用 insert(_:at:) 方法可以在一个字符串的指定索引插入一个字符，调用 insert(contentsOf:at:) 方法可以在一个字符串的指定索引插入一个段字符串。
         */
        var welcome = "hello"
        welcome.insert("!", at: welcome.endIndex)
        // welcome 变量现在等于 "hello!"
        
        welcome.insert(contentsOf:" there", at: welcome.index(before: welcome.endIndex))
        // welcome 变量现在等于 "hello there!"
        
        // 调用 remove(at:) 方法可以在一个字符串的指定索引删除一个字符，调用 removeSubrange(_:) 方法可以在一个字符串的指定索引删除一个子字符串。
        welcome.remove(at: welcome.index(before: welcome.endIndex))
        // welcome 现在等于 "hello there"
        
        let range = welcome.index(welcome.endIndex, offsetBy: -6)..<welcome.endIndex
        welcome.removeSubrange(range)
        // welcome 现在等于 "hello"
       // 注意： 您可以使用 insert(_:at:)、insert(contentsOf:at:)、remove(at:) 和  removeSubrange(_:) 方法在任意一个确认的并遵循 RangeReplaceableCollection 协议的类型里面，如上文所示是使用在 String 中，您也可以使用在 Array、Dictionary 和 Set 中。
        
        
    }
    
}
