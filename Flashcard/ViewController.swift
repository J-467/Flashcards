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
    @IBOutlet weak var prevButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    struct Flashcard
    {
        var question: String
        var answer: String
    }
    
    // Creating an array to store the flashcards
    var flashcards = [Flashcard]()
    var currentIndex = 0
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Read saved flashcards on loading
        readSavedFlashcards()
        
        //show this if there are no flashcards in the database
        if flashcards.count == 0{
            updateFlashcard(question: "Who is the best sprinter of all time", answer: "Bolt, Usain")
        }
        else{
            updateLabels()
            updateNextPrevButtons()
        }
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
    

    @IBAction func onTap(_ sender: Any) {
        if flashText1.isHidden == true{
            flashText1.isHidden = false
        }
        else{
            flashText1.isHidden = true
        }

        }
    
    @IBAction func didOnTapPrev(_ sender: Any) {
        currentIndex -= 1
        
        updateNextPrevButtons()
        updateLabels()
    }
    @IBAction func didOnTapNext(_ sender: Any) {
        currentIndex += 1
        
        updateNextPrevButtons()
        updateLabels()
    }
    
    
    // This functions updates the current flash card adds it to the db
    func updateFlashcard(question: String, answer: String) {
        let flashcard = Flashcard(question: question, answer: answer)
        flashText1.text = flashcard.question
        backText1.text = flashcard.answer
        
        // Add the flashcard to the array
        flashcards.append(flashcard)
        
        //print these for debugging sake
        print("Added a new flashcard")
        print("We now have \(flashcards.count) flashcards")
        
        
        currentIndex = flashcards.count - 1
        print("Our current index is \(currentIndex)")
        
        updateNextPrevButtons()
        updateLabels()
        saveAllFlashcardsToDisk()
        
    }
    
    func updateNextPrevButtons()
    {
        // disable next button if it is at the end
        if currentIndex == flashcards.count - 1 {
            nextButton.isEnabled = false}
        else{
            nextButton.isEnabled = true}
        
        // disable previous button if it is at the first index
        if currentIndex == 0 {
            prevButton.isEnabled = false}
        else{
            prevButton.isEnabled = true}
        
    }
    
    func updateLabels()
    {
        let currentFlashcard = flashcards[currentIndex]
        
        flashText1.text = currentFlashcard.question
        backText1.text  = currentFlashcard.answer
    }
        

    //This functions saves all the user made flashcards to the harddisk
    
    func saveAllFlashcardsToDisk()
    {
        // converting flashcards to dictionary since the pc doesn't know
        // the flashcard datatype by default
        let dictionaryArray = flashcards.map{
            (card) -> [String: String] in
            return["question": card.question, "answer": card.answer]
        }
        
        UserDefaults.standard.set(dictionaryArray, forKey: "flashcards")
        
        //Logging it
        print("Flashcards saved to UserDefaults")
        
    }
    
    func readSavedFlashcards()
    {
        //Reading dictionary array from disk if any
        if let dictionaryArray = UserDefaults.standard.array(forKey: "flashcards") as? [[String: String]]{
            //if the code reaches here, we know for sure there are some stored flashcards
            let savedCards = dictionaryArray.map{dictionary -> Flashcard in
                return Flashcard(question: dictionary["question"]!, answer: dictionary["answer"]!)
        }
            flashcards.append(contentsOf: savedCards)
    }
        //put all the saved flashcards in our flashcards array
        
   
    }

}
