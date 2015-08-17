//
//  SearchManager.swift
//  intern-sample
//
//  Created by sakahara on 2015/08/13.
//  Copyright (c) 2015年 Sonicmoov. All rights reserved.
//

import UIKit

import Result

public class SearchManager: NSObject {
    private typealias Response = Result<[ItemJSON], NSError>

    lazy var client: APIClient = APIClient()

    public func searchItems(handler: Result<ItemsJSON, NSError> -> ()) {
        client.request(SearchEndpoint(keyword: "ios"), handler:handler)
    }
}

