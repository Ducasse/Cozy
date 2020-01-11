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

	^ Color fromHexString: 'a5d6a7'
]

{ #category : #definitions }
CzCherryOnATreeTheme class >> darkBaseColorDefinition [
	^ Color fromHexString: '00796b'
]

{ #category : #definitions }
CzCherryOnATreeTheme class >> lightBaseColorDefinition [

	^ (Color fromString: 'e0f7fa')
]

{ #category : #definitions }
CzCherryOnATreeTheme class >> lightSelectionColorDefinition [
	^ Color fromHexString: 'ffcdd2'
]

{ #category : #'core definition' }
CzCherryOnATreeTheme >> backgroundColorDefinition [
	"Color for the text background in main editors."
	
	^ (Color fromString: 'fffde7') alphaMixed: 0.25 with: Color white
]
