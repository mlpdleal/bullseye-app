//
//  LeaderBoardView.swift
//  Bullseye
//
//  Created by Manoel Leal on 10/04/22.
//

import SwiftUI

struct LeaderBoardView: View {
    
    @Binding var leaderBoardIsShowing: Bool
    @Binding var game: Game
    
    var body: some View {
        
        ZStack {
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(.all)
            VStack{
                HeaderView(leaderBoardIsShowing: $leaderBoardIsShowing)
                LabelView()
                ScrollView {
                    VStack(spacing: 10){
                        ForEach(game.leaderboardEntries.indices){ i in
                            let leaderboardEntry = game.leaderboardEntries[i]
                            RowView(index: (i + 1), score: leaderboardEntry.score, date: leaderboardEntry.date)
                        }
                    }
                }
            }
        }
    }
}

struct RowView: View {
    
    let index: Int
    let score: Int
    let date: Date
    
    var body: some View {
        
        HStack{
            RoundedTextView(text: String(index))
            Spacer()
            ScoreText(score: score)
                .frame(width: Constants.LeaderBoard.leaderboardScoreColWidth)
            Spacer()
            DateText(date: date)
                .frame(width: Constants.LeaderBoard.leaderboardDateColWidth)
        }
        .background(
            RoundedRectangle(cornerRadius: .infinity)
                .strokeBorder(Color("LeaderBoardRowColor"), lineWidth: Constants.General.strokeWidth)
        )
        .padding(.leading)
        .padding(.trailing)
        .frame(maxWidth: Constants.LeaderBoard.leaderboardMaxRowWidth)
            
    }
}

struct HeaderView: View{
    
    @Binding var leaderBoardIsShowing: Bool
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    
    
    var body: some View{
        ZStack {
            HStack {
                if verticalSizeClass == .regular && horizontalSizeClass == .compact {
                    BigBoldText(text: "LeaderBoard")
                        .padding(.leading)
                    Spacer()
                } else {
                    BigBoldText(text: "LeaderBoard")
                }
            }
            HStack{
                Spacer()
                Button(action: {
                    leaderBoardIsShowing = false
                }){
                    RoundedImageViewFilled(systemName: "xmark")
                        .padding(.trailing)
                }
            }
                
        }
    }
}

struct LabelView: View{
    
    var body: some View{
        HStack{
            Spacer()
                .frame(width: Constants.General.roudedViewLength)
            Spacer()
            LabelText(text: "Score")
                .frame(width: Constants.LeaderBoard.leaderboardScoreColWidth)
            Spacer()
            LabelText(text: "Date")
                .frame(width: Constants.LeaderBoard.leaderboardDateColWidth)
            
        }
        .padding(.leading)
        .padding(.trailing)
        .frame(maxWidth: Constants.LeaderBoard.leaderboardMaxRowWidth)
    }
    
}

struct LeaderBoardView_Previews: PreviewProvider {
    
    static private var leaderBoardIsShowing = Binding.constant(false)
    static private var game = Binding.constant(Game())
    
    static var previews: some View {
        LeaderBoardView(leaderBoardIsShowing: leaderBoardIsShowing, game: game)
            .preferredColorScheme(.dark)
        LeaderBoardView(leaderBoardIsShowing: leaderBoardIsShowing, game: game)
            .preferredColorScheme(.light)
        LeaderBoardView(leaderBoardIsShowing: leaderBoardIsShowing, game: game)
            .previewLayout(.fixed(width: 568, height: 320))
            .preferredColorScheme(.dark)
        LeaderBoardView(leaderBoardIsShowing: leaderBoardIsShowing, game: game)
            .previewLayout(.fixed(width: 568, height: 320))
            .preferredColorScheme(.light)
    }
}
