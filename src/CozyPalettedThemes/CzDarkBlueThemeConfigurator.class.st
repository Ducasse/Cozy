Class {
	#name : 'CzDarkBlueThemeConfigurator',
	#superclass : 'DarkThemeColorConfigurator',
	#category : 'CozyPalettedThemes-Strong',
	#package : 'CozyPalettedThemes',
	#tag : 'Strong'
}

{ #category : 'accessing colors' }
CzDarkBlueThemeConfigurator >> backgroundColor [
	^ Color r: 0.116 g: 0.147 b: 0.210
]

{ #category : 'accessing colors' }
CzDarkBlueThemeConfigurator >> balloonBackgroundColor [

	^ self backgroundColor lighter
]

{ #category : 'accessing' }
CzDarkBlueThemeConfigurator >> baseColor [
	^ Color r: 16r26 g: 16r2f b: 16r49 range: 16rFF
]

{ #category : 'accessing' }
CzDarkBlueThemeConfigurator >> basePassiveBackgroundColor [
	^ self baseColor lighter
]

{ #category : 'accessing' }
CzDarkBlueThemeConfigurator >> baseSelectionColor [
	^ (Color r: 0.243 g: 0.271 b: 0.394 alpha: 1.0)
]

{ #category : 'accessing colors' }
CzDarkBlueThemeConfigurator >> borderColor [
	^ self darkBaseColor adjustBrightness: -0.04
]

{ #category : 'accessing colors' }
CzDarkBlueThemeConfigurator >> buttonColor [
	^ self backgroundColor
]

{ #category : 'accessing' }
CzDarkBlueThemeConfigurator >> darkBaseColor [
	^ self baseColor
]

{ #category : 'fill-styles' }
CzDarkBlueThemeConfigurator >> desktopColor [
	^ self backgroundColor muchDarker
]

{ #category : 'growl - specific' }
CzDarkBlueThemeConfigurator >> growlBorderColorFor: aGrowlMorph [
	^ self borderColor alpha: 0.5
]

{ #category : 'growl - specific' }
CzDarkBlueThemeConfigurator >> growlFillColorFor: aGrowlMorph [
	^ self lightBackgroundColor alpha: 0.5
]

{ #category : 'accessing colors' }
CzDarkBlueThemeConfigurator >> lightBackgroundColor [
	^ Color r: 16r30 g: 16r3b b: 16r4f range: 16rff
]

{ #category : 'accessing' }
CzDarkBlueThemeConfigurator >> lightBaseColor [
	^ self baseColor lighter
]

{ #category : 'accessing' }
CzDarkBlueThemeConfigurator >> lightSelectionColor [
	^ self baseSelectionColor lighter
]

{ #category : 'accessing colors' }
CzDarkBlueThemeConfigurator >> secondarySelectionColor [
	^ self selectionColor alpha: 0.4
]

{ #category : 'accessing colors' }
CzDarkBlueThemeConfigurator >> selectionColor [
	^ self baseSelectionColor lighter
]
