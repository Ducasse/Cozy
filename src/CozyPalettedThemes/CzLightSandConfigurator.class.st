Class {
	#name : 'CzLightSandConfigurator',
	#superclass : 'LightThemeColorConfigurator',
	#category : 'CozyPalettedThemes',
	#package : 'CozyPalettedThemes'
}

{ #category : 'configuration' }
CzLightSandConfigurator class >> colorConfiguratorClass [

	^ CzLightSandyConfigurator 
]

{ #category : 'initialization' }
CzLightSandConfigurator class >> setPreferredShoutColors [
	"self setPreferredShoutColors"

	"Color can be a valid argument to Color class>>colorFrom: , or nil to
	use the editor text color.
	Multiple emphases can be specified using an array e.g. #(bold italic).
	If emphasis is not specified, #normal will be used.
	if pixel height is not specified , then the editor font size will be used.
	"
	<styleTable: 'Beach'>
	
	SHRBTextStyler styleTable:
	"(symbol color [emphasisSymbolOrArray [textStyleName [pixelHeight]]]) #bf360c" 							
 		 #(
			(default 								black)
			(invalid 								red #(italic bold))
			(excessCode 							red)
			
			"(comment 								'd81b60' darker) #(italic))"
			(comment 								('795548') #(italic))
			(unfinishedComment 				(red muchDarker))
			
			(#'$' 									('268BD2' lighter))
			(character 							('268BD2' lighter))
			(integer 								'2AA198')
			(number 								'2AA198')
			(#- 									'2AA198')
			(symbol 								'268BD2') 
			(stringSymbol 						'268BD2') 
			(literalArray 						black)
			(string 								'268BD2')
												
			(unfinishedString 					red normal)
			(assignment 							nil bold)
			(ansiAssignment 					nil bold)
					
			(literal 									nil italic)
												
			(keyword 									nil)
			(binary 									nil) 
			(unary 									nil)
										
			(#true 								('CB4B16' darker))
			(#false 								('CB4B16' darker))
			(#nil 									('CB4B16' darker))
													
			(#self 									'01579b' bold)
			(#super									'01579b')
			(#thisContext 							'01579b')
			(#return 									'01579b' bold)
												
			(patternArg 								'D33682') 
			(methodArg 								('D33682'))
			(blockPatternArg 						('D33682'))
			(blockArg 								('D33682'))
			(argument 								('D33682'))
			(blockTempVar 							('01579b'))
			(blockPatternTempVar 					('01579b'))
								
			(instVar 									'01579b' bold)
			(workspaceVar 							('D33682') bold)
										
			(tempVar 									('D33682'))
			(patternTempVar 						('D33682'))
										
			(poolConstant 							('D33682') bold)
			(classVar 								('D33682') bold)
			(globalVar 								('268BD2' muchDarker) bold)
												
			(undefinedIdentifier 					red)
			(incompleteIdentifier 					'D33682' italic)
			(incompleteKeyword 					nil  italic)
			(incompleteBinary 						nil  italic) 
			(incompleteUnary 						nil  italic)
			(undefinedKeyword 					red)
			(undefinedBinary 						red) 
			(undefinedUnary 						red) 
			(patternKeyword 						black bold)
			(patternBinary 							black bold)
			(patternUnary 							black bold) 
			(blockArgColon 							black)
			(leftParenthesis 						black)
			(rightParenthesis 						black)
			(leftParenthesis1 						(green muchDarker))
			(rightParenthesis1 						(green muchDarker))
			(leftParenthesis2 						(magenta muchDarker))
			(rightParenthesis2 						(magenta muchDarker))
			(leftParenthesis3 						(red muchDarker))
			(rightParenthesis3 						(red muchDarker))
			(leftParenthesis4 						(green darker))
			(rightParenthesis4 						(green darker))
			(leftParenthesis5 						(orange darker))
			(rightParenthesis5 						(orange darker))
			(leftParenthesis6 						(magenta darker))
			(rightParenthesis6 						(magenta darker))
			(leftParenthesis7 						blue)
			(rightParenthesis7 						blue)
			(blockStart 								black)
			(blockEnd 								black)
			(blockStart1 							(green muchDarker))
			(blockEnd1 								(green muchDarker))
			(blockStart2 							(magenta muchDarker))
			(blockEnd2 								(magenta muchDarker))
			(blockStart3 							(red muchDarker))
			(blockEnd3 								(red muchDarker))
			(blockStart4 							(green darker))
			(blockEnd4 								(green darker))
			(blockStart5 							(orange darker))
			(blockEnd5 								(orange darker))
			(blockStart6 							(magenta darker))
			(blockEnd6 								(magenta darker))
			(blockStart7 							blue)
			(blockEnd7 								blue) 
			(arrayStart 								black)
			(arrayEnd 								black)
			(arrayStart1 							black)
			(arrayEnd1 								black)
			(leftBrace 								black)
			(rightBrace 								black)
			(cascadeSeparator 					black bold)
			(statementSeparator 					black bold)
			(methodTempBar 						black)
			(blockTempBar 						black)
			(blockArgsBar 							black)
										
			(externalCallType 						black)
			(externalCallTypePointerIndicator 		black)
			(primitiveOrExternalCallStart 			black bold)
			(primitiveOrExternalCallEnd 			black bold)
			(primitive 								(cyan muchDarker))
			(pragmaKeyword 						(cyan muchDarker))
			(pragmaUnary 							(cyan muchDarker))
			(pragmaBinary 							(cyan muchDarker)) 
			(externalFunctionCallingConvention 	(cyan muchDarker) bold)
			(module 								(cyan muchDarker) bold))
]

{ #category : 'accessing' }
CzLightSandConfigurator class >> themeName [
	^ 'Light Sandy'
]
