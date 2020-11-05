Class {
	#name : #CzMoosishQuickAccess,
	#superclass : #CzQuickAccess,
	#category : #CozyCommon9
}

{ #category : #codax }
CzMoosishQuickAccess >> addImportFromMSE [
	<cozyScript: #'Compile #importFromMSE'>
	
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

{ #category : #codax }
CzMoosishQuickAccess >> flushAll [
	<cozyScript: #'Flush all'>
	
	(self class environment at: #MooseEntity) allSubInstances
		do: [ :entity | entity privateState flush ]
		displayingProgress: [ :entity | 'Cleaning cache of ' , entity mooseName ]
]

{ #category : #codax }
CzMoosishQuickAccess >> flushGroups [
	<cozyScript: #'Flush groups'>
	(self class environment at: #MooseEntity) allSubInstances
		do: [ :entity | entity privateState flushGroups ]
		displayingProgress: [ :entity | 'Cleaning cache of ' , entity mooseName ]
]

{ #category : #codax }
CzMoosishQuickAccess >> flushProperties [
	<cozyScript: #'Flush properties'>
	(self class environment at: #MooseEntity) allSubInstances
		do: [ :entity | entity privateState flushProperties ]
		displayingProgress: [ :entity | 'Cleaning cache of ' , entity mooseName ]
]

{ #category : #codax }
CzMoosishQuickAccess >> resetMeta [
	<cozyScript: #'Reset meta'>
	(self class environment at: #MooseModel) resetMeta
]

{ #category : #codax }
CzMoosishQuickAccess >> weeklyMail [
	<cozyScript: #'Weekly mail'>
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
