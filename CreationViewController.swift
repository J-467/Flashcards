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
    var flashcardsController: ViewController!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func didTapOnCancel(_ sender: Any) {
        dismiss(animated: true)
    }
    @IBAction func didTapOnDone(_ sender: Any) {
        let questionText = questionTextField.text
        let answerText = answerTextField.text
        
        flashcardsController.updateFlashcard(question: questionText!, answer: answerText!)
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
