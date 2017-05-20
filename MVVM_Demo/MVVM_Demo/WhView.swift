//
//  WhView.swift
//  MVVM_Demo
//
//  Created by weihua on 2017/5/20.
//  Copyright © 2017年 Twh. All rights reserved.
//

import UIKit

let identy = "cell"
let kScreenWidth = UIScreen.main.bounds.width
let kScreenHeight = UIScreen.main.bounds.height

class WhView: UIView,UITableViewDataSource,UITableViewDelegate {

    var tableView:UITableView?
    
    var viewModel:WhViewModel?
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight - 200), style: UITableViewStyle.plain)
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView?.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: identy)
        self.addSubview(tableView!)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: identy, for: indexPath)
        cell.textLabel?.text = self.viewModel?.titleContent
        return cell
    }
    
    public func setWithViewModel(vm:WhViewModel){
    
        self.viewModel = vm
       
        /**
         1、该方法为，观察vm中的属性titleContent
         2、observe：被观察者、keyPath：被观察者的属性、options：观察的类型(新值、旧值、初始值)
         3、observer：观察者(一般为self对象)、observe：被观察者、change：存储有改变值的字典
         */
        self.kvoController.observe(vm, keyPath: "titleContent", options:[.new,.initial]) { (observer, observe, change) in
            
            self.tableView?.reloadData()
        }
    }
    
}
