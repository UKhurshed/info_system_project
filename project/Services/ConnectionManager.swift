//
//  ConnectionManager.swift
//  project
//
//  Created by Khurshed Umarov on 09.11.2021.
//

import Foundation
import Network

/// Connection managing class
class ConnectionManager{
    /// singleton instance our class
    static let shared = ConnectionManager()
    
    /// Store queue for monitoring object
    private let queue = DispatchQueue.global()
    /// Connection monitor
    private let monitor: NWPathMonitor
    
    /// Bool variable store state of connection
    public private(set) var isConnected: Bool = false
    
    /// Variable store type of internet connection, default value is unknown
    public private(set) var connectionType: ConnectionType = .unknown
    
    /// ConnectionType enum
    enum ConnectionType{
        case wifi
        case cellular
        case ethernet
        case unknown
    }
    
    /// Initialize monitor
    private init(){
        monitor = NWPathMonitor()
    }
    
    /// Start monitoring
    public func startMonitoring(){
        monitor.start(queue: queue)
        monitor.pathUpdateHandler = { [weak self] path in
            self?.isConnected = path.status == .satisfied
            self?.getConnectionType(path)
        }
    }
    
    /// Stop monitoring
    public func stopMonitoring(){
        monitor.cancel()
    }
    
    /// Get internet connection state type and set it to connectionType variable
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
