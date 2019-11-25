//
//  SceneDelegate.swift
//  DriverSearch
//
//  Created by Martin on 11/13/19.
//  Copyright © 2019 DebuggingHell. All rights reserved.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else { return }

        #if DEBUG
         if let _ = NSClassFromString("XCTest") {
            // If we're running tests, don't launch the main storyboard as
            // it's confusing if that is running fetching content whilst the
            // tests are also doing so.
            let viewController = UIViewController()
            let label = UILabel()
            label.text = "Running tests..."
            label.frame = viewController.view.frame
            label.textAlignment = .center
            label.textColor = .white
            viewController.view.addSubview(label)
            let window = UIWindow(windowScene: scene as! UIWindowScene)
            self.window = window
            self.window!.rootViewController = viewController
            self.window!.makeKeyAndVisible()
            return
         }
         #endif
        
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: MainView())
            self.window = window
            window.makeKeyAndVisible()
        }
    }

    func sceneDidDisconnect(_ scene: UIScene) {

    }

    func sceneDidBecomeActive(_ scene: UIScene) {

    }

    func sceneWillResignActive(_ scene: UIScene) {

    }

    func sceneWillEnterForeground(_ scene: UIScene) {

    }

    func sceneDidEnterBackground(_ scene: UIScene) {

    }
}

