//
//  SceneDelegate.swift
//  Swipbox_VIPER
//
//  Created by Muneeb Ali on 04/10/2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    //MARK: - Variables
    var window: UIWindow?
    
    //MARK: - Life Cycle Methods
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: scene)
        window?.makeKeyAndVisible()
        SplashRouter.setSplashScreen(from: window!)
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
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }
}
