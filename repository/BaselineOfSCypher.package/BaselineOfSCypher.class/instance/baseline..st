baseline
baseline: spec
	<baseline>

	spec for: #common do: [
		self neo4rest: spec.
		spec 
			package: 'SCypher-Core' with: [spec requires: 'Neo4reSt'];
			package: 'SCypher-Tests' with: [ spec requires: #('SCypher-Core')].
		spec 
			group: 'default' with: #('Core' 'Tests');
			group: 'Core' with: #('SCypher-Core');
			group: 'Tests' with: #('SCypher-Tests')].
		
