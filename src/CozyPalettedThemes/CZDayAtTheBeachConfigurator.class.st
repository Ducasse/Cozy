Class {
	#name : 'CzDayAtTheBeachConfigurator',
	#superclass : 'LightThemeColorConfigurator',
	#category : 'CozyPalettedThemes',
	#package : 'CozyPalettedThemes'
}

{ #category : 'accessing' }
CzDayAtTheBeachConfigurator >> backgroundColor [

	^ (Color fromString: 'fffde7') alphaMixed: 0.25 with: Color white
]

{ #category : 'colors' }
CzDayAtTheBeachConfigurator >> baseColor [
	^ Color fromHexString: 'b2ebf2'
]

{ #category : 'colors' }
CzDayAtTheBeachConfigurator >> basePassiveBackgroundColor [

	^ self baseColor lighter
]

{ #category : 'colors' }
CzDayAtTheBeachConfigurator >> baseSelectionColor [

	^ Color fromHexString: 'ffe082'
]

{ #category : 'colors' }
CzDayAtTheBeachConfigurator >> darkBaseColor [

	^  Color fromHexString: '80deea'
]

{ #category : 'colors' }
CzDayAtTheBeachConfigurator >> lightBaseColor [

	^ Color fromString: 'e0f7fa'
]

{ #category : 'colors' }
CzDayAtTheBeachConfigurator >> lightSelectionColor [

	^ Color fromHexString: 'ffd200'
]

{ #category : 'colors' }
CzDayAtTheBeachConfigurator >> secondarySelectionColor [

	^ Color fromString: '84ffff'
]

{ #category : 'colors' }
CzDayAtTheBeachConfigurator >> selectionTextColor [

	^ Color fromString: 'ffd54f'
]

{ #category : 'colors' }
CzDayAtTheBeachConfigurator >> veryLightSelectionColor [

	^ Color fromHexString: 'ffe700'
]

{ #category : 'colors' }
CzDayAtTheBeachConfigurator >> windowBorderColor [

	^ self darkBaseColor
]

{ #category : 'colors' }
CzDayAtTheBeachConfigurator >> windowColor [

	^ self baseColor
]
