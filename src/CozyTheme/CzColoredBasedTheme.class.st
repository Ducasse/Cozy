Class {
	#name : #CzColoredBasedTheme,
	#superclass : #PharoDarkTheme,
	#category : #CozyTheme
}

{ #category : #accessing }
CzColoredBasedTheme class >> baseColor [
	^ self subclassResponsibility
]

{ #category : #accessing }
CzColoredBasedTheme class >> basePassiveBackgroundColor [
	^ self baseColor lighter
]

{ #category : #query }
CzColoredBasedTheme class >> beCurrent [
	super beCurrent.
	CzCommonSettings setFastDragging
]

{ #category : #accessing }
CzColoredBasedTheme class >> darkBaseColor [
	^ self baseColor darker
]

{ #category : #accessing }
CzColoredBasedTheme class >> isAbstract [
	^ self = CzColoredBasedTheme
]

{ #category : #accessing }
CzColoredBasedTheme class >> lightBaseColor [
	^ self baseColor lighter
]

{ #category : #'accessing colors' }
CzColoredBasedTheme >> backgroundColor [
	^ self baseColor muchDarker
]

{ #category : #'accessing colors' }
CzColoredBasedTheme >> borderColor [
	^ self class darkBaseColor adjustBrightness: -0.04
]

{ #category : #'glamour shit' }
CzColoredBasedTheme >> brickThemer [
	^ GLMBrickThemer new
]

{ #category : #'border-styles' }
CzColoredBasedTheme >> buttonBorderStyleFor: aButton [
	aButton borderStyle: (BorderStyle width: 1 color: self borderColor)
]

{ #category : #'accessing colors' }
CzColoredBasedTheme >> buttonColor [
	^ self baseColor darker
]

{ #category : #'accessing colors' }
CzColoredBasedTheme >> lightBackgroundColor [ 
	^ self backgroundColor lighter
]

{ #category : #'fill-styles' }
CzColoredBasedTheme >> progressBarProgressFillStyleFor: aProgressBar [
	^ self subclassResponsibility
]

{ #category : #'accessing colors' }
CzColoredBasedTheme >> secondarySelectionColor [
	^ self selectionTextColor alpha: 0.4
]

{ #category : #'accessing colors' }
CzColoredBasedTheme >> selectionColor [
	^ self subclassResponsibility
]

{ #category : #'accessing colors' }
CzColoredBasedTheme >> selectionTextColor [
	^ self selectionColor darker
]

{ #category : #'fill-styles-taskbar' }
CzColoredBasedTheme >> taskbarFillStyleFor: aTaskbar [
	^ SolidFillStyle color: (self backgroundColor muchDarker alpha: 0.8)
]

{ #category : #'accessing colors' }
CzColoredBasedTheme >> windowColor [
	^ self baseColor
]
