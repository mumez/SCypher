Class {
	#name : #CyNode,
	#superclass : #CyObject,
	#instVars : [
		'props',
		'labels'
	],
	#category : #'SCypher-Core'
}

{ #category : #'instance creation' }
CyNode class >> name: nodeName label: label [
	^self name: nodeName labels: { label }
]

{ #category : #'instance creation' }
CyNode class >> name: nodeName label: label props: propsDict [
	^self name: nodeName labels: {label} props: propsDict
]

{ #category : #'instance creation' }
CyNode class >> name: nodeName labels: labels [
	^ (self name: nodeName)
		labels: labels;
		yourself
]

{ #category : #'instance creation' }
CyNode class >> name: nodeName labels: labels props: propsDict [
	^ (self name: nodeName)
		labels: labels;
		props: propsDict;
		yourself
]

{ #category : #'instance creation' }
CyNode class >> name: nodeName props: propsDict [
	^self name: nodeName labels: nil props: propsDict
]

{ #category : #'actions-path pattern' }
CyNode >> - aCyRelationship [
	| rel |
	rel := aCyRelationship class
		start: self end: aCyRelationship end name: aCyRelationship identifier types: aCyRelationship types props: aCyRelationship props.
	^ rel
	
]

{ #category : #'actions-path pattern' }
CyNode >> <- aCyRelationship [
	^(self - aCyRelationship) beIn
]

{ #category : #converting }
CyNode >> accessor: propName [
	^CyIdentifier of: self identifier prop: propName
]

{ #category : #converting }
CyNode >> asNode [
	^self
]

{ #category : #accessing }
CyNode >> labels [
	^ labels
]

{ #category : #accessing }
CyNode >> labels: anObject [
	labels := anObject
]

{ #category : #printing }
CyNode >> printOn: aStream [
	aStream nextPutAll: self className.
	aStream nextPutAll: self cypherString 
]

{ #category : #accessing }
CyNode >> props [
	^ props
]

{ #category : #accessing }
CyNode >> props: anObject [
	props := anObject asDictionary
]

{ #category : #printing }
CyNode >> tokensLabelOn: tokens [
	| lbls |
	lbls := self labels.
	lbls isEmptyOrNil ifTrue: [ ^self ].
	
	tokens add: ':'; addAll: (self join: ':' in: lbls) 
]

{ #category : #printing }
CyNode >> tokensOn: tokens [
	tokens add: '('.
	self identifier ifNotNil: [ :nm | tokens add: nm cypherIdentifierString ].
	self tokensLabelOn: tokens.
	self tokensPropsOn: tokens.
	tokens add: ')'
]

{ #category : #printing }
CyNode >> tokensPropsOn: tokens [
	| prps |
	prps := self props.
	prps isEmptyOrNil ifTrue: [ ^self ].
	
	tokens preSpacedAdd: (prps cypherString )
]
