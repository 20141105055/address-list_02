//
//  Alter.swift
//  address list_02
//
//  Created by 20141105055ljm on 16/7/12.
//  Copyright © 2016年 20141105055ljm. All rights reserved.
//

import Foundation
import UIKit
class alter: UIViewController {
    
    
    @IBOutlet weak var name: UITextField!
    
    @IBOutlet weak var phone: UITextField!
    var db:SQLiteDB!
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        db = SQLiteDB.sharedInstance()
        db.execute("create table if not exists user(uid integer primary key,uname varchar(20),mobile varchar(20))")
        
    }
    
    
    @IBAction func save(sender: AnyObject) {
        save()
        showAlert()
    }
    
    
    func save(){
        let x=name.text!
        let y=phone.text!
        let sql = "update user set mobile='\(y)' where uname='\(x)'"
        print("sql:\(sql)")
        let result = db.execute(sql)
        print(result)
    }
    func showAlert() {
        var alert = UIAlertView(title: "提示",message: " 更改联系人成功！",delegate: self,cancelButtonTitle: "确定")
        alert.alertViewStyle = UIAlertViewStyle.Default
        alert.show()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

