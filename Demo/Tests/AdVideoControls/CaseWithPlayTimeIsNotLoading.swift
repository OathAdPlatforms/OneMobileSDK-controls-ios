//  Copyright © 2017 One by AOL : Publishers. All rights reserved.

import UIKit
import SnapshotTest
@testable import PlayerControls


@available(iOS 11.0, *)
class CaseWithPlayTimeIsNotLoading: SnapshotTest {
    
    var controller: AdVideoControls {
        let controller = AdVideoControls()
        controller.view.backgroundColor = .red
        
        controller.props = AdVideoControls.Props(
            mainAction: AdVideoControls.Props.MainAction.pause(nop()),
            seeker: AdVideoControls.Props.Seeker(
                remainingPlayTime: "9999:59",
                currentValue: 0.5),
            tapAction: nop() ,
            isLoading: false, airplayActiveViewHidden: false)
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
        verify(controller, for: Device.iPadPro12.landscape.fullScreen)
    }
    
    func verifyPhones() {
        verify(controller, for: Device.iPhoneX.landscapeRight)
    }
}
