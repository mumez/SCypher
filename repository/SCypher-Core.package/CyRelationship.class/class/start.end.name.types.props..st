instance creation
start: start end: end name: identifier types: types props: props
	^self new start: start;
		end: end;
		identifier: identifier;
		types: types;
		props: props;
		yourself