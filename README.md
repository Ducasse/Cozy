# Cozy (for Pharo 80 and above)
A little package to create a more cozy and productive working environment for Pharo.

It is based on Pharo-scripts from Cyril Ferlicot and probably QuickAccess from Torsten Bergman (I do not know since I started from pharo-scripts). But I want to thank them both. I made sure that Cozy can be loaded without impacting pharo-scripts to support cross-fertilization.

Cozy supports
- Iceberg configuration via files saved in your settings (password, ssh, share repo). See IcePick.
- Automatic Iceberg configuration for Pharo contribution
- scan of your github repo to populate iceberg in one click
- many cool scripts
- a superb new them called "A day at the beach": yes with a nice blue and orange style!

Next version should
- clean some duplicated functions
- support modular definition of script (instead in a single class because relying on protocols does not work with class extensions.
- make sure that my lovely scripts are nicely packaged. 
- check pharo-scripts support for multiple pharo versions. 
- a way to manage (as Pharo-scripts all) the settings folder in github.
- smoother theme integration. 

## How to load manually

```
Metacello new
  baseline: 'Cozy';
  repository: 'github://Ducasse/Cozy/tree/master/src';
  load
```

## How to make it load automatically 

Edit your preference settings for your Pharo 80 version and 

```
StartupPreferencesLoader default executeAtomicItems: {			

	StartupAction
		name: 'Load Settings'
		code: [ Metacello new
			filetreeDirectory: '.....Cozy/src';
			baseline: 'Cozy';
			load 
		]
		runOnce: true
}
```

I will check with Cyril why this is filetreeDirectory: 
