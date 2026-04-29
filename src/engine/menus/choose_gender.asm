PlayerGenderSelection:
	; setup the screen
	xor a
	ld [wTileMapFill], a
	call EmptyScreen
	call ZeroObjectPositions
	ld a, $01
	ld [wVBlankOAMCopyToggle], a
	call LoadSymbolsFont
	lb de, $38, $bf
	call SetupText

	; draw male portrait
	ld a, PORTRAIT_PLAYER               ; was PLAYER_PIC
	ld [wCurPortrait], a
	ld a, PORTRAIT_SLOT_1               ; was TILEMAP_PLAYER
	ld [wPortraitSlot], a               ; Needed for Extended's
	ld a, EMOTION_NEUTRAL               ;  Portrait overhaul
	lb bc, 2, 4
	call DrawPortrait

	; draw female portrait
	ld a, PORTRAIT_PLAYER_FEMALE        ; tutorial used MINT_PIC
	ld [wCurPortrait], a
	ld a, PORTRAIT_SLOT_2               ; was TILEMAP_OPPONENT
	ld [wPortraitSlot], a               ; Needed for Extended's
	ld a, EMOTION_NEUTRAL               ;  Portrait overhaul
	lb bc, 12, 4
	call DrawPortrait

	; print text
	ld hl, .TextItems
	call PlaceTextItems
	ldtx hl, AreYouABoyOrGirlText
	call DrawWideTextBox_PrintText

	; set parameters for the cursor
	lb de, 3, 2 ; cursor x and y
	lb bc, SYM_CURSOR_R, SYM_SPACE
	call SetCursorParametersForTextBox

	; start loop for selection
	ld a, [wCurMenuItem]
	jr .refresh_menu

.loop_input
	call DoFrame
	call RefreshMenuCursor
	ldh a, [hKeysPressed]
	bit B_PAD_A, a
	jr nz, .selection_made
	ldh a, [hDPadHeld]
	and PAD_RIGHT | PAD_LEFT
	jr z, .loop_input
	ld a, SFX_CURSOR
	call PlaySFX
	call EraseCursor
	ld hl, wCurMenuItem
	ld a, [hl]
	xor $1 ; toggle selected gender
	ld [hl], a
.refresh_menu
	or a
	ld a, 3 ; "Boy" cursor x
	jr z, .got_cursor_x
	ld a, 13 ; "Girl" cursor x
.got_cursor_x
	ld [wMenuCursorXOffset], a
	xor a
	ld [wCursorBlinkCounter], a
	jr .loop_input

.selection_made
	; set the gender event value
	ld a, [wCurMenuItem]
	or a
	ld a, EVENT_PLAYER_GENDER_CHOICE
	jr nz, .female
	farcall ZeroOutEventValue ; bit unset
	ret
.female
	farcall MaxOutEventValue ; bit set
	ret

.TextItems:
	textitem  4, 2, BoyText
	textitem 14, 2, GirlText
	db $ff