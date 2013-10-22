local Character = {}

local characterFunctions = {
	enter = function(character, gridSquare)
		if type(character.canEnter) == "function" and character:canEnter(gridSquare) then
			character.gridSquare = gridSquare
			character.displayObject.x = gridSquare.x
			character.displayObject.y = gridSquare.y
		end
		return character
	end,

	show = function(character)
		character.displayObject.isVisible = true
	end,

	hide = function(character)
		character.displayObject.isVisible = false
	end,
}

Character.newCharacter = function(imageName)
	local character = {}
	character.displayObject = display.newImageRect(imageName)
	character.displayObject.isVisible = false
	character.enter = characterFunctions.enter
	character.show = characterFunctions.show
	character.hide = characterFunctions.hide
	return character
end

return Character
