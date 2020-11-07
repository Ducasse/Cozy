"
I'm class executing settings. 
By default the settings to be executed are defined in method `defaultScriptNames`.
"
Class {
	#name : #CzSettingExecutor,
	#superclass : #CozyRoot,
	#classInstVars : [
		'scriptNames'
	],
	#category : #CozyCommon9
}

{ #category : #customization }
CzSettingExecutor class >> defaultScriptNames [
	"Redefine your scripts by adding them to this list or adding them to self scriptNames"
	^ #(
		setAuthorName
		setAppearance
		setLocalFolders
		setMonticelloCredentials
		someToolsOptions
		enableGTSpotterPreview
		removeTaskBarPreview
		setFastDragging
		disableSomeGTSpotterExtensions
		ensurePlayground
		)
]

{ #category : #gt }
CzSettingExecutor class >> disableSomeGTSpotterExtensions [
	<script>
	
	#('GTSpotter_spotterWorldMenuFor') do: [ :ext | GTSpotterExtensionSettings disabledExtensions add: ext ]
]

{ #category : #gt }
CzSettingExecutor class >> enableGTSpotterPreview [
	<script>
	GTSpotter showPreview
]

{ #category : #gt }
CzSettingExecutor class >> ensurePlayground [
	<script>
	"I want the normal playground..."
	Smalltalk tools workspaceTool name = #MoosePlayground 
		ifTrue: [ Smalltalk tools workspaceTool: GTPlayground ]
]

{ #category : #initialization }
CzSettingExecutor class >> executeSetup [
	"Execute all the scripts"
	
	self scriptNames 
		do: [ :each | 
			[
			Transcript show: each, 'will be executed. '.
			self perform: each.
			Transcript show: each, 'has been executed.'; cr.
			] on: Error do: [ :ex | self inform: 'error raised' ] ]
]

{ #category : #initialization }
CzSettingExecutor class >> initialize [
	
	self executeSetup
]

{ #category : #appearence }
CzSettingExecutor class >> launchThemeProcess [
	<script>
	
	| installThemeBlock currentTheme |
	installThemeBlock := [ | theme |
	theme := (Time now between: '7:00am' asTime and: '9:00pm' asTime) 
					ifTrue: [ self darkThemeClass ] ifFalse: [ self lightThemeClass ].
	theme = currentTheme
		ifFalse: [ currentTheme := theme.
			PolymorphSystemSettings uiThemeClass: currentTheme.
			self setFastDragging ] ].
	[ [ installThemeBlock value.
	5 minutes asDelay wait ] repeat ] newProcess
		priority: Processor systemBackgroundPriority;
		name: 'changeTheme';
		resume
]

{ #category : #credentials }
CzSettingExecutor class >> monticelloCredentialFile [
	^ 'credentialsMonticello.ston'
]

{ #category : #appearence }
CzSettingExecutor class >> removeLogo [
	<script>
	
	PolymorphSystemSettings showDesktopLogo: false
]

{ #category : #appearence }
CzSettingExecutor class >> removeTaskBarPreview [
	<script>
	
	TaskbarMorph showWindowPreview: false
]

{ #category : #credentials }
CzSettingExecutor class >> resetMonticelloCredentials [
	<script>
	
	| file |
	file := self resourcesFolder / self monticelloCredentialFile.
	file ensureDelete
]

{ #category : #initialization }
CzSettingExecutor class >> resetScriptNames [

	scriptNames := nil
]

{ #category : #initialization }
CzSettingExecutor class >> scriptNames [

	scriptNames ifNil: [ scriptNames := self defaultScriptNames ].
	^ scriptNames
]

{ #category : #appearence }
CzSettingExecutor class >> setAppearance [
	<script>
	
	self removeLogo
]

{ #category : #pharo }
CzSettingExecutor class >> setAuthorName [
	<script>
	Author fullName: 'StephaneDucasse'
]

{ #category : #appearence }
CzSettingExecutor class >> setFastDragging [
	<script>
	
	UITheme currentSettings fastDragging: true
]

{ #category : #pharo }
CzSettingExecutor class >> setLocalFolders [
	<script>
	| packageCache |
	GTPlayBook cacheDirectory: StartupPreferencesLoader preferencesGeneralFolder / 'play-cache'.
	GTPlayBook stashDirectory: StartupPreferencesLoader preferencesGeneralFolder / 'play-stash'.
	"packageCache := StartupPreferencesLoader preferencesGeneralFolder / 'package-cache'.
	packageCache ensureCreateDirectory.
	MCCacheRepository cacheDirectory: packageCache.
	MCGitHubRepository
		cacheDirectory:
			(((OSPlatform current isWindows
				ifTrue: [ FileLocator C]
				ifFalse: [ StartupPreferencesLoader preferencesGeneralFolder ]) / 'github-cache')
				ensureCreateDirectory;
				yourself)
	I do not know what is the githubcache
	"
]

{ #category : #credentials }
CzSettingExecutor class >> setMonticelloCredentials [
	<script>
	
	| creds file |
	file := self resourcesFolder / self monticelloCredentialFile.
	file exists
		ifFalse: [ | cred |
			cred := Dictionary new.
			cred at: #username put: (UIManager default textEntry: 'Username').
			cred
				at: #password
				put: (UIManager default requestPassword: 'Password').
			file
				writeStreamDo: [ :s | s nextPutAll: (STON toStringPretty: cred) ] ].
	creds := STON fromString: file contents.
	MCRepositoryGroup default repositories
		do: [ :rep | 
			[ rep user: (creds at: #username).
			rep password: (creds at: #password) ]
				on: Error
				do: [  ] ]
]

{ #category : #appearence }
CzSettingExecutor class >> setRandomBackground [
	<script>
	
	| files |
	files := self backgroundFolder allFiles.
	PolymorphSystemSettings desktopImageFileName: (files at: UUID new asInteger \\ files size + 1) fullName
]

{ #category : #appearence }
CzSettingExecutor class >> setThemeSetting [
	<script>
	
	UITheme currentSettings fastDragging: true
]

{ #category : #appearence }
CzSettingExecutor class >> setWindowsPreferences [
	<script>
	self showBoundsInHalo
]

{ #category : #appearence }
CzSettingExecutor class >> showBoundsInHalo [
	<script>
	HaloMorph showBoundsInHalo: true
]

{ #category : #pharo }
CzSettingExecutor class >> someToolsOptions [
	<script>
	ClassDefinitionPrinter showFluidClassDefinition: true.
	MCWorkingCopyBrowser order: 4.
	MCRepositoryGroup default repositories
		select: [ :r | (r isKindOf: MCSmalltalkhubRepository) and: [ r location includesSubstring: 'Pharo/Pharo' ] ]
		thenDo: [ :r | MCRepositoryGroup default removeRepository: r ]
]

{ #category : #'see class side' }
CzSettingExecutor >> seeClassSide [
]
