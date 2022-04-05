//
//  Game.swift
//  Bullseye
//
//  Created by Manoel Leal on 04/04/22.
//

import Foundation


struct Game {
    var target = Int.random(in: 1...100)
    var score = 0
    var round = 1
    
    func points(sliderValue: Int) -> Int {
        let diference = abs(self.target - sliderValue)
        
        let awardsPoints = 100 - diference
        return awardsPoints
    }
}
