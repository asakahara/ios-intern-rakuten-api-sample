//
//  ItemsJSON.swift
//  intern-sample
//
//  Created by sakahara on 2015/08/13.
//  Copyright (c) 2015年 Sonicmoov. All rights reserved.
//

import UIKit

import Mantle

public class ItemsJSON: MTLModel, MTLJSONSerializing {

    public var items = [ItemJSON]()

    public class func JSONKeyPathsByPropertyKey() -> [NSObject : AnyObject]! {
        return [
            "items": "Items",
        ]
    }

    public class func itemsJSONTransformer() -> NSValueTransformer {
        return MTLJSONAdapter.arrayTransformerWithModelClass(ItemJSON.self)
    }
}

public class ItemJSON: MTLModel, MTLJSONSerializing {

    public var title: String?
    public var author: String?
    public var itemURL: NSURL?
    public var content: String?
    public var largeImage: String?
    public var itemPrice = 0

    public class func JSONKeyPathsByPropertyKey() -> [NSObject : AnyObject]! {
        return [
            "title": "Item.title",
            "author": "Item.author",
            "itemURL": "Item.itemUrl",
            "content": "Item.itemCaption",
            "largeImage": "Item.largeImageUrl",
            "itemPrice": "Item.itemPrice",
        ]
    }

    public class func itemURLJSONTransformer() -> NSValueTransformer {
        return NSValueTransformer(forName: MTLURLValueTransformerName)!
    }
}

