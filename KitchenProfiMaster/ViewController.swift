//
//  ViewController.swift
//  KitchenProfiMaster
//
//  Created by Eugen Ganske on 16.09.22.
//

import UIKit
import AVKit

class ViewController: UIViewController {
    
    var videoPlayer: AVPlayer?
    
    var videoPlayerLayer:AVPlayerLayer?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    override func viewWillAppear(_ animated: Bool) {
        setUpVideo()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        videoPlayer?.pause()
    }
    
    func setUpVideo(){
        
        let bundlePath = Bundle.main.path(forResource: "KitchenProfiIntro3", ofType: "mp4")
        
        guard bundlePath != nil else{
            return
        }
        
        let url = URL(fileURLWithPath: bundlePath!)
        
        let item = AVPlayerItem(url: url)
        
        videoPlayer = AVPlayer(playerItem: item)
        
        videoPlayerLayer = AVPlayerLayer(player: videoPlayer!)
        
        videoPlayerLayer?.frame = CGRect(x:
                                            -self.view.frame.size.width*1.5, y: 0, width: self.view.frame.size.width*4, height: self.view.frame.size.height)
        view.layer.insertSublayer(videoPlayerLayer!, at: 0)
        
        videoPlayer?.playImmediately(atRate: 0.8)
        
    }
    
    
}

