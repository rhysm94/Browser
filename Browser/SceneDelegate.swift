//
//  SceneDelegate.swift
//  Browser
//
//  Created by Rhys Morgan on 17/10/2019.
//  Copyright © 2019 Rhys Morgan. All rights reserved.
//

import SwiftUI
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
	var window: UIWindow?

	func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
		// Create the SwiftUI view that provides the window contents.
		let mainView = MainView()

		// Use a UIHostingController as window root view controller.
		if let windowScene = scene as? UIWindowScene {
			let window = UIWindow(windowScene: windowScene)
			window.rootViewController = UIHostingController(rootView: mainView)
			self.window = window
			window.makeKeyAndVisible()
		}
	}
}
