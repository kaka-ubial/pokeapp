//
//  NetworkMonitor.swift
//  poke-explorer
//
//  Created by user276492 on 6/12/25.
//


// NetworkMonitor.swift
import Network

class NetworkMonitor {
    static let shared = NetworkMonitor()

    private let monitor = NWPathMonitor()
    private let queue = DispatchQueue(label: "NetworkMonitor")
    private(set) var isConnected: Bool = true

    private init() {
        monitor.pathUpdateHandler = { path in
            self.isConnected = path.status == .satisfied
        }
        monitor.start(queue: queue)
    }
}
