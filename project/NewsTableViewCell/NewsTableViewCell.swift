//
//  NewsTableViewCell.swift
//  project
//
//  Created by Khurshed Umarov on 08.11.2021.
//

import UIKit

/// NewsTableViewCell extends from UITableViewCell
class NewsTableViewCell: UITableViewCell {
    
    /// UIImageView for showing image each news item
    @IBOutlet weak var newsImg: UIImageView!
    /// UILabel for news description
    @IBOutlet weak var newsDesc: UILabel!
    /// UILabel for news title
    @IBOutlet weak var newsTitle: UILabel!
    
    /// this is called just before the cell is returned from the table view method dequeueReusableCellWithIdentifier
    override func prepareForReuse() {
        super.prepareForReuse()
        self.accessoryType = .none
    }
    
    /// Fetch all of data from request, in our case News
    ///
    /// - Parameter news:  News struct
    func setCellWithValuesOf(_ news: News){
        updateUI(title: news.title, desc: news.description, imageNews: news.urlToImage, urlNews: news.url)
    }
    
    /// After fetch news we need transfer item for show in list
    ///
    /// - Parameters:
    ///   - title: title text
    ///   - desc: description text
    ///   - imageNews: image url
    ///   - urlNews: url for open in browser
    private func updateUI(title: String?, desc: String?, imageNews: String?, urlNews: String?){
        self.newsDesc.numberOfLines = 0
        self.newsTitle.text = title
        self.newsDesc.text = desc ?? "No description"
        
        if imageNews != nil{
            NetworkManager.shared.getImage(urlString: imageNews ?? "") { data in
                guard let data = data else{
                    return
                }
                DispatchQueue.main.async {
                    self.newsImg.image = UIImage(data: data)
                }
                
            }
        }else{
            newsImg.layer.isHidden = true
        }
    }
    
    
}
