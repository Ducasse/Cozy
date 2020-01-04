Class {
	#name : #BaselineOfCozy,
	#superclass : #BaselineOf,
	#category : #BaselineOfCozy
}

{ #category : #baselines }
BaselineOfCozy >> baseline: spec [
	<baseline>
	spec for: #common do: [ spec package: 'CozyCommon' ].

	"This one is from the removal of BlueInk and GTEventRecorder."
	"spec for: #(#'pharo5.x' #'pharo6.x' #'Pharo7.x') do: [ spec package: 'PharoSettingsUpTo7' with: [ spec requires: #('PharoSettings') ] ].

	spec for: (self pharoVersionsFrom: 5) do: [ spec package: 'PharoSettings5' with: [ spec requires: #('PharoSettings') ] ].
	spec for: (self pharoVersionsFrom: 6) do: [ spec package: 'PharoSettings6' with: [ spec requires: #('PharoSettings') ] ].
	spec for: (self pharoVersionsFrom: 7) do: [ spec package: 'PharoSettings7' with: [ spec requires: #('PharoSettings' 'PharoSettings6')  ] ]."
 
	spec package: 'CozyPharo8' with: [ spec requires: #('CozyCommon') ]
]

{ #category : #baselines }
BaselineOfCozy >> pharoVersionsFrom: aVersion [
	^ (aVersion to: SystemVersion current major) collect: [ :v | ('pharo' , v asString , '.x') asSymbol ]
]
