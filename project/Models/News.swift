//
//  News.swift
//  project
//
//  Created by Khurshed Umarov on 07.11.2021.
//

import Foundation

/// Item struct for json response
struct News: Codable{
    let title: String
    let description: String?
    let url: String?
    let urlToImage: String?
}

/// Root item from response
struct NewsData: Codable{
    let articles: [News]
}
