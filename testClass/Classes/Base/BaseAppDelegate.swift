//
//  BaseAppDelegate.swift
//  testClass
//
//  Created by Youngmin Jin on 2023/07/13.
//

import UIKit
import RxCocoa
import RxSwift
import ExtensionCollection

open class BaseAppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate  {
    var window:UIWindow?
    
    func storyboard(name:String = "Main") -> UIStoryboard {
        let board = UIStoryboard(name: name, bundle: nil)
        return board
    }
}
