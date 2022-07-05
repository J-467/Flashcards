//
//  CreationViewController.swift
//  Flashcard
//
//  Created by Julian Tweneboa Kodua on 3/12/22.
//

import UIKit

class CreationViewController: UIViewController {
    
    @IBOutlet weak var questionTextField: UITextField!
    @IBOutlet weak var answerTextField: UITextField!
    var initialQuestion: String?
    var initialAnswer: String?
    var flashcardsController: ViewController!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
   
        questionTextField.text = initialQuestion
        answerTextField.text = initialAnswer
    }
    @IBAction func didTapOnCancel(_ sender: Any) {
        dismiss(animated: true)
    }
    @IBAction func didTapOnDone(_ sender: Any) {  
        let questionText = questionTextField.text
        let answerText = answerTextField.text
        
        if questionText!.isEmpty || answerText!.isEmpty
        {
            //show error is question or answertext is nil
            let alert = UIAlertController(title: "Missing text", message: "Please provide both a question and an answer. No Field can be left empty", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "Ok", style: .default)
            
            alert.addAction(okAction)
            
            present(alert, animated: true)
        }
        else
        {
            var isExisting = false
            if initialQuestion != nil {
                isExisting = true
            }
            flashcardsController.updateFlashcard(question: questionText!, answer: answerText!,isExisting: isExisting)
        }
        dismiss(animated: true)
        
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
