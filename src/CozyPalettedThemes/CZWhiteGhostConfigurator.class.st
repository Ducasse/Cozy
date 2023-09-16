Class {
	#name : 'CzWhiteGhostConfigurator',
	#superclass : 'LightThemeColorConfigurator',
	#category : 'CozyPalettedThemes',
	#package : 'CozyPalettedThemes'
}

{ #category : 'colors' }
CzWhiteGhostConfigurator >> baseColor [
	
	^ Color fromHexString: '90a4ae'
]

{ #category : 'colors' }
CzWhiteGhostConfigurator >> baseSelectionColor [

	^ self lightSelectionColor
]

{ #category : 'colors' }
CzWhiteGhostConfigurator >> darkBaseColor [
	^ Color fromHexString: '607d8b'
]

{ #category : 'colors' }
CzWhiteGhostConfigurator >> lightBaseColor [
	^ Color fromString: 'cfd8dc'
]

{ #category : 'colors' }
CzWhiteGhostConfigurator >> lightSelectionColor [

	^ (Color fromHexString: 'ffe082') lighter lighter lighter

]
