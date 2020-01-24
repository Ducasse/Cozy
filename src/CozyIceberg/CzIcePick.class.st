"
I'm a little helper to manage configurations of iceberg. I have a layered design: 
I have three kinds of methods: the low-level ones (to directly configure iceberg), the configuration one querying 
setting files (usually stored in the preference folder), and interactive methods helping the creation of the 
setting files. 

The configuration is done via files located in the Settings folder in the preference folder. 
By default it configures iceberg to share projects in a single repository.

To create the setting files use the methods categorized in the 'interactive helpers' protocol.
The configuration will then use the created files. Note that if the file already exists
and you decide to create a new one, the old file is kept so that you can have a look at the information.

	
	self new 
		storeSharedRepositoryFolderInLocalSettings;
		storeIcebergCredentialsInLocalSettings;
		configure. 
Once you configuration files are created, you can simply invoke

	self new configure. 



"
Class {
	#name : #CzIcePick,
	#superclass : #Object,
	#category : #CozyIceberg
}

{ #category : #iceberg }
CzIcePick class >> credentialsIcebergFilename [
	^ 'credentialsIceberg.ston'
]

{ #category : #iceberg }
CzIcePick class >> sharedRepositoryFolderPathFile [
	"return the name of the file containing the path to the shared repository folder."
	
	^ 'sharedRepositoryFolderPath.ston'
	
]

{ #category : #'on progress' }
CzIcePick >> collectAllSubprojectsFrom: aDirectory into: aCollection [
	(aDirectory directories anySatisfy: [ :e | e basename = '.git' ]) 
		ifTrue: [ aCollection add: aDirectory ] 
		ifFalse: [ aDirectory directories do: [ :dir | self collectAllSubprojectsFrom: dir into: aCollection ] ]
]

{ #category : #'main configuration' }
CzIcePick >> configure [

	self configureMonticelloIntegration.
	"self configureSshCredentials."
	self useStoredIcebergCredentials.
	self useStoredSharedRepositoryFolder 
]

{ #category : #'low-level operations' }
CzIcePick >> configureCredentialStore: aDictionary [
	
	self configureCredentialStoreUsername: (aDictionary at: #username)  password: (aDictionary at: #password)
]

{ #category : #'low-level operations' }
CzIcePick >> configureCredentialStoreUsername: aString password: aPassword [
	
	IceCredentialStore current
		storeCredential: (IcePlaintextCredentials new
				 username: aString;
				 password: aPassword;
				 yourself)
		forHostname: 'github.com'

]

{ #category : #'low-level operations' }
CzIcePick >> configureMonticelloIntegration [

	Iceberg enableMetacelloIntegration: true
	
]

{ #category : #'low-level operations' }
CzIcePick >> configureSharedRepositoriesFolder: aFileReference [

	IceLibgitRepository
		shareRepositoriesBetweenImages: true;
		sharedRepositoriesLocation: aFileReference
]

{ #category : #'low-level operations' }
CzIcePick >> configureSshCredentials [

	IceCredentialsProvider useCustomSsh: true.
	IceCredentialsProvider sshCredentials
		username: 'git';
		publicKey: '/Users/ducasse/.ssh/id_rsa.pub';
		privateKey: '/Users/ducasse/.ssh/id_rsa'.
	self flag: #todo "should manage this from the config files."
]

{ #category : #helpers }
CzIcePick >> contributingPharoImageIdentifier [

  ^ 'ContribPharo'
]

{ #category : #'file and folders' }
CzIcePick >> credentialsIcebergFilename [

	^ self class credentialsIcebergFilename
]

{ #category : #working }
CzIcePick >> fetchAllRemotesOf: repo [
	| remotes |
	remotes := repo remotes.
	UIManager default informUserDuring: [ :bar | 
		bar label: 'Fetching incoming commits'.
		bar max: remotes size.
		bar value: 1.
		remotes withIndexDo: [ :each :index | 
			bar label: ('Fetching incoming commits of {1}' format: { each name }).
			bar value: index + 1.
			repo fetchFrom: each ] ]
]

{ #category : #helpers }
CzIcePick >> imageNameBeginsWith: aString [
	^ self imageNameBeginsWithAny: {aString}
]

{ #category : #helpers }
CzIcePick >> imageNameBeginsWithAny: aCollection [
	^ aCollection anySatisfy: [ :each | Smalltalk shortImageName beginsWith: each ]
]

{ #category : #'on progress' }
CzIcePick >> initializePotentialIcebergRepos [

	| projects |
	projects := OrderedCollection new.
	self collectAllSubprojectsFrom: self sharedRepositoryFolder into: projects.
	IceRepository registry do: [ :repo | projects 
				detect: [ :e | e basename asLowercase = repo name asLowercase and: [ repo location isNil or: [ repo location exists not ] ] ] 
				ifFound: [ :dir | repo location: dir ] ]
]

{ #category : #'interactive helpers' }
CzIcePick >> moveCurrentToOld: afileName [
	(self resourcesFolder / (afileName, '.old')) ensureDelete.
	self resourcesFolder / afileName moveTo: (self resourcesFolder / (afileName, '.old'))
]

{ #category : #working }
CzIcePick >> openIceberg [
	<script>
	IceTipRepositoriesBrowser new openWithSpec
]

{ #category : #working }
CzIcePick >> prepareContributionToPharoForUnsynchronizedRepositories [
	"When you do not synchronized manually the pharo local and remote repositories, 
	and you want to contribute, the important thing to do is is to sync the local repository with the image.
	This script fetches and create a branch that is synchronized with the current image
	and can serve as common root for multiple contributions."
	"Not tested so far. Based on Ferlicot's code."
	<script: 'self new prepareContributionToPharoForUnsynchronizedRepositories'>
	"self new toPrepareContributionToPharo"
	
	| pharo branchName |
	pharo := (IceRepository registry select: [ :each | each name = 'pharo' ]) first.
	self flag:#fixMe. "remove dependency to stef"
	pharo location: (self sharedRepositoryFolder / 'Ducasse' / 'pharo') asFileReference.
	self fetchAllRemotesOf: pharo.

	branchName := pharo localBranchNames select:  [:each | Date today yyyymmdd, '-*' match: each ].
	branchName 
		ifEmpty: [ branchName := Date today yyyymmdd, '-1' ]
		ifNotEmpty: [ branchName := (branchName collect: [ :each | (each allButFirst: 11) squeezeOutNumber ]) sorted first.
				branchName := Date today yyyymmdd, '-', (branchName + 1) asString ].
	pharo createNewBranch: branchName
	
]

{ #category : #working }
CzIcePick >> prepareForPharoContributionForSynchronizedRepository [
	"Useful when the local repository of pharo is synchronized with the remote.
	Checks that before contributing the current branch is the contribution branches of current Pharo version"
	
	(self imageNameBeginsWith: self contributingPharoImageIdentifier) ifFalse: [ ^self ].
 
	IceRepository registry detect: [:repo |  repo workingCopy packages anySatisfy: [:p |  p name = 'BaselineOfPharo' ] ] ifFound: [:pharoRepository |  
		| defaultBranch |
		pharoRepository fetch.
		defaultBranch := 'Pharo' , SystemVersion current major asString , '.0'.
		pharoRepository branch name = defaultBranch ifTrue: [ ^self ].
        
		"This means that we are not on the default branch. Ask what to do."
		(UIManager default 
			questionWithoutCancel: ('Currently on branch {1}. Want to switch to {2}?' format: {pharoRepository branch name. 
                    defaultBranch})) ifTrue: [ pharoRepository checkoutBranch: defaultBranch ] ]
]

{ #category : #'file and folders' }
CzIcePick >> resourcesFolder [
	^ self rootFolder / 'SettingResources'
]

{ #category : #'file and folders' }
CzIcePick >> rootFolder [
	^ StartupPreferencesLoader preferencesGeneralFolder
]

{ #category : #'file and folders' }
CzIcePick >> sharedRepositoryFolder [ 

	^ ((STON fromString: (self resourcesFolder / self sharedRepositoryFolderPathFile ) asFileReference contents) at: #dir) asFileReference

]

{ #category : #'file and folders' }
CzIcePick >> sharedRepositoryFolderPathFile [

	^ self class sharedRepositoryFolderPathFile
]

{ #category : #'interactive helpers' }
CzIcePick >> storeIcebergCredentialsInLocalSettings [

	| file userName password |
	file := self resourcesFolder / self credentialsIcebergFilename.
	file exists ifTrue: [ 
		| answer |
		answer := UIManager default
			          confirm: 'Credential file exist at: ' , (self resourcesFolder / self credentialsIcebergFilename) fullName , '.'
			          trueChoice: 'Use that file'
			          falseChoice: 'Erase it'
			          cancelChoice: 'Cancel'
			          default: nil.
		answer ifNil: [ ^ self ].
		answer 
			ifFalse: [ self moveCurrentToOld: self credentialsIcebergFilename ]
			ifTrue: [ ^ self ] ].

	userName := UIManager default textEntry: 'Git Username or empty to cancel'.
	userName ifEmpty: [ ^ self ].
	password := UIManager default requestPassword: 'Git Password or empty to cancel'.
	password ifEmpty: [ ^ self ].
	file writeStreamDo: [ :s | s nextPutAll: (STON toStringPretty: (Dictionary with: #username -> userName with: #password -> password)) ]
]

{ #category : #'interactive helpers' }
CzIcePick >> storeSharedRepositoryFolderInLocalSettings [
	
	| file path |
	file := self resourcesFolder / self sharedRepositoryFolderPathFile.
	file exists ifTrue: [ 
		| answer |
		answer := UIManager default
			 confirm: 'Shared repository folder file exist at: ' , (self resourcesFolder / self sharedRepositoryFolderPathFile) fullName , '.'
			 trueChoice: 'Use that file'
			 falseChoice: 'Erase it'
			 cancelChoice: 'Cancel'
			 default: nil.
		answer ifNil: [ ^ self ].
		answer 
			ifFalse: [ self moveCurrentToOld: self sharedRepositoryFolderPathFile ]
			ifTrue: [ ^ self ]
	 ].

	path := UIManager default textEntry: 'Path to Iceberg default shared folder'.
	path ifNil: [ ^ self ].
	path ifEmpty: [ ^ self ].
	file writeStreamDo: [ :s | s nextPutAll: (STON toStringPretty: (Dictionary with: #dir -> path)) ]
	
]

{ #category : #working }
CzIcePick >> toPrepareContributionToPharo [
	"self new toPrepareContributionToPharo"
	| pharo branchName |
	pharo := (IceRepository registry select: [ :each | each name = 'pharo' ]) first.
	pharo location: (self sharedRepositoryFolder / 'Ducasse' / 'pharo') asFileReference.
	self fetchAllRemotesOf: pharo.

	branchName := pharo localBranchNames select:  [:each | Date today yyyymmdd, '-*' match: each ].
	branchName 
		ifEmpty: [ branchName := Date today yyyymmdd, '-1' ]
		ifNotEmpty: [ branchName := (branchName collect: [ :each | (each allButFirst: 11) squeezeOutNumber ]) sorted first.
				branchName := Date today yyyymmdd, '-', (branchName + 1) asString ].
	pharo createNewBranch: branchName
	
]

{ #category : #'main configuration' }
CzIcePick >> useStoredIcebergCredentials [

	| file |
	file := self resourcesFolder / self credentialsIcebergFilename.
	file exists
		ifFalse: [ self error: 'No credentials in ', (self resourcesFolder / self credentialsIcebergFilename) fileName. ]
		ifTrue: [ self configureCredentialStore: (STON fromString: file contents) ]


]

{ #category : #'main configuration' }
CzIcePick >> useStoredSharedRepositoryFolder [
	"self new useStoredSharedRepositoryFolder"
	| file |
	file := self resourcesFolder / self sharedRepositoryFolderPathFile.
	file exists
		ifFalse: [ self error: 'No file in ', (self resourcesFolder / self sharedRepositoryFolderPathFile) fileName. ]
		ifTrue: [ self configureSharedRepositoriesFolder: ((STON fromString: file contents) at: #dir) asFileReference ]


]

{ #category : #stefSetup }
CzIcePick >> violentlyGenerateSharedRepositoryFolderInLocalSettings [
	"self new violentlyGenerateSharedRepositoryFolderInLocalSettings"
	| file cred |
	file := self resourcesFolder / self sharedRepositoryFolderPathFile.
	cred := Dictionary new.
	cred at: #dir put: '/Users/ducasse/Workspace/FirstCircle/ActiveResearch/Pharo/PharoCodeBase'.
	file writeStreamDo: [ :s | s nextPutAll: (STON toStringPretty: cred) ].
	
]
