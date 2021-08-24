//
//  WatchListCell.swift
//  TradingView
//
//  Created by Антон Белый on 22.08.2021.
//

import UIKit

class WatchListCell: UITableViewCell {
    static let identifier = "WatchListCell"
    //prepareforReuse cellimageview(nil)
    


    
    var title = UILabel()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.imageView?.frame = CGRect(x: 5, y: 10, width: 40, height: 40)
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)

    }
    

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
//    func downImg() {
//    if let url = URL(string: "https://s3-symbol-logo.tradingview.com/metal/gold--96.webp") {
//        let task = URLSession.shared.dataTask(with: url) { data, response, error in
//            guard let data = data, error == nil else { return }
//
//            DispatchQueue.main.async { /// execute on main thread
//                self.translatesAutoresizingMaskIntoConstraints = false
//                self.imageView?.image = UIImage(data: data)
//            }
//        }
//
//        task.resume()
//    }
//    }
    
    
    func downImg() {
        
    }

}


extension UIImageView {
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}
