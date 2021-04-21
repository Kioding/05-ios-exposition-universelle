//
//  koreanItemDetailViewController.swift
//  Expo1900
//
//  Created by kio on 2021/04/16.
//

import UIKit

class koreanItemDetailViewController: UIViewController {

    @IBOutlet weak var koreanItemDescriptionLabel: UILabel!
    @IBOutlet weak var koreanItemImage: UIImageView!

    var koreanItemDetail: KoreanItemInfo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        update()
    }
    
    func update() {
        self.navigationItem.title = koreanItemDetail?.name
        guard let itemDetail = koreanItemDetail else {
            return
        }
        
        koreanItemImage.image = UIImage(named:itemDetail.imageName)
        koreanItemDescriptionLabel.text = itemDetail.description
    }
}
