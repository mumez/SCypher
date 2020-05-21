instance creation
name: nodeName labels: labels props: propsDict
	^ (self name: nodeName)
		labels: labels;
		props: propsDict;
		yourself