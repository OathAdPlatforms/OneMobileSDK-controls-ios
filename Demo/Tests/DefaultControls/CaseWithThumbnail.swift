//  Copyright © 2017 One by AOL : Publishers. All rights reserved.

import UIKit
import SnapshotTest
@testable import PlayerControls


@available(iOS 11.0, *)
class CaseWithThumbnail: SnapshotTest{
    
    var controller: DefaultControlsViewController {
        let controller = DefaultControlsViewController()
        controller.view.backgroundColor = .red
        
        controller.props = DefaultControlsViewController.Props.player(
            DefaultControlsViewController.Props.Player { player in
                player.playlist = DefaultControlsViewController.Props.Player.Playlist()
                player.playlist?.next = nop
                player.item = DefaultControlsViewController.Props.Player.Item.playable(
                    DefaultControlsViewController.Props.Player.Item.Controls { controls in
                        
                        controls.title = "SOME TITLE"
                        controls.seekbar = .init()
                        controls.seekbar?.seeker.state.stop = nop
                        
                        controls.live.isHidden = false
                        controls.live.dotColor = #colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1)
                        controls.sideBarViewHidden = false
                        controls.playbackAction.isNone = true
                        
                        controls.camera = nil
                        controls.loading = true
                        
                        controls.settings = .hidden
                        controls.pictureInPictureControl = .unsupported
                        
                        controls.legible = .`internal`(nil)
                        controls.thumbnail = DefaultControlsViewController.Props.Player.Item.Controls.Thumbnail.image(UIImage(named: "brackets")!)
                })
        })
        return controller
    }
    
    private enum Errors: Error {
        case notValidIdiom
    }
    
    func test()throws {
        switch UIDevice.current.userInterfaceIdiom {
        case .pad:
            verifyPads()
        case .phone:
            verifyPhones()
        default:
            throw Errors.notValidIdiom
        }
    }
    
    func verifyPads() {
        verify(controller, for: Device.iPadPro9.portrait.fullScreen)
        verify(controller, for: Device.iPadPro9.portrait.oneThird)
        verify(controller, for: Device.iPadPro9.landscape.twoThird)
        
        verify(controller, for: Device.iPadPro10.portrait.twoThirds)
        verify(controller, for: Device.iPadPro10.landscape.oneThird)
        
        verify(controller, for: Device.iPadPro12.portrait.oneThird)
        verify(controller, for: Device.iPadPro12.landscape.fullScreen)
    }
    
    func verifyPhones() {
        verify(controller, for: Device.iPhoneX.portrait)
        verify(controller, for: Device.iPhoneX.landscapeLeft)
        verify(controller, for: Device.iPhoneX.landscapeRight)
        
        verify(controller, for: Device.iPhone8.portrait)
        
        verify(controller, for: Device.iPhone8Plus.landscape)
        
        verify(controller, for: Device.iPhoneSE.portrait)
    }
}
