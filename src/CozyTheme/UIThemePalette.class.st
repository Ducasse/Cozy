Class {
	#name : #UIThemePalette,
	#superclass : #Object,
	#instVars : [
		'colorDictionary'
	],
	#classInstVars : [
		'colorDictionary'
	],
	#category : #CozyTheme
}

{ #category : #'accessing colors' }
UIThemePalette >> backgroundColor [
	"Color for the text background in main editors."
	
	^ colorDictionary at: #backgroundColor
]

{ #category : #'core definition' }
UIThemePalette >> backgroundColorDefinition [
	"Color for the text background in main editors.
	fffde7 is white with a little of yellow but really little"

	^ (Color fromString: 'fffde7') alphaMixed: 0.25 with: Color white
]

{ #category : #'accessing colors' }
UIThemePalette >> baseColor [

	^ colorDictionary at: #baseColor
]

{ #category : #'core definition' }
UIThemePalette >> baseColorDefinition [

	^ Color fromHexString: 'b2ebf2'
]

{ #category : #'core definition' }
UIThemePalette >> basePassiveBackgroundColorDefinition [
	^ self baseColorDefinition lighter
]

{ #category : #'accessing colors' }
UIThemePalette >> borderColor [
	^ colorDictionary at: #borderColor
]

{ #category : #'core definition' }
UIThemePalette >> borderColorDefinition [

	^ self darkBaseColorDefinition adjustBrightness: -0.04
]

{ #category : #'accessing colors' }
UIThemePalette >> buttonColor [
	^ self backgroundColor lighter lighter
]

{ #category : #'core definition' }
UIThemePalette >> buttonColorDefinition [

	^ self backgroundColorDefinition lighter lighter
]

{ #category : #'accessing colors' }
UIThemePalette >> darkBaseColor [
	^ colorDictionary at: #darkBaseColor
]

{ #category : #'core definition' }
UIThemePalette >> darkBaseColorDefinition [
	^ Color fromHexString: '80deea'
]

{ #category : #initialization }
UIThemePalette >> initialize [
	super initialize.
	colorDictionary := Dictionary new.
	self initializeColors.
	
	
]

{ #category : #initialization }
UIThemePalette >> initializeColors [
	
	| colorDefs  |
	colorDefs := self class selectors select: [ :each | each endsWith: 'Definition'].
	colorDefs do: [:d | colorDictionary at: (d allButLast: 'Definition') put: (self perform: d) ].
	
]

{ #category : #'accessing colors' }
UIThemePalette >> lightBaseColor [

	^ colorDictionary at: #lightBaseColor
]

{ #category : #'core definition' }
UIThemePalette >> lightBaseColorDefinition [

	^ (Color fromString: 'e0f7fa')
]

{ #category : #'accessing colors' }
UIThemePalette >> lightSelectionColor [

	^ colorDictionary at: #lightSelectionColor
]

{ #category : #'core definition' }
UIThemePalette >> lightSelectionColorDefinition [
	^ Color fromHexString: 'ffd200'
]

{ #category : #'accessing colors' }
UIThemePalette >> listTextColor [
	"Answer the list text color to use."

	^ colorDictionary at: #listTextColor
]

{ #category : #'core definition' }
UIThemePalette >> listTextColorDefinition [
	"Answer the list text color to use."

	^ self textColorDefinition
]

{ #category : #'accessing colors' }
UIThemePalette >> menuColor [
	"For Calypso menu but apparently this does not work for the world menu."

	^ colorDictionary at: #menuColor
]

{ #category : #'core definition' }
UIThemePalette >> menuColorDefinition [
	"For Calypso menu but apparently this does not work for the world menu."

	^ self baseColorDefinition
]

{ #category : #'accessing colors' }
UIThemePalette >> scrollbarColor [

	^ colorDictionary at: #scrollbarColor
]

{ #category : #'core definition' }
UIThemePalette >> scrollbarColorDefinition [
	^ self buttonColorDefinition
]

{ #category : #'accessing colors' }
UIThemePalette >> secondarySelectionColor [
	^ colorDictionary at: #secondarySelectionColor
]

{ #category : #'core definition' }
UIThemePalette >> secondarySelectionColorDefinition [
	^ Color fromString: '84ffff'
	

]

{ #category : #'accessing colors' }
UIThemePalette >> selectionColor [
	"^ Color fromHexString: 'ffe082'"
	
	^ colorDictionary at: #selectionColor
]

{ #category : #'accessing colors' }
UIThemePalette >> selectionColorDefinition [
	^ Color fromHexString: 'ffe082'
	
	
]

{ #category : #'accessing colors' }
UIThemePalette >> selectionTextColor [
	"^ Color fromString: 'ffd54f'"
	
	^ colorDictionary at: #selectionTextColor
]

{ #category : #'core definition' }
UIThemePalette >> selectionTextColorDefinition [
	^ Color fromString: 'ffd54f'
]

{ #category : #initialization }
UIThemePalette >> shStyleTableName [

	^ #daybeachStyleTable
]

{ #category : #'accessing colors' }
UIThemePalette >> textColor [
	"This is only for all the list and the text except that the selection color can hide it on certain list."
	
	^ colorDictionary at: #textColor
]

{ #category : #'core definition' }
UIThemePalette >> textColorDefinition [
	"This is only for all the list and the text except that the selection color can hide it on certain list."
	^ Color black
	

]

{ #category : #'sample methods' }
UIThemePalette >> thisIsATestMethod: arg for: shoutTable [
	"comment stating purpose of instance-side message"
	"scope: class-variables  &  instance-variables"	
			
	| temporary names |
	self printString.
	forms select: [ :each | |tmp| 
			each printString].
	true. 
	self focusIndicat
	false. 
	names := 33.
	{ 1. $a. #aSymbol } do: [ :each | self printString ].
	^ self
]

{ #category : #'accessing colors' }
UIThemePalette >> unfocusedSelectionColor [
	"^ self selectionColor"
	
	^ colorDictionary at: #unfocusedSelectionColor
]

{ #category : #'accessing colors' }
UIThemePalette >> unfocusedSelectionColorDefinition [
	
	^ Color gray
]

{ #category : #'accessing colors' }
UIThemePalette >> veryLightSelectionColor [
	^ colorDictionary at: #veryLightSelectionColor
]

{ #category : #'core definition' }
UIThemePalette >> veryLightSelectionColorDefinition [
	^ Color fromHexString: 'ffe700'
]

{ #category : #'core definition' }
UIThemePalette >> windowBorderColor [

	^ colorDictionary at: self darkBaseColorDefinition
]

{ #category : #'core definition' }
UIThemePalette >> windowBorderColorDefinition [
	^ self darkBaseColorDefinition
]

{ #category : #'accessing colors' }
UIThemePalette >> windowColor [
	
	^ colorDictionary at: #windowColor
]

{ #category : #'core definition' }
UIThemePalette >> windowColorDefinition [
	"For the bar of calypso and probably the menu"
	
	^ self baseColorDefinition 
]
