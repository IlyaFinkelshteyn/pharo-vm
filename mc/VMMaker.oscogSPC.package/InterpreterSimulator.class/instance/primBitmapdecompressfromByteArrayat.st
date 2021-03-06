other primitives
primBitmapdecompressfromByteArrayat
	| indexInt index baOop bmOop baSize bmSize ba bm |
	indexInt := self stackTop.
	(self isIntegerValue: indexInt) ifFalse: [^ self primitiveFail].
	index := self integerValueOf: indexInt.
	baOop := self stackValue: 1.
	bmOop := self stackValue: 2.
	baSize := self stSizeOf: baOop.
	bmSize := self stSizeOf: bmOop.
	ba := ByteArray new: baSize.
	bm := Bitmap new: bmSize.

	"Copy the byteArray into ba"
	1 to: baSize do: [:i | ba at: i put: (self fetchByte: i-1 ofObject: baOop)].

	"Decompress ba into bm"
	bm decompress: bm fromByteArray: ba at: index.

	"Then copy bm into the Bitmap"
	1 to: bmSize do: [:i | self storeLong32: i-1 ofObject: bmOop withValue: (bm at: i)].
	self pop: 3