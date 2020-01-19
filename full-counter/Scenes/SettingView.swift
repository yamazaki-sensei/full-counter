//
//  SettingView.swift
//  full-counter
//
//  Created by Hiraku Ohno on 2020/01/19.
//  Copyright © 2020 hira. All rights reserved.
//

import SwiftUI

struct SettingView: View {

    @State var countMap = [CardType: Int]()

    var body: some View {
        NavigationView {
            List(countMap.keys.map{ $0 }) { type in
                self.settingRow(type: type, value: self.countMap[type]!)
            }
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
        let v = ContentView()
        v.countMap = [.two: 10]

        return v
    }
}
