instance creation
type: aSymbol operator: operatorString expressions: expressionCollection
	^self new 
		type: aSymbol; operator: operatorString; expressions: (CyObjects withAll: expressionCollection); yourself