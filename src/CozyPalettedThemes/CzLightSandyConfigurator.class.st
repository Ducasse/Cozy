Class {
	#name : 'CzLightSandyConfigurator',
	#superclass : 'LightThemeColorConfigurator',
	#category : 'CozyPalettedThemes',
	#package : 'CozyPalettedThemes'
}

{ #category : 'colors' }
CzLightSandyConfigurator >> baseColor [

	^ (Color fromHexString: 'fff9c8')
]

{ #category : 'colors' }
CzLightSandyConfigurator >> basePassiveBackgroundColor [

	^ (Color fromHexString: 'fffce3')
]

{ #category : 'colors' }
CzLightSandyConfigurator >> darkBaseColor [

	^ (Color fromHexString: 'e5d86a') lighter lighter
]

{ #category : 'colors' }
CzLightSandyConfigurator >> lightBaseColor [
	
	"Principally use by calypso tabs."
	^ (Color fromString: 'FFFF8D') lighter lighter
]

{ #category : 'colors' }
CzLightSandyConfigurator >> lightSelectionColor [

	^ (Color fromHexString: 'c8edfd')
]
