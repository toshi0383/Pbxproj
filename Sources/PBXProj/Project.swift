import Foundation

//public class Project: AutoPbxSubscript {
//    public var key: String
//    public var rawObject: [String: Any]
//    public var attributes: [String: Any]
//    public var buildConfigurationList: BuildConfigurationList
//    public var compatibilityVersion: String
//    public var developmentRegion: String
//    public var hasScannedForEncodings: String
//    public var knownRegions: [String]
//    public var mainGroup: String // TODO
//    public var productRefGroup: String // TODO
//    public var projectDirPath: String
//    public var projectRoot: String?
//    public var targets: [NativeTarget]
//    public required init?(key: String, value o: [String: Any], objects: [String: Any]) {
//        guard IsaType(object: o) == .PBXProject else {
//            return nil
//        }
//        self.key = key
//        self.rawObject = o
//        self.attributes = o["attributes"] as! [String: Any]
//        let buildConfigurationListKey = o["buildConfigurationList"] as! String
//        self.buildConfigurationList = BuildConfigurationList(key: buildConfigurationListKey, objects: objects)!
//        self.compatibilityVersion = o["compatibilityVersion"] as! String
//        self.developmentRegion = o["developmentRegion"] as! String
//        self.hasScannedForEncodings = o["hasScannedForEncodings"] as! String
//        self.knownRegions = o["knownRegions"] as! [String]
//        self.mainGroup = o["mainGroup"] as! String
//        self.productRefGroup = o["productRefGroup"] as! String
//        self.projectDirPath = o["projectDirPath"] as! String
//        self.projectRoot = o["projectRoot"] as? String
//        self.targets = (o["targets"] as! [String]).map { k in
//            return NativeTarget(key: k, objects: objects)!
//        }
//    }
//}
