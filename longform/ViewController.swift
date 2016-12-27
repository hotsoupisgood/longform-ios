//
//  ViewController.swift
//  longform
//
//  Created by Mac on 12/16/16.
//  Copyright © 2016 This Agora. All rights reserved.
//

import UIKit
import Alamofire
import AVFoundation


class ViewController: UIViewController {
//    var shuffle = Shuffle()
    var currentPodcast = NSDictionary()
    var player = UniversalPlayer()
    @IBOutlet weak var AudioProgressSlider: UISlider!
    @IBOutlet weak var maxTime: UILabel!
    @IBOutlet weak var currentTime: UILabel!
    func play() {
        UniversalPlayer.audio.play()
    }
    func pause() {
        UniversalPlayer.audio.pause()
    }
    //MARK: Properties
    @IBOutlet weak var playPauseButton: UIButton!

    @IBOutlet weak var podcastDescriptionTextView: UITextView!
    @IBOutlet weak var podcastTitleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        podcastTitleLabel.text = ""
//        podcastDescriptionTextView.text = ""
        fillCurrentPodcastData()
//        getRandomPodcast()
        let interval = CMTimeMake(2, 1)
        UniversalPlayer.audio.addPeriodicTimeObserver(forInterval: interval, queue: DispatchQueue.main) { [unowned self] time in
            do {
                let timeElapsed = Float(CMTimeGetSeconds(time))
                self.setTimers(time: time)
                let percentage = (timeElapsed/Float(CMTimeGetSeconds((UniversalPlayer.audio.currentItem?.duration)!)))*100
                self.AudioProgressSlider.value = percentage
            }
            catch {
                
            }
            
        }
        
    }
    //MARK: Outlet
    @IBAction func skipButtonPress(_ sender: UIButton) {
        UniversalPlayer.audio.pause()
//        getRandomPodcast()
        
    }
    @IBAction func sliderChange(_ sender: Any) {
        let timeNumber = (AudioProgressSlider.value/100)*Float(CMTimeGetSeconds((UniversalPlayer.audio.currentItem?.duration)!))
        let time: CMTime = CMTimeMake(Int64(timeNumber), 1)
        UniversalPlayer.audio.seek(to: time)
    }

    @IBAction func playButtonPress(_ sender: UIButton) {
        if UniversalPlayer.audio.rate != 0 {
            pause()
        playPauseButton.setTitle("play", for: .normal)
        }else {
            play()
            playPauseButton.setTitle("pause", for: .normal)
        }
    }
    //Mark: Private
    private func fillCurrentPodcastData() {
        podcastTitleLabel.text = UniversalPlayer.podcastTitle
        print(UniversalPlayer.podcastDescription)
        podcastDescriptionTextView.text = UniversalPlayer.podcastDescription
    }
    private func setTimers(time: CMTime) {
        let currentSeconds = Int(CMTimeGetSeconds(time))
        let hours = currentSeconds / 3600
        let minutes = (currentSeconds % 3600) / 60
        let seconds = currentSeconds % 60
        let maxSeconds = Int(CMTimeGetSeconds((UniversalPlayer.audio.currentItem?.duration)!))
        let totalHours = maxSeconds / 3600
        let totalMinutes = (maxSeconds % 3600) / 60
        let totalSeconds = maxSeconds % 60
        self.currentTime.text = String(hours) + ":" + String(minutes) + ":" + String(seconds)
        self.maxTime.text = String(totalHours) + ":" + String(totalMinutes) + ":" + String(totalSeconds)
    }
//    private func getRandomPodcast() {
//        Alamofire.request("http://localhost:8888/php/getRandomPodcast.php").responseJSON { response in
//            if let result = response.result.value {
//                self.currentPodcast = result as! NSDictionary
//                
//                self.podcastTitleLabel.text = self.currentPodcast["name"] as? String
//                self.podcastDescriptionTextView.text = self.currentPodcast["description"] as? String
//                
//                let locationString = self.currentPodcast["location" ]
//                let location = URL(string: locationString as! String)
//                let playerItem = AVPlayerItem(url: location!)
//                
//                UniversalPlayer.audio.replaceCurrentItem(with: playerItem)
//            }
//        }
//    }
}

