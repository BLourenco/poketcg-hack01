
# TODO List
A list of TODO comments I've put in the code so I don't forget about them and know why I've put them aside

 - [card_constants.asm](src/constants/card_constants.asm) - index
   comments need to be updated to account for newly added cards
 - [card_constants.asm](src/engine/duel/core.asm) - bug where Basic Pokemon have a different tile graphic loading on one of the card info pages than the base game. In my opinion I think it actually works better, but leaving it here so I don't forget about the differing behaviour in case I want to change it
 - [bg_map.asm](src/home/bg_map.asm) - When VRAM1 is loaded, WriteByteToBGMap0 function will write the bytes with BGP0 applied - investigate whether there are any scenarios where a coloured tile is incorrectly being printed in B&W
	 - Also consider possibility of loading parts of the duel UI in colour
 - [mason_laboratory.asm](src/scripts/mason_laboratory.asm) - there is an NPC who gives you a  bunch of free Energy cards if you have less than 10 spare Energy cards outside of your decks. I don't think this accounts for new Energy types properly, so should be investigated.

# Pre-existing TODOs
These TODOs were already in the codebase

 - [charmaps.asm](src/constants/charmaps.asm) - change symbol syntax
 - [menu_constants.asm](src/constants/menu_constants.asm) - hardcoded values
 - [deck_selection.asm](src/engine/menus/deck_selection.asm) - something to do with the modify deck function?
 - [intro_sequence_commands.asm](src/engine/sequences/intro_sequence_commands.asm) - potentially rename function