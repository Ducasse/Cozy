"
Description
--------------------

One line summary. For example, ""I represent a paragraph of text"".

Three sentences about my main responsibilities - what I do, what I know.

State my main collaborators and one line about how I interact with them.

Public API and Key Messages
--------------------

- #
- #
- #

Examples
--------------------



Internal Representation and Key Implementation Points.
--------------------

"
Class {
	#name : #CzPinkThemeConfigurator,
	#superclass : #ColoredBasedThemeConfigurator,
	#category : #CozyPalettedThemes
}

{ #category : #accessing }
CzPinkThemeConfigurator >> baseColor [
	^ Color fromHexString: 'c2185b'
]

{ #category : #'accessing colors' }
CzPinkThemeConfigurator >> selectionColor [
	^ Color fromHexString: '73264d'
]

{ #category : #'accessing colors' }
CzPinkThemeConfigurator >> selectionTextColor [
	^ Color fromHexString: '993366'
]
