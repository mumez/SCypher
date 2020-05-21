instance creation
start: start end: end type: type props: props
	^self new start: start;
		end: end;
		type: type;
		props: props;
		yourself