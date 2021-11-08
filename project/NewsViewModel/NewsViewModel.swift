//
//  NewsViewModel.swift
//  project
//
//  Created by Khurshed Umarov on 08.11.2021.
//

import Foundation

class NewsViewModel{
    private var topHeadlineNews = [News]()
    
    func fetchNews(source: String,query: String, completion: @escaping () -> ()){
        NetworkManager.shared.getNews(source: source, query: query){ [weak self] result in
            switch result{
            case .success(let listOf):
                self?.topHeadlineNews = listOf.articles
                completion()
            case .failure(let error):
                print("Error proccessing json data: \(error)")
                completion()
            }
        }
    }
    
    func numberOfRowsInSection(section: Int) -> Int{
        if topHeadlineNews.count != 0 {
            return topHeadlineNews.count
        }else{
            return 0
        }
    }
    
    func cellForRowAt(indexPath: IndexPath) -> News{
        return topHeadlineNews[indexPath.row]
    }
}
