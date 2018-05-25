//
//  Magic8Ball.swift
//  Magic 8 Ball
//
//  Created by Азизбек Матчанов on 02/02/2018.
//  Copyright © 2018 Azizbek Matchanov. All rights reserved.
//

import Foundation

struct Magic8Ball {
    func shakeBall () -> Int {
        return 20.arc4random
    }
}

extension Int {
    var arc4random: Int {
        return Int(arc4random_uniform(UInt32(abs(self))))
    }
}
