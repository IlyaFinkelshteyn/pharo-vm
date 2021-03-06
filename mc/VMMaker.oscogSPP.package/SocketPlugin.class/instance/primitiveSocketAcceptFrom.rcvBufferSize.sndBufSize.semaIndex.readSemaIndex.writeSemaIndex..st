primitives
primitiveSocketAcceptFrom: sockHandle rcvBufferSize: recvBufSize sndBufSize: sendBufSize semaIndex: semaIndex readSemaIndex: aReadSema writeSemaIndex: aWriteSema
	| socketOop s serverSocket |
	<var: #s type: 'SocketPtr '>
	<var: #serverSocket type: 'SocketPtr '>
	self primitive: 'primitiveSocketAccept3Semaphores'
		parameters: #(Oop SmallInteger SmallInteger SmallInteger SmallInteger SmallInteger).
	serverSocket := self socketValueOf: sockHandle.

	interpreterProxy failed
		ifFalse: [socketOop := interpreterProxy instantiateClass: interpreterProxy classByteArray indexableSize: self socketRecordSize.
			s := self socketValueOf: socketOop.
			self
				sqSocket: s
				AcceptFrom: serverSocket
				RecvBytes: recvBufSize
				SendBytes: sendBufSize
				SemaID: semaIndex
				ReadSemaID: aReadSema
				WriteSemaID: aWriteSema].
	^ socketOop