Extension { #name : #RPackageOrganizer }

{ #category : #'*CozyCommon' }
RPackageOrganizer class >> includingWith: aString [
	^ self default packages select: [ :p | p name includesSubstring: aString ]
]

{ #category : #'*CozyCommon' }
RPackageOrganizer class >> startingWith: aString [
	^ self default packages select: [ :p | p name beginsWith: aString ]
]
