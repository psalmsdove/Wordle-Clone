//
//  Wordle_CloneApp.swift
//  Wordle Clone
//
//  Created by Ali Erdem Kökcik on 25.10.2022.
//

import SwiftUI

@main
struct WordleApp: App {
    @StateObject var dm = WordleDataModel()
    var body: some Scene {
        WindowGroup {
            GameView()
                .environmentObject(dm)
        }
    }
}
