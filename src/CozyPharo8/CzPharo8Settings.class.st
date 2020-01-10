Class {
	#name : #CzPharo8Settings,
	#superclass : #CozyRoot,
	#category : #'CozyPharo8-Code'
}

{ #category : #initialization }
CzPharo8Settings class >> addMooseRepositories [
	<script>
	(self imageNameBeginsWithAny: #('MyMoose-' 'MooseNG-' 'MooseSpec-' 'moose')) ifFalse: [ ^ self ].

	self
		registerIfPresentProjectOf: 'moosetechnology' named: 'Moose';
		registerIfPresentProjectOf: 'moosetechnology' named: 'MooseAlgos';
		registerIfPresentProjectOf: 'pharo-contributions' named: 'DeepTraverser';
		registerIfPresentProjectOf: 'pharo-contributions' named: 'CollectionExtensions';
		registerIfPresentProjectOf: 'jecisc' named: 'Hashtable';
		registerIfPresentProjectOf: 'jecisc' named: 'Fame';
		registerIfPresentProjectOf: 'jecisc' named: 'KGBTestResources';
		registerIfPresentProjectOf: 'jecisc' named: 'PackageBlueprintTestResources';
		registerIfPresentProjectOf: 'jecisc' named: 'ReferenceTestResources';
		registerIfPresentProjectOf: 'RMODINRIA' named: 'RoelTyper';
		registerIfPresentProjectOf: 'jecisc' named: 'MooseRing2';
		registerIfPresentProjectOf: 'jecisc' named: 'Famix';
		registerIfPresentProjectOf: 'jecisc' named: 'MooseSpec'
]

{ #category : #initialization }
CzPharo8Settings class >> formatingOptions [
	<script>
	EFFormatter
		multiLineMessages: '#(#on:do: #ensure: #ifCurtailed:)';
		retainBlankLinesBetweenStatements: true;
		maxLineLength: 160
]

{ #category : #initialization }
CzPharo8Settings class >> initialize [
	
	self formatingOptions.
	CzIcePick new configure.
	self resetMenuBar.
	CozyRoot lightThemeClass: CzDayAtTheBeachTheme.
	CzDayAtTheBeachTheme beCurrent
]

{ #category : #initialization }
CzPharo8Settings class >> installSpecRepository [
	<script>
	
	(self imageNameBeginsWithAny: #('Spec-' 'NewTools-' 'MooseSpec-')) ifFalse: [ ^ self ].

	self registerIfPresentProjectOf: 'pharo-spec' named: 'Spec'.
	Deprecation raiseWarning: false
]

{ #category : #initialization }
CzPharo8Settings class >> resetMenuBar [
	<script>
	MenubarMorph reset
]

{ #category : #'see class side' }
CzPharo8Settings >> seeClassSide [
	
]
