"
Green with a red selection

CzCherryOnATreeTheme initialize; beCurrent
"
Class {
	#name : #CzCherryOnATreeTheme,
	#superclass : #CzDayAtTheBeachTheme,
	#category : #'CozyPharo8-Code'
}

{ #category : #definitions }
CzCherryOnATreeTheme class >> baseColorDefinition [

	^ Color fromHexString: 'b9f6ca'
]

{ #category : #definitions }
CzCherryOnATreeTheme class >> darkBaseColorDefinition [
	^ Color fromHexString: '69f0ae'

]

{ #category : #definitions }
CzCherryOnATreeTheme class >> lightBaseColorDefinition [

	^ Color fromString: 'f8bbd0'
]

{ #category : #definitions }
CzCherryOnATreeTheme class >> lightSelectionColorDefinition [
	^ Color fromHexString: 'fce4ec'
]

{ #category : #'core definition' }
CzCherryOnATreeTheme >> backgroundColorDefinition [
	"Color for the text background in main editors."
	
	^ (Color fromString: 'fffde7') alphaMixed: 0.25 with: Color white
]

{ #category : #'core definition' }
CzCherryOnATreeTheme >> selectionColorDefinition [

	^ Color fromString: 'fce4ec'
]
