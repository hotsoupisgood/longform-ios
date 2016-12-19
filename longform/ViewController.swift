//
//  ViewController.swift
//  longform
//
//  Created by Mac on 12/16/16.
//  Copyright © 2016 This Agora. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    var shuffle = Shuffle()
    
    //MARK: Properties

    @IBOutlet weak var podcastTitleLabel: UILabel!
    @IBOutlet weak var podcastDescriptionTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        podcastTitleLabel.text = ""
        podcastDescriptionTextView.text = ""
        shuffle.getRandomPodcast()
        
    }
    //MARK: Outlet
    @IBAction func skipButtonPress(_ sender: UIButton) {
        shuffle.getRandomPodcast()
        podcastTitleLabel.text = shuffle.getTitle()
        podcastDescriptionTextView.text = shuffle.getDescription()
    }
    @IBAction func pausButtonPress(_ sender: UIButton) {
        shuffle.pause()
    }
    @IBAction func playButtonPress(_ sender: UIButton) {
        shuffle.play()
        podcastTitleLabel.text = shuffle.getTitle()
        podcastDescriptionTextView.text = shuffle.getDescription()
    }
}

