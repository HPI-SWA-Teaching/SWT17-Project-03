stepping and presenter
performAnimationStep: delta
	"Moves every particle currently on the connection along itself."

	self particles do: [:particle |
		particle stepAnimation: delta.
		particle center: self vertices first + ((self vertices second - self vertices first) * particle progress).
		particle progress >= 1 ifTrue: [
			self endNode level: self endNode level + self output.
			self removeMorph: particle.] ].
	self particles removeAllSuchThat: [ :e | e progress >= 1].
	self particles isEmpty ifTrue: [
		self stopStepping.
		self lastStepTime: nil.].