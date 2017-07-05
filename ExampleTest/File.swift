//
//  File.swift
//  ExampleTest
//
//  Created by tran trung thanh on 7/5/17.
//  Copyright © 2017 tran trung thanh. All rights reserved.
//

import Foundation
class A
{
    let pro1: String
    let pro2: String
    let pro3: Bool
    
    init(pro1: String,pro2: String,pro3: Bool)
    {
        self.pro1 = pro1
        self.pro2 = pro2
        self.pro3 = pro3
    }
    convenience init(pro1: String)
    {
        self.init(pro1: pro1,pro2: "thanh",pro3: true)
    }
}
class B: A
{
    let pro4: String
    var pro5: String?
    init(pro1: String,pro2: String,pro3: Bool,pro4: String) {
        self.pro4 = pro4;
        super.init(pro1: pro1,pro2: pro2,pro3: pro3)
    }
    convenience init(pro1: String){
        self.init(pro1: pro1, pro2: "thu", pro3: false, pro4: "")
    }
}
