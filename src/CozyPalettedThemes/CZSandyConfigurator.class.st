Class {
	#name : #CZSandyConfigurator,
	#superclass : #LightThemeColorConfigurator,
	#category : #CozyPalettedThemes
}

{ #category : #colors }
CZSandyConfigurator >> baseColor [

	^ (Color fromHexString: 'FFF176') 
]

{ #category : #colors }
CZSandyConfigurator >> basePassiveBackgroundColor [

	^ self baseColor lighter
]

{ #category : #colors }
CZSandyConfigurator >> darkBaseColor [

	^ Color fromHexString: 'FFF9c4'
]

{ #category : #colors }
CZSandyConfigurator >> lightBaseColor [
	
	"Principally use by calypso tabs."
	^ (Color fromString: 'FFFF8D') lighter
]

{ #category : #colors }
CZSandyConfigurator >> lightSelectionColor [

	^ Color fromHexString: 'e1f5fe'
]
