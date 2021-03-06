halos and balloon help
addHandlesTo: myHalo box: aBox
	"Overwrite the addHandles of the standard morph and places our own handles.
	
	Since I am a Circle, I won't use the Rectangle and directly add my handles to my Halo.
	The box is only sent, to overwrite the function.
	
	A handle is a simple Morph, who gets added onto the Halo and triggers events."
	
	| adderCollection handleOffset radialOffset |

	adderCollection := #(#addResizeHandleTo:centeredAt: #addDeletionHandleTo:centeredAt: #addMoveHandleTo:centeredAt: #addInspectionHandleTo:centeredAt: #addNegativeHandleTo:centeredAt: #addDensityHandleTo:centeredAt: #addCapacityHandleTo:centeredAt:).
	handleOffset := 360 / adderCollection size.
	1 to: adderCollection size 
		do: [:index |
			radialOffset := Point r: self radius + STWHaloMorph handleRadius + STWSimulation normalLineWidth degrees: index * handleOffset.
			self
				perform: (adderCollection at: index)
				with: myHalo
				with: self center + radialOffset.].
