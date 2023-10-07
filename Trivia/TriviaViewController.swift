
//  TriviaViewController.swift
//  Trivia
//
//  Created by Camila Castaneda on 10/7/23.
//


import UIKit

class TriviaViewController: UIViewController {
    
    struct Question {
        let prompt: String
        let options: [String]
        let correctAnswer: Int // Index of the correct answer in the options array
    }

    var questions: [Question] = [
        Question(prompt: "Who wrote 'Pride and Prejudice'?", options: ["George Orwell", "Jane Austen", "Mark Twain", "J.K. Rowling"], correctAnswer: 1),
        Question(prompt: "Which book is dystopian novel about surveillance?", options: ["1984", "Great Expectations", "The Catcher in the Rye", "Moby Dick"], correctAnswer: 0),
        Question(prompt: "In which book is there a character named Holden Caulfield?", options: ["The Shining", "The Catcher in the Rye", "The Great Gatsby", "War and Peace"], correctAnswer: 1),
        Question(prompt: "What is the ring in 'The Lord of the Rings'?", options: ["A wedding ring", "A decoder ring", "A ring of power", "A friendship ring"], correctAnswer: 2),
        Question(prompt: "Which book features a giant whale?", options: ["1984", "War and Peace", "Moby Dick", "To Kill a Mockingbird"], correctAnswer: 2),
        Question(prompt: "Who wrote 'The Shining'?", options: ["Stephen King", "John Grisham", "Ernest Hemingway", "F. Scott Fitzgerald"], correctAnswer: 0),
        Question(prompt: "Which of these is a book by George Orwell?", options: ["War and Peace", "Great Expectations", "Animal Farm", "The Odyssey"], correctAnswer: 2),
        Question(prompt: "'A Tale of Two Cities' is set during which event?", options: ["World War II", "Renaissance", "The French Revolution", "The Industrial Revolution"], correctAnswer: 2),
        Question(prompt: "Who is the author of 'Brave New World'?", options: ["William Golding", "Herman Melville", "Charles Dickens", "Aldous Huxley"], correctAnswer: 3),
        Question(prompt: "Which is a play by William Shakespeare?", options: ["The Odyssey", "War and Peace", "Macbeth", "Pride and Prejudice"], correctAnswer: 2)
    ]
    
    var currentQuestionIndex = 0
    var correctAnswersCount = 0

    override func viewDidLoad() {
        questionLabel.numberOfLines = 0
        questionLabel.lineBreakMode = .byWordWrapping
        super.viewDidLoad()
        updateUI()
    }
    
    @IBOutlet weak var questionCounterLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!

    @IBOutlet weak var option1Button: UIButton!
    @IBOutlet weak var option2Button: UIButton!
    @IBOutlet weak var option3Button: UIButton!
    @IBOutlet weak var option4Button: UIButton!
    
    @IBAction func option1Button(_ sender: Any) {
        checkAnswer(selectedOption: 0)
    }
    @IBAction func option2Button(_ sender: Any) {
        checkAnswer(selectedOption: 1)
    }
    @IBAction func option3Button(_ sender: Any) {
        checkAnswer(selectedOption: 2)
    }
    @IBAction func option4Button(_ sender: Any) {
        checkAnswer(selectedOption: 3)
    }

    func checkAnswer(selectedOption: Int) {
        if questions[currentQuestionIndex].correctAnswer == selectedOption {
            correctAnswersCount += 1
        }

        currentQuestionIndex += 1

        if currentQuestionIndex >= questions.count {
            endQuiz()
            return
        }
        updateUI()
    }
    
    func endQuiz() {
        let alert = UIAlertController(title: "Quiz Finished", message: "You got \(correctAnswersCount) out of \(questions.count) correct. Would you like to play again?", preferredStyle: .alert)
        let restartAction = UIAlertAction(title: "Restart", style: .default) { _ in
            self.currentQuestionIndex = 0
            self.correctAnswersCount = 0
            self.updateUI()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addAction(restartAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
    
    

    func updateUI() {
        let currentQuestion = questions[currentQuestionIndex]
        questionLabel.text = currentQuestion.prompt
        option1Button.setTitle(currentQuestion.options[0], for: .normal)
        option2Button.setTitle(currentQuestion.options[1], for: .normal)
        option3Button.setTitle(currentQuestion.options[2], for: .normal)
        option4Button.setTitle(currentQuestion.options[3], for: .normal)
        questionCounterLabel.text = "Question \(currentQuestionIndex + 1) of \(questions.count)"
    }
}
