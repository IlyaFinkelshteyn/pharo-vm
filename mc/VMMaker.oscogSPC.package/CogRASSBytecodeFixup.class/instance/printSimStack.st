debug printing
printSimStack
	<doNotGenerate>
	self notAFixup ifFalse:
		[cogit printSimStack: mergeSimStack toDepth: simStackPtr spillBase: -1 on: cogit coInterpreter transcript]