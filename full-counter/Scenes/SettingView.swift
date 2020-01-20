//
//  SettingView.swift
//  full-counter
//
//  Created by Hiraku Ohno on 2020/01/19.
//  Copyright © 2020 hira. All rights reserved.
//

import SwiftUI

struct SettingView: View {

    private var dismiss: (() -> Void)?
    @State private var countMap = [CardType: Int]()

    init(dismiss: @escaping () -> Void) {
        self.dismiss = dismiss
        let initial: [CardType: Int] = CardType.allCases.map { type  in
            (type: type, value: Count.get(type: type))
        }.reduce([:], { (result, current) in
            var ret = result
            ret[current.type] = current.value
            return ret
        })

        self._countMap = State(initialValue: initial)
    }


    var body: some View {
        List(CardType.allCases.map { $0 }) { type in
            self.settingRow(type: type, value: self.countMap[type]!)
        }
    }

    private func settingRow(type: CardType, value: Int) -> some View {
        HStack {
            Text(type.rawValue)
            Text("\(value)")
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        return SettingView() {

        }
    }
}
