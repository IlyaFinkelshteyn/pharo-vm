encoding - arithmetic
subuR: destReg R: leftReg R: rightReg
	^self rtype: SPECIAL rs: leftReg rt: rightReg rd: destReg sa: 0 funct: SUBU