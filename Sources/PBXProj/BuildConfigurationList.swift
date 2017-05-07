//
//  BuildConfigurationList.swift
//  xcconfig-extractor
//
//  Created by Toshihiro Suzuki on 2017/04/27.
//  Copyright © 2017 Toshihiro Suzuki. All rights reserved.
//

import Foundation

public class BuildConfigurationList: IsaObject {
    public var key: String
    public var rawObject: [String: Any]
    public var buildConfigurations: [BuildConfiguration]
    public var defaultConfigurationName: String?
    public var defaultConfigurationIsVisible: String
    public required init?(key: String, value o: [String: Any], objects: [String: Any]) {
        guard IsaType(object: o) == .XCConfigurationList else {
            return nil
        }
        self.key = key
        self.rawObject = o
        self.defaultConfigurationName = o["defaultConfigurationName"] as? String
        let buildConfigurationKeys = o["buildConfigurations"] as! [String]
        self.buildConfigurations = buildConfigurationKeys.map { key in (key, objects) }
            .flatMap(BuildConfiguration.init)
        self.defaultConfigurationIsVisible = o["defaultConfigurationIsVisible"] as! String
    }
}

public class BuildConfiguration: IsaObject {
    public var key: String
    public var rawObject: [String: Any]
    public var name: String
    public var baseConfigurationReference: FileReference?
    public var buildSettings: [String: Any]
    public required init?(key: String, value o: [String: Any], objects: [String: Any]) {
        guard IsaType(object: o) == .XCBuildConfiguration else {
            return nil
        }
        self.key = key
        self.rawObject = o
        self.name = o["name"] as! String
        self.baseConfigurationReference = FileReference(key: o["baseConfigurationReference"], objects: objects)
        self.buildSettings = o["buildSettings"] as! [String: Any]
    }
}
