//
//  ViewController.swift
//  OC-Shamaz
//
//  Created by Bjørn Lau Jørgensen on 07/10/2019.
//  Copyright © 2019 Bjørn Lau Jørgensen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var questionLabel: UILabel!
    
    
    //  Generates a random sentence from either the past or for the future based on the input.
    //  The function accepts either "past" or "future" as an argument.
    func generateSentence(futureOrPast: String) -> String {
        let futureSentences = ["Where do you see yourself in", "Do you have kids within", "What is your goal in", "How much moeny do you plan to have in", "In what career are you in"]
        let pastSentences = ["What was the best you did", "What was the worst you did", "What did you do for others", "Did you have a drink", "Your favorite song", "Greatest achievement"]
        var sentences = [String]()
        var timeFrame = [String]()
        var result: String
        var ago = ""

        //  Check if the request is on "future" or "past" and asign the propper data.
        if futureOrPast == "past" {
            ago = " ago"
            sentences = pastSentences
        } else if futureOrPast == "future" {
            sentences = futureSentences
        }
        
        //  Generate the possible answers and put them into an array.
        for n in 1...10 {
            if n == 1 {
                timeFrame.append(contentsOf: ["\(n) day\(ago)?","\(n) week\(ago)?", "\(n) year\(ago)?", "\(n) month\(ago)?"])
            } else {
                timeFrame.append(contentsOf: ["\(n) days\(ago)?","\(n) weeks\(ago)?", "\(n) years\(ago)?", "\(n) months\(ago)?"])
            }
        }
        
        //  Select a random element from the sentences and time frame and combine them into a string.
        result = "\(sentences.randomElement()!) \(timeFrame.randomElement()!)"
        
        return result
    }

    @IBAction func pastButton(_ sender: Any) {
        questionLabel.text = generateSentence(futureOrPast: "past")
    }
    
    @IBAction func futureButton(_ sender: Any) {
        questionLabel.text = generateSentence(futureOrPast: "future")
    }
    
}

