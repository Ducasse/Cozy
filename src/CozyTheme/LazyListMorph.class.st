"
The morph that displays the list in a PluggableListMorph.  It is ""lazy"" because it will only request the list items that it actually needs to display.

I will cache the maximum width of my items in maxWidth to avoid this potentially expensive and frequent computation.
"
Class {
	#name : #LazyListMorph,
	#superclass : #Morph,
	#instVars : [
		'listItems',
		'font',
		'selectedRow',
		'selectedRows',
		'listSource',
		'maxWidth'
	],
	#category : #CozyTheme
}

{ #category : #'*CozyTheme' }
LazyListMorph >> colorForRow: row [ 
	"Answer the color for the row text."
	^ (self isRowSelected: row )
		ifTrue: [ self theme selectionTextColor ]
		ifFalse: [ self theme listTextColor  ]
]
