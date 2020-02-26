//
//  ViewController.swift
//  UITableViewSectionIndex
//
//  Created by home on 2020/02/26.
//  Copyright © 2020 Swift-beginners. All rights reserved.
//

import UIKit

struct List {
    var listID: Int
    var listName1: String
    var listName2: String
}

class ViewController: UIViewController {
    
    let lists = [
        List(listID: 15, listName1: "テスト", listName2: "test"),
        List(listID: 3, listName1: "テント", listName2: "tent"),
        List(listID: 10, listName1: "リンゴ", listName2: "apple"),
        List(listID: 12, listName1: "オレンジ", listName2: "orange"),
        List(listID: 5, listName1: "サカナ", listName2: "fish")
    ]
    
    private var groupedList = [String: [List]]()
    private var sortedList = [(key: String, value: [List])]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let groupedList = Dictionary(grouping: self.lists, by: { String($0.listName1.prefix(1)) })
        self.sortedList = groupedList.sorted{$0.key < $1.key}
        print(sortedList)
    }
}
