//
//  ItemCell.swift
//  intern-sample
//
//  Created by sakahara on 2015/08/13.
//  Copyright (c) 2015年 Sonicmoov. All rights reserved.
//

import UIKit

import SDWebImage

class ItemCell: UITableViewCell {

    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!

    var item: ItemJSON? {
        didSet {
            titleLabel.text = item?.title
            detailLabel.text = item?.content
            itemImageView.sd_setImageWithURL(NSURL(string: item!.largeImage!))
            priceLabel.text = "\(item!.itemPrice.decimalFormat!)円"
        }
    }
}

extension Int {
    var decimalFormat: String? {
        get {
            var formatter = NSNumberFormatter()
            formatter.numberStyle = .DecimalStyle
            formatter.groupingSeparator = ","
            formatter.groupingSize = 3
            
            return formatter.stringFromNumber(NSNumber(integer: self))
        }
    }
}

