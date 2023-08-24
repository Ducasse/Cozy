Extension { #name : #SpCodePresenterTest }

{ #category : #'*CozyFlow' }
SpCodePresenterTest >> testDoBrowseImplementorsOnBrokenSelectorDoesNotOpenAClassBrowser [

	| navigation |
	navigation := SpCodeSystemNavigationMock new.
	presenter systemNavigation: navigation.
	presenter beForScripting.
	self openInstance.

	presenter text: '#degressThatDoesNotExist'.
	presenter kyoDoBrowseImplementors.

	self assert: navigation browseClass equals: nil
]

{ #category : #'*CozyFlow' }
SpCodePresenterTest >> testDoBrowseImplementorsOnBrokenSelectorRepresentingAClassOpensAClassBrowser [

	| navigation |
	navigation := SpCodeSystemNavigationMock new.
	presenter systemNavigation: navigation.
	presenter beForScripting.
	self openInstance.

	presenter text: '#Point23456'.
	presenter kyoDoBrowseImplementors.

	self assert: navigation browseClass equals: nil
]

{ #category : #'*CozyFlow' }
SpCodePresenterTest >> testDoBrowseImplementorsOnSelectorRepresentingAClassOpensAClassBrowser [

	| navigation |
	navigation := SpCodeSystemNavigationMock new.
	presenter systemNavigation: navigation.
	presenter beForScripting.
	self openInstance.

	presenter text: '#Point'.
	presenter kyoDoBrowseImplementors.

	self assert: navigation browseClass equals: Point
]

{ #category : #'*CozyFlow' }
SpCodePresenterTest >> testDoBrowseOnBrokenSelectorDoesNotBrowseTheClass [

	| navigation |
	navigation := SpCodeSystemNavigationMock new.
	presenter systemNavigation: navigation.
	self openInstance.

	presenter text: '#degressThatDoesNotExist'.
	"Selection"
	presenter selectionInterval: (1 to: 6).
	presenter kyoDoBrowseClass.

	self assert: navigation browseClass equals: nil.

	navigation reset.
	"Line"
	presenter cursorPositionIndex: 1.
	presenter selectionInterval: (1 to: 0).
	presenter kyoDoBrowseClass.
	self assert: navigation browseClass equals: nil.

	"Middle of line"
	presenter cursorPositionIndex: 5.
	presenter selectionInterval: (5 to: 4).
	presenter kyoDoBrowseClass.
	self assert: navigation browseClass equals: nil.

	"End of line"
	presenter cursorPositionIndex: 14.
	presenter selectionInterval: (14 to: 13).
	presenter kyoDoBrowseClass.
	self assert: navigation browseClass equals: nil
]

{ #category : #'*CozyFlow' }
SpCodePresenterTest >> testDoBrowseOnBrokenSymbolRepresentingAClassDoesNotBrowseTheClass [

	| navigation |
	navigation := SpCodeSystemNavigationMock new.
	presenter systemNavigation: navigation.
	self openInstance.

	presenter text: '#Point234'.
	"Selection"
	presenter selectionInterval: (1 to: 6).
	presenter kyoDoBrowseClass.

	self assert: navigation browseClass equals: Point.

	navigation reset.
	"Line"
	presenter cursorPositionIndex: 1.
	presenter selectionInterval: (1 to: 0).
	presenter kyoDoBrowseClass.
	self assert: navigation browseClass equals: nil.

	"Middle of line"
	presenter cursorPositionIndex: 5.
	presenter selectionInterval: (5 to: 4).
	presenter kyoDoBrowseClass.
	self assert: navigation browseClass equals: nil.

	"End of line"
	presenter cursorPositionIndex: 14.
	presenter selectionInterval: (14 to: 13).
	presenter kyoDoBrowseClass.
	self assert: navigation browseClass equals: nil
]

{ #category : #'*CozyFlow' }
SpCodePresenterTest >> testDoBrowseOnSelectorOpensAnImplementor [

	| navigation |
	navigation := SpCodeSystemNavigationMock new.
	presenter systemNavigation: navigation.
	self openInstance.

	presenter text: '#~~>'.
	"Selection"
	presenter selectionInterval: (1 to: 4).
	presenter kyoDoBrowseClass.

	self assert: navigation messageList first selector equals: #'~~>'.

	navigation reset.
	"Line"
	presenter cursorPositionIndex: 1.
	presenter selectionInterval: (1 to: 0).
	presenter kyoDoBrowseClass.
	self assert: navigation messageList first selector equals: #'~~>'.

	"Middle of line"
	presenter cursorPositionIndex: 5.
	presenter selectionInterval: (5 to: 4).
	presenter kyoDoBrowseClass.
	self assert: navigation messageList first selector equals: #'~~>'.

	"End of line"
	presenter cursorPositionIndex: 14.
	presenter selectionInterval: (14 to: 13).
	presenter kyoDoBrowseClass.
	self assert: navigation messageList first selector equals: #'~~>'
]

{ #category : #'*CozyFlow' }
SpCodePresenterTest >> testDoBrowseOnSymbolRepresentingAClassBrowsesTheClass [

	| navigation |
	navigation := SpCodeSystemNavigationMock new.
	presenter systemNavigation: navigation.
	self openInstance.

	presenter text: '#Point'.
	"Selection"
	presenter selectionInterval: (1 to: 6).
	presenter kyoDoBrowseClass.

	self assert: navigation browseClass equals: Point.

	navigation reset.
	"Line"
	presenter cursorPositionIndex: 1.
	presenter selectionInterval: (1 to: 0).
	presenter kyoDoBrowseClass.
	self assert: navigation browseClass equals: Point.

	"Middle of line"
	presenter cursorPositionIndex: 5.
	presenter selectionInterval: (5 to: 4).
	presenter kyoDoBrowseClass.
	self assert: navigation browseClass equals: Point.

	"End of line"
	presenter cursorPositionIndex: 14.
	presenter selectionInterval: (14 to: 13).
	presenter kyoDoBrowseClass.
	self assert: navigation browseClass equals: Point
]

{ #category : #'*CozyFlow' }
SpCodePresenterTest >> testSelectedSelectorForScripting2 [
	"Testing border cases to avoid breaking execution. The selector extraction logic should be tested in the extractor class"

	"Code presenter has nil text for some reason"

	| selector |
	presenter text: nil.
	presenter beForScripting.
	selector := presenter selectedSelector.
	self assert: selector isNil.
	presenter text: '#Point'.
	selector := presenter selectedSelector.
	self assert: selector equals: #Point.



]
