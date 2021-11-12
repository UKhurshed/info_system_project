//
//  NetworkManager.swift
//  project
//
//  Created by Khurshed Umarov on 07.11.2021.
//

import Foundation

class NetworkManager{
    
    /// NSCache for caching image
    let imageCache = NSCache<NSString, NSData>()
    
    /// Singleton instance of NetworkManager
    static let shared = NetworkManager()
    
    private init(){}
    
    /// Our base url for request
    private let baseUrl = "https://newsapi.org/v2/"
    
    /// Main func, for getting news from request
    /// - Parameters:
    ///   - source: Find sources that display news of this category. Possible options: business, entertainment, general, health, science, sports, technology.
    ///   - query: Keywords or a phrase to search for.
    ///   - completion: This completion return NewsData struct or Error depends from request state
    func getNews(source: String, query: String, completion: @escaping (Result<NewsData, Error>) -> Void){
        let urlString = "\(baseUrl)top-headlines?q=\(query)&category=\(source)&country=ru&apiKey=\(ApiKey.key)"
        guard let url = URL(string: urlString) else{
            return
        }
        
        URLSession.shared.dataTask(with: url){ (data, response, error) in
            if let error = error{
                completion(.failure(error))
            }
            
            guard let response = response as? HTTPURLResponse else{
                print("Empty response")
                return
            }
            
            print("Response statusCode: \(response.statusCode)")
            
            if let data = data {
                do {
                    let jsonData = try JSONDecoder().decode(NewsData.self, from: data)
                    DispatchQueue.main.async {
                        completion(.success(jsonData))
                    }
                }catch{
                    print("error: \(error)")
                    completion(.failure(error))
                }
            }
            
        }.resume()
    }
    
    /// This function get Image from url
    /// - Parameters:
    ///   - urlString: url from image
    ///   - completion: This completion after calling function and return just Void or Nil depends from request
    func getImage(urlString: String, completion: @escaping (Data?) -> Void){
        guard let url = URL(string: urlString) else{
            completion(nil)
            return
        }
        
        if let cacheImage = imageCache.object(forKey: NSString(string: urlString)){
            completion(cacheImage as Data)
        }else{
            URLSession.shared.dataTask(with: url){ (data, response, error) in
                
                if let error = error{
                    completion(nil)
                }
                if let data = data{
                    do {
                        self.imageCache.setObject(data as NSData, forKey: NSString(string: urlString))
                        completion(data)
                    }catch{
                        completion(nil)
                    }
                }
                
                
            }.resume()
        }
        
    }
    
}
