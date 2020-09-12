Class {
	#name : #CyCreateIndex,
	#superclass : #CyIndexCommand,
	#category : 'SCypher-Core'
}

{ #category : #defaults }
CyCreateIndex >> defaultCommandName [
	^'CREATE'
]
