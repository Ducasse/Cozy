Class {
	#name : 'CzDarkBlueTheme',
	#superclass : 'PharoDarkTheme',
	#category : 'CozyPalettedThemes-Strong',
	#package : 'CozyPalettedThemes',
	#tag : 'Strong'
}

{ #category : 'query' }
CzDarkBlueTheme class >> beCurrent [

	<script>
	super beCurrent.
	
]

{ #category : 'configuration' }
CzDarkBlueTheme class >> colorConfiguratorClass [

	^ CzDarkBlueThemeConfigurator
]

{ #category : 'class initialization' }
CzDarkBlueTheme class >> initialize [

	
]

{ #category : 'accessing' }
CzDarkBlueTheme class >> themeName [
	^ 'DarkBlue'
]

{ #category : 'border-styles - buttons' }
CzDarkBlueTheme >> buttonNormalBorderStyleFor: aButton [
	"Return the normal button borderStyle for the given button."

	(aButton valueOfProperty: #noBorder ifAbsent: [ false ])
		ifTrue: [
			^ SimpleBorderStyle new
				width: 0;
				baseColor: Color transparent ].

	^ SimpleBorderStyle new
		width: 1;
		baseColor: self buttonColor darker
]

{ #category : 'accessing' }
CzDarkBlueTheme >> shStyleTableName [

	^ #darkBlueStyleTable
]

{ #category : 'fill-styles' }
CzDarkBlueTheme >> windowInactiveFillStyleFor: aWindow [
	"We do not want the lighting effect when the window goes inactive"

	^ SolidFillStyle color: self baseColor slightlyDarker slightlyDarker
]
