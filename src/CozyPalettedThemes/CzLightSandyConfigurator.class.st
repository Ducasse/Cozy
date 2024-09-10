Class {
	#name : 'CzLightSandyConfigurator',
	#superclass : 'LightThemeColorConfigurator',
	#category : 'CozyPalettedThemes',
	#package : 'CozyPalettedThemes'
}

{ #category : 'colors' }
CzLightSandyConfigurator >> baseColor [

	^ (Color fromHexString: 'FFFCE2') 
]

{ #category : 'colors' }
CzLightSandyConfigurator >> basePassiveBackgroundColor [

	^ (Color fromHexString: 'FFF9C8')
]

{ #category : 'colors' }
CzLightSandyConfigurator >> darkBaseColor [

	^ "(Color fromHexString: 'E2DCAD')" "Color fromHexString: 'FFF6AF'" 
		Color fromHexString: 'FFF7AF'. Color red
]

{ #category : 'colors' }
CzLightSandyConfigurator >> lightBaseColor [
	
	"Principally use by calypso tabs."
	^ "(Color fromString: 'E2DCAD')" Color fromString: 'FFF7AF'
]

{ #category : 'colors' }
CzLightSandyConfigurator >> lightSelectionColor [

	^ (Color fromHexString: 'C8CEFF')
]