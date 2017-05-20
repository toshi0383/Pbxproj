// Generated using Sourcery 0.6.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT


import XCTest
extension FilesAndGroupsTests {
  static var allTests: [(String, (FilesAndGroupsTests) -> () throws -> Void)] = [
    ("testFileReference", testFileReference),
    ("testAddAFile", testAddAFile),
    ("testAddAFolderAsGroup", testAddAFolderAsGroup),
  ]
}
extension PbxprojTests {
  static var allTests: [(String, (PbxprojTests) -> () throws -> Void)] = [
    ("testPbxproj", testPbxproj),
    ("testModification", testModification),
    ("testBuildSettings", testBuildSettings),
  ]
}

XCTMain([
  testCase(FilesAndGroupsTests.allTests),
  testCase(PbxprojTests.allTests),
])

