"
CzSandyTheme initialize.

CzSandyTheme beCurrent
"
Class {
	#name : #CzSandyTheme,
	#superclass : #CzDayAtTheBeachTheme,
	#category : #CozyTheme
}

{ #category : #definitions }
CzSandyTheme class >> baseColorDefinition [
	"Yellow 300 sandy"
	
	^ (Color fromHexString: 'FFF176') 
]

{ #category : #definitions }
CzSandyTheme class >> basePassiveBackgroundColorDefinition [
	^ Color red
	"^ self baseColorDefinition lighter"
]

{ #category : #definitions }
CzSandyTheme class >> darkBaseColorDefinition [
	"Yellow 300"
	^ Color fromHexString: 'FFF9c4'
]

{ #category : #definitions }
CzSandyTheme class >> lightBaseColorDefinition [
	"Principally use by calypso tabs."
	^ (Color fromString: 'FFFF8D')
]

{ #category : #'core definition' }
CzSandyTheme >> backgroundColorDefinition [
	"Color for the text background in main editors.
	fffde7 is white with a little of yellow but really little"

	^ (Color fromString: 'fffde7') alphaMixed: 0.25 with: Color white
]

{ #category : #'core definition' }
CzSandyTheme >> borderColorDefinition [

	^ self class darkBaseColor adjustBrightness: -0.04
]

{ #category : #'core definition' }
CzSandyTheme >> secondarySelectionColorDefinition [
	^ Color fromHexString: 'FDD835'
	

]

{ #category : #'core definition' }
CzSandyTheme >> selectionTextColorDefinition [
	^ Color fromString: 'ffd54f'
]
