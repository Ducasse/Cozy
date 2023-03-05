Class {
	#name : #CzCherryOnTreeConfigurator,
	#superclass : #LightThemeColorConfigurator,
	#category : #CozyPalettedThemes
}

{ #category : #accessing }
CzCherryOnTreeConfigurator >> backgroundColor [

	^ (Color fromString: 'fffde7') alphaMixed: 0.25 with: Color white
]

{ #category : #colors }
CzCherryOnTreeConfigurator >> baseColor [
	"pale green b9f6ca, 9CEF23, 92F51E"
	^ (Color fromHexString: '94FF19') alphaMixed: 0.5 with: Color white
]

{ #category : #colors }
CzCherryOnTreeConfigurator >> basePassiveBackgroundColor [

	^ self baseColor lighter
]

{ #category : #colors }
CzCherryOnTreeConfigurator >> baseSelectionColor [

	^ self lightSelectionColor 
]

{ #category : #colors }
CzCherryOnTreeConfigurator >> darkBaseColor [
"69f0ae: darker intense green. Probably to change"
	 "(Color fromHexString: '74C21D') alphaMixed: 0.4 with: Color white."
	((Color fromHexString: '94FF19') alphaMixed: 0.5 with: Color white) darker .
	^ (Color fromHexString: 'BAEB81')
]

{ #category : #colors }
CzCherryOnTreeConfigurator >> lightBaseColor [
	"f8bbd0 pinkish light fce4ec"
	"Color fromString: 'f8bbd0'"
	^ (Color fromHexString: 'FFA3CE') alphaMixed: 0.25 with: Color white
	
]

{ #category : #colors }
CzCherryOnTreeConfigurator >> lightSelectionColor [

	"ligher pinkish f8bbd0"
	"Color fromHexString: 'fce4ec'"
	"^ (Color fromString: 'C25689') alphaMixed: 0.3 with: Color white"
		^ (Color fromHexString: 'FFA3CE') alphaMixed: 0.33 with: Color white
]

{ #category : #colors }
CzCherryOnTreeConfigurator >> secondarySelectionColor [

	^ self darkBaseColor 
]

{ #category : #colors }
CzCherryOnTreeConfigurator >> selectionTextColor [

	^ Color fromString: 'f06292'
]

{ #category : #colors }
CzCherryOnTreeConfigurator >> veryLightSelectionColor [

	^ Color purple
]

{ #category : #colors }
CzCherryOnTreeConfigurator >> windowBorderColor [

	^ self darkBaseColor
]

{ #category : #colors }
CzCherryOnTreeConfigurator >> windowColor [

	^ self baseColor
]
