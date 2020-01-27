//
//  ViewController.swift
//  AlwaysBackground
//
//  Created by htanaka on 2020/01/17.
//  Copyright © 2020 htanaka. All rights reserved.
//

import UIKit
import CoreMotion
import CoreLocation
import CurrentLocationTime

class ViewController: UIViewController, CLLocationManagerDelegate {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: UIButton!
    
    @IBAction func onChangeStatus(_ sender: Any) {
        //location = CLLocationManager()
        //location.delegate = self
        //location.requestAlwaysAuthorization()
        //location.allowsBackgroundLocationUpdates = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
