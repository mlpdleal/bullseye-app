//
//  TextViews.swift
//  Bullseye
//
//  Created by Manoel Leal on 07/04/22.
//

import SwiftUI

struct InstructionText: View {
    
    var text: String
    
    var body: some View {
        Text(text.uppercased())
            .bold()
            .kerning(2.0)
            .multilineTextAlignment(.center)
            .lineSpacing(4.0)
            .font(.footnote)
            .foregroundColor(Color("TextColor"))
    }
    
}

struct LabelText: View {
    
    var text: String
    
    var body: some View{
        Text(text.uppercased())
            .bold()
            .foregroundColor(Color("TextColor"))
            .kerning(1.5)
            .font(.caption)
                
    }
    
}

struct BigNumberText: View {
    
    var text: String
    
    var body: some View {
        Text(text)
            .kerning(-1.0)
            .font(.largeTitle)
            .fontWeight(.black)
            .foregroundColor(Color("TextColor"))
    }
    
}

struct TextSlider: View{
    
    var text: String
    
    var body: some View{
        Text(text)
            .bold()
            .foregroundColor(Color("TextColor"))
            .frame(width: 35.0)
    }
}

struct BodyText: View{
    
    var text: String
    
    var body: some View{
        Text(text)
            .font(.subheadline)
            .fontWeight(.semibold)
            .multilineTextAlignment(.center)
            .lineSpacing(12.0)
    }
}

struct ButtonText: View{
    
    var text: String
    
    var body: some View{
        Text(text)
            .bold()
            .padding()
            .frame(maxWidth: .infinity)
            .background(
                Color.accentColor
            )
            .foregroundColor(.white)
            .cornerRadius(12.0)
    }
}

struct ScoreText: View{
    var score: Int
    
    var body: some View {
        Text(String(score))
            .bold()
            .font(.title3)
            .kerning(-0.2)
            .foregroundColor(Color("TextColor"))
            
    }
}

struct DateText: View{
    var date: Date
    
    var body: some View {
        Text(date, style: .time)
            .bold()
            .font(.title3)
            .kerning(-0.2)
            .foregroundColor(Color("TextColor"))
    }
}

struct BigBoldText: View{
    
    let text: String
    
    var body: some View{
        Text(text.uppercased())
            .kerning(2.0)
            .font(.title)
            .foregroundColor(Color("TextColor"))
            .fontWeight(.black)
    }
}


struct TextViews_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            InstructionText(text: "Instructions")
            BigNumberText(text: "999")
            LabelText(text: "SCORE")
            BodyText(text: "You scored 200 Points\n🎉🎉🎉")
            ButtonText(text: "Start New Round")
            ScoreText(score: 200)
            DateText(date: Date())
            BigBoldText(text: "LeaderBoard")
        }
        
    }
}
