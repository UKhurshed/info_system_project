//
//  SceneDelegate.swift
//  project
//
//  Created by Khurshed Umarov on 07.11.2021.
//

import UIKit

/// SceneDelegate
class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    /// Application window on which root view controller is set
    var window: UIWindow?

    
    /// Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
    ///
    /// - Parameters:
    ///   - scene: UIScene
    ///   - session: UISceneSession
    ///   - connectionOptions: UIScene.ConnectionOptions
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let _ = (scene as? UIWindowScene) else { return }
    }
    
    /// Called as the scene is being released by the system.
    ///
    /// - Parameter scene: UIScene
    func sceneDidDisconnect(_ scene: UIScene) {
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }
    
    /// Called when the scene has moved from an inactive state to an active state.
    /// - Parameter scene: UIScene
    func sceneDidBecomeActive(_ scene: UIScene) {
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }
    
    /// Called when the scene will move from an active state to an inactive state.
    ///
    /// - Parameter scene: UIScene
    func sceneWillResignActive(_ scene: UIScene) {
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }
    
    /// Called as the scene transitions from the background to the foreground.
    ///
    /// - Parameter scene: UIScene
    func sceneWillEnterForeground(_ scene: UIScene) {
        // Use this method to undo the changes made on entering the background.
    }
    
    /// Called as the scene transitions from the foreground to the background.
    ///
    /// - Parameter scene: UIScene
    func sceneDidEnterBackground(_ scene: UIScene) {
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.

        // Save changes in the application's managed object context when the application transitions to the background.
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }


}

