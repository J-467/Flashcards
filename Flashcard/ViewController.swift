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
    }

