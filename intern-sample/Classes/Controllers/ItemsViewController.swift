//
//  ItemsViewController.swift
//  intern-sample
//
//  Created by sakahara on 2015/08/13.
//  Copyright (c) 2015年 Sonicmoov. All rights reserved.
//

import UIKit

import Result

class ItemsViewController: UITableViewController {

    private var items = [ItemJSON]()
    private var manager = SearchManager()

    override func viewDidLoad() {
        super.viewDidLoad()

        refresh()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func refresh() {
        manager.searchItems(onDataChanged)
    }

    func onDataChanged(result: Result<ItemsJSON, NSError>) {
        if let value = result.value {
            items = value.items
            tableView.reloadData()
        }
        refreshControl?.endRefreshing()
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        switch segue.destinationViewController {
        case let viewController as BrowserViewController:
            if let itemCell = sender as? ItemCell {
                viewController.URL = itemCell.item?.itemURL
            }
        default:()
        }
    }
}

extension ItemsViewController: UITableViewDataSource {

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ItemCell", forIndexPath: indexPath) as! ItemCell
        cell.item = items[indexPath.row]
        return cell
    }
}
