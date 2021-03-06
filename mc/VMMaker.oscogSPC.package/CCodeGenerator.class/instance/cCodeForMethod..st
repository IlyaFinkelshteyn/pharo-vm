utilities
cCodeForMethod: selector
	"Answer a string containing the C code for the given method."
	"Example:
		((CCodeGenerator new initialize addClass: TestCClass1; prepareMethods)
			cCodeForMethod: #ifTests)"

	| m s |
	m := self methodNamed: selector.
	m = nil ifTrue: [ self error: 'method not found in code base: ', selector ].

	s := (ReadWriteStream on: '').
	m emitCCodeOn: s generator: self.
	^ s contents