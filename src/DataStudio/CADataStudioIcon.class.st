Class {
	#name : #CADataStudioIcon,
	#superclass : #CAObject,
	#classInstVars : [
		'icon16x16'
	],
	#category : #'DataStudio-WorldMenu'
}

{ #category : #accessing }
CADataStudioIcon class >> icon16x16 [
	"
	self icon16x16
	"
	icon16x16 ifNotNil: [ ^ icon16x16 ].
	
	icon16x16 := Form extent: 16 @ 16 depth: 32.
	icon16x16 readResourceFrom: self icon16x16Source readStream.
	
	^ icon16x16
]

{ #category : #accessing }
CADataStudioIcon class >> icon16x16Source [
	^ #[70 79 82 77 0 0 0 16 0 0 0 16 0 0 0 32 0 0 1 137 225 0 201 0 35 12 86 78 123 43 30 26 120 97 14 22 120 117 14 22 120 123 14 22 120 111 14 22 120 66 14 22 121 20 51 73 124 33 0 7 176 55 44 241 30 255 28 45 241 11 72 141 166 249 0 127 127 127 25 0 43 107 99 86 226 231 28 45 240 255 28 45 242 87 196 237 255 1 255 255 255 15 237 228 250 202 115 78 241 255 28 45 241 169 27 77 243 42 13 54 123 25 0 19 20 122 103 122 148 136 126 242 255 28 45 242 4 223 239 255 9 0 19 2 127 127 127 132 210 176 245 254 44 45 241 144 74 113 246 25 0 19 6 124 104 124 134 138 126 244 255 28 45 242 0 127 127 127 13 0 15 25 255 249 252 255 87 71 241 179 38 82 243 25 0 15 1 127 64 127 128 141 86 248 255 28 45 242 17 0 15 1 255 255 255 255 119 100 242 216 27 61 243 25 0 15 0 127 127 127 128 141 150 248 255 28 45 242 17 0 15 7 255 255 255 255 116 97 241 202 27 62 243 29 0 15 127 14 22 120 255 28 45 242 5 159 239 255 9 0 19 5 127 127 127 154 235 211 246 255 49 45 241 148 60 99 246 29 0 39 125 14 22 120 255 28 45 242 27 198 236 255 0 0 0 0 8 63 63 63 121 237 220 250 248 121 106 241 216 28 45 242 91 42 65 185 29 0 23 114 14 22 120 255 28 45 241 229 166 210 251 125 196 183 247 210 128 112 243 10 255 28 45 241 11 79 141 150 248 0 127 127 127 29 0 7 84 13 23 120 22 255 28 45 241 11 97 29 45 242 0 127 127 127 33 0 27 7 6 10 61 107 13 22 120 126 14 22 120 101 14 22 120 62 28 38 121 4 85 99 127 93 0]
]