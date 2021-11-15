//
//  News.swift
//  project
//
//  Created by Khurshed Umarov on 07.11.2021.
//

import Foundation

/// News item struct
struct News: Codable{
    /// The headline or title of the article.
    let title: String
    /// A description or snippet from the article.
    let description: String?
    /// The direct URL to the article.
    let url: String?
    /// The URL to a relevant image for the article.
    let urlToImage: String?
}

/// News Response
struct NewsData: Codable{
    /// The results of the request.
    let articles: [News]
}
