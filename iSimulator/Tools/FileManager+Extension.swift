//
//  FileManager+Extension.swift
//  iSimulator
//
//  Created by Nazar Lisovyi on 04.03.2020.
//  Copyright © 2020 niels.jin. All rights reserved.
//

import Foundation

extension FileManager {
    func searchFile(with name: String, inFolder url: URL) -> URL? {
        if let paths = try? FileManager.default.contentsOfDirectory(at: url, includingPropertiesForKeys: nil, options: []) {
            for path in paths {
                if path.lastPathComponent == name {
                    return path
                }
                if let result = searchFile(with: name, inFolder: path) {
                    return result
                } else {
                    continue
                }
            }
        }
        return nil
    }
}
