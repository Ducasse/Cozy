Extension { #name : 'SHRBTextStyler' }

{ #category : '*CozyPalettedThemes' }
SHRBTextStyler class >> darkBlueStyleTable [
	"color can be a valid argument to Color class>>colorFrom: , or nil to
	use the editor text color.
	Multiple emphases can be specified using an array e.g. #(bold italic).
	If emphasis is not specified, #normal will be used.
	if pixel height is not specified , then the editor font size will be used.

	This style is based on old theme and other old environments.
	"
	<styleTable: 'Solarized'>

			"(symbol color [emphasisSymbolOrArray [textStyleName [pixelHeight]]])"
 ^ #(
			(default 								('657A81' muchDarker))
			(invalid 									red)

			(comment 								'586E75')

			(character 								('268BD2' lighter))
			(number 								('2AA198'))
			(symbol 								('268BD2'))
			(string 									('268BD2'))


			(selector 								nil)

			(#true 									('CB4B16' darker))
			(#false 									('CB4B16' darker))
			(#nil 									('CB4B16' darker))

			(#self 									'B58900')
			(#super								'B58900')
			(#thisContext 							'B58900')
			(#thisProcess 							'B58900')
			(#return 								'B58900' bold)

			(patternArg 							('D33682'))
			(blockPatternArg 						('D33682'))
			(blockArg 								('D33682'))
			(argument 								('D33682'))
			(blockTempVar 						('D33682'))
			(blockPatternTempVar 					('D33682'))

			(instVar 								('D33682'))

			(tempVar 								('D33682'))
			(patternTempVar 						('D33682'))

			(poolConstant 							('D33682') bold)
			(classVar 								('D33682') bold)
			(globalVar 								('268BD2' muchDarker) bold)

			(undefinedIdentifier 					red)
			(incompleteIdentifier 					'D33682' italic)
			(incompleteSelector 					nil  italic)
			(undefinedSelector 					red)
			(patternSelector 						'657A81' bold)
			(blockArgColon 						black)
			(parenthesis 						black)
			(parenthesis1 						(green muchDarker))
			(parenthesis2 						(magenta muchDarker))
			(parenthesis3 						(red muchDarker))
			(parenthesis4 						(green darker))
			(parenthesis5 						(orange darker))
			(parenthesis6 						(magenta darker))
			(parenthesis7 						blue)
			(block 								black)
			(block1 							(green muchDarker))
			(block2 							(magenta muchDarker))
			(block3 							(red muchDarker))
			(block4 							(green darker))
			(block5 							(orange darker))
			(block6 							(magenta darker))
			(block7 							blue)
			(brace 								black)
			(brace1 								(green muchDarker))
			(brace2 								(magenta muchDarker))
			(brace3 								(red muchDarker))
			(brace4 								(green darker))
			(brace5 								(orange darker))
			(brace6 								(magenta darker))
			(brace7 								blue)
			(cascadeSeparator 					black bold)
			(statementSeparator 					black bold)
			(methodTempBar 						black)
			(blockTempBar 						black)
			(blockArgsBar 							black)

			(pragma 						(cyan muchDarker)))
]
