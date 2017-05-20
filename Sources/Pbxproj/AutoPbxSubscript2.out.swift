// Generated using Sourcery 0.6.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT


import AsciiPlistParser


// MARK: AnyIsaObject
extension AnyIsaObject {

}

// MARK: BuildConfiguration
extension BuildConfiguration {



















}

// MARK: BuildConfigurationList
extension BuildConfigurationList {






    public var buildConfigurations: [BuildConfiguration] {
        let ids = object.stringArray(for: "buildConfigurations")!
        return ids.map(objectTuple).map(BuildConfiguration.init)
    }

















}

// MARK: BuildFile
extension BuildFile {







}

// MARK: BuildPhase
extension BuildPhase {
















}

// MARK: FileReference
extension FileReference {































}

// MARK: Group
extension Group {






















}

// MARK: Pbxproj
extension Pbxproj {














































}

// MARK: RootObject
extension RootObject {
















































    public var targets: [Target] {
        let ids = object.stringArray(for: "targets")!
        return ids.map(objectTuple).map(Target.init)
    }











}

// MARK: Target
extension Target {










































    public var buildPhases: [BuildPhase] {
        let ids = object.stringArray(for: "buildPhases")!
        return ids.map(objectTuple).map(BuildPhase.init)
    }





}

