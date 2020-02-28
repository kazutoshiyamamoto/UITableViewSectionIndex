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
    
    private var searchController = UISearchController()
    
    @IBOutlet weak var tableView: UITableView!
    
    let lists = [
        List(listID: 15, listName1: "デラウェア", listName2: "delaware"),
        List(listID: 3, listName1: "ライム", listName2: "sour"),
        List(listID: 10, listName1: "リンゴ", listName2: "apple"),
        List(listID: 12, listName1: "オレンジ", listName2: "orange"),
        List(listID: 5, listName1: "サカナ", listName2: "fish"),
        List(listID: 13, listName1: "ピーチ", listName2: "peach"),
        List(listID: 17, listName1: "グレープ", listName2: "grape"),
        List(listID: 19, listName1: "ナシ", listName2: "pear"),
        List(listID: 21, listName1: "パイナップル", listName2: "pineapple"),
        List(listID: 34, listName1: "マンゴー", listName2: "mango"),
        List(listID: 45, listName1: "ユズ", listName2: "citron"),
        List(listID: 2, listName1: "ライチ", listName2: "litchi")
    ]
    
    private var sectionTitles = [String]()
    private var filteredSectionTitles = [String]()
    private var sortedList = [(key: String, value: [List])]()
    private var filteredList = [(key: String, value: [List])]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.searchController = UISearchController(searchResultsController: nil)
        self.searchController.searchResultsUpdater = self
        self.searchController.obscuresBackgroundDuringPresentation = false
        self.searchController.searchBar.placeholder = "検索ワードを入力"
        self.navigationItem.searchController = self.searchController
        self.navigationItem.hidesSearchBarWhenScrolling = false
        
        self.tableView.sectionIndexColor = UIColor.red
        
        let groupedList = Dictionary(grouping: self.lists, by: { String($0.listName1.prefix(1)) })
        self.sortedList = groupedList.sorted{$0.key < $1.key}
        
        for tuple in self.sortedList {
            self.sectionTitles.append(tuple.key)
        }
    }
}

extension ViewController: UITableViewDataSource {
    //セクションの個数
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.sectionTitles.count
    }
    
    //セクション名
    func tableView(_ tableView:UITableView, titleForHeaderInSection section:Int) -> String?{
        return self.sectionTitles[section]
    }
    
    // 画面右側の索引
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return self.sectionTitles
    }
    
    // 各セクションのセルの個数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.sortedList[section].value.count
    }
    
    // セルの設定
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for:indexPath) as UITableViewCell
        cell.textLabel?.text = self.sortedList[indexPath.section].value[indexPath.row].listName1
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(self.sortedList[indexPath.section].value[indexPath.row].listName1)
    }
}

extension ViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {

        // SearchBarに入力した文字の色の設定
        self.searchController.searchBar.searchTextField.textColor = .black
    }
}
