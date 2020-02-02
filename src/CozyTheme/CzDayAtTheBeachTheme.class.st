"
A blue theme within sandy selection

nice links:

	https://www.color-hex.com
	https://www.materialpalette.com/colors
	https://color.adobe.com/create/
	

Should 
	- fix the window border. I lost it. 
	- the blue in the bar of the QA assistant

Next step: 
	- generate automatically the cache.
	- inherit directly from UITheme 
	- propose a couple of dark theme.
"
Class {
	#name : #CzDayAtTheBeachTheme,
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
CzDayAtTheBeachTheme class >> baseColor [

	^ colorDictionary at: #baseColor
]

{ #category : #definitions }
CzDayAtTheBeachTheme class >> baseColorDefinition [

	^ Color fromHexString: 'b2ebf2'
]

{ #category : #accessing }
CzDayAtTheBeachTheme class >> basePassiveBackgroundColor [
	^ colorDictionary at: #basePassiveBackgroundColor
]

{ #category : #definitions }
CzDayAtTheBeachTheme class >> basePassiveBackgroundColorDefinition [
	^ self baseColorDefinition lighter
]

{ #category : #accessing }
CzDayAtTheBeachTheme class >> darkBaseColor [
	^ colorDictionary at: #darkBaseColor
]

{ #category : #definitions }
CzDayAtTheBeachTheme class >> darkBaseColorDefinition [
	^ Color fromHexString: '80deea'
]

{ #category : #initialization }
CzDayAtTheBeachTheme class >> initialize [
	"self initialize"
	super initialize. "Yes there is an initialize class method in UITheme"

	self withAllSubclassesDo: [ :cls | cls initializeColors; initializeDefault ]

	
]

{ #category : #initialization }
CzDayAtTheBeachTheme class >> initializeColors [
	colorDictionary := Dictionary new. 
	colorDictionary at: #baseColor put: self baseColorDefinition.
	colorDictionary at: #basePassiveBackgroundColor put: self basePassiveBackgroundColorDefinition.
	colorDictionary at: #darkBaseColor put: self darkBaseColorDefinition.
	colorDictionary at: #lightBaseColor put: self lightBaseColorDefinition.
	colorDictionary at: #lightSelectionColor put: self lightSelectionColorDefinition.
	colorDictionary at: #veryLightSelectionColor put: self veryLightSelectionColorDefinition 

]

{ #category : #initialization }
CzDayAtTheBeachTheme class >> initializeDefault [
	self resetDefaultSettings

]

{ #category : #accessing }
CzDayAtTheBeachTheme class >> lightBaseColor [

	^ colorDictionary at: #lightBaseColor
]

{ #category : #definitions }
CzDayAtTheBeachTheme class >> lightBaseColorDefinition [

	^ (Color fromString: 'e0f7fa')
]

{ #category : #accessing }
CzDayAtTheBeachTheme class >> lightSelectionColor [

	^ colorDictionary at: #lightSelectionColor
]

{ #category : #definitions }
CzDayAtTheBeachTheme class >> lightSelectionColorDefinition [
	^ Color fromHexString: 'ffd200'
]

{ #category : #accessing }
CzDayAtTheBeachTheme class >> newDefaultSettings [
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
CzDayAtTheBeachTheme class >> themeName [
	^ 'Day at the Beach'
]

{ #category : #accessing }
CzDayAtTheBeachTheme class >> veryLightSelectionColor [
	^ colorDictionary at: #veryLightSelectionColor
]

{ #category : #definitions }
CzDayAtTheBeachTheme class >> veryLightSelectionColorDefinition [
	^ (Color fromHexString: 'ffe700')
]

{ #category : #'accessing colors' }
CzDayAtTheBeachTheme >> backgroundColor [
	"Color for the text background in main editors."
	
	^ colorDictionary at: #backgroundColor
]

{ #category : #'core definition' }
CzDayAtTheBeachTheme >> backgroundColorDefinition [
	"Color for the text background in main editors.
	fffde7 is white with a little of yellow but really little"

	^ (Color fromString: 'fffde7') alphaMixed: 0.25 with: Color white
]

{ #category : #'core definition' }
CzDayAtTheBeachTheme >> baseColorDefinition [
	"Color for the text background in main editors."

	^ self class baseColor
]

{ #category : #'accessing colors' }
CzDayAtTheBeachTheme >> borderColor [
	^ colorDictionary at: #borderColor
]

{ #category : #'core definition' }
CzDayAtTheBeachTheme >> borderColorDefinition [

	^ self class darkBaseColor adjustBrightness: -0.04
]

{ #category : #'trying to fix testRunner selection' }
CzDayAtTheBeachTheme >> configureMorphTreeMorph: aMorph [
 	aMorph preferedPaneColor: self textColor.
 	aMorph 
 		rowColorForEven:  Color pink
 		odd: Color pink.
]

{ #category : #'trying to fix testRunner selection' }
CzDayAtTheBeachTheme >> configureScrollPane: aMorph [
	self halt.
	aMorph color: Color white.
]

{ #category : #initialization }
CzDayAtTheBeachTheme >> configureWindowBorderFor: aWindow [
	"this is to handle correctly the window border."
	| aStyle |
	aStyle := SimpleBorder new 
					color: self windowBorderColorDefinition;
					width: 1.
	aWindow borderStyle: aStyle
]

{ #category : #initialization }
CzDayAtTheBeachTheme >> initialize [
	super initialize.
	colorDictionary := Dictionary new.
	self initializeColors.
	settings menuColor: self baseColorDefinition.
	
]

{ #category : #initialization }
CzDayAtTheBeachTheme >> initializeColors [
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
CzDayAtTheBeachTheme >> listTextColor [
	"Answer the list text color to use."

	^ colorDictionary at: #listTextColor
]

{ #category : #'core definition' }
CzDayAtTheBeachTheme >> listTextColorDefinition [
	"Answer the list text color to use."

	^ self textColorDefinition
]

{ #category : #'accessing colors' }
CzDayAtTheBeachTheme >> menuColor [
	"For Calypso menu but apparently this does not work for the world menu."

	^ colorDictionary at: #menuColor
]

{ #category : #'core definition' }
CzDayAtTheBeachTheme >> menuColorDefinition [
	"For Calypso menu but apparently this does not work for the world menu."

	^ self baseColorDefinition
]

{ #category : #'accessing colors' }
CzDayAtTheBeachTheme >> progressBarProgressFillStyleFor: aProgressBar [
	"Answer the colour for the given progress bar."

	^ self class darkBaseColor
]

{ #category : #'accessing colors' }
CzDayAtTheBeachTheme >> scrollbarColor [

	^ colorDictionary at: #scrollbarColor
]

{ #category : #'core definition' }
CzDayAtTheBeachTheme >> scrollbarColorDefinition [
	^ self buttonColor
]

{ #category : #'accessing colors' }
CzDayAtTheBeachTheme >> secondarySelectionColor [
	^ colorDictionary at: #secondarySelectionColor
]

{ #category : #'core definition' }
CzDayAtTheBeachTheme >> secondarySelectionColorDefinition [
	^ Color fromString: '84ffff'
	

]

{ #category : #'accessing colors' }
CzDayAtTheBeachTheme >> selectionColor [
	"^ Color fromHexString: 'ffe082'"
	
	^ colorDictionary at: #selectionColor
]

{ #category : #'accessing colors' }
CzDayAtTheBeachTheme >> selectionColorDefinition [
	^ Color fromHexString: 'ffe082'
	
	
]

{ #category : #'accessing colors' }
CzDayAtTheBeachTheme >> selectionTextColor [
	"^ Color fromString: 'ffd54f'"
	
	^ colorDictionary at: #selectionTextColor
]

{ #category : #'core definition' }
CzDayAtTheBeachTheme >> selectionTextColorDefinition [
	^ Color fromString: 'ffd54f'
]

{ #category : #initialization }
CzDayAtTheBeachTheme >> shStyleTableName [

	^ #daybeachStyleTable
]

{ #category : #'accessing colors' }
CzDayAtTheBeachTheme >> textColor [
	"This is only for all the list and the text except that the selection color can hide it on certain list."
	
	^ colorDictionary at: #textColor
]

{ #category : #'core definition' }
CzDayAtTheBeachTheme >> textColorDefinition [
	"This is only for all the list and the text except that the selection color can hide it on certain list."
	^ Color black
	

]

{ #category : #'sample methods' }
CzDayAtTheBeachTheme >> thisIsATestMethod: arg for: shoutTable [
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
CzDayAtTheBeachTheme >> unfocusedSelectionColor [
	"^ self selectionColor"
	
	^ colorDictionary at: #unfocusedSelectionColor
]

{ #category : #'core definition' }
CzDayAtTheBeachTheme >> windowBorderColorDefinition [
	^ self class darkBaseColor
]

{ #category : #'accessing colors' }
CzDayAtTheBeachTheme >> windowColor [
	
	^ colorDictionary at: #windowColor
]

{ #category : #'core definition' }
CzDayAtTheBeachTheme >> windowColorDefinition [
	"For the bar of calypso and probably the menu"
	
	^ self baseColorDefinition 
]
