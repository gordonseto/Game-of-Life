//
//  Utility.swift
//  Game of Life
//
//  Created by Gordon Seto on 2016-07-25.
//  Copyright © 2016 gordonseto. All rights reserved.
//

import Foundation

extension Array {
    func customFilter(predicate: (Element) -> Bool) -> [Element] {
        var filteredArray = [Element]()
        for x in self where predicate(x) {
            filteredArray.append(x)
        }
        
        return filteredArray
    }
}

extension Array {
    func customMap(transform: (Element) -> Element) -> [Element] {
        var result: [Element] = []
        for item in self {
            result.append(transform(item))
        }
        return result
    }
}