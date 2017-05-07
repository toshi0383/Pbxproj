//
//  Group.swift
//  xcconfig-extractor
//
//  Created by Toshihiro Suzuki on 2017/04/30.
//  Copyright © 2017 Toshihiro Suzuki. All rights reserved.
//

import Foundation

public class Group: IsaObject {
    public var rawObject: [String : Any]
    public var key: String
    public var children: [String]
    public var path: String?
    public var name: String?
    public required init?(key: String, value o: [String : Any], objects: [String : Any]) {
        guard IsaType(object: o) == .PBXGroup else {
            return nil
        }
        self.key = key
        self.rawObject = o
        self.children = o["children"] as! [String]
        self.path = o["path"] as? String
        self.name = o["name"] as? String
    }
}
