Class {
	#name : #BaselineOfCozy,
	#superclass : #BaselineOf,
	#category : #BaselineOfCozy
}

{ #category : #baselines }
BaselineOfCozy >> baseline: spec [
	<baseline>
	
	
	spec for: #'pharo8.x' 
		do: [ 
			spec package: 'CozyCommon'.
			spec package: 'CozyPharo8' with: [ spec requires: #('CozyCommon') ]
			].

	spec for: #'pharo9.x' 
		do: [ 
			spec package: 'CozyCommon9'.
			spec package: 'CozyIceberg'.
			spec package: 'CozyTheme'.
			 ].
		
	spec for: #'pharo10.x' 
		do: [ 
			spec package: 'CozyCommon10'.
			spec package: 'CozyIceberg'.
			spec package: 'CozyTheme'.
			 ].
		
	spec for: #'pharo11.x' 
		do: [ 
			spec package: 'CozyCommon10'.
			spec package: 'CozyIceberg'.
			spec package: 'CozyPalettedThemes'.
			 ].
]

{ #category : #baselines }
BaselineOfCozy >> pharoVersionsFrom: aVersion [
	^ (aVersion to: SystemVersion current major) collect: [ :v | ('pharo' , v asString , '.x') asSymbol ]
]
