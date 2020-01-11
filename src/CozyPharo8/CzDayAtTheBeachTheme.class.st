"
A blue theme within sandy selection

nice links:

	https://www.color-hex.com
	https://www.materialpalette.com/colors
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
	#category : #'CozyPharo8-Code'
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
	^ self baseColor lighter
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
	colorDictionary := Dictionary new. 
	self initializeColors
]

{ #category : #initialization }
CzDayAtTheBeachTheme class >> initializeColors [

	colorDictionary at: #baseColor put: self baseColorDefinition.
	colorDictionary at: #basePassiveBackgroundColor put: self basePassiveBackgroundColorDefinition.
	colorDictionary at: #darkBaseColor put: self darkBaseColorDefinition.
	colorDictionary at: #lightBaseColor put: self lightBaseColorDefinition.
	colorDictionary at: #lightSelectionColor put: self lightSelectionColorDefinition.
	colorDictionary at: #veryLightSelectionColor put: self veryLightSelectionColorDefinition 

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
		menuTitleColor: self darkBaseColor
	"
	
	^ super newDefaultSettings
		menuColor: self baseColor;
		menuTitleColor: self baseColor;
		windowColor: self baseColor;
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
	"Color for the text background in main editors."
	
	^ (Color fromString: 'fffde7') alphaMixed: 0.25 with: Color white
]

{ #category : #'accessing colors' }
CzDayAtTheBeachTheme >> borderColor [
	^ colorDictionary at: #borderColor
]

{ #category : #'core definition' }
CzDayAtTheBeachTheme >> borderColorDefinition [

	^ self class darkBaseColor adjustBrightness: -0.04
]

{ #category : #unused }
CzDayAtTheBeachTheme >> configurePluggableTextMorph: textMorph [ 
	textMorph 	
		color: self backgroundColor;
		textColor: self textColor;
		borderWidth: 1.
]

{ #category : #unused }
CzDayAtTheBeachTheme >> configureWindowBorderFor: aWindow [

	| aStyle |
	aStyle := SimpleBorder new 
					color: self darkBaseColor;
					width: 1.
	aWindow borderStyle: aStyle
]

{ #category : #initialization }
CzDayAtTheBeachTheme >> initialize [

	super initialize. 
	colorDictionary := Dictionary new.
	settings menuColor: self baseColor.
	self initializeColors
]

{ #category : #initialization }
CzDayAtTheBeachTheme >> initializeColors [
	colorDictionary
		at: #backgroundColor
		put: self backgroundColorDefinition.
	colorDictionary
		at: #borderColor
		put: self borderColorDefinition.
	colorDictionary 
		at: #scrollbarColor 
		put: self scrollbarColorDefinition.
	colorDictionary 
		at: #textColor 
		put: self textColorDefinition.
	
	colorDictionary at: #listTextColor put: self textColor.
	colorDictionary at: #menuColor put: self baseColor.
	colorDictionary
		at: #secondarySelectionColor
		put: (Color fromString: '84ffff').
	colorDictionary
		at: #selectionTextColor
		put: (Color fromString: 'ffd54f').
	colorDictionary
		at: #selectionColor
		put: (Color fromHexString: 'ffe082').
	colorDictionary
		at: #unfocusedSelectionColor
		put: self selectionTextColor
]

{ #category : #shout }
CzDayAtTheBeachTheme >> listTextColor [
	"Answer the list text color to use."

	"^ self textColor"
	^ colorDictionary at: #listTextColor
]

{ #category : #'core definition' }
CzDayAtTheBeachTheme >> listTextColorDefinition [
	"Answer the list text color to use."

	^ self textColor
]

{ #category : #shout }
CzDayAtTheBeachTheme >> menuColor [
	"For Calypso menu but apparently this does not work for the world menu."
	"^ self baseColor"
	
	^ colorDictionary at: #menuColor
]

{ #category : #'core definition' }
CzDayAtTheBeachTheme >> menuColorDefinition [
	"For Calypso menu but apparently this does not work for the world menu."
	"^ self baseColor"
	
	^ colorDictionary at: #menuColor
]

{ #category : #shout }
CzDayAtTheBeachTheme >> progressBarProgressFillStyleFor: aProgressBar [
	"Answer the colour for the given progress bar."

	^ self class darkBaseColor
]

{ #category : #'accessing colors' }
CzDayAtTheBeachTheme >> scrollbarColor [ 
	"^ self buttonColor"
	^ colorDictionary at: #backgroundColor
]

{ #category : #'core definition' }
CzDayAtTheBeachTheme >> scrollbarColorDefinition [
	^ self buttonColor
]

{ #category : #shout }
CzDayAtTheBeachTheme >> secondarySelectionColor [
	"^ Color fromString: '84ffff'"
	
	^ colorDictionary at: #secondarySelectionColor
]

{ #category : #'core definition' }
CzDayAtTheBeachTheme >> secondarySelectionColorDefinition [
	"^ Color fromString: '84ffff'"
	
	^ colorDictionary at: #secondarySelectionColor
]

{ #category : #shout }
CzDayAtTheBeachTheme >> selectionColor [
	"^ Color fromHexString: 'ffe082'"
	
	^ colorDictionary at: #selectionColor
]

{ #category : #shout }
CzDayAtTheBeachTheme >> selectionTextColor [
	"^ Color fromString: 'ffd54f'"
	
	^ colorDictionary at: #selectionTextColor
]

{ #category : #'core definition' }
CzDayAtTheBeachTheme >> selectionTextColorDefinition [
	"^ Color fromString: 'ffd54f'"
	
	^ colorDictionary at: #selectionTextColor
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
