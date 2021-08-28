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

    var stockImage = UIImageView()
    var stockLabel = UILabel()

    
    
    override func layoutSubviews() {
        super.layoutSubviews()
//        self.imageView?.frame = CGRect(x: 5, y: contentView.bounds.size.width / 2, width: 40, height: 40)
        

        
        // Настройка Лэйбла
        
        stockLabel.frame = CGRect(x: 5, y: 5, width: 100, height: contentView.frame.size.height-10)
        
        // Настройка Изображения
        stockImage.frame = CGRect(x: 16, y: 12, width: 36, height: 36) // Поправить центр!!!
        stockImage.layer.cornerRadius = 18
        stockImage.clipsToBounds = true
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
//        contentView.addSubview(stockLabel)
        contentView.addSubview(stockImage)
        

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
