//
//  ContentView.swift
//  Shared
//
//  Created by Manoel Leal on 04/04/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var alertIsVisible = false
    @State private var sliderValue = 50.0
    @State private var game = Game()
    
    var body: some View {
    
            VStack {
                Text("🎯🎯🎯\nPUT THE BULLSEYE AS CLOSE AS YOU CAN TO")
                    .bold()
                    .kerning(2.0)
                    .multilineTextAlignment(.center)
                    .lineSpacing(4.0)
                    .font(.footnote)
                Text(String(game.target))
                    .kerning(-1.0)
                    .font(.largeTitle)
                    .fontWeight(.black)
                HStack{
                    Text("1")
                        .bold()
                        .padding()
                    Slider(value: self.$sliderValue, in: 1.0...100.0)
                    Text("100")
                        .bold()
                        .padding()
                }
                
                Button(action: {
                    print("Hello SwiftUI")
                    self.alertIsVisible = true
                }){
                    Text("Hit me")
                }
                .alert("Hello there!", isPresented: $alertIsVisible) {
                  Button("Awesome!") { }
                } message: {
                    let roundedValue = Int(self.sliderValue.rounded())
                    Text("The slider's value is \(roundedValue). \n" + "You scored \(self.game.points(sliderValue: roundedValue)) points this round ")
                }
                
            }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView()
            .previewLayout(.fixed(width: 568, height: 320))
    
    }
}

