//
//  WhViewModel.swift
//  MVVM_Demo
//
//  Created by weihua on 2017/5/20.
//  Copyright © 2017年 Twh. All rights reserved.
//

import UIKit

class WhViewModel: NSObject {

    dynamic var titleContent:String?
    
    public func setWithModel(model:WhModel){
     
        self.kvoController.observe(model, keyPath: "title", options: [.new,.initial], block: { (observer, observe, change) in
            
            self.titleContent = change[NSKeyValueChangeKey.newKey] as? String
        })
    
    }
}
