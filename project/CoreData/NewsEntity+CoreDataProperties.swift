//
//  NewsEntity+CoreDataProperties.swift
//  project
//
//  Created by Khurshed Umarov on 09.11.2021.
//
//

import Foundation
import CoreData


extension NewsEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<NewsEntity> {
        return NSFetchRequest<NewsEntity>(entityName: "NewsEntity")
    }

    @NSManaged public var title: String?
    @NSManaged public var desc: String?
    @NSManaged public var urlToImage: String?
    @NSManaged public var searchUrl: String?

}

extension NewsEntity : Identifiable {

}
