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
    var stockSubtitle = UILabel()
    var stockPrice = UILabel()
    var stockPercentage = UILabel()


    override func layoutSubviews() {
        super.layoutSubviews()

        // Настройка Лэйбла
        
        stockLabel.frame = CGRect(x: stockImage.frame.size.width + 26, y: 11, width: 100, height: 16)
        stockLabel.font = UIFont.boldSystemFont(ofSize: 16)
        stockLabel.textColor = #colorLiteral(red: 0.6128784021, green: 0.6128784021, blue: 0.6128784021, alpha: 1)
        
        // Настройка Изображения
        stockImage.frame = CGRect(x: 16, y: 12, width: 36, height: 36) // Поправить центр!!!
        stockImage.layer.cornerRadius = 18
        stockImage.clipsToBounds = true
        
        // Настройка сабтайтла
        stockSubtitle.frame = CGRect(x: stockImage.frame.size.width + 26, y: stockLabel.frame.size.height + 19, width: 200, height: 16)
        stockSubtitle.font = stockSubtitle.font.withSize(14)
        stockSubtitle.textColor = #colorLiteral(red: 0.61385113, green: 0.6139419079, blue: 0.6138312817, alpha: 1)
        
        // Настройка цены
        
        stockPrice.frame = CGRect(x: contentView.frame.size.width - stockPrice.frame.size.width - 16, y: 11, width: 60, height: 16)
        stockPrice.textColor = #colorLiteral(red: 0.61385113, green: 0.6139419079, blue: 0.6138312817, alpha: 1)
        stockPrice.font = UIFont.boldSystemFont(ofSize: 16)
        stockPrice.textAlignment = NSTextAlignment.right
        
        // Процентное изменение цены
        
        stockPercentage.frame = CGRect(x: contentView.frame.size.width - stockPercentage.frame.size.width - 16, y: stockPrice.frame.size.height + 19, width: 60, height: 16)
        stockPercentage.font = stockPercentage.font.withSize(15)
        stockPercentage.textColor = #colorLiteral(red: 0.186942637, green: 0.5768624544, blue: 0.5230153799, alpha: 1)
        stockPercentage.textAlignment = NSTextAlignment.right
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(stockLabel)
        contentView.addSubview(stockImage)
        contentView.addSubview(stockSubtitle)
        contentView.addSubview(stockPrice)
        contentView.addSubview(stockPercentage)
        

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
