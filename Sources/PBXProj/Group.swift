//
//  Group.swift
//  xcconfig-extractor
//
//  Created by Toshihiro Suzuki on 2017/04/30.
//  Copyright © 2017 Toshihiro Suzuki. All rights reserved.
//

import Foundation
import AsciiPlistParser

final public class Group: IsaObject {
    public let object: Object
    public required init(object: Object) {
        self.object = object
    }
}
