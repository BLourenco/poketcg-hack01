# TODO List

 - Verify that any code tha uses NUM_TYPES and "- 1" together still work since the Unused type has been removed and new types have been added.
 - Confirm whether I should remove gaps in cgb_symbols.png, update LoadVRAM0DuelCardSymbolTiles and LoadVRAM1DuelCardSymbolTiles if needed.
 - For all types, test:
   - Booster pack types
   - Weaknesses and Resistances
   - Attack costs (colored, colorless, mixed colors, all colorless)
   - Retreat costs (0, 1, 2, 3, 4, 5)
   - All of the above, but for the AI
 - In the deck machine, going into and then out of a card page of a missing card glitches the card type icon.
 - Evolving into a Stage 2 (Venusaur) caused a gliched tile under the card icon.


# Mario_Bone's TODO List
A list of TODO comments I've put in the code so I don't forget about them and know why I've put them aside

 - [card_constants.asm](src/constants/card_constants.asm) - index
   comments need to be updated to account for newly added cards
 - [card_constants.asm](src/engine/duel/core.asm) - bug where Basic Pokemon have a different tile graphic loading on one of the card info pages than the base game. In my opinion I think it actually works better, but leaving it here so I don't forget about the differing behaviour in case I want to change it
 - [bg_map.asm](src/home/bg_map.asm) - When VRAM1 is loaded, WriteByteToBGMap0 function will write the bytes with BGP0 applied - investigate whether there are any scenarios where a coloured tile is incorrectly being printed in B&W
	 - Also consider possibility of loading parts of the duel UI in colour
 - [mason_laboratory.asm](src/scripts/mason_laboratory.asm) - there is an NPC who gives you a  bunch of free Energy cards if you have less than 10 spare Energy cards outside of your decks. I don't think this accounts for new Energy types properly, so should be investigated.
  - [wram.asm](src/wram.asm) - Pretty sure most/all of the comments with registers are incorrect after things have been moved around and expanded

# Pre-existing TODOs
These TODOs were already in the codebase

 - [menu_constants.asm](src/constants/menu_constants.asm) - hardcoded values
 - [deck_selection.asm](src/engine/menus/deck_selection.asm) - something to do with the modify deck function?
 - [intro_sequence_commands.asm](src/engine/sequences/intro_sequence_commands.asm) - potentially rename function