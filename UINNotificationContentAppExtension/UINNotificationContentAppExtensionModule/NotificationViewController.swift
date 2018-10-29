//
//  NotificationViewController.swift
//  UINNotificationContentAppExtensionModule
//
//  Created by 田中 佑 on 2018/09/14.
//  Copyright © 2018年 yu tanaka. All rights reserved.
//

import UIKit
import UserNotifications
import UserNotificationsUI
import AVKit

class NotificationViewController: UIViewController, UNNotificationContentExtension {

    @IBOutlet weak var customButton: UIButton! {
        didSet {
            customButton.layer.cornerRadius = 4
            customButton.backgroundColor = .gray
        }
    }
    @IBOutlet weak var playerView: UIView!
    @IBOutlet weak var emptyView: UIView!
    @IBOutlet var label: UILabel?
    
    var player: AVPlayer?
    
    let mediaPlayPauseButtonType: UNNotificationContentExtensionMediaPlayPauseButtonType = .overlay
    var mediaPlayPauseButtonFrame: CGRect {
        return CGRect(x: self.view.frame.width / 2 - emptyView.frame.width / 2, y: playerView.frame.height / 2 - emptyView.frame.height / 2, width: emptyView.frame.width, height: emptyView.frame.height)
    }
    
    override func viewDidLayoutSubviews() {
        let path = Bundle.main.path(forResource: "waterfall-free-video1.mp4", ofType: nil)
        
        player = AVPlayer(url: URL(fileURLWithPath:path!))
        player?.externalPlaybackVideoGravity = .resizeAspectFill
        
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = playerView.bounds
        playerView.layer.addSublayer(playerLayer)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any required interface initialization here.
    }
    
    func didReceive(_ notification: UNNotification) {
        self.title = "AAAAAA"
        self.label?.text = notification.request.content.body
    }

    @IBAction func touchupButton(_ sender: Any) {
        guard let player = player else { return }
        
        if case .paused = player.timeControlStatus  {
            player.play()
        } else {
            player.pause()
        }
    }
    
    public func mediaPlay() {
        player?.play()
    }
    
    public func mediaPause() {
        player?.pause()
    }
}
