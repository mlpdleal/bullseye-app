//
//  RoundViews.swift
//  Bullseye
//
//  Created by Manoel Leal on 07/04/22.
//

import SwiftUI

// list.dash
// arrow.counterclockwise

struct RoundedImageViewStroked: View {
    
    var systemName: String
    
    var body: some View {
       Image(systemName: systemName)
            .font(.title)
            .foregroundColor(Color("TextColor"))
            .frame(width: Constants.General.roudedViewLength, height: Constants.General.roudedViewLength)
            .overlay(
                Circle()
                    .strokeBorder(Color("ButtonStrokeColor"), lineWidth: Constants.General.strokeWidth)
            )
    }
}


struct RoundedImageViewFilled: View {
    
    var systemName: String
    
    var body: some View {
       Image(systemName: systemName)
            .font(.title)
            .foregroundColor(Color("ButtonFilledTextColor"))
            .frame(width: Constants.General.roudedViewLength, height: Constants.General.roudedViewLength)
            .background(
                Circle()
                    .fill(Color("ButtonFilledBackgroundColor"))
            )
    }
}

struct RoundRectTextView: View{
    
    var textView: String
    
    var body: some View{
        Text(textView)
            .kerning(-0.2)
            .bold()
            .font(.title3)
            .frame(width: Constants.General.roundRectViewWidth, height: Constants.General.roundRectViewHeight)
            .foregroundColor(Color("TextColor"))
            .overlay(
                RoundedRectangle(cornerRadius: Constants.General.roundRectCornerRadius)
                    .strokeBorder(Color("ButtonStrokeColor"), lineWidth: Constants.General.strokeWidth)
                    
            )
            
    }
    
}

struct RoundedTextView: View{
    
    let text: String
    
    var body: some View{
        Text(text)
            .font(.title)
            .frame(width: Constants.General.roudedViewLength, height: Constants.General.roudedViewLength)
            .foregroundColor(Color("TextColor"))
            .overlay(
                Circle()
                    .strokeBorder(Color("LeaderBoardRowColor"), lineWidth: Constants.General.strokeWidth)
            )
    }
    
}

struct RoundViews_Previews: PreviewProvider {
    static var previews: some View {
            RoundedImageViewStroked(systemName: "arrow.counterclockwise")
            RoundedImageViewFilled(systemName: "arrow.counterclockwise").preferredColorScheme(.dark)
            RoundRectTextView(textView: "99")
            RoundedTextView(text: "1")
    }
}
