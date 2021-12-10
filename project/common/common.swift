//
//  common.swift
//  project
//
//  Created by Khurshed Umarov on 18.11.2021.
//

import Foundation

/// Common class
class Common: HelloCommon{
    func greetingCommon() {
        DispatchQueue.global(qos: .background)
    }
    
    
    
    
    /// Greeting function
    /// - Parameter name: name of common
    func helloCommon(name: String){
        
    }
}

/// HelloCommon protocol
protocol HelloCommon: class{
    func greetingCommon()
}
