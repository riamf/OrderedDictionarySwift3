//
//  ViewController.swift
//  OrderedDictionarySwift3
//
//  Created by Pawel Kowalczuk on 08/10/16.
//  Copyright © 2016 Pawel Kowalczuk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    fileprivate var tableDataSource: OrderedDictionary<ViewModel,[ViewModel]>!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        tableView.register(UITableViewHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: "UITableViewHeaderFooterView")
        tableView.rowHeight = 44
        tableView.sectionHeaderHeight = 22
        prepareTableData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    private func prepareTableData() {
        tableDataSource = OrderedDictionary<ViewModel,[ViewModel]>()
        let naturalNumbers = [
            ViewModel(title: "1"),
            ViewModel(title: "2"),
            ViewModel(title: "3")
        ]
        let realNumbers = [
            ViewModel(title: "3.14159265"),
            ViewModel(title: "1.41421356")
        ]
        tableDataSource[ViewModel(title: "Natural numbers")] = naturalNumbers
        tableDataSource[ViewModel(title: "Real numbers")] = realNumbers
        tableView.reloadData()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableDataSource.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let value = tableDataSource[section] else { return 0 }
        return value.count
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "UITableViewHeaderFooterView")
            header?.textLabel?.text = tableDataSource.keys[section].title
        return header!
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell")
        if let values = tableDataSource[indexPath.section] {
            cell?.textLabel?.text = values[indexPath.row].title
        }
        
        
        return cell!
    }
}
