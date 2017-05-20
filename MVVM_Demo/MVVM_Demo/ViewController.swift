//
//  ViewController.swift
//  MVVM_Demo
//
//  Created by weihua on 2017/5/20.
//  Copyright © 2017年 Twh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var mvvmModel:WhModel?
    var mvvmView:WhView?
    var mvvmViewModel:WhViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        mvvmModel = WhModel()
        mvvmModel?.title = "hello world"
        
        mvvmView = WhView(frame: view.bounds)
        view.addSubview(mvvmView!)
        
        mvvmViewModel = WhViewModel()
        mvvmView?.setWithViewModel(vm: mvvmViewModel!)
        mvvmViewModel?.setWithModel(model: mvvmModel!)
        
        let btn = UIButton(frame: CGRect(x: 50, y: 500, width: 50, height: 30))
        btn.backgroundColor = UIColor.red
        btn.setTitle("你好", for: UIControlState.normal)
        btn.addTarget(self, action: #selector(changeTitle(btn:)), for: UIControlEvents.touchUpInside)
        view.addSubview(btn)
        
        let btn2 = UIButton(frame: CGRect(x: 250, y: 500, width: 50, height: 30))
        btn2.backgroundColor = UIColor.green
        btn2.setTitle("世界", for: UIControlState.normal)
        btn2.addTarget(self, action: #selector(changeTitle(btn:)), for: UIControlEvents.touchUpInside)
        view.addSubview(btn2)
    }

    func changeTitle(btn:UIButton)  {
        
        mvvmModel?.title = btn.currentTitle
    }


}

