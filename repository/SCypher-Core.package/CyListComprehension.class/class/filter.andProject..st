instance creation
filter: filterExp andProject: projectionExpression
	^ self new
		filterExpression: filterExp;
		projectionExpression: projectionExpression;
		yourself