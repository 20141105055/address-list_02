//
//  Delet.swift
//  address list_02
//
//  Created by 20141105055ljm on 16/7/4.
//  Copyright © 2016年 20141105055ljm. All rights reserved.
//

import Foundation
import UIKit
class Delet: UIViewController {
    
    @IBOutlet weak var todelet: UITextField!
    var db:SQLiteDB!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        db = SQLiteDB.sharedInstance()
        db.execute("create table if not exists user(uid integer primary key,uname varchar(20),mobile varchar(20))")
        //initUser()
    }
    
    @IBAction func delet(sender: AnyObject) {
        delt()
    }
    
    @IBAction func deletbyphone(sender: AnyObject) {
        deletbyphone()
    }
    func delt(){
        let x=todelet.text!
        let sql = "delete from user where uname='\(x)'"
        print("sql:\(sql)")
        let result = db.execute(sql)
        print(result)
    }
    func deletbyphone(){
        let y=todelet.text!
        let sql = "delete from user where mobile='\(y)'"
        print("sql:\(sql)")
        let result = db.execute(sql)
        print(result)
    }
        override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
