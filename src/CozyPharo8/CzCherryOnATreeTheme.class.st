"
Green with a red selection

CzCherryOnATreeTheme initialize; beCurrent
"
Class {
	#name : #CzCherryOnATreeTheme,
	#superclass : #CzDayAtTheBeachTheme,
	#category : #'CozyPharo8-Code'
}

{ #category : #definitions }
CzCherryOnATreeTheme class >> baseColorDefinition [
	"pale green b9f6ca, 9CEF23, 92F51E"
	^ (Color fromHexString: '94FF19') alphaMixed: 0.5 with: Color white
]

{ #category : #definitions }
CzCherryOnATreeTheme class >> darkBaseColorDefinition [
	"69f0ae: darker intense green. Probably to change"
	 "(Color fromHexString: '74C21D') alphaMixed: 0.4 with: Color white."
	((Color fromHexString: '94FF19') alphaMixed: 0.5 with: Color white) darker .
	^ (Color fromHexString: 'BAEB81')
]

{ #category : #definitions }
CzCherryOnATreeTheme class >> lightBaseColorDefinition [
	"f8bbd0 pinkish light fce4ec"
	"Color fromString: 'f8bbd0'"
	^ (Color fromHexString: 'FFA3CE') alphaMixed: 0.3 with: Color white
	
]

{ #category : #definitions }
CzCherryOnATreeTheme class >> lightSelectionColorDefinition [
	"ligher pinkish f8bbd0"
	"Color fromHexString: 'fce4ec'"
	"^ (Color fromString: 'C25689') alphaMixed: 0.3 with: Color white"
		^ (Color fromHexString: 'FFA3CE') alphaMixed: 0.3 with: Color white
]

{ #category : #accessing }
CzCherryOnATreeTheme class >> themeName [
	^ 'Cherry on a Tree'
]

{ #category : #definitions }
CzCherryOnATreeTheme class >> veryLightSelectionColorDefinition [
	"is it ever used"
	^ Color purple
]

{ #category : #'core definition' }
CzCherryOnATreeTheme >> backgroundColorDefinition [
	"Color for the text background in main editors.
	fffde7 is white with a little of yellow but really little"

	^ (Color fromString: 'fffde7') alphaMixed: 0.25 with: Color white
]

{ #category : #'core definition' }
CzCherryOnATreeTheme >> secondarySelectionColorDefinition [
	"Merge and use darkerBaseColor instead = so we have only one selection color in list."

	^ self class darkBaseColorDefinition
]

{ #category : #'core definition' }
CzCherryOnATreeTheme >> selectionColorDefinition [
	^ self class lightSelectionColorDefinition
]

{ #category : #'core definition' }
CzCherryOnATreeTheme >> selectionTextColorDefinition [
	"darker pink"
	
	^ Color fromString: 'f06292'
]
