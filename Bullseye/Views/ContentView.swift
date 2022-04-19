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
            
        ZStack {
            BackgroundView(game: $game)
            VStack {
                InstructionView(game: $game, alertIsVisible: alertIsVisible)
                if alertIsVisible {
                    PointsView(alertIsVisible: $alertIsVisible, sliderValue: $sliderValue, game: $game)
                        .transition(.scale)
                } else {
                    HitMeButton(alertIsVisible: $alertIsVisible, sliderValue: $sliderValue, game: $game)
                        .transition(.scale)
                }
            }
            
            if !alertIsVisible {
                SliderView(sliderValue: $sliderValue)
                    .transition(.scale)
            }
          
        }
        
    }
}

struct InstructionView: View {
    
    @Binding var game: Game
    var alertIsVisible: Bool
    
    var body: some View{
        InstructionText(text: "🎯🎯🎯\nPUT THE BULLSEYE AS CLOSE AS YOU CAN TO")
            .padding(.leading, 30)
            .padding(.trailing, 30)
        BigNumberText(text: String(game.target))
            .padding(.bottom, alertIsVisible ? 0 : 100)
    }
    
}

struct SliderView: View {
    
    @Binding var sliderValue: Double
    
    var body: some View {
        HStack{
            TextSlider(text: "1")
            Slider(value: $sliderValue, in: 1.0...100.0)
            TextSlider(text: "100")
        }
        .padding()
    }
}

struct HitMeButton: View {
    
    @Binding var alertIsVisible: Bool
    @Binding var sliderValue: Double
    @Binding var game: Game
    
    var body: some View {
        Button(action: {
            withAnimation{
                self.alertIsVisible = true
            }
        }){
            Text("Hit me".uppercased())
                .bold()
                .font(.title3)
                
        }
        .padding(20.0)
        .background(
            ZStack {
                Color("ButtonColor")
                // Light shade in the button, from top to bottom
                LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.3), Color.clear]), startPoint: .top, endPoint: .bottom)
            }
        )
        .foregroundColor(Color.white)
        .cornerRadius(Constants.General.roundRectCornerRadius)
        .overlay(
            RoundedRectangle(cornerRadius: Constants.General.roundRectCornerRadius)
                .strokeBorder(Color.white, lineWidth: Constants.General.strokeWidth)
        )
        
    }
    

    
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
            .preferredColorScheme(.light)
        ContentView()
            .previewLayout(.fixed(width: 568, height: 320))
            .preferredColorScheme(.dark)
        ContentView()
            .previewLayout(.fixed(width: 568, height: 320))
            .preferredColorScheme(.light)
    }
}

