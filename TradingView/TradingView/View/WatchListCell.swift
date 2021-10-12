//
//  WatchListCell.swift
//  TradingView
//
//  Created by Антон Белый on 22.08.2021.
//

import UIKit

class WatchListCell: UITableViewCell {
    static let identifier = "WatchListCell"

    var stockImage = ImageLoader()
    var stockNameLabel = UILabel()
    var stockSubtitle = UILabel()
    var stockPrice = UILabel()
    var stockPercentage = UILabel()
    var stockAbsolute = UILabel()
    var stockMarketClosed = UILabel()

    override func layoutSubviews() {
        super.layoutSubviews()
        
        // NameLable
        stockNameLabel.frame = CGRect(x: stockImage.frame.size.width + 26, y: 11, width: 95, height: 16)
        stockNameLabel.font = UIFont.boldSystemFont(ofSize: 16)
        stockNameLabel.textColor = UIColor { traitCollection in
            switch traitCollection.userInterfaceStyle {
            case .dark:
                return UIColor(red: 189/255, green: 195/255, blue: 199/255, alpha: 1.0)
            default:
                return UIColor.black
            }
        }
        // Image
        stockImage.frame = CGRect(x: 16, y: 12, width: 36, height: 36)
        stockImage.layer.cornerRadius = 18
        stockImage.clipsToBounds = true
        
        // SubtitleLabel
        stockSubtitle.frame = CGRect(x: stockImage.frame.size.width + 26, y: stockNameLabel.frame.size.height + 19, width: 200, height: 16)
        stockSubtitle.font = stockSubtitle.font.withSize(14)
        stockSubtitle.textColor = UIColor { traitCollection in
            switch traitCollection.userInterfaceStyle {
            case .dark:
                return UIColor(red: 189/255, green: 195/255, blue: 199/255, alpha: 1.0)
            default:
                return UIColor.black
            }
        }
        // Pricelabel
        stockPrice.frame = CGRect(x: contentView.frame.size.width - stockPrice.frame.size.width - 16, y: 11, width: 80, height: 16)
        stockPrice.font = UIFont.boldSystemFont(ofSize: 16)
        stockPrice.textAlignment = NSTextAlignment.right
        stockPrice.textColor = UIColor { traitCollection in
            switch traitCollection.userInterfaceStyle {
            case .dark:
                return UIColor(red: 189/255, green: 195/255, blue: 199/255, alpha: 1.0)
            default:
                return UIColor.black
            }
        }
        // PercentPrice
        stockPercentage.frame = CGRect(x: contentView.frame.size.width - stockPercentage.frame.size.width - 16, y: stockPrice.frame.size.height + 19, width: 60, height: 16)
        stockPercentage.font = stockPercentage.font.withSize(15)
        stockPercentage.textAlignment = NSTextAlignment.right
        
        // AbsolutePrice
        stockAbsolute.frame = CGRect(x: contentView.frame.size.width - stockAbsolute.frame.size.width - 75, y: stockPrice.frame.size.height + 19, width: 60, height: 16)
        stockAbsolute.font = stockAbsolute.font.withSize(15)
        stockAbsolute.textAlignment = NSTextAlignment.right
        
        // stockMarketClosed
        stockMarketClosed.frame = CGRect(x: stockImage.frame.size.width + 100, y: 11, width: 125, height: 16)
        stockMarketClosed.font = UIFont.boldSystemFont(ofSize: 16)
        stockMarketClosed.textAlignment = NSTextAlignment.center
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(stockNameLabel)
        contentView.addSubview(stockImage)
        contentView.addSubview(stockSubtitle)
        contentView.addSubview(stockPrice)
        contentView.addSubview(stockPercentage)
        contentView.addSubview(stockAbsolute)
        contentView.addSubview(stockMarketClosed)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
