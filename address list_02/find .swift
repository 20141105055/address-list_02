//
//  find .swift
//  address list_02
//
//  Created by 20141105055ljm on 16/7/5.
//  Copyright © 2016年 20141105055ljm. All rights reserved.
//

import Foundation
import UIKit
class find: UIViewController {
    
    var db:SQLiteDB!

    @IBOutlet weak var all: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        db = SQLiteDB.sharedInstance()
        db.execute("create table if not exists user(uid integer primary key,uname varchar(20),mobile varchar(20))")
        
    }
    
    @IBAction func tofind(sender: AnyObject) {
        selete()
    }
    func selete(){
    all.text = ""
    let data = db.query("select * from user")
        for var x=0;x<data.count;x++ {
        let tuser = data[x]
            all.text! += "姓名：" + String(tuser["uname"]!) + "手机：" + String(tuser["mobile"]!)  + "\n"
        }
    }
    
    @IBAction func alldelet(sender: AnyObject) {
        let sql = "delete * from user"
        let result = db.execute(sql)
        print(result)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
