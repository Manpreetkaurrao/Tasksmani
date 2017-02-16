//
//  itemList.swift
//  TaskTableView
//
//  Created by Sierra 4 on 08/02/17.
//  Copyright © 2017 codebrew2. All rights reserved.
//

import Foundation

class  itemList
{
    var discount : String?
    var name : String?
    var quantity : String?
    var price : String?
    var newprice : String?
    var imageOFitem : URL?
    init(discount : String?, name : String? , quantity : String?, price : String?, newprice : String?, imageOFitem : URL?)
    {
        self.discount = discount
        self.name = name
        self.quantity = quantity
        self.price = price
        self.newprice = newprice
        self.imageOFitem = imageOFitem
    }
}
