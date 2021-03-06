testing
testBrackets
	"Test if no opening bracket is followed by a space and no closing bracket is preceeded by a space."

	self testAllMethodsFor:
		[:source |
		| result |
		result := OrderedCollection new.
		(1 to: source asByteArray size)
			do: [:index |
				((source at: index) = $[ and: [(source at: (index - 1)) ~= $$])
					ifTrue: [result add: (source at: index + 1) ~= Character space].
				((source at: index) = $])
					ifTrue: [result add: (source at: index - 1) ~= Character space].
				result add: true.].
		result allSatisfy: [:elem | elem = true].].
