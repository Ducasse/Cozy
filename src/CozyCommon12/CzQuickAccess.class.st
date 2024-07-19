"
I'm adding a menu to the menubar and world menu called Cozy (check my class method worldMenuOn:).

The method protocols such as 'scripts-some' define the submenu for example 	
	 self buildSubmenu: #Convenience on: aBuilder 
will create a submenu with all the methods tagged with name: as menu entries. 

"
Class {
	#name : 'CzQuickAccess',
	#superclass : 'CozyRoot',
	#classVars : [
		'RefreshingIsActive',
		'UniqueInstance'
	],
	#category : 'CozyCommon12',
	#package : 'CozyCommon12'
}

{ #category : 'rebuilding' }
CzQuickAccess class >> activate [ 
	RefreshingIsActive := true
]

{ #category : 'scripts-some' }
CzQuickAccess class >> browseIcons [
	<cozyScript: #'Browse icons'>
	Smalltalk ui icons inspect
]

{ #category : 'world menu' }
CzQuickAccess class >> buildMenuAddToIcebergOn: aBuilder [ 
	self createAddToIcebergSubmenusFrom: self sharedRepositoryFolder on: aBuilder
]

{ #category : 'world menu' }
CzQuickAccess class >> buildMenuRenameSelectBackgroundOn: aBuilder [
	(self backgroundFolder allFiles sorted: #basename ascending)
		do: [ :background | 
			(aBuilder item: background basename asSymbol)
				action: [ PolymorphSystemSettings desktopImageFileName: background fullName ];
				iconName: #scriptManager ]
]

{ #category : 'world menu' }
CzQuickAccess class >> buildMenuRenameSubmenu: protocolName on: aBuilder [
	
	(self methodsIn: protocolName asLowercase)
		do: [ :method | 
			(aBuilder item: ((method pragmaAt: #'cozyScript:') ifNotNil: [:each | each argumentAt: 1]))
				parent: protocolName;
				action: [ self execute: method selector ];
				iconName: #scriptManager ]
]

{ #category : 'world menu' }
CzQuickAccess class >> buildSubMenuBasedOnProtocol: protocolName withBuilder: aBuilder [
	 
	(self methodsIn: protocolName asLowercase)
		do: [ :method | 
			(aBuilder item: ((method pragmaAt: #'cozyScript:') ifNotNil: [:each | each argumentAt: 1]))
				parent: protocolName;
				action: [ self execute: method selector ];
				iconName: #scriptManager ]
]

{ #category : 'world menu' }
CzQuickAccess class >> buildSubMenuBasedOnProtocol: protocolName withBuilder: aBuilder forParent: parent [
	 
	(self methodsIn: protocolName asLowercase)
		do: [ :method | 
			(aBuilder item: ((method pragmaAt: #'cozyScript:') ifNotNil: [:each | each argumentAt: 1]))
				parent: parent;
				action: [ self execute: method selector ];
				iconName: #scriptManager ]
]

{ #category : 'world menu' }
CzQuickAccess class >> createAddToIcebergSubmenusFrom: aFolder on: aBuilder [
	self
		recursivelyCreateCommandForRepositoriesFrom: aFolder
		action: [ :dir | 
			(IceRepositoryCreator new
				location: dir;
				createRepository) register.
				self focusIceberg ]
		prefix: ' '
		on: aBuilder
]

{ #category : 'rebuilding' }
CzQuickAccess class >> desactivate [ 
	RefreshingIsActive := false
]

{ #category : 'accessing' }
CzQuickAccess class >> execute: aSelector [
	
	self instance perform: aSelector.
	self inform: 'Executed with success: ' , aSelector
	
]

{ #category : 'accessing' }
CzQuickAccess class >> executeBlock: aBlock [
	[ aBlock value.
	self inform: 'Executed with success' ]
		on: Error
		do: [ :ex | 
			self
				inform:
					'Error during execution.
' , ex asString ]
]

{ #category : 'world menu' }
CzQuickAccess class >> focusIceberg [
	"This method will look for an open tip repository browser open (This is the entry point of Iceberg). If one is open, bring it to front. Else, open one."
	
	(self currentWorld windowsSatisfying: [ :window | window label = 'Repositories' ])
		ifEmpty: [ [ IceTipRepositoriesBrowser new open ]
				on: Error
				do: [ self inform: 'Opening Iceberg only works in Pharo >= 7' ] ]
		ifNotEmpty: [ :repos | 
			| window |
			window := repos first.
			window isMinimized 
				ifTrue: [ window restore ] 
				ifFalse: [ window activate ] ]
]

{ #category : 'class initialization' }
CzQuickAccess class >> initialize [ 
	self install.
	MenubarMorph reset 
	
]

{ #category : 'class initialization' }
CzQuickAccess class >> install [
	"Unsubscribe to subscribe only once"
	SystemAnnouncer uniqueInstance unsubscribe: self.
	SystemAnnouncer uniqueInstance weak
		when: MethodAnnouncement
		send: #methodAnnouncementReceived: to: self.
]

{ #category : 'accessing' }
CzQuickAccess class >> instance [
	^ UniqueInstance ifNil: [ UniqueInstance := self new ]
]

{ #category : 'rebuilding' }
CzQuickAccess class >> isRefreshingActive [
	
	RefreshingIsActive ifNil: [ self activate ].
	^ RefreshingIsActive
]

{ #category : 'rebuilding' }
CzQuickAccess class >> methodAnnouncementReceived: anAnnouncement [
	
	self isRefreshingActive ifFalse: [ ^ self ].

	({self . self class} 
		anySatisfy: [ :class | anAnnouncement methodAffected methodClass = class ]) ifTrue: [ MenubarMorph reset ]
]

{ #category : 'accessing' }
CzQuickAccess class >> methodsIn: aProtocol [
	^ (self methods select: [ :method | method protocol name = aProtocol ]) sort: #selector ascending
]

{ #category : 'world menu' }
CzQuickAccess class >> recursivelyCreateCommandForRepositoriesFrom: aFolder action: action prefix: aString on: aBuilder [
	
	(aFolder directories sort: [ :a :b | a basename asLowercase < b basename asLowercase ])
		do: [ :dir | 
			(dir directories anySatisfy: [ :e | e basename = '.git' ])
				ifTrue: [ (aBuilder item: (aString , dir basename) asSymbol)
						action: [ self executeBlock: [ action cull: dir ] ];
						iconName: #smallDoIt ]
				ifFalse: [ (aBuilder item: (aString , dir basename) asSymbol)
						iconName: #configNew;
						with: [ self
								recursivelyCreateCommandForRepositoriesFrom: dir
								action: action
								prefix: aString
								on: aBuilder ] ] ]
]

{ #category : 'world menu' }
CzQuickAccess class >> worldMenuOn: aBuilder [
	<worldMenu>

	(aBuilder item: #Scripts)
		label: 'Cozy';
		order: 100.0;
		iconName: #changeUpdate. 

	
		
	(aBuilder item: #'CozyTheme') 
		"pay attention the item name should be the one of the category."
		parent: #Scripts;
		label: 'Cozy Theme';
		order: 5; 
		iconName: #scriptManager;
		with: [ self buildSubMenuBasedOnProtocol: #cozy withBuilder: aBuilder forParent: #'CozyTheme'].	
	
	(aBuilder item: #scriptsMine)
		parent: #Scripts;
		label: 'My lovely scripts';
		order: 5;
		iconName: #scriptManager;
		with: [ self buildSubMenuBasedOnProtocol: #'scripts-mine' withBuilder: aBuilder forParent: #scriptsMine ].
		
		
	(aBuilder item: #'calypso')
		parent: #Scripts;
		label: 'Calypso';
		order: 5;
		iconName: #scriptManager;
		with: [ self buildSubMenuBasedOnProtocol: #calypso withBuilder: aBuilder forParent: #'calypso'].
		
	(aBuilder item: #'scripts-some')
		label: 'Some lovely scripts';
	 	parent: #Scripts;
		order: 5;
		iconName: #configNew;
		with: [ self buildSubMenuBasedOnProtocol: #'scripts-some' withBuilder: aBuilder forParent: #'scripts-some'].
		 
	(aBuilder item: #CodeSnippets)
		parent: #Scripts;
		order: 10;
		iconName: #configNew;
		with: [ self buildSubMenuBasedOnProtocol: #'code snippets' withBuilder: aBuilder forParent: #CodeSnippets].

	(aBuilder item: #BrowseCozy)
		parent: #Scripts;
		order: 20;
		iconName: #configNew;
		with: [ self buildSubMenuBasedOnProtocol: #browse withBuilder: aBuilder forParent: #BrowseCozy].
	

	(aBuilder item: #'Local Iceberg Projects')
		parent: #Scripts;
		order: 1;
		iconName: #configNew;
		with: [ self buildMenuAddToIcebergOn: aBuilder ].
]

{ #category : 'code snippets' }
CzQuickAccess >> baselineTemplate [
	<cozyScript: #'BaselineTemplate'>

	self inWorkspace: 
			'baseline: spec
	<baseline>
	spec
		baseline: ''ContainersPropertyEnvironment''
		with: [ spec repository: ''github://Ducasse/Containers-PropertyEnvironment:v1.0.0'' ].
	spec
		for: #pharo
		do: [ 
			spec
				package: ''Chrysal-Runtime'' with: [ spec requires: #(''ContainersPropertyEnvironment'') ].
			spec
				package: ''Chrysal-Tests''
				with: [ spec requires: #(''Chrysal-Runtime'' ''Chrysal'') ].
			spec
				package: ''Chrysal''
				with: [ spec requires: #(''Chrysal-Runtime'') ] ]'
]

{ #category : 'browse' }
CzQuickAccess >> browseCommonSettings [
	<cozyScript: #'Pharo common settings'>
	
	CzSettingExecutor class browse
]

{ #category : 'scripts-some' }
CzQuickAccess >> browseIcons [
	<cozyScript: #'Browse icons'>
	Smalltalk ui icons inspect
]

{ #category : 'browse' }
CzQuickAccess >> browseQuickAccess [
	<cozyScript: #QuickAccess>
	
	self class browse
]

{ #category : 'calypso' }
CzQuickAccess >> calypsoCheckingChanges [
	"Take care the methods are named like that since the selectors are used to sort the menuitem"
	<cozyScript: #'Calypso reacting to changes'>
	
	ClyNavigationEnvironment reset.
	ClyNavigationEnvironment currentImage queryCache do: #forceRebuild.
	ClyNavigationEnvironment currentImage attachToSystem.

]

{ #category : 'calypso' }
CzQuickAccess >> calypsoCheckingNoChanges [
	"Take care the methods are named like that since the selectors are used to sort the menuitem"
	
	<cozyScript: #'Calypso not reacting to changes'>

	ClyNavigationEnvironment reset.
	ClyNavigationEnvironment currentImage detachFromSystem.

]

{ #category : 'calypso' }
CzQuickAccess >> calypsoCriticDisable [
	"Take care the methods are named like that since the selectors are used to sort the menuitem"
	
	<cozyScript: #'Disable Calypso critics'>

	ClyCriticBrowserPlugin disable
]

{ #category : 'calypso' }
CzQuickAccess >> calypsoCriticEnable [
	"Take care the methods are named like that since the selectors are used to sort the menuitem"
	
	<cozyScript: #'Enable Calypso critics'>

	ClyCriticBrowserPlugin enable
]

{ #category : 'code snippets' }
CzQuickAccess >> coolCommands [
	<cozyScript: #'Git commands'>

	self inWorkspace: 
			'''Remove merged branches except master and dev:''.

	''git branch --merged | egrep -v "(^\*|master|dev)" | xargs git branch -d''.

''Create first draft of changelog:''.

	''git log --pretty="* %s ([%h](https://github.com/pharo-spec/Spec/commit/%H))" 8208767590371c5ce4e6938f0f79d6cea601fca8...HEAD --grep="Merge "''.
	
	(''Content'' copyWithRegex: ''Merge pull request #[0-9]+ from [^/]+/[0-9]*'' matchesReplacedWith: '' '') copyReplaceAll: ''-'' with: '' ''.
	'
]

{ #category : 'code snippets' }
CzQuickAccess >> dependencies [
	<cozyScript: #'Find who depend on me'>
	self inWorkspace:
'
| report | 
report := DADependencyChecker new computeImageDependencies.
report knownDependantsOf: ''Glamour-Examples''
'
]

{ #category : 'scripts-some' }
CzQuickAccess >> gc [
	<cozyScript: #'Garbage collect'>
	
	5 timesRepeat: [ Smalltalk garbageCollect ]
]

{ #category : 'scripts-some' }
CzQuickAccess >> generateSimpleBaseline [
	<cozyScript: #'Generate simple baseline'>
	(UIManager default request: 'Name of the project')
		ifNotNil: [ :name | 
			| baselineName class |
			baselineName := 'BaselineOf' , name capitalized.
			class := BaselineOf
				subclass: baselineName asSymbol
				slots: {}
				classVariables: {}
				package: baselineName.

			class comment: 'I am a baseline to define the structure and dependencies of the ' , name , ' project.'.

			class
				compile:
					('baseline: spec
	<baseline>
	spec
		for: #common
		do: [
			"Dependencies"
			self materialDesignLite: spec.

			"Packages"
			spec
				package: ''{1}'';
				package: ''{1}-Tests'' with: [ spec requires: #(''{1}'') ].

			"Groups"
			spec
				group: ''Core'' with: #(''{1}'');
				group: ''Tests'' with: #(''{1}'') ].' format: {name})
				classified: 'baseline'.

			class
				compile:
					'materialDesignLite: spec
	spec
		baseline: ''MaterialDesignLite'' with: [ spec repository: ''github://DuneSt/MaterialDesignLite:v2.x.x/src'' ]'
				classified: 'dependencies'.

			class
				compile:
					'projectClass
	^ MetacelloCypressBaselineProject'
				classified: 'accessing'.

			class browse ]
]

{ #category : 'scripts-mine' }
CzQuickAccess >> iceberg [
	<cozyScript: #'Iceberg focus'>

	self class focusIceberg
]

{ #category : 'scripts-mine' }
CzQuickAccess >> installBloc [
	<cozyScript: #'Install Bloc DEV'>
	
	[ Metacello new
	baseline: 'Bloc';
	repository: 'github://pharo-graphics/Bloc:dev-1.0/src';
	onConflictUseIncoming;
	ignoreImage;
	load ]
		on: MCMergeOrLoadWarning
		do: [ :warning | warning load ]

	
]

{ #category : 'scripts-mine' }
CzQuickAccess >> installMicrodownDevPillar [
	<cozyScript: #'Install Microdown DEV (pillar)'>
	
	Metacello new
		baseline: 'Microdown';
		repository: 'github://Pillar-markup/Microdown:dev/src';
		onConflict: [ :e | e useIncoming ];
		onUpgrade: [ :e | e useIncoming ];
		ignoreImage;
		load.

	
]

{ #category : 'scripts-mine' }
CzQuickAccess >> installPillar [
	<cozyScript: #'Install Pillar'>
	
	Metacello new
		baseline: 'Pillar';
		repository: 'github://pillar-markup/pillar:dev/src';
		onConflict: [ :e | e useIncoming ];
		onUpgrade: [ :e | e useIncoming ];
		ignoreImage;
		load.

	
]

{ #category : 'code snippets' }
CzQuickAccess >> installSample [
	<cozyScript: #'Install Sample'>
	
	self inWorkspace: 'Metacello new
		baseline: #WebPokedex;
		githubUser: ''jecisc''
			project: ''WebPokedex''
			commitish: ''development''
			path: ''src'';
		onWarningLog;
		load.'
]

{ #category : 'scripts-mine' }
CzQuickAccess >> installUniter [
	<cozyScript: #'Install Uniter'>
	
	Metacello new
		baseline: 'Uniter';
		repository: 'github://Ducasse/Uniter';
		onConflictUseIncoming;
		ignoreImage;
		load
]

{ #category : 'scripts-some' }
CzQuickAccess >> logAllUnusedVariables [
	<cozyScript: #'Log all unused variables'>
	
	Transcript clear; open.
	Object
		allSubclassesDo: [ :class | 
			class instVarNames
				do: [ :each | (class whichSelectorsAccess: each) size = 0 ifTrue: [ Transcript crTrace: 'Class: ' , class printString , ' var: ' , each ] ] ]
]

{ #category : 'code snippets' }
CzQuickAccess >> myDependencies [
	<cozyScript: #'Find my dependencies'>
	self inWorkspace:
'
|report |
report := DADependencyChecker new computeImageDependencies.
report dependenciesOf: ''Glamour-Examples''
'
]

{ #category : 'scripts-some' }
CzQuickAccess >> openCommonTools [
	<cozyScript: #'Open common tools'>
	
	| group |
	group := GroupWindowMorph new
		addWindow: Transcript open;
		addWindow: DrTests open.
	"group tabGroup selectedPageIndex: 1."
	(group openInWindowLabeled: 'Common Tools') expandBoxHit
]

{ #category : 'old' }
CzQuickAccess >> prepareForContribution [
	"<cozyScript: #'Prepare Pharo contribution'>"

	CzIcePick new prepareContributionToPharoForUnsynchronizedRepositories.
]

{ #category : 'code snippets' }
CzQuickAccess >> profileTests [
	<cozyScript: #'Profile tests'>
	self inWorkspace: 
			'packageSelectionBlock := [ :e | e name beginsWith: ''Traits'' ].
testSuite := TestSuite new.
	
((RPackageOrganizer default packages select: packageSelectionBlock) flatCollect: #classes) select: [ :e | e inheritsFrom: TestCase ] thenDo: [ :e | e addToSuiteFromSelectors: testSuite ].

[ testSuite run ] spy'
]

{ #category : 'scripts-some' }
CzQuickAccess >> randomBackground [
	<cozyScript: #'Set random background'>

	CzSettingExecutor setRandomBackground
]

{ #category : 'scripts-mine' }
CzQuickAccess >> removeCleanlyMDAndBC [

	<cozyScript: #'Flush MD and BC'>
	#( 'Microdown' 'BeautifulComments' 'DocumentBrowser' ) do: [ :name |
		(IceRepository repositoryNamed: name)
			ifNil: [ self inform: 'Project not found: ' , name ]
			ifNotNil: [ :found |
				found
					unload;
					forget ] ]
]

{ #category : 'code snippets' }
CzQuickAccess >> rewritePatterns [
	<cozyScript: #'Rewrite patterns'>
	self inWorkspace:
			'r := RBParseTreeRewriter new.
r replace: ''`@receiver assert: `@arg = `@arg2'' with: ''`@receiver assert: `@arg equals: `@arg2''.
r replace: ''`@receiver deny: `@arg = `@arg2'' with: ''`@receiver deny: `@arg equals: `@arg2''.


classes := TestCase allSubclasses select: [ :e | e package name first = $c ].

classes do: [ :class | 
	
	class localMethods select: [ :m | m selector beginsWith: ''test'' ] thenDo: [ :m |
		n := m parseTree.
		(r executeTree: n) ifTrue: [ class compile: n formattedCode].
		 ]
	 ]
	displayingProgress: [ :c | c printString ]'
]

{ #category : 'scripts-some' }
CzQuickAccess >> screenshot [
	<cozyScript: #Screenshot>
	
	Form fromUser asMorph openInWindow
]

{ #category : 'scripts-some' }
CzQuickAccess >> setMonticelloCredentials [
	<cozyScript: #'Set Monticello credentials'>
	
	CzSettingExecutor setMonticelloCredentials
]

{ #category : 'code snippets' }
CzQuickAccess >> stonFile [
	<cozyScript: #'Variable usage'>
	self inWorkspace: 'SmalltalkCISpec {
  #loading : [
    SCIMetacelloLoadSpec {
      #baseline : ''ContainersArray2D'',
      #directory : ''src'',
      #platforms : [ #pharo ]
    }
  ],
  #testing : {
    #coverage : {
      #packages : [ ''Containers-Array2D'' ]
    }
  }
}'
]

{ #category : 'scripts-some' }
CzQuickAccess >> toggleDeprecation [
	<cozyScript: #'Toggle deprecations'>
	
	Deprecation raiseWarning: Deprecation raiseWarning not
]

{ #category : 'scripts-some' }
CzQuickAccess >> toggleTheme [
	<cozyScript: #'Toggle theme'>

	| light dark |
	dark := CozyRoot darkThemeClass.
	light := CozyRoot lightThemeClass.

	(dark isCurrent ifTrue: [ light ] ifFalse: [ dark ]) beCurrent.

	CzSettingExecutor setFastDragging
]

{ #category : 'cozy' }
CzQuickAccess >> toggleToCherry [
	<cozyScript: #'Use Cherry-On-A-Tree'>

	CzCherryOnTreeTheme beCurrent.
	CzSettingExecutor setFastDragging
]

{ #category : 'cozy' }
CzQuickAccess >> toggleToDayAtTheBeach [
	<cozyScript: #'Use Day-at-the-Beach'>

	CzDayAtTheBeachTheme2 beCurrent.
	CzSettingExecutor setFastDragging
]

{ #category : 'cozy' }
CzQuickAccess >> toggleToSandy [
	<cozyScript: #'Use Sandy'>

	CzSandyTheme beCurrent.
	CzSettingExecutor setFastDragging
]

{ #category : 'cozy' }
CzQuickAccess >> toggleToWhiteGhost [
	<cozyScript: #'Use White Ghost'>

	CzWhiteGhostTheme beCurrent.
	CzSettingExecutor setFastDragging
]

{ #category : 'code snippets' }
CzQuickAccess >> variableUsage [
	<cozyScript: #'Variable usage'>
	self inWorkspace: '
| origin variables |
	
origin := SpPresenter.
variables := origin instVarNames.

variables
	inject: Dictionary new
	into: [ :dict :var | 
		dict
			at: var put: ((origin slots detect: [ :e | e name = var ]) usingMethods collect: #methodClass as: Set);
			yourself ]'
]
