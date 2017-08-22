//  Copyright © 2017 One by AOL : Publishers. All rights reserved.

import UIKit
import PlayerControls

func nop() {}

typealias Props = ContentControlsViewController.Props
func props() -> Props {
    return Props.player(Props.Player { player in
        player.item = Props.Player.Item.playable(Props.Player.Item.Controls { controls in
            controls.title = "Some title"
            controls.seekbar = Props.Player.Item.Controls.Seekbar { seekbar in
                seekbar.duration = 100
                seekbar.buffered = 0.5
                seekbar.currentTime = 25
                seekbar.progress = 0.25
                seekbar.seeker = Props.Player.Item.Controls.Seekbar.Seeker()
            }
            controls.playbackAction.pause = nop
            controls.camera = Props.Player.Item.Controls.Camera()
            controls.subtitles.available = (
                toggle: nop,
                state: .active(text: "This is how subtitles will look")
            )
        })
    })
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        let vc = DefaultControlsViewController()
        vc.view.backgroundColor = .black
        vc.view.tintColor = .white
        vc.props = props()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
        return true
    }
}

