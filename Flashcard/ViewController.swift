//
//  ViewController.swift
//  Flashcard
//
//  Created by Julian Tweneboa Kodua on 2/26/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var backText1: UILabel!
    @IBOutlet weak var flashText1: UILabel!
    @IBOutlet weak var randombox: UIView!
    @IBOutlet weak var randomText: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

    @IBAction func onTap(_ sender: Any) {
        flashText1.isHidden = true
        }
    func updateFlashcard(question: String, answer: String) {
        flashText1.text = question
        backText1.text = answer
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let navigationController = segue.destination as! UINavigationController
        let creationController = navigationController.topViewController as! CreationViewController
        
        creationController.flashcardsController = self
        
        if segue.identifier == "EditSegue"
        {
            creationController.initialQuestion = flashText1.text
            creationController.initialAnswer = backText1.text
        }
    }
    }

