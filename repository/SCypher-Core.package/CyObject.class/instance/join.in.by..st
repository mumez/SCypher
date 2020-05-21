private
join: separator in: tokens by: convertSelector 
	| all |
	all := OrderedCollection new.
	tokens do: [ :each | | tokenString |
		tokenString := each perform: convertSelector.
		all add: tokenString] separatedBy: [ all add: separator ].
	^all