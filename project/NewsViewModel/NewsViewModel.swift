//
//  NewsViewModel.swift
//  project
//
//  Created by Khurshed Umarov on 08.11.2021.
//

import Foundation

/// ViewModel layer from our architecture
class NewsViewModel{
    
    /// variable for assignment after fetch News
    private var topHeadlineNews = [News]()
    
    /// Fetch News
    /// - Parameters:
    ///   - source: Find sources that display news of this category. Possible options: business, entertainment, general, health, science, sports, technology.
    ///   - query: Keywords or a phrase to search for.
    ///   - completion: This completion return
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
    
    /// Return count of elements from list news
    /// - Parameter section: section from uitableView
    /// - Returns: if count of list empty return zero, otherwise count of list
    func numberOfRowsInSection(section: Int) -> Int{
        if topHeadlineNews.count != 0 {
            return topHeadlineNews.count
        }else{
            return 0
        }
    }
    
    /// Return cell from list items
    /// - Parameter indexPath: integer parametr getting from index of list
    /// - Returns: Item from list, it is News struct
    func cellForRowAt(indexPath: IndexPath) -> News{
        return topHeadlineNews[indexPath.row]
    }
}
