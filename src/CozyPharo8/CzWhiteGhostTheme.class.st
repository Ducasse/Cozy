Class {
	#name : #CzWhiteGhostTheme,
	#superclass : #CzDayAtTheBeachTheme,
	#category : #'CozyPharo8-Code'
}

{ #category : #definitions }
CzWhiteGhostTheme class >> baseColorDefinition [
	^ Color fromHexString: '90a4ae'
]

{ #category : #definitions }
CzWhiteGhostTheme class >> darkBaseColorDefinition [
	^ Color fromHexString: '607d8b'
]

{ #category : #definitions }
CzWhiteGhostTheme class >> lightBaseColorDefinition [
	^ Color fromString: 'cfd8dc'
]

{ #category : #definitions }
CzWhiteGhostTheme class >> lightSelectionColorDefinition [
	^ Color fromHexString: 'ffe082'
]

{ #category : #'core definition' }
CzWhiteGhostTheme >> backgroundColorDefinition [
	"Color for the text background in main editors.
	fffde7 is white with a little of yellow but really little"

	^ (Color fromString: 'fffde7') alphaMixed: 0.25 with: Color white
]

{ #category : #'core definition' }
CzWhiteGhostTheme >> selectionColorDefinition [
	^ Color fromString: 'fff59d'.

]
