//
//  AppDelegate.swift
//  AlwaysBackground
//
//  Created by htanaka on 2020/01/17.
//  Copyright © 2020 htanaka. All rights reserved.
//

import UIKit
import CoreLocation
import CurrentLocationTime

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, CLLocationManagerDelegate {

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
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        stopLocation()
        changeType()
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        changeType()
        startLocation()
    }
    
    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        location = CLLocationManager()
        location.delegate = self
        location.requestAlwaysAuthorization()
        location.allowsBackgroundLocationUpdates = true
        initLocation()
        changeType()
        return true
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        /// ** 位置情報が更新されると以下を実行するはずだ！ ** //
        let location = locations.first
        let latitude = location?.coordinate.latitude
        let longitude = location?.coordinate.longitude
        
        // 現在時刻
        let timestamp = getTime(formatStr: "[yyyy-MM-dd(EEE) HH:mm:ss]")
        
        // ファイルに書き込む文字列
        let content = timestamp + " \(latitude) \(longitude)\n"
        let contentData = content.data(using: .utf8)!
        
        // ファイル追記
        do {
            let file = try FileHandle(forWritingTo: fileURL!)
            file.seekToEndOfFile()
            file.write(contentData)
            file.closeFile()
        
            print(content)
        } catch let error {
            print(error)
            print("( ^_^;)")
        }
    }
}
