//
//  ViewController.swift
//  Quizzler
//
//  Created by Armin Spahic on 10/03/2018.

//

import UIKit

class ViewController: UIViewController {
    
    //Place your instance variables here
    let questionsList = QuestionBank()
    var pickedAnswer : Bool = false
    var questionNumber : Int = 0
    var progress : Int = 0
    var score : Int = 0
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
     nextQuestion()
        
        
        
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        
        if sender.tag == 1 {
            pickedAnswer = true
        } else {
            pickedAnswer = false
        }
        checkAnswer()
         questionNumber = questionNumber + 1
        nextQuestion()
        
        
        
        
        
       
  
    }
    func nextQuestion() {
        
        
        if questionNumber <= 12 {
            questionLabel.text = questionsList.list[questionNumber].questionText
             progress = progress + 1
            updateUI()
            
        } else {
            let alert = UIAlertController(title: "Awesome", message: "Your score was \(score)\nFinished all the question, do you want to start over ?", preferredStyle: .alert)
            
            let restartAlert = UIAlertAction(title: "Restart", style: .default, handler: { (alert) in
                self.startOver()
                
            })
            alert.addAction(restartAlert)
            
            present(alert, animated: true, completion: nil)
        }
        
    }
    
    
    func updateUI() {
        
       
       
        if progress <= 12 {
        progressLabel.text = String(progress) + "/13"
        } else {
            progressLabel.text = "13/13"
        }
        scoreLabel.text = "Score: \(score)"
        progressBar.frame.size.width = (view.frame.size.width)/13 * CGFloat(progress)
    }
    

   
    
    
    func checkAnswer() {
        
        var correctAnswer = questionsList.list[questionNumber].answer
        if correctAnswer == pickedAnswer {
           ProgressHUD.showSuccess("Correct!")
            score = score + 1
        } else {
            ProgressHUD.showError("Wrong!")
        }
        
    }
    
    
    func startOver() {
        
        questionNumber = 0
        progress = 0
        score = 0
        nextQuestion()
        updateUI()
       
        
       
       
    }
    

    
}
