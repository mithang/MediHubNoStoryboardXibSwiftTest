//
//  VideoVC.swift
//  MediHubNoStoryboardXibSwiftTest
//
//  Created by apple on 6/23/18.
//  Copyright © 2018 appledemoobj. All rights reserved.
//

import UIKit
import YouTubePlayer
import youtube_ios_player_helper

class VideoVC: UIViewController,YTPlayerViewDelegate {

    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var uiyoutube: YTPlayerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        uiyoutube.delegate = self;
        //showinfo=0 -> Không show nút back, nhưng show logo youtube
        //showinfo=1 -> show nút back, nhưng không show logo youtube
        // Do any additional setup after loading the view.
        let playvarsDic = ["controls": 1, "playsinline": 1, "autohide": 1, "showinfo": 1, "autoplay": 1, "modestbranding": 0,"rel" : 0,"fs" : 1]
        //self.uiyoutube.load(withVideoId: "sA0-QXbLnaE", playerVars: ["playsinline":1])
        self.uiyoutube.load(withVideoId: "sA0-QXbLnaE", playerVars: playvarsDic)
        //let url="https://www.youtube.com/embed/sA0-QXbLnaE?rel=0"
        //self.uiyoutube.loadVideo(byURL: url, startSeconds: 0, suggestedQuality: YTPlaybackQuality.auto)
       
        
    }
    // MARK: - IBAction
    @IBAction func tapPlay(sender: AnyObject) {
        self.uiyoutube.playVideo()
    }
    @IBAction func tapPause(sender: AnyObject) {
        self.uiyoutube.pauseVideo()
    }
    @IBAction func tapStop(sender: AnyObject) {
        self.uiyoutube.stopVideo()
    }
    
    // MARK: - delegate methods
    func playerView(_ playerView: YTPlayerView, didChangeTo state: YTPlayerState) {
        //print("Duraction: \(playerView.duration())")//Tổng thời gian thời lượng video
        //print("Time: \(playerView.currentTime())")//Thời gian phát hiện tại mà thanh bar đang chạy
        
        switch (state) {
        case YTPlayerState.unstarted:
            stateLabel.text = "Dừng"
        case YTPlayerState.playing:
            stateLabel.text = "Đang trong quá trình tải"
        case YTPlayerState.paused:
            stateLabel.text = "Dừng tạm thời"
        case YTPlayerState.buffering:
            stateLabel.text = "Đang lưu trong bộ đệm"
        case YTPlayerState.ended:
            stateLabel.text = "Kết thúc phát lại"
        default:
            break
        }
    }
    func playerView(_ playerView: YTPlayerView, didChangeTo quality: YTPlaybackQuality) {
        
        switch quality {
        case YTPlaybackQuality.HD720:
            break
        default: break
            
        }
        
    }
    func playerView(_ playerView: YTPlayerView, didChangeTo error: YTPlayerError) {
       
    }
    

    //Khi video đã load xong và sẳn sàng play, khi đó có thể tính được thời gian video
    func playerViewDidBecomeReady(_ playerView:YTPlayerView){
        print("Duraction: \(playerView.duration())")//Tổng thời gian thời lượng video
        print("Time: \(playerView.currentTime())")//Thời gian phát hiện tại mà thanh bar đang chạy
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
