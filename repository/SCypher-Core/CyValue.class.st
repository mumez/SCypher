Class {
	#name : #CyValue,
	#superclass : #CyObject,
	#category : 'SCypher-Core'
}

{ #category : #converting }
CyValue >> tokenArray [
	^{self value cypherValueString}
]
