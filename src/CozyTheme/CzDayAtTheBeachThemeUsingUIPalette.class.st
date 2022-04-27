"
I'm in the process of using a UIPalette
"
Class {
	#name : #CzDayAtTheBeachThemeUsingUIPalette,
	#superclass : #PharoLightTheme,
	#instVars : [
		'uiPalette'
	],
	#classVars : [
		'Palette'
	],
	#category : #'CozyTheme-fullyExperimentalBroken'
}

{ #category : #accessing }
CzDayAtTheBeachThemeUsingUIPalette class >> baseColor [

	^ Palette baseColor
]

{ #category : #accessing }
CzDayAtTheBeachThemeUsingUIPalette class >> basePassiveBackgroundColor [
	^ Palette basePassiveBackgroundColor
]

{ #category : #accessing }
CzDayAtTheBeachThemeUsingUIPalette class >> darkBaseColor [
	^ Palette darkBaseColor
]

{ #category : #initialization }
CzDayAtTheBeachThemeUsingUIPalette class >> initialize [ 
	"self initialize"
	
	super initialize. 
	Palette := UIThemePalette new.
	"UI manager is plain bad. Why forcing to duplicate everything on class and instance side.
	what a shitty idea.
	"
]

{ #category : #initialization }
CzDayAtTheBeachThemeUsingUIPalette class >> initializeDefault [
	self resetDefaultSettings

]

{ #category : #accessing }
CzDayAtTheBeachThemeUsingUIPalette class >> lightBaseColor [

	^ Palette lightBaseColor
]

{ #category : #accessing }
CzDayAtTheBeachThemeUsingUIPalette class >> lightSelectionColor [

	^ Palette lightSelectionColor
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
	^ 'Day at the Beach 2'
]

{ #category : #accessing }
CzDayAtTheBeachThemeUsingUIPalette class >> veryLightSelectionColor [
	^ Palette veryLightSelectionColor
]

{ #category : #'accessing colors' }
CzDayAtTheBeachThemeUsingUIPalette >> backgroundColor [
	"Color for the text background in main editors."
	
	^ uiPalette backgroundColor
]

{ #category : #'accessing colors' }
CzDayAtTheBeachThemeUsingUIPalette >> borderColor [
	^ uiPalette borderColor
]

{ #category : #custom }
CzDayAtTheBeachThemeUsingUIPalette >> configureWindowBorderFor: aWindow [
	"this is to handle correctly the window border."
	| aStyle |
	aStyle := SimpleBorder new 
					color: self windowBorderColor;
					width: 1.
	aWindow borderStyle: aStyle
]

{ #category : #initialization }
CzDayAtTheBeachThemeUsingUIPalette >> initialize [
	super initialize.
	uiPalette := Palette.
	"the default one for now is the one of day at the beach. 
	In the future we will see how we can get colors loaded in a palette"

	settings menuColor: self baseColor.
	
]

{ #category : #'accessing colors' }
CzDayAtTheBeachThemeUsingUIPalette >> listTextColor [
	"Answer the list text color to use."

	^ uiPalette listTextColor
]

{ #category : #'accessing colors' }
CzDayAtTheBeachThemeUsingUIPalette >> menuColor [
	"For Calypso menu but apparently this does not work for the world menu."

	^ uiPalette menuColor
]

{ #category : #custom }
CzDayAtTheBeachThemeUsingUIPalette >> progressBarProgressFillStyleFor: aProgressBar [
	"Answer the colour for the given progress bar."

	^ uiPalette darkBaseColor
]

{ #category : #'accessing colors' }
CzDayAtTheBeachThemeUsingUIPalette >> scrollbarColor [

	^ uiPalette scrollbarColor
]

{ #category : #'accessing colors' }
CzDayAtTheBeachThemeUsingUIPalette >> secondarySelectionColor [
	^ uiPalette secondarySelectionColor
]

{ #category : #'accessing colors' }
CzDayAtTheBeachThemeUsingUIPalette >> selectionColor [
	
	^ uiPalette selectionColor
]

{ #category : #'accessing colors' }
CzDayAtTheBeachThemeUsingUIPalette >> selectionTextColor [
	
	^ uiPalette selectionTextColor
]

{ #category : #initialization }
CzDayAtTheBeachThemeUsingUIPalette >> shStyleTableName [

	^ #daybeachStyleTable
]

{ #category : #'accessing colors' }
CzDayAtTheBeachThemeUsingUIPalette >> textColor [
	"This is only for all the list and the text except that the selection color can hide it on certain list."
	
	^ uiPalette textColor
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
	
	^ uiPalette unfocusedSelectionColor
]

{ #category : #'accessing colors' }
CzDayAtTheBeachThemeUsingUIPalette >> windowBorderColor [
	
	^ uiPalette windowBorderColor
]

{ #category : #'accessing colors' }
CzDayAtTheBeachThemeUsingUIPalette >> windowColor [
	
	^ uiPalette windowColor
]
