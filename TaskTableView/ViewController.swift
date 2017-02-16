//
//  ViewController.swift
//  TaskTableView
//
//  Created by Sierra 4 on 07/02/17.
//  Copyright © 2017 codebrew2. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    var grandlists = [
                            [
                                itemList(discount: "5% OFF", name: "Aashirvaad Whole Wheat Atta", quantity: "10 kg", price: "$380", newprice: "$360", imageOFitem: URL(string: "https://p1.zopnow.com/images/products/320/aashirvaad-whole-wheat-atta-v-10-kg-4.png")),
                                itemList(discount: "", name: "Aashirvaad Multigrain Atta", quantity: "5 kg", price: "$245", newprice: "", imageOFitem : URL(string: "https://p1.zopnow.com/images/products/320/aashirvaad-whole-wheat-atta-v-10-kg-4.png")),
                            itemList(discount: "", name: "Aashirvaad Whole Wheat Atta", quantity: "5 kg", price: "$185", newprice: "", imageOFitem : URL(string: "https://p1.zopnow.com/images/products/320/aashirvaad-whole-wheat-atta-v-10-kg-4.png")),
                            itemList(discount: "", name: "Aashirvaad Select Superior Atta", quantity: "10 kg", price: "$360",newprice: "", imageOFitem : URL(string: "https://p1.zopnow.com/images/products/320/aashirvaad-whole-wheat-atta-v-10-kg-4.png")),
                            itemList(discount: "", name: "Aashirvaad Whole Wheat Atta", quantity: "1 kg", price: "$350",newprice: "", imageOFitem : URL(string: "https://p1.zopnow.com/images/products/320/aashirvaad-whole-wheat-atta-v-10-kg-4.png"))
                            ],
                            [
                                itemList(discount: "", name: "India Gate Dabur Basmati Rice", quantity: "10 kg", price: "$360",newprice: "", imageOFitem : URL(string: "http://sugamsauda.com/image/cache/data/LUCKNOW/GROCERY/RICE/india%20gate%20basmati%20rice%20dubar%205kg-400x400.jpg")),
                            itemList(discount: "", name: "India Gate Feast Rozzana Rice", quantity: "1 kg", price: "$360",newprice: "", imageOFitem : URL(string: "http://sugamsauda.com/image/cache/data/LUCKNOW/GROCERY/RICE/india%20gate%20basmati%20rice%20dubar%205kg-400x400.jpg")),
                            itemList(discount: "", name: "India Gate Dabur Basmati Rice", quantity: "2 kg", price: "$360",newprice: "", imageOFitem : URL(string: "http://sugamsauda.com/image/cache/data/LUCKNOW/GROCERY/RICE/india%20gate%20basmati%20rice%20dubar%205kg-400x400.jpg")),
                            itemList(discount: "", name: "India Gate Feast Basmati Rice", quantity: "5 kg", price: "$360",newprice: "", imageOFitem : URL(string: "http://sugamsauda.com/image/cache/data/LUCKNOW/GROCERY/RICE/india%20gate%20basmati%20rice%20dubar%205kg-400x400.jpg")),
                            itemList(discount: "", name: "India Gate Dabur Basmati Rice", quantity: "10 kg", price: "$360",newprice: "", imageOFitem : URL(string: "http://sugamsauda.com/image/cache/data/LUCKNOW/GROCERY/RICE/india%20gate%20basmati%20rice%20dubar%205kg-400x400.jpg"))
                            ]
                     ]
   
    
    @IBOutlet var tableView: UITableView!
    let fooditems = [
                        foodtype(name: "Flour & Grain"),
                        foodtype(name: "Rice"),
                        foodtype(name: "Juice"),
                        foodtype(name: "Vegatables"),
                        foodtype(name: "Fruits"),
                        foodtype(name: "Beans")
        
                    ]
    var sectionIndex = 0
    var selectedCell = 0
}

// MARK:  UITableViewDataSourse Methods
extension ViewController : UITableViewDataSource, UITableViewDelegate
{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return grandlists[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TextCell", for: indexPath as IndexPath) as! TableViewCell
        cell.itemlist = grandlists[indexPath.section][indexPath.row]
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return grandlists.count
    }
    
}

// MARK:  UICollectionViewDataSourse Methods
extension ViewController : UICollectionViewDelegate, UICollectionViewDataSource
{
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return fooditems.count
    }

    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath)as! CollectionViewCell
        cell.foodtype = fooditems[indexPath.row]
        if  selectedCell == indexPath.row
        {
            cell.underlineView.backgroundColor = UIColor.orange
        }
        else
        {
            cell.underlineView.backgroundColor = UIColor.white
        }
        return cell
    }
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        let numberOfSections = self.tableView.numberOfSections
        let numberOfRows = self.tableView.numberOfRows(inSection: numberOfSections-1)
        let indexPath = IndexPath(row: numberOfRows-1 , section: numberOfSections-1)
        sectionIndex = numberOfSections - 1
        selectedCell = indexPath.row
        self.tableView.scrollToRow(at: indexPath, at: UITableViewScrollPosition.middle, animated: true)
        collectionView.reloadData()
        tableView.reloadData()
    }
}
