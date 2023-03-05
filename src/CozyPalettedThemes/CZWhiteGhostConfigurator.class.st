Class {
	#name : #CZWhiteGhostConfigurator,
	#superclass : #LightThemeColorConfigurator,
	#category : #CozyPalettedThemes
}

{ #category : #colors }
CZWhiteGhostConfigurator >> baseColor [
	
	^ Color fromHexString: '90a4ae'
]

{ #category : #colors }
CZWhiteGhostConfigurator >> darkBaseColor [
	^ Color fromHexString: '607d8b'
]

{ #category : #colors }
CZWhiteGhostConfigurator >> lightBaseColor [
	^ Color fromString: 'cfd8dc'
]

{ #category : #colors }
CZWhiteGhostConfigurator >> lightSelectionColor [

	^ Color fromHexString: 'ffe082'
]
