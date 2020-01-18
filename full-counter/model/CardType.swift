//
//  CardType.swift
//  full-counter
//
//  Created by Hiraku Ohno on 2020/01/19.
//  Copyright © 2020 hira. All rights reserved.
//

import Foundation

enum CardType : String, CaseIterable {
    case ace     = "A"
    case two     = "2"
    case three   = "3"
    case four    = "4"
    case five    = "5"
    case six     = "6"
    case seven   = "7"
    case eight   = "8"
    case nine    = "9"
    case ten     = "10"

    var defaultCount: Int {
        switch self {
        case .ace:      return 0
        case .two:      return 1
        case .three:    return 1
        case .four:     return 1
        case .five:     return 1
        case .six:      return 0
        case .seven:    return 0
        case .eight:    return 0
        case .nine:     return 0
        case .ten:      return -1
        }
    }
}
