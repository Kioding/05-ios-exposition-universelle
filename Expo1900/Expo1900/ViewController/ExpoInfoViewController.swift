//
//  Expo1900 - ViewController.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import UIKit

class ExpoInfoViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var visitorsLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var descrtionLabel: UILabel!

    @IBAction func MoveToKoreanItemButton(_ sender: Any) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var expo: ExpoInfo

        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "exposition_universelle_1900") else {
            return
        }

        do {
            expo = try jsonDecoder.decode(ExpoInfo.self, from: dataAsset.data)
            titleLabel.text = expo.title
            visitorsLabel.text = "방문자: " + String(expo.visitors)
            locationLabel.text = "개최지: " + expo.location
            durationLabel.text = "기간: " + expo.duration
            descrtionLabel.text = expo.description
            
        } catch {
            print(error.localizedDescription)
        }
    }
}
