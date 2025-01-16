//
//  ChainControllerPassiveBarrierComposer.swift
//  Internal
//
//  Created by wx on 1/18/19.
//  Copyright © 2019 wx. All rights reserved.
//

import Foundation

@MainActor
protocol ChainControllerDelegate: AnyObject {
    func controller(_ controller: ChainController, didSuccess object: Any?)
    func controller(_ controller: ChainController, didFail error: Error?)
}

@MainActor
class ChainController: NSObject {
    weak var delegate: ChainControllerDelegate?
    
    var nextController: ChainController?
    
    func perform(object: Any? = nil) {
        self.nextController?.perform(object: object)
    }
    
    func notifyAboutSuccess(object: Any? = nil) {
        self.delegate?.controller(self, didSuccess: object)
    }

    func notifyAboutFail(error: Error? = nil) {
        self.delegate?.controller(self, didFail: error)
    }
}
