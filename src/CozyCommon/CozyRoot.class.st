"
I'm a package freely inspired from Cyril Ferlicot Pharo Settings. 

I would like to thank him to show us the way to adapt our lovely environment to gain productivity.
"
Class {
	#name : #CozyRoot,
	#superclass : #Object,
	#category : #CozyCommon
}

{ #category : #initialization }
CozyRoot class >> backgroundFolder [
	^ self resourcesFolder / 'backgrounds'
]

{ #category : #themes }
CozyRoot class >> darkThemeClass [
	^ SystemVersion current major >= 7
		ifTrue: [ CzDarkBlueTheme ]
		ifFalse: [ PharoDarkTheme ]
]

{ #category : #initialization }
CozyRoot class >> imageNameBeginsWith: aString [
	^ self imageNameBeginsWithAny: {aString}
]

{ #category : #initialization }
CozyRoot class >> imageNameBeginsWithAny: aCollection [
	^ aCollection anySatisfy: [ :each | Smalltalk shortImageName beginsWith: each ]
]

{ #category : #themes }
CozyRoot class >> lightThemeClass [
	^  PharoLightTheme 
]

{ #category : #iceberg }
CozyRoot class >> registerIfPresentProjectAt: location subdirectory: subdirectory [
	location exists ifFalse: [ ^ self ].
	
	[ (IceRepositoryCreator new
		location: location;
		subdirectory: subdirectory;
		createRepository) register ]
		on: IceDuplicatedRepository
		do: [ "nothing" ]
]

{ #category : #iceberg }
CozyRoot class >> registerIfPresentProjectOf: owner named: project [
	self registerIfPresentProjectOf: owner named: project subdirectory: 'src'
]

{ #category : #iceberg }
CozyRoot class >> registerIfPresentProjectOf: owner named: project subdirectory: subdirectory [
	
	self flag: #todo. "looks to me that it should use shared folder?"
	self registerIfPresentProjectAt: StartupPreferencesLoader preferencesGeneralFolder / 'GitRepositories' / owner / project subdirectory: subdirectory
]

{ #category : #helpers }
CozyRoot class >> resourcesFolder [
	^ self rootFolder / 'SettingResources'
]

{ #category : #helpers }
CozyRoot class >> rootFolder [
	^ StartupPreferencesLoader preferencesGeneralFolder
]

{ #category : #iceberg }
CozyRoot class >> sharedRepositoryFolder [
	| file |
	file := self resourcesFolder / self sharedRepositoryFolderPathFile.
	file exists
		ifFalse: [ | cred |
			cred := Dictionary new.
			cred at: #dir put: (UIManager default textEntry: 'Path to Iceberg default shared folder').
			file writeStreamDo: [ :s | s nextPutAll: (STON toStringPretty: cred) ] ].
	^ ((STON fromString: file contents) at: #dir) asFileReference
]

{ #category : #iceberg }
CozyRoot class >> sharedRepositoryFolderPathFile [
	"return the name of the file containing the path to the shared repository folder."
	
	^ 'sharedRepositoryFolderPath.ston'.
	
]
