//
//  Game.swift
//  Bullseye
//
//  Created by Manoel Leal on 04/04/22.
//

import Foundation

struct LeaderboardEntry{
    let score: Int
    let date: Date
}


struct Game {
    var target = Int.random(in: 1...100)
    var score = 0
    var round = 1
    var leaderboardEntries: [LeaderboardEntry] = []
    
    func points(sliderValue: Int) -> Int {
        let diference = abs(self.target - sliderValue)
        let bonus: Int
    
        if diference == 0 {
            bonus = 100
        } else if diference <= 2{
            bonus = 50
        } else {
            bonus = 0
        }
        
        return (100 - diference) + bonus
        
    }
    
    mutating func startNewRound(points: Int){
        self.score += points
        self.round += 1
        self.target = Int.random(in: 1...100)
        addToLeaderboard(points: points)
    }
    
    mutating func restart(){
        self.score = 0
        self.round = 1
        self.target = Int.random(in: 1...100)
        self.leaderboardEntries.removeAll()
    }
    
    mutating func addToLeaderboard(points: Int){
        let leaderboardEntry: LeaderboardEntry = LeaderboardEntry(score: points, date: Date())
        self.leaderboardEntries.append(leaderboardEntry)
        self.leaderboardEntries.sort {$0.score > $1.score}
    }
    
}
    
