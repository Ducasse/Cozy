Class {
	#name : #CzGreenTheme,
	#superclass : #CzColoredBasedTheme,
	#category : #CozyTheme
}

{ #category : #accessing }
CzGreenTheme class >> baseColor [
	^ Color fromHexString: '1F774D'
]

{ #category : #query }
CzGreenTheme class >> beCurrent [
	<script>
	super beCurrent
]

{ #category : #accessing }
CzGreenTheme class >> themeName [
	^ 'Green Theme'
]

{ #category : #'basic-colors' }
CzGreenTheme >> progressBarProgressFillStyleFor: aProgressBar [
	^ Color fromHexString: '4CAF50'
]

{ #category : #'accessing colors' }
CzGreenTheme >> selectionColor [
	^ Color fromHexString: '1F774D'
]
