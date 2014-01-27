-- requires
local widget = require( "widget" )	--	buttons
local physics = require( "physics" )
physics.start()

local centerX = display.contentCenterX
local centerY = display.contentCenterY
local _W = display.contentWidth
local _H = display.contentHeight

-- Define reference points locations anchor ponts
local TOP_REF = 0
local BOTTOM_REF = 1
local LEFT_REF = 0
local RIGHT_REF = 1
local CENTER_REF = 0.5

local baseline = 200

-- set game speed	
local gameSpeed = 0.08

score = -2 	--	default score	//	-2 because we add two points for generating the first pit and predator :)

--	load assets
	local sheetInfo = require("assets")
	local myImageSheet = graphics.newImageSheet( "assetspack.png", sheetInfo:getSheet() )

-- The sky as background
	-- local background = display.newImage("background.png", centerX, centerY )
	local background =  display.newImage( myImageSheet , sheetInfo:getFrameIndex("background") )
	background.x=display.contentWidth/2
	background.y=display.contentHeight/2

-- solid ground, doesn't need to move
	local ground = display.newRect( 0, baseline+25, 480, _H - baseline - 25 )
	ground:setFillColor( 0x31/255, 0x5a/255, 0x18/255 )
	ground.anchorX = LEFT_REF
	ground.anchorY = TOP_REF

--	predator creation function
	getNewPredatorRGB = function ()
		predatorR, predatorG, predatorB = 0, 0, 0

		local rand = math.random(1,3)
		if 		rand == 1 then 	predatorR=255
		elseif 	rand == 2 then 	predatorG=255
		else 					predatorB=255
		end

		predator:setFillColor(predatorR, predatorG, predatorB, 1)

		predator.x = _W + math.random(100, 300)

		score = score + 1
	end

--	pit creation function
	getNewPitRGB = function ()
		pitR, pitG, pitB = 0, 0, 0

		local rand = math.random(1,3)
		if 		rand == 1 then 	pitR=255
		elseif 	rand == 2 then 	pitG=255
		else 					pitB=255
		end

		pit:setFillColor(pitR, pitG, pitB, 1)

		pit.x = _W + math.random(100, 500)

		score = score + 1
	end

--	speed up
	speedUp = function ()
		gameSpeed = gameSpeed + 0.003
		rgbeleon.timeScale = 1 + gameSpeed*2
		rgbeleon:play()
		txtDebug.text = gameSpeed
	end

--	die
	RGBeleonDie = function ()
		gameSpeed = 0
		rgbeleon:pause()
	end

-- CHAMELEON
	-- an image sheet // not used in the end as we don't have the animation
	-- local sheet1 = graphics.newImageSheet( "rgbeleon.png", { width=100, height=50, numFrames=1 } )

	rgbeleon = display.newSprite( myImageSheet , {frames={sheetInfo:getFrameIndex("sprite")}, start=5, count=10, time=900} )
	-- rgbeleon = display.newSprite( myImageSheet , {frames={sheetInfo:getFrameIndex("sprite")}, frames = { 10,11,12,13,14,15,16,17,18,19 }, time=700} )


	-- play 8 frames every 1000 ms // yeah, maybe in an updated version :D
	-- rgbeleon = display.newSprite( sheet1, { name="rgbeleon", start=1, count=1, time=1000 } )
	rgbeleon.anchorX = LEFT_REF
	rgbeleon.anchorY = TOP_REF
	rgbeleon.x = 20
	rgbeleon.y = baseline - rgbeleon.height/2
	rgbeleon:play()

--	be green
	rgbeleonR, rgbeleonG, rgbeleonB = 0, 255, 0

	--	RGBeleon color change function // basically updates the world based on set colors
	updateRGBeleonColor = function ()
		if	rgbeleonR>0 then 
			btnR:setFillColor(255,0,0,1)
			if predatorR>0 then transition.to( predator, { time=500, delay=0, alpha=0.1 } ) end
			if pitR>0 then transition.to( pit, { time=500, delay=0, alpha=0.1 } ) end
		else
			btnR:setFillColor(255,0,0,0.3)
			if predatorR>0 then transition.to( predator, { time=500, delay=0, alpha=1 } ) end
			if pitR>0 then transition.to( pit, { time=500, delay=0, alpha=1 } ) end
		end
		if 	rgbeleonG>0 then
			btnG:setFillColor(0,255,0,1)
			if predatorG>0 then transition.to( predator, { time=500, delay=0, alpha=0.1 } ) end
			if pitG>0 then transition.to( pit, { time=500, delay=0, alpha=0.1 } ) end
		else
			btnG:setFillColor(0,255,0,0.3)
			if predatorG>0 then transition.to( predator, { time=500, delay=0, alpha=1 } ) end
			if pitG>0 then transition.to( pit, { time=500, delay=0, alpha=1 } ) end
		end
		if 	rgbeleonB>0 then
			btnB:setFillColor(0,0,255,1)
			if predatorB>0 then transition.to( predator, { time=500, delay=0, alpha=0.1 } ) end
			if pitB>0 then transition.to( pit, { time=500, delay=0, alpha=0.1 } ) end
		else
			btnB:setFillColor(0,0,255,0.3)
			if predatorB>0 then transition.to( predator, { time=500, delay=0, alpha=1 } ) end
			if pitB>0 then transition.to( pit, { time=500, delay=0, alpha=1 } ) end
		end

		rgbeleon:setFillColor(rgbeleonR, rgbeleonG, rgbeleonB)
	end

--	hide status bar
	display.setStatusBar( display.HiddenStatusBar )



-- buttons
	btnR = display.newRect( _W - 180, _H - 60, 50, 50 )
	btnR.anchorX, btnR.anchorY = 0.0, 0.0
	btnR:setFillColor(255, 0, 0, 0.3)

	btnG = display.newRect( _W - 120, _H - 60, 50, 50 )
	btnG.anchorX, btnG.anchorY = 0.0, 0.0
	btnG:setFillColor(0, 255, 0, 0.3)

	btnB = display.newRect( _W - 60, _H - 60, 50, 50 )
	btnB.anchorX, btnB.anchorY = 0.0, 0.0
	btnB:setFillColor(0, 0, 255, 0.3)

--	score text
	t = display.newText( "score", 0, 0, "HelveticaNeue-Light", 18 )
	t.anchorX, t.anchorY = RIGHT_REF, TOP_REF
	t.x, t.y = _W - 10, 10
	t.height, t.width = 30, 100
	t.text = 0

--	debug text // used to show speed while debugging .. don't know why :)
	txtDebug = display.newText( "debug", 0, 0, "HelveticaNeue-Light", 18 )
	txtDebug.anchorX, txtDebug.anchorY = RIGHT_REF, TOP_REF
	txtDebug.x, txtDebug.y = _W - 10, 40
	txtDebug.height, txtDebug.width = 30, 100
	txtDebug.text = gameSpeed

--	button tap function
	local buttonHandler = function( event )
		if event.phase == "ended" then

			if event.target.id == "btnRed" 		then rgbeleonR = 255 else rgbeleonR = 0 end
			if event.target.id == "btnGreen" 	then rgbeleonG = 255 else rgbeleonG = 0 end
			if event.target.id == "btnBlue" 	then rgbeleonB = 255 else rgbeleonB = 0 end

			updateRGBeleonColor()
		end
	end

--	invisible buton creation over the visible boxes :)
	local buttonRed = widget.newButton{id = "btnRed", onEvent = buttonHandler}
	buttonRed.x = _W - 180; buttonRed.y = _H - 60; buttonRed.width = 50; buttonRed.height = 50
	buttonRed.anchorX, buttonRed.anchorY = 0.0, 0.0

	local buttonGreen = widget.newButton{id = "btnGreen",onEvent = buttonHandler}
	buttonGreen.x = _W - 120; buttonGreen.y = _H - 60; buttonGreen.width = 50; buttonGreen.height = 50
	buttonGreen.anchorX, buttonGreen.anchorY = 0.0, 0.0

	local buttonBlue = widget.newButton{id = "btnBlue",onEvent = buttonHandler}
	buttonBlue.x = _W - 60; buttonBlue.y = _H - 60; buttonBlue.width = 50; buttonBlue.height = 50
	buttonBlue.anchorX, buttonBlue.anchorY = 0.0, 0.0

--	predator // create the fucker :)
	predator =  display.newImage( myImageSheet , sheetInfo:getFrameIndex("predator") )
	-- predator = display.newImage("predator.png", _W+50, baseline-25 )
	predator.y = baseline-19
	predatorR, predatorG, predatorB = 0,0,0
	predator.width = 100
	predator.anchorX = LEFT_REF
	predator.anchorY = TOP_REF
	getNewPredatorRGB()

-- pit 	--	140x20	//	bridge // hole // whatever
	-- pit = display.newImage("pit.png", 0, baseline+25 ) --XXXDFSADFADSFDSAFDSAFDSFDSAFDSAFSDAAFSDFSADFSDAFASD
	pit = display.newImage( myImageSheet , sheetInfo:getFrameIndex("pit") )
	pit.y = baseline+14
	pit.width = 140
	pit.anchorX = LEFT_REF
	pit.anchorY = TOP_REF
	pitR, pitG, pitB = 0,0,0
	getNewPitRGB()

--	update colors
	updateRGBeleonColor()

--	grass // add grass to the sceen... everything is better with a bit of grass :)
	local grass =  display.newImage( myImageSheet , sheetInfo:getFrameIndex("grass") )
	grass.anchorX = LEFT_REF
	grass.anchorY = TOP_REF
	grass.x = 0
	grass.y = baseline + 6
	grass.height = grass.height/2
	local grass2 =  display.newImage( myImageSheet , sheetInfo:getFrameIndex("grass") )
	grass2.anchorX = LEFT_REF
	grass2.anchorY = TOP_REF
	grass2.x = _W -1
	grass2.y = baseline +6
	grass2.height = grass2.height/2

-- start the game loop
local tPrevious = system.getTimer()
local function move(event)
	local tDelta = event.time - tPrevious
	tPrevious = event.time

	local xOffset = ( gameSpeed * tDelta )

	--	move the grass
		grass.x = grass.x - xOffset
		grass2.x = grass2.x - xOffset

	--	move the predator
		predator.x = predator.x - xOffset

	--	move the pit
		pit.x = pit.x - xOffset

	--	fix imposible situation // pit and predator the same color = hame over :P
		if math.abs( (predator.x+predator.width/2) - (pit.x+pit.width/2) ) < pit.width*1.1 then 
			if predatorR==pitR and predatorG==pitG and predatorB==pitB then
				if pitR>0 then
					predatorR=0
					predatorG=255
				elseif pitG>0 then
					predatorG=0
					predatorB=255
				elseif pitB>0 then
					predatorB=0
					predatorR=255
				end

				--	color changed, redraw
					predator:setFillColor(predatorR, predatorG, predatorB, 1)
					updateRGBeleonColor()
			end
		end

	--	detect collision with Predator
		if predator.x < rgbeleon.x+rgbeleon.width then
			--	check color for Predator
				if rgbeleonR==predatorR and rgbeleonG==predatorG and rgbeleonB==predatorB then
					if predator.x < rgbeleon.x then

						--	fade out predator ???

						-- --	kill the predator -- generate new one
						-- 	getNewPredatorRGB()

						-- --	update colors
						-- 	updateRGBeleonColor()

						-- --	add score
						-- 	t.text = score

						-- --	speed up the game
						-- 	gameSpeed = gameSpeed + 0.003
						-- 	txtDebug.text = gameSpeed
					end
				elseif predator.x > rgbeleon.x then
					-- player is dead
					physics.addBody( rgbeleon, { density=3.0, friction=0.5, bounce=0.1 } )
					forceMag = 5
					if gameSpeed > 0 then  rgbeleon:applyLinearImpulse(forceMag*-10, -20, rgbeleon.x, rgbeleon.y) end
					RGBeleonDie()

					-- txtDebug.text = "RGBeleon is DEAD :("
				end
		end


	--	collision with the Pit
		--	check color for the Pit
			if rgbeleonR==pitR and rgbeleonG==pitG and rgbeleonB==pitB then
				-- txtDebug.text = "warning"
				--	same color as the pit / bridge
				if pit.x > rgbeleon.x - rgbeleon.width/2 -20  and  pit.x < rgbeleon.x + rgbeleon.width/2 +20 then
					--	death

					--	where to fall
					if pit.x <= rgbeleon.x and pit.x + pit.width >= rgbeleon.x + rgbeleon.width then
						--	fall down
						xComp = 0
					elseif pit.x + pit.width/2 <= rgbeleon.x + rgbeleon.width/2 then
						--	fall right
						xComp = -10
					else
						--	fall left
						xComp = 10
					end
					
					physics.addBody( rgbeleon, { density=3.0, friction=0.5, bounce=0.3 } )
					if gameSpeed > 0 then rgbeleon:applyLinearImpulse(5*xComp, 0, rgbeleon.x, rgbeleon.y) end
					RGBeleonDie()

					-- txtDebug.text = "RGBeleon is DEAD :("
				end
			end

		--	check if predator off screen
			if predator.x < 0 - predator.width then
				--	kill the predator -- generate new one
					getNewPredatorRGB()

				--	update colors
					updateRGBeleonColor()

				--	add score
					t.text = score

				--	speed up the game
					-- gameSpeed = gameSpeed + 0.003
					-- txtDebug.text = gameSpeed
					speedUp()
			end

		--	check if pit off screen
			if pit.x < 0 - pit.width then
				--	kill the pit
					getNewPitRGB()

				--	update colors
					updateRGBeleonColor()

				--	add score
					t.text = score

				--	speed up the game
					-- gameSpeed = gameSpeed + 0.003
					-- txtDebug.text = gameSpeed
					speedUp()
			end


	

	--	teleport grass
		if (grass.x + grass.contentWidth) < 0 then
			-- grass:translate( 480 * 2, 0)
			grass.x = 480 -2
		end
		if (grass2.x + grass2.contentWidth) < 0 then
			-- grass2:translate( 480 * 2, 0)
			grass2.x = 480 -2
		end
	
end

-- get the party started
	Runtime:addEventListener( "enterFrame", move );