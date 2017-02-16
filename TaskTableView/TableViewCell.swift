//
//  TableViewCell.swift
//  TaskTableView
//
//  Created by Sierra 4 on 08/02/17.
//  Copyright © 2017 codebrew2. All rights reserved.
//

import UIKit
import Kingfisher

class TableViewCell: UITableViewCell {

    @IBOutlet var lblNewPrice: UILabel!
    @IBOutlet var lblDiscount: UILabel!
    @IBOutlet var imgOfItem: UIImageView!
    @IBOutlet var lblQuantity: UILabel!
    @IBOutlet var lblname: UILabel!
    @IBOutlet var lblPrice: UILabel!
    var itemlist : itemList?
    {
        didSet
        {
            updateUI()
        }
    }
    
    fileprivate func updateUI()
    {
        lblDiscount?.text = itemlist?.discount
        lblname?.text = itemlist?.name
        lblQuantity?.text = itemlist?.quantity
        lblPrice?.text = itemlist?.price
        lblNewPrice?.text = itemlist?.newprice
        imgOfItem.kf.setImage(with: itemlist?.imageOFitem)
    }
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)
    }
}
