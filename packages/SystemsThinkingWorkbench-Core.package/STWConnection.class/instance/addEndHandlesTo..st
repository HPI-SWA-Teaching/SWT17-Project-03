halos and balloon help
addEndHandlesTo: aHalo

	| levelDisplay |
	
	levelDisplay := (STWStringMorph new contents: self output asString) preventEditing.
	
	aHalo addEndHandleFor: [self output: self output + 1. levelDisplay contents: self output asString.] 
		color: Color green muchLighter
		containing: '+' asMorph.
	
	aHalo addEndHandleFor: [] color: Color gray muchLighter containing: levelDisplay.
	
	aHalo addEndHandleFor: [self output: self output - 1. levelDisplay contents: self output asString.] 
		color: Color red muchLighter
		containing: '-' asMorph.