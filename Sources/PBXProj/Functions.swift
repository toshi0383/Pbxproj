//
//  Functions.swift
//  xcconfig-extractor
//
//  Created by Toshihiro Suzuki on 2017/04/30.
//  Copyright © 2017 Toshihiro Suzuki. All rights reserved.
//

import Foundation
import AsciiPlistParser

//func findPaths(to id: String, objects: Object) -> [String] {
//    for (k, v) in objects {
//        if let o = v as? Object, let group = Group(key: k, objects: objects) {
//            if group.children.contains(id) {
//                if let path = group.path {
//                    return findPaths(to: k.value, objects: objects) + [path]
//                } else {
//                    return findPaths(to: k.value, objects: objects)
//                }
//            }
//        }
//    }
//    return []
//}

//func decodeAsciiPlist<T: PBXObject>(_ object: Object) throws -> T {
//    return try T.decode(object)
//}
