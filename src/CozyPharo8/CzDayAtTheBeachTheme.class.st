"
nice links:

	https://www.color-hex.com
	https://www.materialpalette.com/colors
"
Class {
	#name : #CzDayAtTheBeachTheme,
	#superclass : #PharoLightTheme,
	#instVars : [
		'backgroundColor',
		'colorDictionary'
	],
	#category : #CozyPharo8
}

{ #category : #accessing }
CzDayAtTheBeachTheme class >> baseColor [

	^ Color fromHexString: 'b2ebf2'
]

{ #category : #accessing }
CzDayAtTheBeachTheme class >> basePassiveBackgroundColor [
	^ self baseColor lighter
]

{ #category : #accessing }
CzDayAtTheBeachTheme class >> darkBaseColor [
	^ Color fromHexString: '80deea'
]

{ #category : #accessing }
CzDayAtTheBeachTheme class >> lightBaseColor [

	^ (Color fromString: 'e0f7fa')
]

{ #category : #accessing }
CzDayAtTheBeachTheme class >> lightSelectionColor [
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
	^ (Color fromHexString: 'ffe700')
]

{ #category : #'accessing colors' }
CzDayAtTheBeachTheme >> backgroundColor [
	"Color for the text background in main editors."
	
	^ (Color fromString: 'fffde7') alphaMixed: 0.25 with: Color white
]

{ #category : #'accessing colors' }
CzDayAtTheBeachTheme >> borderColor [
	^ self class darkBaseColor adjustBrightness: -0.04
]

{ #category : #unused }
CzDayAtTheBeachTheme >> configureMorphTreeMorph: aMorph [
	aMorph preferedPaneColor: self textColor.
	aMorph 
		rowColorForEven: self backgroundColor
		odd: self backgroundColor.
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

	
	colorDictionary at: #backgroundColor put: ((Color fromString: 'fffde7') alphaMixed: 0.25 with: Color white).
	colorDictionary at: #borderColor put: (self class darkBaseColor adjustBrightness: -0.04).
	colorDictionary at: #scrollbarColor put: self buttonColor.
	colorDictionary at: #listTextColor put: self textColor.
	colorDictionary at: #menuColor put: self baseColor.
	colorDictionary at: #secondarySelectionColor put: (Color fromString: '84ffff').
	colorDictionary at: #selectionTextColor put: (Color fromString: 'ffd54f').
	colorDictionary at: #selectionColor put: (Color fromHexString: 'ffe082').
	
	
	
	colorDictionary at: #listTextColor put: self textColor.
	colorDictionary at: #listTextColor put: self textColor.
	
	
]

{ #category : #shout }
CzDayAtTheBeachTheme >> listTextColor [
	"Answer the list text color to use."

	^ self textColor
]

{ #category : #shout }
CzDayAtTheBeachTheme >> menuColor [
	"For Calypso menu but apparently this does not work for the world menu."
	^ self baseColor
]

{ #category : #shout }
CzDayAtTheBeachTheme >> progressBarProgressFillStyleFor: aProgressBar [
	"Answer the colour for the given progress bar."

	^ self class darkBaseColor
]

{ #category : #'accessing colors' }
CzDayAtTheBeachTheme >> scrollbarColor [ 
	^ self buttonColor
]

{ #category : #shout }
CzDayAtTheBeachTheme >> secondarySelectionColor [
	^ Color fromString: '84ffff'
]

{ #category : #shout }
CzDayAtTheBeachTheme >> selectionColor [
	^ Color fromHexString: 'ffe082'
]

{ #category : #shout }
CzDayAtTheBeachTheme >> selectionTextColor [
	^ Color fromString: 'ffd54f'
]

{ #category : #shout }
CzDayAtTheBeachTheme >> shStyleTableName [

	^ #daybeachStyleTable
]

{ #category : #'accessing colors' }
CzDayAtTheBeachTheme >> textColor [
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
	^ self selectionColor
]
