//
//  NewsTableViewCell.swift
//  project
//
//  Created by Khurshed Umarov on 08.11.2021.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var newsImg: UIImageView!
    @IBOutlet weak var newsDesc: UILabel!
    @IBOutlet weak var newsTitle: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.accessoryType = .none
    }
    
    func setCellWithValuesOf(_ news: News){
        updateUI(title: news.title, desc: news.description, imageNews: news.urlToImage, urlNews: news.url)
    }
    
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
