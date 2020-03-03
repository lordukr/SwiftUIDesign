//
//  ContentView.swift
//  Neumorphism
//
//  Created by Anatolii Zavialov on 27.02.2020.
//  Copyright © 2020 Anatolii Zavialov. All rights reserved.
//

import SwiftUI

extension Color {
    static let offWhite = Color(red: 225 / 255, green: 225 / 255, blue: 235 / 255)
    static let darkStart = Color(red: 50 / 255, green: 60 / 255, blue: 65 / 255)
    static let darkEnd = Color(red: 25 / 255, green: 25 / 255, blue: 30 / 255)
}

extension LinearGradient {
    init(_ colors: Color...) {
        self.init(gradient: Gradient(colors: colors), startPoint: .topLeading, endPoint: .bottomTrailing)
    }
}

struct SimplButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(30)
        .contentShape(Circle())
            .background(
                Group {
                    if configuration.isPressed {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.offWhite)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.gray, lineWidth: 4)
                            .blur(radius: 4)
                            .offset(x: 2, y: 2)
                                .mask(RoundedRectangle(cornerRadius: 20).fill(LinearGradient(Color.black, Color.clear)))
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.gray, lineWidth: 4)
                            .blur(radius: 4)
                            .offset(x: -2, y: -2)
                                .mask(RoundedRectangle(cornerRadius: 20).fill(LinearGradient(Color.clear, Color.black )))
                        )
                    } else {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.offWhite)
                            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                            .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
                    }
                }
        )
    }
}

struct ContentView: View {
    var body: some View {
        
        ZStack {
            Color.offWhite
            VStack(spacing: 10) {
                
                RoundedRectangle(cornerRadius: 25)
                    .fill(Color.offWhite)
                    .frame(width: 300, height: 300, alignment: .center)
                    .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                    .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
                Button(action: {
                    print("Tap")
                }) {
                    Text("Hello")
                    
                }
                .buttonStyle(SimplButtonStyle())
                .frame(width: 200, height: 60, alignment: .center)
                
            }
            .edgesIgnoringSafeArea(.all)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
