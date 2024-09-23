Class {
	#name : 'CzLightSandyConfigurator',
	#superclass : 'LightThemeColorConfigurator',
	#category : 'CozyPalettedThemes-Pale',
	#package : 'CozyPalettedThemes',
	#tag : 'Pale'
}

{ #category : 'colors' }
CzLightSandyConfigurator >> baseColor [

	^ (Color fromHexString: 'FFFCE2') 
]

{ #category : 'colors' }
CzLightSandyConfigurator >> basePassiveBackgroundColor [
	"used for disabled drop and text for example"
	
	^ Color fromHexString: 'FFF9C8'
]

{ #category : 'colors' }
CzLightSandyConfigurator >> darkBaseColor [

	^ "(Color fromHexString: 'E2DCAD')" "Color fromHexString: 'FFF6AF'" 
		Color fromHexString: 'FFF7AF'. Color red
]

{ #category : 'colors' }
CzLightSandyConfigurator >> lightBaseColor [
	
	"Principally use by calypso tabs."
	^ Color fromString: 'E2DCAD'
]

{ #category : 'colors' }
CzLightSandyConfigurator >> lightSelectionColor [

	^ (Color fromHexString: 'C8CEFF')
]
