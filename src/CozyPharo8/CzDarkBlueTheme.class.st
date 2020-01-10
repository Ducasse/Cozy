Class {
	#name : #CzDarkBlueTheme,
	#superclass : #PharoDarkTheme,
	#category : #'CozyPharo8-Code'
}

{ #category : #accessing }
CzDarkBlueTheme class >> baseColor [
	^ Color r: 16r26 g: 16r2f b: 16r49 range: 16rFF
]

{ #category : #accessing }
CzDarkBlueTheme class >> basePassiveBackgroundColor [
	^ self baseColor lighter
]

{ #category : #accessing }
CzDarkBlueTheme class >> baseSelectionColor [
	^ (Color r: 0.243 g: 0.271 b: 0.394 alpha: 1.0)
]

{ #category : #accessing }
CzDarkBlueTheme class >> baseTextColor [
	^ Color white	
]

{ #category : #accessing }
CzDarkBlueTheme class >> darkBaseColor [
	^ self baseColor
]

{ #category : #accessing }
CzDarkBlueTheme class >> lightBaseColor [
	^ self baseColor lighter
]

{ #category : #accessing }
CzDarkBlueTheme class >> lightSelectionColor [
	^ self baseSelectionColor lighter
]

{ #category : #settings }
CzDarkBlueTheme class >> newDefaultSettings [
	self setPreferredPreferences.
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
		"secondarySelectionColor: self veryLightSelectionColor;"
		flatMenu: true
]

{ #category : #accessing }
CzDarkBlueTheme class >> themeName [
	^ 'DarkBlue'
]

{ #category : #'accessing colors' }
CzDarkBlueTheme >> backgroundColor [
	^ Color r: 0.116 g: 0.147 b: 0.210
]

{ #category : #'accessing colors' }
CzDarkBlueTheme >> balloonBackgroundColor [

	^ self backgroundColor lighter
]

{ #category : #'accessing colors' }
CzDarkBlueTheme >> borderColor [
	^ self class darkBaseColor adjustBrightness: -0.04
]

{ #category : #'border-styles' }
CzDarkBlueTheme >> buttonBorderStyleFor: aButton [
	aButton borderStyle: (BorderStyle width: 1 color: self borderColor)
]

{ #category : #'accessing colors' }
CzDarkBlueTheme >> buttonColor [
	^ self backgroundColor
]

{ #category : #'border-styles-buttons' }
CzDarkBlueTheme >> buttonNormalBorderStyleFor: aButton [
	"Return the normal button borderStyle for the given button."
	
	(aButton valueOfProperty: #noBorder ifAbsent: [ false ]) 
		ifTrue: [ 
			^ SimpleBorder new 
				width: 0; 
				baseColor: Color transparent ].
	
	^ SimpleBorder new
		width: 1;
		baseColor: self buttonColor darker
]

{ #category : #'fill-styles' }
CzDarkBlueTheme >> desktopColor [
	^ self backgroundColor muchDarker
]

{ #category : #'growl - specific' }
CzDarkBlueTheme >> growlBorderColorFor: aGrowlMorph [
	^ self borderColor alpha: 0.5 
]

{ #category : #'growl - specific' }
CzDarkBlueTheme >> growlFillColorFor: aGrowlMorph [
	^ self lightBackgroundColor alpha: 0.5 
]

{ #category : #'accessing colors' }
CzDarkBlueTheme >> lightBackgroundColor [
	^ Color r: 16r30 g: 16r3b b: 16r4f range: 16rff

]

{ #category : #'accessing colors' }
CzDarkBlueTheme >> secondarySelectionColor [
	^ self selectionColor alpha: 0.4
]

{ #category : #'accessing colors' }
CzDarkBlueTheme >> selectionColor [
	^ self class baseSelectionColor
]

{ #category : #'fill-styles' }
CzDarkBlueTheme >> windowInactiveFillStyleFor: aWindow [
	"We do not want the lighting effect when the window goes inactive"

	^ SolidFillStyle color: self class baseColor slightlyDarker slightlyDarker
]
