Class {
	#name : #CzBlueTheme,
	#superclass : #CzColoredBasedTheme,
	#category : #CozyPharo8
}

{ #category : #accessing }
CzBlueTheme class >> baseColor [
	^ "Color fromHexString: '6DA1FC' "Color fromHexString: '6495ED'
]

{ #category : #query }
CzBlueTheme class >> beCurrent [
	<script>
	super beCurrent
]

{ #category : #accessing }
CzBlueTheme class >> themeName [
	^ 'Blue Theme'
]

{ #category : #'basic-colors' }
CzBlueTheme >> progressBarProgressFillStyleFor: aProgressBar [
	"Answer the colour for the given progress bar."

	^ self class baseColor
]

{ #category : #'accessing colors' }
CzBlueTheme >> selectionColor [
	^ Color fromHexString: 'EB9A3F'
]

{ #category : #'accessing colors' }
CzBlueTheme >> selectionTextColor [
	^ Color fromHexString: 'D58326'
]
