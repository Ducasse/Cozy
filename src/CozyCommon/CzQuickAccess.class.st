"
I'm adding a menu to the menubar and world menu called Scripts (check my method worldMenuOn:).

The method protocols defines the submenu for example 	
	 self buildSubmenu: #Convenience on: aBuilder 
will create a submenu with all the methods tagged with name: as menu entries. 

"
Class {
	#name : #CzQuickAccess,
	#superclass : #CozyRoot,
	#classVars : [
		'UniqueInstance'
	],
	#category : #CozyCommon
}

{ #category : #'world menu' }
CzQuickAccess class >> buildMenuAddToIcebergOn: aBuilder [ 
	self createAddToIcebergSubmenusFrom: self sharedRepositoryFolder on: aBuilder
]

{ #category : #'world menu' }
CzQuickAccess class >> buildMenuRenameSelectBackgroundOn: aBuilder [
	(self backgroundFolder allFiles sorted: #basename ascending)
		do: [ :background | 
			(aBuilder item: background basename asSymbol)
				action: [ PolymorphSystemSettings desktopImageFileName: background fullName ];
				iconName: #scriptManager ]
]

{ #category : #'world menu' }
CzQuickAccess class >> buildMenuRenameSubmenu: protocolName on: aBuilder [
	
	(self methodsIn: protocolName asLowercase)
		do: [ :method | 
			(aBuilder item: ((method pragmaAt: #name:) argumentAt: 1))
				parent: protocolName;
				action: [ self execute: method selector ];
				iconName: #scriptManager ]
]

{ #category : #'world menu' }
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

{ #category : #accessing }
CzQuickAccess class >> execute: aSelector [
	
	[ self instance perform: aSelector.
	self inform: 'Executed with success: ' , aSelector ]
		on: Error
		do: [ :ex | 
			self
				inform:
					'Error during execution.
' , ex asString ]
]

{ #category : #accessing }
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

{ #category : #'world menu' }
CzQuickAccess class >> focusIceberg [
	"This method will look for an open tip repository browser open (This is the entry point of Iceberg). If one is open, bring it to front. Else, open one."

	(self currentWorld windowsSatisfying: [ :window | window label = 'Repositories' ])
		ifEmpty: [ [ IceTipRepositoriesBrowser new openWithSpec ]
				on: Error
				do: [ self inform: 'Opening Iceberg only works in Pharo >= 7' ] ]
		ifNotEmpty: [ :repos | 
			| window |
			window := repos first.
			window isMinimized 
				ifTrue: [ window restore ] 
				ifFalse: [ window activate ] ]
]

{ #category : #'class initialization' }
CzQuickAccess class >> initialize [ 
	self install.
	MenubarMorph reset 
	
]

{ #category : #'class initialization' }
CzQuickAccess class >> install [
	"Unsubscribe to subscribe only once"
	SystemAnnouncer uniqueInstance unsubscribe: self.
	SystemAnnouncer uniqueInstance weak
		when: MethodAnnouncement
		send: #methodAnnouncementReceived: to: self.
]

{ #category : #accessing }
CzQuickAccess class >> instance [
	^ UniqueInstance ifNil: [ UniqueInstance := self new ]
]

{ #category : #rebuilding }
CzQuickAccess class >> methodAnnouncementReceived: anAnnouncement [
	"No need to rebuild if it contains the world menu pragma"

	({self . self class} 
		anySatisfy: [ :class | anAnnouncement methodAffected methodClass = class ]) 
							ifTrue: [ MenubarMorph reset ]
]

{ #category : #accessing }
CzQuickAccess class >> methodsIn: aProtocol [
	^ (self methods select: [ :method | method protocol = aProtocol ]) sort: #selector ascending
]

{ #category : #'world menu' }
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

{ #category : #'world menu' }
CzQuickAccess class >> worldMenuOn: aBuilder [
	<worldMenu>

	(aBuilder item: #Scripts)
		order: 6.0;
		iconName: #changeUpdate.

	(aBuilder item: #'Add projects to Iceberg')
		parent: #Scripts;
		order: 1;
		iconName: #configNew;
		with: [ self buildMenuAddToIcebergOn: aBuilder ].

	(aBuilder item: #'scripts-mine')
		label: 'My lovely scripts';
		parent: #Scripts;
		order: 5;
		iconName: #configNew;
		with: [ self buildMenuRenameSubmenu: #'scripts-mine' on: aBuilder ].
	
		(aBuilder item: #'scripts-some')
		label: 'Some lovely scripts';
		parent: #Scripts;
		order: 5;
		iconName: #configNew;
		with: [ self buildMenuRenameSubmenu: #'scripts-some' on: aBuilder ].
		
	(aBuilder item: #Templates)
		parent: #Scripts;
		order: 10;
		iconName: #configNew;
		with: [ self buildMenuRenameSubmenu: #Templates on: aBuilder ].

	(aBuilder item: #Loading)
		parent: #Scripts;
		order: 5; 
		iconName: #configNew;
		with: [ self buildMenuRenameSubmenu: #Loading on: aBuilder ].

	(aBuilder item: #Browse)
		parent: #Scripts;
		order: 20;
		iconName: #configNew;
		with: [ self buildMenuRenameSubmenu: #Browse on: aBuilder ].

	self backgroundFolder exists 
		ifTrue: [ 
			(aBuilder item: #'Select background')
				parent: #'scripts-mine';
				order: 1;
				iconName: #configNew;
				with: [ self buildMenuRenameSelectBackgroundOn: aBuilder ] ]

]

{ #category : #codax }
CzQuickAccess >> addImportFromMSE [
	<name: #'Compile #importFromMSE'>
	(self class environment at: #MooseModel)
		compile:
			'importFromMSE
| stream |
stream := UITheme builder fileOpen: ''Import model from MSE file'' extensions: #(''mse'').
stream
ifNotNil: [ 
self name: (stream localName copyUpToLast: Path extensionDelimiter).	"name without extension"
self importFromMSEStream: stream.
stream close ]'
]

{ #category : #browse }
CzQuickAccess >> browseCommonSettings [
	<name: #'Pharo common settings'>
	CzCommonSettings class browse
]

{ #category : #browse }
CzQuickAccess >> browseCommonSettings8 [
	<name: #'Pharo common settings 8'>
	self class environment at: #CzPharo8Settings ifPresent: [ :class | class class browse ]
]

{ #category : #'scripts-some' }
CzQuickAccess >> browseIcons [
	<name: #'Browse icons'>
	Smalltalk ui icons inspect
]

{ #category : #browse }
CzQuickAccess >> browseQuickAccess [
	<name: #QuickAccess>
	self class browse
]

{ #category : #templates }
CzQuickAccess >> coolCommands [
	<name: #'Git commands'>

	GTPlayground
		openContents:
			'''Remove merged branches except master and dev:''.

	''git branch --merged | egrep -v "(^\*|master|dev)" | xargs git branch -d''.

''Create first draft of changelog:''.

	''git log --pretty="* %s ([%h](https://github.com/pharo-spec/Spec/commit/%H))" 8208767590371c5ce4e6938f0f79d6cea601fca8...HEAD --grep="Merge "''.
	
	(''Content'' copyWithRegex: ''Merge pull request #[0-9]+ from [^/]+/[0-9]*'' matchesReplacedWith: '' '') copyReplaceAll: ''-'' with: '' ''.
	'
]

{ #category : #codax }
CzQuickAccess >> cppDupDet [
	<name: #'CPP script duplication detection'>
	| model |
	model := (self class environment at: #CPPModel) allInstances last.

	model clearDuplicationSystem.
	MessageTally
		spyOn: [ model
				dupSys:
					((self class environment at: #DPDetector)
						createDupSysFromParameters:
							((self class environment at: #DPParameters) new
								selectedPrograms: model entitiesForDupDetection;
								frequency: 2;
								minNumberOfLines: 100;
								minNumberOfCharacters: 80;
								cleaner: (self class environment at: #DPCPPCleaner) new)) ]
]

{ #category : #codax }
CzQuickAccess >> cppDupDetInPlayground [
	<name: #'CPP script duplication detection in playground'>
	GTPlayground openContents: 'model := CPPModel allInstances last.

model clearDuplicationSystem.
MessageTally spyOn: [model dupSys: (DPDetector createDupSysFromParameters:(DPParameters new
				selectedPrograms: model entitiesForDupDetection;
				frequency: 2;
				minNumberOfLines: 100;
				minNumberOfCharacters: 80;
				cleaner: DPCPPCleaner new)).]'
]

{ #category : #'seaside scripts' }
CzQuickAccess >> debuggerInImage [
	<name: #'Enable in image debugger'>
	self class environment
		at: #WAApplication
		ifPresent: [ :class | class allInstancesDo: [ :app | app exceptionHandler: (Smalltalk at: #WADebugErrorHandler) ] ]
		ifAbsent: [ self error: 'Seaside dev not loaded' ]
]

{ #category : #templates }
CzQuickAccess >> dependencies [
	<name: #'Find dependencies'>
	GTPlayground
		openContents:
			'report := DADependencyChecker new computeImageDependencies.
report knownDependantsOf: ''Glamour-Examples'''
]

{ #category : #codax }
CzQuickAccess >> flushAll [
	<name: #'Flush all'>
	(self class environment at: #MooseEntity) allSubInstances
		do: [ :entity | entity privateState flush ]
		displayingProgress: [ :entity | 'Cleaning cache of ' , entity mooseName ]
]

{ #category : #codax }
CzQuickAccess >> flushGroups [
	<name: #'Flush groups'>
	(self class environment at: #MooseEntity) allSubInstances
		do: [ :entity | entity privateState flushGroups ]
		displayingProgress: [ :entity | 'Cleaning cache of ' , entity mooseName ]
]

{ #category : #codax }
CzQuickAccess >> flushProperties [
	<name: #'Flush properties'>
	(self class environment at: #MooseEntity) allSubInstances
		do: [ :entity | entity privateState flushProperties ]
		displayingProgress: [ :entity | 'Cleaning cache of ' , entity mooseName ]
]

{ #category : #'scripts-some' }
CzQuickAccess >> gc [
	<name: #'Garbage collect'>
	5 timesRepeat: [ Smalltalk garbageCollect ]
]

{ #category : #'scripts-some' }
CzQuickAccess >> generateSimpleBaseline [
	<name: #'Generate simple baseline'>
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

{ #category : #loading }
CzQuickAccess >> installSample [
	<name: #'Install Sample'>
	Metacello new
		baseline: #WebPokedex;
		githubUser: 'jecisc'
			project: 'WebPokedex'
			commitish: 'development'
			path: 'src';
		onWarningLog;
		load.
]

{ #category : #'scripts-some' }
CzQuickAccess >> logAllUnusedVariables [
	<name: #'Log all unused variables'>
	Transcript clear; open.
	Object
		allSubclassesDo: [ :class | 
			class instVarNames
				do: [ :each | (class whichSelectorsAccess: each) size = 0 ifTrue: [ Transcript crTrace: 'Class: ' , class printString , ' var: ' , each ] ] ]
]

{ #category : #'scripts-some' }
CzQuickAccess >> openCommonTools [
	<name: #'Open common tools'>
	| group |
	group := GroupWindowMorph new
		addWindow: MCWorkingCopyBrowser new show;
		addWindow: GTPlayground open;
		addWindow: Transcript open;
		addWindow: TestRunner open.
	group tabGroup selectedPageIndex: 1.
	(group openInWindowLabeled: 'Common Tools') expandBoxHit
]

{ #category : #'scripts-some' }
CzQuickAccess >> openImageNatively [
	<name: #'Open image natively'>
	FileLocator image openInNativeBrowser
]

{ #category : #templates }
CzQuickAccess >> profileTests [
	<name: #'Profile tests'>
	GTPlayground
		openContents:
			'packageSelectionBlock := [ :e | e name beginsWith: ''Traits'' ].
testSuite := TestSuite new.
	
((RPackageOrganizer default packages select: packageSelectionBlock) flatCollect: #classes) select: [ :e | e inheritsFrom: TestCase ] thenDo: [ :e | e addToSuiteFromSelectors: testSuite ].

[ testSuite run ] spy'
]

{ #category : #'scripts-some' }
CzQuickAccess >> randomBackground [
	<name: #'Set random background'>

	CzCommonSettings setRandomBackground
]

{ #category : #templates }
CzQuickAccess >> renameMethodsWithDeprecation [
	<name: #'Batch method rename with deprecations'>
	GTPlayground
		openContents:
			'class := FM3Class.
from := ''attribute''.
to := ''propertie''.
deprecatedProtocol := ''*Famix-Deprecated''.

signatureBuilder := [ :selector |
	selector isUnary ifTrue: [ selector ] ifFalse: [
	| count |
	count := 1. 
	String streamContents: [ :s | selector keywords do: [ :key | s nextPutAll: key; space; nextPutAll: ''arg''; print: count; space. count := count + 1 ] ] ] ].

class methods
	select: [ :method | method selector includesSubstring: from ]
	thenDo: [ :method | 
		| oldSelector newSelector |
		oldSelector := method selector asSymbol.
		newSelector := (method selector copyReplaceAll: from with: to) asSymbol.
		
		class
			compiledMethodAt: newSelector
			ifPresent: [ :m | self inform: newSelector , '' already exists'' ]
			ifAbsent: [

			(RBRenameMethodRefactoring
				renameMethod: oldSelector
				in: class
				to: newSelector
				permutation: (1 to: method numArgs) asArray) execute.
			
			class compile: (''{1}
	{2}
	^ self {3}'' format: {signatureBuilder value: oldSelector . ''self deprecated: ''''Use #'', newSelector , '' instead.'''' transformWith: ''''``@object '' , (RBParseTreeSearcher buildSelectorString: oldSelector),'''''' -> ''''``@object '' , (RBParseTreeSearcher buildSelectorString: newSelector) ,''''''.''. signatureBuilder value: newSelector }).
	
			deprecatedProtocol ifNotNil: [ :p | (class>>oldSelector) protocol: p ].	
			] ].'
]

{ #category : #codax }
CzQuickAccess >> resetMeta [
	<name: #'Reset meta'>
	(self class environment at: #MooseModel) resetMeta
]

{ #category : #codax }
CzQuickAccess >> resetSynMeta [
	<name: #'Reset synectique meta'>
	(self class environment at: #SYNModel) resetMeta
]

{ #category : #templates }
CzQuickAccess >> rewritePatterns [
	<name: #'Rewrite patterns'>
	GTPlayground
		openContents:
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

{ #category : #'scripts-some' }
CzQuickAccess >> screenshot [
	<name: #Screenshot>
	Form fromUser asMorph openInWindow
]

{ #category : #'scripts-some' }
CzQuickAccess >> setMonticelloCredentials [
	<name: #'Set Monticello credentials'>
	CzCommonSettings setMonticelloCredentials
]

{ #category : #'seaside scripts' }
CzQuickAccess >> startOn8080 [
	<name: #'Start adaptor on 8080'>
	(self class environment at: #ZnZincServerAdaptor) startOn: 8080
]

{ #category : #'seaside scripts' }
CzQuickAccess >> startOn8080AndDebug [
	<name: #'Start adaptor on 8080 with debug mode'>
	self
		startOn8080;
		debuggerInImage
]

{ #category : #'seaside scripts' }
CzQuickAccess >> stopAdaptors [
	<name: #'Stop adaptors'>
	(self class environment at: #WAServerAdaptor) allSubInstances do: #stop
]

{ #category : #'seaside scripts' }
CzQuickAccess >> templateAddFileToLibraryFromURL [
	<name: #'_Template: URL to file library'>
	GTPlayground openContents: 'library := SYNFileLibrary.
url := ''http://synectique.eu/images/ada.png''.
fileName := ''ada.png''.

library addFileNamed: fileName contents: (ZnEasy get: url) contents'
]

{ #category : #'scripts-some' }
CzQuickAccess >> toggleDeprecation [
	<name: #'Toggle deprecations'>
	Deprecation raiseWarning: Deprecation raiseWarning not
]

{ #category : #'scripts-some' }
CzQuickAccess >> toggleTheme [
	<name: #'Toggle theme'>

	| light dark |
	dark := CozyRoot darkThemeClass.
	light := CozyRoot lightThemeClass.

	(dark isCurrent ifTrue: [ light ] ifFalse: [ dark ]) beCurrent.

	CzCommonSettings setThemeSetting
]

{ #category : #'scripts-mine' }
CzQuickAccess >> toggleToMyTheme [
	<name: #'Try my theme'>

	CzDayAtTheBeachTheme beCurrent.
	CzCommonSettings setThemeSetting
]

{ #category : #templates }
CzQuickAccess >> variableUsage [
	<name: #'Variable usage'>
	GTPlayground openContents: 'origin := SpPresenter.
variables := origin instVarNames.

variables
	inject: Dictionary new
	into: [ :dict :var | 
		dict
			at: var put: ((origin slots detect: [ :e | e name = var ]) usingMethods collect: #methodClass as: Set);
			yourself ]'
]

{ #category : #codax }
CzQuickAccess >> weeklyMail [
	<name: #'Weekly mail'>
	| files mailMessage from to creds file text |
	from := 'cyril.ferlicot@synectique.eu'.
	to := 'team@synectique.eu'.
	(file := StartupPreferencesLoader preferencesGeneralFolder / 'SettingRessources' / 'CredsAmen') exists
		ifFalse: [ | cred |
			cred := Dictionary new.
			cred at: #amenPassword put: (UIManager default textEntry: 'Amen Password').
			file writeStreamDo: [ :s | s nextPutAll: (STON toStringPretty: cred) ] ].
	creds := STON fromString: file contents.

	files := ('/Users/cyril/Google Drive/Synectique/Rapports' asFileReference allFiles select: [ :f | f basename first isDigit ])
		sort: [ :a :b | a basenameWithoutExtension asDate > b basenameWithoutExtension asDate ].

	text := String
		streamContents: [ :stream | 
			stream
				<< 'Bonjour,';
				lf;
				lf;
				<< 'Voici mon rapport de la semaine : ';
				lf;
				lf;
				<< files first contents;
				lf;
				lf;
				<<
					'--
Cyril Ferlicot
https://ferlicot.fr

http://www.synectique.eu
2 rue Jacques Prévert 01,
59650 Villeneuve d''ascq France
' ].

	(UIManager default confirm: text label: 'Envoyer ?')
		ifTrue: [ mailMessage := MailMessage empty
				setField: 'subject' toString: (Date today printFormat: #(1 2 3 $- 1 1));
				body: (MIMEDocument contentType: 'text/plain' content: text);
				setField: 'from' toString: from;
				setField: 'to' toString: to;
				setField: 'bcc' toString: from;
				yourself.

			ZdcSecureSMTPClient new
				user: from;
				password: (creds at: #amenPassword);
				openOnHost: (NetNameResolver addressForName: 'smtp.synectique.eu') port: 465;
				mailFrom: from to: {to} text: mailMessage text;
				quit;
				close ]
]
