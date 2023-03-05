Class {
	#name : #CZDayAtTheBeachConfigurator,
	#superclass : #LightThemeColorConfigurator,
	#category : #CozyPalettedThemes
}

{ #category : #accessing }
CZDayAtTheBeachConfigurator >> backgroundColor [

	^ (Color fromString: 'fffde7') alphaMixed: 0.25 with: Color white
]

{ #category : #colors }
CZDayAtTheBeachConfigurator >> baseColor [
	^ Color fromHexString: 'b2ebf2'
]

{ #category : #colors }
CZDayAtTheBeachConfigurator >> basePassiveBackgroundColor [

	^ self baseColor lighter
]

{ #category : #colors }
CZDayAtTheBeachConfigurator >> baseSelectionColor [

	^ Color fromHexString: 'ffe082'
]

{ #category : #colors }
CZDayAtTheBeachConfigurator >> darkBaseColor [

	^  Color fromHexString: '80deea'
]

{ #category : #colors }
CZDayAtTheBeachConfigurator >> lightBaseColor [

	^ Color fromString: 'e0f7fa'
]

{ #category : #colors }
CZDayAtTheBeachConfigurator >> lightSelectionColor [

	^ Color fromHexString: 'ffd200'
]

{ #category : #colors }
CZDayAtTheBeachConfigurator >> secondarySelectionColor [

	^ Color fromString: '84ffff'
]

{ #category : #colors }
CZDayAtTheBeachConfigurator >> selectionTextColor [

	^ Color fromString: 'ffd54f'
]

{ #category : #colors }
CZDayAtTheBeachConfigurator >> veryLightSelectionColor [

	^ Color fromHexString: 'ffe700'
]

{ #category : #colors }
CZDayAtTheBeachConfigurator >> windowBorderColor [

	^ self darkBaseColor
]

{ #category : #colors }
CZDayAtTheBeachConfigurator >> windowColor [

	^ self baseColor
]
