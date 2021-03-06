testing
testResetWithSimulation

	| simulation node1 node2 connection |
	
	simulation := STWSimulation new.
	node1 := simulation addNodeAt: 0@0.
	node2 := simulation addNodeAt: 50@0.
	
	"Set it to default values again just to make sure"
	node1 level: 42.
	node1 backupLevel: 42.
	connection := STWConnection new.
	connection connect: node1 with: node2.
	simulation addConnection: connection.
	simulation startSimulation.
	simulation stepSimulation.
	self deny: node1 level = node1 backupLevel.
	simulation resetSimulation.
	self assert: 42 equals: node1 level.
