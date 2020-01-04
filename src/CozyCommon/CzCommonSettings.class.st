Class {
	#name : #CzCommonSettings,
	#superclass : #CozyRoot,
	#category : #CozyCommon
}

{ #category : #initialization }
CzCommonSettings class >> disableSomeGTSpotterExtensions [
	<script>
	
	#('GTSpotter_spotterWorldMenuFor') do: [ :ext | GTSpotterExtensionSettings disabledExtensions add: ext ]
]

{ #category : #initialization }
CzCommonSettings class >> enableGTSpotterPreview [
	<script>
	GTSpotter showPreview
]

{ #category : #initialization }
CzCommonSettings class >> ensurePlayground [
	<script>
	"I want the normal playground..."
	Smalltalk tools workspaceTool name = #MoosePlayground 
		ifTrue: [ Smalltalk tools workspaceTool: GTPlayground ]
]

{ #category : #initialization }
CzCommonSettings class >> initialize [
	self
		setAuthorName;
		setAppearance;
		setLocalFolders;
		setMonticelloCredentials;
		someToolsOptions;
		enableGTSpotterPreview;
		removeTaskBarPreview;
		setThemeSetting;
		disableSomeGTSpotterExtensions;
		ensurePlayground
]

{ #category : #appearence }
CzCommonSettings class >> launchThemeProcess [
	<script>
	| installThemeBlock currentTheme |
	installThemeBlock := [ | theme |
	theme := (Time now between: '7:00am' asTime and: '9:00pm' asTime) 
					ifTrue: [ self darkThemeClass ] ifFalse: [ self lightThemeClass ].
	theme = currentTheme
		ifFalse: [ currentTheme := theme.
			PolymorphSystemSettings uiThemeClass: currentTheme.
			self setThemeSetting ] ].
	[ [ installThemeBlock value.
	5 minutes asDelay wait ] repeat ] newProcess
		priority: Processor systemBackgroundPriority;
		name: 'changeTheme';
		resume
]

{ #category : #credentials }
CzCommonSettings class >> monticelloCredentialFile [
  ^'credentialsMonticello.ston'
]

{ #category : #appearence }
CzCommonSettings class >> removeLogo [
	<script>
	PolymorphSystemSettings showDesktopLogo: false
]

{ #category : #appearence }
CzCommonSettings class >> removeTaskBarPreview [
	<script>
	TaskbarMorph showWindowPreview: false
]

{ #category : #credentials }
CzCommonSettings class >> resetMonticelloCredentials [
	<script>
	| file |
	file := self resourcesFolder / self monticelloCredentialFile.
	file ensureDelete
]

{ #category : #appearence }
CzCommonSettings class >> setAppearance [
	<script>
	self removeLogo.
	self launchThemeProcess.
	self setRandomBackground
]

{ #category : #initialization }
CzCommonSettings class >> setAuthorName [
	<script>
	Author fullName: 'StephaneDucasse'
]

{ #category : #initialization }
CzCommonSettings class >> setLocalFolders [
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
CzCommonSettings class >> setMonticelloCredentials [
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
CzCommonSettings class >> setRandomBackground [
	<script>
	[ | files |
	files := self backgroundFolder allFiles.
	PolymorphSystemSettings desktopImageFileName: (files at: UUID new asInteger \\ files size + 1) fullName ] fork
]

{ #category : #appearence }
CzCommonSettings class >> setThemeSetting [
	<script>
	UITheme currentSettings fastDragging: true
]

{ #category : #initialization }
CzCommonSettings class >> setWindowsPreferences [
	<script>
	self showBoundsInHalo
]

{ #category : #initialization }
CzCommonSettings class >> showBoundsInHalo [
	<script>
	HaloMorph showBoundsInHalo: true
]

{ #category : #initialization }
CzCommonSettings class >> someToolsOptions [
	<script>
	Slot showSlotClassDefinition: true.
	MCWorkingCopyBrowser order: 4.
	MCRepositoryGroup default repositories
		select: [ :r | (r isKindOf: MCSmalltalkhubRepository) and: [ r location includesSubstring: 'Pharo/Pharo' ] ]
		thenDo: [ :r | MCRepositoryGroup default removeRepository: r ]
]

{ #category : #'see class side' }
CzCommonSettings >> seeClassSide [
]
