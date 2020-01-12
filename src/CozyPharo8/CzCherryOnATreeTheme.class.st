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
	"pale green"
	^ Color fromHexString: 'b9f6ca'
]

{ #category : #definitions }
CzCherryOnATreeTheme class >> darkBaseColorDefinition [
	"69f0ae: darker intense green. Probably to change"
	^ Color fromHexString: '69f0ae'
]

{ #category : #definitions }
CzCherryOnATreeTheme class >> lightBaseColorDefinition [
	"f8bbd0 pinkish light"
	^ Color fromString: 'f8bbd0'
]

{ #category : #definitions }
CzCherryOnATreeTheme class >> lightSelectionColorDefinition [
	"ligher pinkish"
	^ Color fromHexString: 'fce4ec'
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
