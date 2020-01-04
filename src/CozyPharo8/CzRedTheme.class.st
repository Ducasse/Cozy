Class {
	#name : #CzRedTheme,
	#superclass : #CzColoredBasedTheme,
	#category : #CozyPharo8
}

{ #category : #accessing }
CzRedTheme class >> baseColor [
	^ Color fromHexString: '520002'
]

{ #category : #query }
CzRedTheme class >> beCurrent [
	<script>
	super beCurrent
]

{ #category : #accessing }
CzRedTheme class >> themeName [
	^ 'Red Theme'
]

{ #category : #'basic-colors' }
CzRedTheme >> progressBarProgressFillStyleFor: aProgressBar [
	"Answer the colour for the given progress bar."

	^ Color red
]

{ #category : #'accessing colors' }
CzRedTheme >> selectionColor [
	^ Color fromHexString: '73264d'
]

{ #category : #'accessing colors' }
CzRedTheme >> selectionTextColor [
	^ Color fromHexString: '993366'
]
