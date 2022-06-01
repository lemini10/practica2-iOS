//
//  ConnectionValidator.swift
//  practica2
//
//  Created by Luis Roberto Blancas Lemini on 31/05/22.
//

import Foundation
import Network

class ConnectionValidator {
  static let shared: ConnectionValidator = ConnectionValidator()
  var hasInternetCollection: Bool = false
  var connectionType: NWInterface.InterfaceType = .other
  private init() {
    validateConnection()
  }
  
  private func validateConnection() {
    let monitor = NWPathMonitor()
    monitor.pathUpdateHandler = { path in
      if path.status == .satisfied {
        self.hasInternetCollection = true
        if path.usesInterfaceType(.wifi){
          self.connectionType = .wifi
        } else if path.usesInterfaceType(.cellular) {
          self.connectionType = .cellular
        }
      } else {
        self.hasInternetCollection = false
      }
    }
    monitor.start(queue: DispatchQueue.global())
  }
}
