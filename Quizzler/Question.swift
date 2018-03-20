//
//  Question.swift
//  Quizzler
//
//  Created by Armin Spahic on 12/03/2018.
//  Copyright © 2018 Armin Spahic. All rights reserved.

//

import Foundation

class Question {
    
    let questionText : String
    let answer : Bool
    
    init(text: String, correctAnswer: Bool) {
       questionText = text
        answer = correctAnswer
    }
    
}


