//
//  AppDelegate.swift
//  SeSAC3Week5
//
//  Created by jack on 2023/08/14.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        
        // 알림 권한 설정
        UNUserNotificationCenter.current().delegate = self
        UNUserNotificationCenter
            .current()
            .requestAuthorization(
                options: [.alert, .sound, .badge, .sound],
                completionHandler: { success, error in
                    print(success, error)
                }
            )
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

extension AppDelegate: UNUserNotificationCenterDelegate {
    
    // 포그라운드 => 1:1 채팅 / 다른 방에서 알림만 온다 / 
    func userNotificationCenter(
        _ center: UNUserNotificationCenter,
        willPresent notification: UNNotification,
        withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
            // 특정 화면, 특정 조건에서만 포그라운드 알림 받기,
            // 특정 화면에서는 알림 안받기
            completionHandler([.sound, .badge, .banner, .list])
    }
    
    // 특정 푸시 클릭하면 특정 화면으로 이동
    // 로컬 알림 갯수 제한: 64개 제한 (identifier)
    // 카톡은?? 포그라운드로 켜는 순간, 등록되어 있던 모든 알림들 제거
    //
    // 잔디는 다 사라지지는 않음
    
}
