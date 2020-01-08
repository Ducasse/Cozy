Extension { #name : #LazyListMorph }

{ #category : #'*CozyPharo8' }
LazyListMorph >> colorForRow: row [ 
	"Answer the color for the row text."
	"I had to overridde this method since the previous definition was not asking the theme
	and was displaying the text of the selected item with the selected color, 
	while the selectorColor is for the background and not for the text.
	
	Here is the previous definition
	
	LazyListMorph >> colorForRow: row 
	
	^ (self isRowSelected: row )
		ifTrue: [ self theme selectionTextColor]
		ifFalse: [ self color]
	
	With it a theme redfining selectionTextColor will get nearly unreadable
	selected item when the distance between the text and the selectionTextColor is not strong enough. 
	
	
	"
	
	^ (self isRowSelected: row )
		ifTrue: [ self theme selectedItemListTextColor  ]
		ifFalse: [ self theme listTextColor ]
]
