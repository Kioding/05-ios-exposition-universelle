//
//  KoreanItemInfoController.swift
//  Expo1900
//
//  Created by kio on 2021/04/16.
//

import UIKit

class KoreanItemInfoViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var koreanItemTableView: UITableView!
    let cellIdentifier: String = "cell"
    var koreanItems: [KoreanItemInfo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "items") else {
            return
        }
        
        do {
            self.koreanItems = try jsonDecoder.decode([KoreanItemInfo].self, from: dataAsset.data)
        } catch {
            print(error.localizedDescription)
        }
        
        self.koreanItemTableView.reloadData()
    }
    
}

extension KoreanItemInfoViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.koreanItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath) as! CustomCellForKoreanitem
        
        let koreanItem: KoreanItemInfo = self.koreanItems[indexPath.row]
        
        cell.koreanItemImage.image = UIImage(named: koreanItem.imageName)
        cell.koreanItemTitleLabel.text = koreanItem.name
        cell.koreanItemShortDescriptionLabel.text = koreanItem.shortDescription

        return cell
    }
}
