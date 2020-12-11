Class {
	#name : #BaselineOfSCypher,
	#superclass : #BaselineOf,
	#category : #BaselineOfSCypher
}

{ #category : #baseline }
BaselineOfSCypher >> baseline: spec [
	<baseline>

	spec for: #common do: [
		spec 
			package: 'SCypher-Core';
			package: 'SCypher-Tests' with: [ spec requires: #('SCypher-Core')].
		spec 
			group: 'default' with: #('Core' 'Tests');
			group: 'Core' with: #('SCypher-Core');
			group: 'Tests' with: #('SCypher-Tests')].
		

]

{ #category : #'external projects' }
BaselineOfSCypher >> neo4rest: spec [
	spec
		baseline: 'Neo4reSt'
		with: [ spec
				repository: 'github://mumez/Neo4reSt/repository';
				loads: 'default' ]
]
