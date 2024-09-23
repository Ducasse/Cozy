Class {
	#name : 'CzRedTheme',
	#superclass : 'CzColoredBasedTheme',
	#category : 'CozyPalettedThemes-Strong',
	#package : 'CozyPalettedThemes',
	#tag : 'Strong'
}

{ #category : 'query' }
CzRedTheme class >> beCurrent [
	<script>
	super beCurrent
]

{ #category : 'configuration' }
CzRedTheme class >> colorConfiguratorClass [

	^ CzRedThemeConfigurator
]

{ #category : 'accessing' }
CzRedTheme class >> themeName [
	^ 'Red Theme'
]

{ #category : 'basic-colors' }
CzRedTheme >> progressBarProgressFillStyleFor: aProgressBar [
	"Answer the colour for the given progress bar."

	^ Color red
]
