// Generated using Sourcery 0.6.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT


import XCTest
extension FileReferenceTests {
  static var allTests: [(String, (FileReferenceTests) -> () throws -> Void)] = [
    ("testFileReference", testFileReference),
    ("testAddFileReference", testAddFileReference),
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
  testCase(FileReferenceTests.allTests),
  testCase(PbxprojTests.allTests),
])

