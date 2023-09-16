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
	#name : 'CzPinkTheme',
	#superclass : 'CzColoredBasedTheme',
	#category : 'CozyPalettedThemes',
	#package : 'CozyPalettedThemes'
}

{ #category : 'query' }
CzPinkTheme class >> beCurrent [
	<script>
	super beCurrent
]

{ #category : 'configuration' }
CzPinkTheme class >> colorConfiguratorClass [

	^ CzPinkThemeConfigurator
]

{ #category : 'accessing' }
CzPinkTheme class >> themeName [
	^ 'Pink Theme'
]

{ #category : 'fill-styles' }
CzPinkTheme >> progressBarProgressFillStyleFor: aProgressBar [
	"Answer the colour for the given progress bar."

	^ Color pink
]
