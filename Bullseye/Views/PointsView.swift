//
//  PointsView.swift
//  Bullseye
//
//  Created by Manoel Leal on 09/04/22.
//

import SwiftUI

struct PointsView: View {
    
    @Binding var alertIsVisible: Bool
    @Binding var sliderValue: Double
    @Binding var game: Game
    
    var body: some View {
        
        let roundedValue = Int(sliderValue.rounded())
        let points = game.points(sliderValue: roundedValue)
        VStack(spacing: 10){
            InstructionText(text: "The slider's value is")
            BigNumberText(text: String(roundedValue))
            BodyText(text: "You scored \(String(points)) Points\n🎉🎉🎉")
            Button(action:{
                withAnimation {
                    alertIsVisible = false
                }
                game.startNewRound(points: points)
            }) {
                ButtonText(text: "Start New Round")
            }
        }
            .padding()
            .frame(maxWidth: 300)
            .background(Color("BackgroundColor"))
            .cornerRadius(21.0)
            .shadow(radius: 10, x: 5, y: 5)
            .transition(.scale)
    }
}

struct PointsView_Previews: PreviewProvider {
    
    static private var alertIsVisible = Binding.constant(false)
    static private var slideValue = Binding.constant(50.0)
    static private var game = Binding.constant(Game())
    
    static var previews: some View {
        
        
        PointsView(alertIsVisible: alertIsVisible, sliderValue: slideValue, game: game)
           .preferredColorScheme(.dark)

        PointsView(alertIsVisible: alertIsVisible, sliderValue: slideValue, game: game)
           .preferredColorScheme(.light)

        PointsView(alertIsVisible: alertIsVisible, sliderValue: slideValue, game: game)
            .previewLayout(.fixed(width: 568, height: 320))
            .preferredColorScheme(.dark)
        
        PointsView(alertIsVisible: alertIsVisible, sliderValue: slideValue, game: game)
            .previewLayout(.fixed(width: 568, height: 320))
            .preferredColorScheme(.light)

    }
}