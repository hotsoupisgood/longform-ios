//
//  ShuffleManager.swift
//  longform
//
//  Created by Mac on 12/16/16.
//  Copyright © 2016 This Agora. All rights reserved.
//

import Foundation
import Alamofire
import AVFoundation
class Shuffle: NSObject {
    var currentPodcast = NSDictionary()
    var player = AVPlayer()
    func play() {
        if let locationString = currentPodcast["location"] {
            print(locationString)
            let location = URL(string: locationString as! String)
            let playerItem = AVPlayerItem(url: location!)
            
            player = AVPlayer(playerItem:playerItem)
            player.volume = 1.0
            player.play()
            print(player.status)
        }
        else{
            print("failed")
        }
    }
    
    func getRandomPodcast() {
        Alamofire.request("http://localhost:8888/php/getRandomPodcast.php").responseJSON { response in
            if let result = response.result.value {
                self.currentPodcast = result as! NSDictionary
            }
        }
    }
}
