//
//  ContentView.swift
//  full-counter
//
//  Created by Hiraku Ohno on 2020/01/19.
//  Copyright © 2020 hira. All rights reserved.
//

import SwiftUI

struct ContentView: View {

    struct CounterState {
        var countMap: [CardType: Int] = [
            .ace: 0,
            .two: 0,
            .three: 0,
            .four: 0,
            .five: 0,
            .six: 0,
            .seven: 0,
            .eight: 0,
            .nine: 0,
            .ten: 0,
        ]
        var count = 0
    }

    @State var state = CounterState()
    @State var settingsShown = false

    var currentCount: Int {
        CardType.allCases.reduce(0) { (result, type) -> Int in
            result + Count.get(type: type) * state.countMap[type]!
        }
    }

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("Count: \(currentCount)")
                    Spacer()
                        .frame(width: 32.0)
                    Button(action: {
                        self.state = CounterState()
                    }) {
                        Text("Reset")
                    }
                }
                List(CardType.allCases.map{ $0 }) { type in
                    self.countRow(type: type, value: self.state.countMap[type]!)
                }
            }
            .navigationBarTitle("Current State")
            .navigationBarItems(trailing: settingButton())
        }.sheet(isPresented: $settingsShown) {
            SettingView {
                self.settingsShown = false
            }
        }
    }

    private func countRow(type: CardType, value: Int) -> some View {
        HStack {
            Text(type.rawValue)
            Button(action: {
                self.state.countMap[type]! += 1
            }) {
                Text("ADD").foregroundColor(.red)
            }
            Spacer()
            Text("\(value)")
        }
    }

    private func settingButton() -> some View {
        Button(action: {
            self.settingsShown = true
        }) {
            Text("Setting").foregroundColor(.accentColor)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
