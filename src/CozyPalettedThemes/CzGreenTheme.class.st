Class {
	#name : 'CzGreenTheme',
	#superclass : 'CzColoredBasedTheme',
	#category : 'CozyPalettedThemes-Strong',
	#package : 'CozyPalettedThemes',
	#tag : 'Strong'
}

{ #category : 'query' }
CzGreenTheme class >> beCurrent [
	<script>
	super beCurrent
]

{ #category : 'configuration' }
CzGreenTheme class >> colorConfiguratorClass [

	^ CzGreenThemeConfigurator
]

{ #category : 'accessing' }
CzGreenTheme class >> themeName [
	^ 'Green Theme'
]

{ #category : 'basic-colors' }
CzGreenTheme >> progressBarProgressFillStyleFor: aProgressBar [
	^ Color fromHexString: '4CAF50'
]
