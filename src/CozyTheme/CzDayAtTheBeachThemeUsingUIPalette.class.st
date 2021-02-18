Class {
	#name : #CzDayAtTheBeachThemeUsingUIPalette,
	#superclass : #PharoLightTheme,
	#instVars : [
		'colorDictionary'
	],
	#classInstVars : [
		'colorDictionary'
	],
	#category : #CozyTheme
}

{ #category : #accessing }
CzDayAtTheBeachThemeUsingUIPalette class >> baseColor [

	^ colorDictionary at: #baseColor
]

{ #category : #definitions }
CzDayAtTheBeachThemeUsingUIPalette class >> baseColorDefinition [

	^ Color fromHexString: 'b2ebf2'
]

{ #category : #accessing }
CzDayAtTheBeachThemeUsingUIPalette class >> basePassiveBackgroundColor [
	^ colorDictionary at: #basePassiveBackgroundColor
]

{ #category : #definitions }
CzDayAtTheBeachThemeUsingUIPalette class >> basePassiveBackgroundColorDefinition [
	^ self baseColorDefinition lighter
]

{ #category : #accessing }
CzDayAtTheBeachThemeUsingUIPalette class >> darkBaseColor [
	^ colorDictionary at: #darkBaseColor
]

{ #category : #definitions }
CzDayAtTheBeachThemeUsingUIPalette class >> darkBaseColorDefinition [
	^ Color fromHexString: '80deea'
]

{ #category : #initialization }
CzDayAtTheBeachThemeUsingUIPalette class >> initialize [
	"self initialize"
	super initialize. "Yes there is an initialize class method in UITheme"

	self withAllSubclassesDo: [ :cls | cls initializeColors; initializeDefault ]

	
]

{ #category : #initialization }
CzDayAtTheBeachThemeUsingUIPalette class >> initializeColors [
	colorDictionary := Dictionary new. 
	colorDictionary at: #baseColor put: self baseColorDefinition.
	colorDictionary at: #basePassiveBackgroundColor put: self basePassiveBackgroundColorDefinition.
	colorDictionary at: #darkBaseColor put: self darkBaseColorDefinition.
	colorDictionary at: #lightBaseColor put: self lightBaseColorDefinition.
	colorDictionary at: #lightSelectionColor put: self lightSelectionColorDefinition.
	colorDictionary at: #veryLightSelectionColor put: self veryLightSelectionColorDefinition 

]

{ #category : #initialization }
CzDayAtTheBeachThemeUsingUIPalette class >> initializeDefault [
	self resetDefaultSettings

]

{ #category : #accessing }
CzDayAtTheBeachThemeUsingUIPalette class >> lightBaseColor [

	^ colorDictionary at: #lightBaseColor
]

{ #category : #definitions }
CzDayAtTheBeachThemeUsingUIPalette class >> lightBaseColorDefinition [

	^ (Color fromString: 'e0f7fa')
]

{ #category : #accessing }
CzDayAtTheBeachThemeUsingUIPalette class >> lightSelectionColor [

	^ colorDictionary at: #lightSelectionColor
]

{ #category : #definitions }
CzDayAtTheBeachThemeUsingUIPalette class >> lightSelectionColorDefinition [
	^ Color fromHexString: 'ffd200'
]

{ #category : #accessing }
CzDayAtTheBeachThemeUsingUIPalette class >> newDefaultSettings [
	"to be done"
	self setPreferredPreferences.
	^ super newDefaultSettings
		flatMenu: true;
		menuColor: self baseColor;
		menuTitleColor: self darkBaseColor;
		windowColor: self baseColor;
		menuSelectionColor: self darkBaseColor
	"
	^ super newDefaultSettings
		selectionColor: self lightSelectionColor;
		menuSelectionColor: self baseSelectionColor;
		menuSelectionTextColor: self baseTextColor darker;
		progressBarColor: self baseColor;
		standardColorsOnly: true;
		autoSelectionColor: false;
		preferRoundCorner: false;
		fadedBackgroundWindows: false;		
	"
]

{ #category : #accessing }
CzDayAtTheBeachThemeUsingUIPalette class >> themeName [
	^ 'Day at the Beach'
]

{ #category : #accessing }
CzDayAtTheBeachThemeUsingUIPalette class >> veryLightSelectionColor [
	^ colorDictionary at: #veryLightSelectionColor
]

{ #category : #definitions }
CzDayAtTheBeachThemeUsingUIPalette class >> veryLightSelectionColorDefinition [
	^ Color fromHexString: 'ffe700'
]

{ #category : #'accessing colors' }
CzDayAtTheBeachThemeUsingUIPalette >> backgroundColor [
	"Color for the text background in main editors."
	
	^ colorDictionary at: #backgroundColor
]

{ #category : #'core definition' }
CzDayAtTheBeachThemeUsingUIPalette >> backgroundColorDefinition [
	"Color for the text background in main editors.
	fffde7 is white with a little of yellow but really little"

	^ (Color fromString: 'fffde7') alphaMixed: 0.25 with: Color white
]

{ #category : #'core definition' }
CzDayAtTheBeachThemeUsingUIPalette >> baseColorDefinition [
	"Color for the text background in main editors."

	^ self class baseColor
]

{ #category : #'accessing colors' }
CzDayAtTheBeachThemeUsingUIPalette >> borderColor [
	^ colorDictionary at: #borderColor
]

{ #category : #'core definition' }
CzDayAtTheBeachThemeUsingUIPalette >> borderColorDefinition [

	^ self class darkBaseColor adjustBrightness: -0.04
]

{ #category : #'trying to fix testRunner selection' }
CzDayAtTheBeachThemeUsingUIPalette >> configureMorphTreeMorph: aMorph [
 	aMorph preferedPaneColor: self textColor.
 	aMorph 
 		rowColorForEven:  Color pink
 		odd: Color pink.
]

{ #category : #initialization }
CzDayAtTheBeachThemeUsingUIPalette >> configureWindowBorderFor: aWindow [
	"this is to handle correctly the window border."
	| aStyle |
	aStyle := SimpleBorder new 
					color: self windowBorderColorDefinition;
					width: 1.
	aWindow borderStyle: aStyle
]

{ #category : #initialization }
CzDayAtTheBeachThemeUsingUIPalette >> initialize [
	super initialize.
	colorDictionary := Dictionary new.
	self initializeColors.
	settings menuColor: self baseColorDefinition.
	
]

{ #category : #initialization }
CzDayAtTheBeachThemeUsingUIPalette >> initializeColors [
	colorDictionary
		at: #windowColor
		put: self windowColorDefinition.

	colorDictionary
		at: #backgroundColor
		put: self backgroundColorDefinition.
	colorDictionary at: #borderColor put: self borderColorDefinition.
	colorDictionary
		at: #scrollbarColor
		put: self scrollbarColorDefinition.
	colorDictionary at: #textColor put: self textColorDefinition.
	colorDictionary at: #listTextColor put: self listTextColorDefinition.
	colorDictionary at: #menuColor put: self menuColorDefinition.
	colorDictionary
		at: #secondarySelectionColor
		put: self secondarySelectionColorDefinition.
	colorDictionary
		at: #selectionTextColor
		put: self selectionTextColorDefinition.
	colorDictionary
		at: #selectionColor
		put: self selectionColorDefinition.
	colorDictionary
		at: #unfocusedSelectionColor
		put: self selectionTextColorDefinition.

]

{ #category : #'accessing colors' }
CzDayAtTheBeachThemeUsingUIPalette >> listTextColor [
	"Answer the list text color to use."

	^ colorDictionary at: #listTextColor
]

{ #category : #'core definition' }
CzDayAtTheBeachThemeUsingUIPalette >> listTextColorDefinition [
	"Answer the list text color to use."

	^ self textColorDefinition
]

{ #category : #'accessing colors' }
CzDayAtTheBeachThemeUsingUIPalette >> menuColor [
	"For Calypso menu but apparently this does not work for the world menu."

	^ colorDictionary at: #menuColor
]

{ #category : #'core definition' }
CzDayAtTheBeachThemeUsingUIPalette >> menuColorDefinition [
	"For Calypso menu but apparently this does not work for the world menu."

	^ self baseColorDefinition
]

{ #category : #'accessing colors' }
CzDayAtTheBeachThemeUsingUIPalette >> progressBarProgressFillStyleFor: aProgressBar [
	"Answer the colour for the given progress bar."

	^ self class darkBaseColor
]

{ #category : #'accessing colors' }
CzDayAtTheBeachThemeUsingUIPalette >> scrollbarColor [

	^ colorDictionary at: #scrollbarColor
]

{ #category : #'core definition' }
CzDayAtTheBeachThemeUsingUIPalette >> scrollbarColorDefinition [
	^ self buttonColor
]

{ #category : #'accessing colors' }
CzDayAtTheBeachThemeUsingUIPalette >> secondarySelectionColor [
	^ colorDictionary at: #secondarySelectionColor
]

{ #category : #'core definition' }
CzDayAtTheBeachThemeUsingUIPalette >> secondarySelectionColorDefinition [
	^ Color fromString: '84ffff'
	

]

{ #category : #'accessing colors' }
CzDayAtTheBeachThemeUsingUIPalette >> selectionColor [
	"^ Color fromHexString: 'ffe082'"
	
	^ colorDictionary at: #selectionColor
]

{ #category : #'accessing colors' }
CzDayAtTheBeachThemeUsingUIPalette >> selectionColorDefinition [
	^ Color fromHexString: 'ffe082'
	
	
]

{ #category : #'accessing colors' }
CzDayAtTheBeachThemeUsingUIPalette >> selectionTextColor [
	"^ Color fromString: 'ffd54f'"
	
	^ colorDictionary at: #selectionTextColor
]

{ #category : #'core definition' }
CzDayAtTheBeachThemeUsingUIPalette >> selectionTextColorDefinition [
	^ Color fromString: 'ffd54f'
]

{ #category : #initialization }
CzDayAtTheBeachThemeUsingUIPalette >> shStyleTableName [

	^ #daybeachStyleTable
]

{ #category : #'accessing colors' }
CzDayAtTheBeachThemeUsingUIPalette >> textColor [
	"This is only for all the list and the text except that the selection color can hide it on certain list."
	
	^ colorDictionary at: #textColor
]

{ #category : #'core definition' }
CzDayAtTheBeachThemeUsingUIPalette >> textColorDefinition [
	"This is only for all the list and the text except that the selection color can hide it on certain list."
	^ Color black
	

]

{ #category : #'sample methods' }
CzDayAtTheBeachThemeUsingUIPalette >> thisIsATestMethod: arg for: shoutTable [
	"comment stating purpose of instance-side message"
	"scope: class-variables  &  instance-variables"	
			
	| temporary names |
	self printString.
	forms select: [ :each | |tmp| 
			each printString].
	true. 
	self focusIndicat
	false. 
	names := 33.
	{ 1. $a. #aSymbol } do: [ :each | self printString ].
	^ self
]

{ #category : #'accessing colors' }
CzDayAtTheBeachThemeUsingUIPalette >> unfocusedSelectionColor [
	"^ self selectionColor"
	
	^ colorDictionary at: #unfocusedSelectionColor
]

{ #category : #'core definition' }
CzDayAtTheBeachThemeUsingUIPalette >> windowBorderColorDefinition [
	^ self class darkBaseColor
]

{ #category : #'accessing colors' }
CzDayAtTheBeachThemeUsingUIPalette >> windowColor [
	
	^ colorDictionary at: #windowColor
]

{ #category : #'core definition' }
CzDayAtTheBeachThemeUsingUIPalette >> windowColorDefinition [
	"For the bar of calypso and probably the menu"
	
	^ self baseColorDefinition 
]
