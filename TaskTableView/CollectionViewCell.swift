//
//  CollectionViewCell.swift
//  TaskTableView
//
//  Created by Sierra 4 on 08/02/17.
//  Copyright © 2017 codebrew2. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell
{
    
    @IBOutlet var underlineView: UIView!
    @IBOutlet var lblCategoryName: UILabel!
    var foodtype : foodtype?
    {
        didSet
        {
            updateUI()
        }
    }
    fileprivate func updateUI()
    {
        lblCategoryName?.text = foodtype?.name
        lblCategoryName.intrinsicContentSize.width
    }
}
