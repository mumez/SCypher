Class {
	#name : #CyConstraint,
	#superclass : #CyObject,
	#instVars : [
		'type',
		'on',
		'assert'
	],
	#category : 'SCypher-Core'
}

{ #category : #accessing }
CyConstraint >> assert [
	^ assert
]

{ #category : #accessing }
CyConstraint >> assert: assertion [
	^ assert := assertion
]

{ #category : #actions }
CyConstraint >> exists [
	^self type: #exists
]

{ #category : #accessing }
CyConstraint >> on [
	^ on
]

{ #category : #accessing }
CyConstraint >> on: target [
	on := target
]

{ #category : #accessing }
CyConstraint >> type [
	^ type
]

{ #category : #accessing }
CyConstraint >> type: anObject [
	"#unique, #exists"
	type := anObject
]

{ #category : #actions }
CyConstraint >> unique [
	^self type: #unique
]
