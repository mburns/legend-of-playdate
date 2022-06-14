import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"

import "player"
import "screenShake"

local pd <const> = playdate
local gfx <const> = pd.graphics

local screenShakeSprite = ScreenShake()

local playerSprite = nil

function setShakeAmount(amount)
	screenShakeSprite:setShakeAmount(amount)
end

local function initialize()
	math.randomseed(pd.getSecondsSinceEpoch())

	Player(200, 120)

	items = gfx.imagetable.new("images/items")

	print("Total items loaded: " .. items:getLength())

	-- for n=1, items:getSize() do
		-- items:drawImage(n,10,10+n*16)
		-- i:add()
	-- end

	setShakeAmount(10)

	local backgroundImage = gfx.image.new("images/background")
	gfx.sprite.setBackgroundDrawingCallback(
		function(x, y, width, height)
			gfx.setClipRect(x, y, width, height)
			backgroundImage:draw(0, 0)
			gfx.clearClipRect()
		end
	)
end

initialize()

function pd.update()
	gfx.sprite.update()
end
