-- # Coder Dojo Corona Game Starter Kit #

-- This is where your code for the game goes! You can use any of the libraries
-- we created during class by using the `require` function.

-- Colorado Smith is an adventurer. He fights scorpions and looks for gold.
-- Any relation or resemblance he may bear to certain archaeologists is *purely
-- coincidental*.

local grid = require("grid")
local character = require("character")
local controlpad = require("controlpad")


local levelSize = {
	xSquares = 10,
	ySquares = 10,
	totalWidth = 700,
	startX = 200,
	startY = 50,
}


local controls = controlpad.newControlPad(0, 500, 100)

local levelOne = grid.newGrid(levelSize.xSquares, levelSize.ySquares, levelSize.totalWidth)
levelOne:setLocation(levelSize.startX, levelSize.startY)
levelOne:show()

local levelTwo = grid.newGrid(levelSize.xSquares, levelSize.ySquares, levelSize.totalWidth)
levelTwo:setLocation(levelSize.startX, levelSize.startY)
levelTwo:hide()


local colorado = character.newCharacter("fedora.png")
colorado:enter(levelOne[0][0])

local gold = character.newCharacter("gold.png")
gold:enter(levelOne[9][8])


local scorpion = character.newCharacter("scorpion.png")
scorpion:enter(levelOne[8][8])

local enemyTurn = function()
	if scorpion.gridSquare.x > colorado.gridSquare.x then
		scorpion:enter(scorpion.gridSquare:left())
	elseif scorpion.gridSquare.x < colorado.gridSquare.x then
		scorpion:enter(scorpion.gridSquare:right())
	elseif scorpion.gridSquare.y > colorado.gridSquare.y then
		scorpion:enter(scorpion.gridSquare:above())
	elseif scorpion.gridSquare.y < colorado.gridSquare.y then
		scorpion:enter(scorpion.gridSquare:below())
	end

	if scorpion.gridSquare == colorado.gridSquare then
		colorado:enter(levelOne[0][0])
		scorpion:enter(levelOne[8][8])
	end
end

controls:whenUpPressed(function()
	colorado:enter(colorado.gridSquare:above())
	enemyTurn()
end)
controls:whenDownPressed(function()
	colorado:enter(colorado.gridSquare:below())
	enemyTurn()
end)
controls:whenLeftPressed(function()
	colorado:enter(colorado.gridSquare:left())
	enemyTurn()
end)
controls:whenRightPressed(function()
	colorado:enter(colorado.gridSquare:right())
	enemyTurn()
end)




