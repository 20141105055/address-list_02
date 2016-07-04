//
//  ViewController.swift
//  address list_02
//
//  Created by 20141105055ljm on 16/7/4.
//  Copyright © 2016年 20141105055ljm. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var db:SQLiteDB!
    
    @IBOutlet weak var txtUname: UITextField!
    
    @IBOutlet weak var txtMobile: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        db = SQLiteDB.sharedInstance()
        db.execute("create table if not exists t_user(uid integer primary key,uname varchar(20),mobile varchar(20))")
        initUser()
    }
    
    @IBAction func saveClicked(sender: AnyObject) {
        saveUser()
    }
    func initUser(){
        let data = db.query("select * from t_user")
        if data.count > 0{
        let user = data[data.count - 1]
            txtMobile.text = user["uname"] as? String
            txtUname.text = user["moble"] as? String
        }
    }
    func saveUser() {
        let uname = self.txtUname.text!
        let mobile = self.txtMobile.text!
        let sql = "insert into t_user(uname,mobile) values('\(uname)','\(mobile)')"
        let result = db.execute(sql)
        print(result)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

