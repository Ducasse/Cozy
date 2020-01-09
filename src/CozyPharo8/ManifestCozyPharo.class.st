"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestCozyPharo,
	#superclass : #PackageManifest,
	#category : #'CozyPharo8-Manifest'
}

{ #category : #'code-critics' }
ManifestCozyPharo class >> ruleRBDoNotSendSuperInitializeInClassSideRuleV1FalsePositive [
	^ #(#(#(#RGMetaclassDefinition #(#'CzDayAtTheBeachTheme class' #CzDayAtTheBeachTheme)) #'2020-01-08T22:14:13.42897+01:00') )
]
