//
//  WhModel.swift
//  MVVM_Demo
//
//  Created by weihua on 2017/5/20.
//  Copyright © 2017年 Twh. All rights reserved.
//

import UIKit

class WhModel: NSObject {
 
   /**
     1、标记为dynamic的变量/函数会隐式的加上@objc关键字，它会使用OC的runtime机制
     2、dynamic关键字，告诉编译器使用动态分发而不是静态分发
     3、使用swift与oc混编时，oc代码中使用到runtime机制，且涉及到swift中的属性时，前面需要加上dynamic关键字修饰
     4、这里的FBKVO框架里面使用到了oc中的runtime机制，且该model的属性title被监听，因此需要加上dynamic修饰
    */
   dynamic var title:String?
}
