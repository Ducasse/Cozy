Class {
	#name : 'CzSandyConfigurator',
	#superclass : 'LightThemeColorConfigurator',
	#category : 'CozyPalettedThemes',
	#package : 'CozyPalettedThemes'
}

{ #category : 'colors' }
CzSandyConfigurator >> baseColor [

	^ (Color fromHexString: 'FFF176') 
]

{ #category : 'colors' }
CzSandyConfigurator >> basePassiveBackgroundColor [

	^ self baseColor lighter
]

{ #category : 'colors' }
CzSandyConfigurator >> darkBaseColor [

	^ Color fromHexString: 'FFF9c4'
]

{ #category : 'colors' }
CzSandyConfigurator >> lightBaseColor [
	
	"Principally use by calypso tabs."
	^ (Color fromString: 'FFFF8D') lighter
]

{ #category : 'colors' }
CzSandyConfigurator >> lightSelectionColor [

	^ Color fromHexString: 'c8edfd'
]
