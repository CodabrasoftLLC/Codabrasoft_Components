//
//  ChainController+NotifyInMain.swift
//  sberservice
//
//  Created by User on 9/11/19.
//  Copyright © 2019 sberbank. All rights reserved.
//

import Foundation

extension ChainController {
    func notifyAboutSuccessInMain(object: Any?) {
        let safeObject = (object as? NSCopying)?.copy() ?? object
        DispatchQueue.main.async {
            self.notifyAboutSuccess(object: safeObject)
        }
    }
    
    func notifyAboutFailInMain(error: Error?) {
        DispatchQueue.main.async {
            self.notifyAboutFail(error: error)
        }
    }
}
