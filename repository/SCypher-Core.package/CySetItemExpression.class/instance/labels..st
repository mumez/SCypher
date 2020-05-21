accessing
labels: labelNames
	| lstr |
	lstr := String streamContents: [ :str | 
		(self join: ':' in: labelNames) do: [:each | str nextPutAll: each]
	 ].
	self labelString: lstr
	