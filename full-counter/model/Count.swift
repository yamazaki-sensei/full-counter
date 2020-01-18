//
//  Count.swift
//  full-counter
//
//  Created by Hiraku Ohno on 2020/01/19.
//  Copyright © 2020 hira. All rights reserved.
//

import Foundation

private let userDefaults = UserDefaults.standard

enum Count {
    static func initializeIfNeeded() {
        let dic = CardType.allCases.reduce([String: Int]()) { (result, current) -> [String: Int] in
            var result = result
            result[current.rawValue] = current.defaultCount
            return result
        }
        userDefaults.register(defaults: dic)
    }

    static func get(type: CardType) -> Int {
        userDefaults.integer(forKey: type.rawValue)
    }

    static func set(type: CardType, value: Int) {
        userDefaults.set(value, forKey: type.rawValue)
    }

}
