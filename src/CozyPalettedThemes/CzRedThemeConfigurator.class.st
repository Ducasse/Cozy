Class {
	#name : #CzRedThemeConfigurator,
	#superclass : #ColoredBasedThemeConfigurator,
	#category : #CozyPalettedThemes
}

{ #category : #accessing }
CzRedThemeConfigurator >> baseColor [
	^ Color fromHexString: 'c62828'
]

{ #category : #'accessing colors' }
CzRedThemeConfigurator >> selectionColor [
	^ Color fromHexString: '73264d'
]

{ #category : #'accessing colors' }
CzRedThemeConfigurator >> selectionTextColor [
	^ Color fromHexString: '993366'
]
