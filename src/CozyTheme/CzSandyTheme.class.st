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

{ #category : #definitions }
CzSandyTheme class >> lightSelectionColorDefinition [
	"to hightligth tabs"
	
	^ Color fromHexString: 'e1f5fe'
]

{ #category : #definitions }
CzSandyTheme class >> newDefaultSettings [
	"to be done"
	self setPreferredPreferences.
	^ super newDefaultSettings
		flatMenu: true;
		menuColor: self baseColor;
		menuTitleColor: self darkBaseColor;
		windowColor: self baseColor;
		menuSelectionColor: (Color fromHexString: 'b3e5fc')
]

{ #category : #'core definition' }
CzSandyTheme >> backgroundColorDefinition [
	"Color for the text background in main editors.
	fffde7 is white with a little of yellow but really little"

	^ (Color fromString: 'fffde7') alphaMixed: 0.25 with: Color white
]

{ #category : #'core definition' }
CzSandyTheme >> borderColorDefinition [

	^ self class darkBaseColor adjustBrightness: -0.5
]

{ #category : #'core definition' }
CzSandyTheme >> secondarySelectionColorDefinition [
	"this color is used by calypso for the strange protocol color."
	^ Color fromHexString: 'FDD835'
	

]

{ #category : #'core definition' }
CzSandyTheme >> selectionTextColorDefinition [
	^ Color fromString: 'ffd54f'
]
