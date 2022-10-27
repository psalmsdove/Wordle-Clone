//
//  ContentView.swift
//  Wordle Clone
//
//  Created by Ali Erdem Kökcik on 25.10.2022.
//

import SwiftUI

struct GameView: View {
    @EnvironmentObject var dm: WordleDataModel
    var body: some View {
        ZStack{
            NavigationView {
                VStack {
                    Spacer()
                    VStack(spacing: 3) {
                        ForEach(0...5, id: \.self) { index in
                            GuessView(guess: $dm.guesses[index])
                                .modifier(Shake(animatableData: CGFloat(dm.incorrectAttempts[index])))
                        }
                    }
                    .frame(width: Global.boardWidth, height: 6 * Global.boardWidth / 5)
                    Spacer()
                    KeyboardView()
                        .scaleEffect(Global.keyboardScale)
                        .padding(.top)
                    Spacer()
                }
                .navigationBarTitleDisplayMode(.inline)
                .overlay(alignment: .top){
                    if let toastText = dm.toastText {
                        ToastView(toastText: toastText)
                            .offset(y: 20)
                    }
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            //faq
                        } label: {
                            Image(systemName: "questionmark.circle")
                        }
                    }
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            dm.newGame()
                        } label: {
                            Image(systemName: "gobackward")
                        }
                        
                    }
                    ToolbarItem(placement: .principal) {
                        Text("WORDLE")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        HStack {
                            Button {
                                withAnimation {
                                    dm.showStats.toggle()
                                }
                            } label: {
                                Image(systemName: "chart.bar")
                            }
                            Button {
                                //settings
                            } label: {
                                Image(systemName: "gearshape.fill")
                            }
                        }
                    }
                }
            }
            if dm.showStats{
                StatsView()
            }
        }
        .navigationViewStyle(.stack)
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
            .environmentObject(WordleDataModel())
    }
}
