Class {
	#name : #CyIndexCommand,
	#superclass : #CyCommand,
	#category : 'SCypher-Core'
}

{ #category : #factory }
CyIndexCommand class >> specifierClass [
	^ CyIndexSpecifier 
]
