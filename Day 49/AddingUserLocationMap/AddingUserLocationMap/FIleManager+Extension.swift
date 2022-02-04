//
//  FIleManager+Extension.swift
//  AddingUserLocationMap
//
//  Created by Rahul on 04/02/22.
//

import Foundation

extension FileManager {
    static var documentsDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
