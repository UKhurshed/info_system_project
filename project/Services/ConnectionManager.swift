//
//  ConnectionManager.swift
//  project
//
//  Created by Khurshed Umarov on 09.11.2021.
//

import Foundation
import Network

/// Class for managing internet connection
class ConnectionManager{
    
    /// Singleton instance of ConnectionManager
    static let shared = ConnectionManager()
    
    private let queue = DispatchQueue.global()
        private let monitor: NWPathMonitor
        
        public private(set) var isConnected: Bool = false
        
        public private(set) var connectionType: ConnectionType = .unknown
    
    /// It's type of state internet connection
        enum ConnectionType{
            case wifi
            case cellular
            case ethernet
            case unknown
        }
        
        private init(){
            monitor = NWPathMonitor()
        }
    
    /// Start handling internet connection
        public func startMonitoring(){
            monitor.start(queue: queue)
            monitor.pathUpdateHandler = { [weak self] path in
                self?.isConnected = path.status == .satisfied
                self?.getConnectionType(path)
            }
        }
    
    /// Stop monitoring for internet connection
        public func stopMonitoring(){
            monitor.cancel()
        }
    
    /// Getting type of connection and set it for our connectionType
    /// - Parameter path: Network type of state
        private func getConnectionType(_ path: NWPath){
            if path.usesInterfaceType(.wifi){
                connectionType = .wifi
            }else if path.usesInterfaceType(.cellular){
                connectionType = .cellular
            }else if path.usesInterfaceType(.wiredEthernet){
                connectionType = .ethernet
            }else{
                connectionType = .unknown
            }
        }
}
