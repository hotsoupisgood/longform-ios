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
    
    //MARK: Initialization
    override func viewDidLoad() {
        super.viewDidLoad()
        shuffle.getRandomPodcast()
        
    }
    //MARK: Outlet
    @IBAction func playButtonPress(_ sender: UIButton) {
        shuffle.play()
    }
}

