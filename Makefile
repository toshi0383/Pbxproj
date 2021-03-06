.PHONY = update test bootstrap sourcery
SOURCERY ?= ./.build/debug/sourcery
MODULE_NAME = Pbxproj
PARAM = SWIFTPM_DEVELOPMENT=YES

test:
	$(PARAM) swift test

update:
	$(PARAM) swift package update

bootstrap:
	$(PARAM) swift build
	$(PARAM) swift package generate-xcodeproj
	# Add Tests/PbxprojTests/test.pbxproj to xcodeproj

sourcery:
	$(SOURCERY) --templates Resources/SourceryTemplates/AutoEquatables.stencil --sources Sources/$(MODULE_NAME)/ --output Sources/$(MODULE_NAME)/AutoEquatables.out.swift
	$(SOURCERY) --templates Resources/SourceryTemplates/AutoPbxSubscript.stencil --sources Sources/$(MODULE_NAME)/ --output Sources/$(MODULE_NAME)/AutoPbxSubscript.out.swift
	$(SOURCERY) --templates Resources/SourceryTemplates/LinuxMain.stencil --sources Tests/PbxprojTests/ --output Tests/LinuxMain.swift
	$(SOURCERY) --templates Resources/SourceryTemplates/AutoPbxSubscript.swifttemplate --sources Sources/$(MODULE_NAME)/ --output Sources/$(MODULE_NAME)/AutoPbxSubscript2.out.swift
