//
//  Functions.swift
//  xcconfig-extractor
//
//  Created by Toshihiro Suzuki on 2017/04/30.
//  Copyright © 2017 Toshihiro Suzuki. All rights reserved.
//

import Foundation
import AsciiPlistParser
import RandomKit

func findPaths(to fileref: FileReference, objects: Object) -> [String] {
    let id = objects.filter { ($1 as? Object) == fileref.object }.map { $0.0.value }[0]
    return _findPaths(to: id, objects: objects)
}
func _findPaths(to id: String, objects: Object) -> [String] {
    for (k, v) in objects {
        if let o = v as? Object, let isa = o.isa, isa == .PBXGroup {
            let group = Group(object: o, objects: objects)
            if group.children.map({ $0.value }).contains(id) {
                if let path = group.path {
                    return _findPaths(to: k.value, objects: objects) + [path]
                } else {
                    return _findPaths(to: k.value, objects: objects)
                }
            }
        }
    }
    return []
}

extension Array {
    func take(_ length: Int) -> Array {
        if count <= length {
            return self
        } else {
            return self[0..<length].map { $0 }
        }
    }
}

func generateNewId() -> String {
    return UUID().uuidString.characters.map { String($0) } .filter { $0 != "-" }.take(24).joined()
}
