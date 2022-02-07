# Change Logs

## v3.1.0

 - fix build-css
 - add lite build: include only 7 pure css loader ( shape + animation ) listed in document page.
 - upgrade stylus to prevent warnings
 - use yargs to parse `build-css` arguments
 - release files also in package root


## v3.0.0

 - release with compact directory structure


## v2.0.2

 - add `style` field in package.json


## v2.0.1

 - upgrade engine version
 - upgrade livescript
 - release dist only


## v2.0.0

 * animations rename: ( old names kept as alias )
   - ld-rubber -> ld-rubber-h
   - ld-wander -> ld-wander-h
   - ld-shake -> ld-shake-h
 * add alias: 
   - ld-coin-h -> ld-coin

 * removed animations:
   - radio
   - broadcast
   - shadow
   - shadow-a
   - bounce-a
   - rotate

 * removed ( tentative )
   - slot
   - bounce-rtl
   - bounce-ltr
   - leaf
