instance creation
of: itemOrItems
	| cypherObj items |
	cypherObj := itemOrItems asCypherObject.
	items := cypherObj isCollection ifTrue: [cypherObj] ifFalse: [CyObjects withAll: {cypherObj}].
	^self new items: items; yourself