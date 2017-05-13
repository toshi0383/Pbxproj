.PHONY = start-daemons
SOURCERY ?= ./.build/debug/sourcery
MODULE_NAME = PBXProj

bootstrap:
	SWIFTPM_DEVELOPMENT=YES swift build
	swift package generate-xcodeproj
	# todo: Add fixtures to xcodeproj
start-daemons:
	$(SOURCERY) --templates Resources/SourceryTemplates/AutoEquatables.stencil --sources Sources/$(MODULE_NAME)/ --output Sources/$(MODULE_NAME)/AutoEquatables.out.swift
	$(SOURCERY) --templates Resources/SourceryTemplates/AutoPbxSubscript.stencil --sources Sources/$(MODULE_NAME)/ --output Sources/$(MODULE_NAME)/AutoPbxSubscript.out.swift
	$(SOURCERY) --templates Resources/SourceryTemplates/AutoPbxSubscript.swifttemplate --sources Sources/$(MODULE_NAME)/ --output Sources/$(MODULE_NAME)/AutoPbxSubscript2.out.swift
	$(SOURCERY) --templates Resources/SourceryTemplates/LinuxMain.stencil --sources Tests/PbxprojTests/ --output Tests/LinuxMain.swift --watch
