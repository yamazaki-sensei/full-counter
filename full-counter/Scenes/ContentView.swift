//
//  ContentView.swift
//  full-counter
//
//  Created by Hiraku Ohno on 2020/01/19.
//  Copyright © 2020 hira. All rights reserved.
//

import SwiftUI

struct ContentView: View {

    @State var countMap = [CardType: Int]()

    var body: some View {
        List(countMap.keys.map{ $0 }) { type in
            self.countRow(type: type, value: self.countMap[type]!)
        }
    }

    private func countRow(type: CardType, value: Int) -> some View {
        HStack {
            Text(type.rawValue)
            Text("\(value)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(countMap: [.two: 10, .three: 5])
    }
}
