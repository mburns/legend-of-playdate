local pd <const> = playdate
local gfx <const> = pd.graphics

class('Player').extends(gfx.sprite)

function Player:init(x, y)
    local playerImage = gfx.image.new("images/player")
	playerSprite = gfx.sprite.new(playerImage)
    self:setImage(playerImage)
    self:moveTo(x, y)
	playerSprite:setCollideRect(0, 0, playerSprite:getSize())
    self:add()

    self.speed = 4
end

function Player:update()
	if pd.buttonIsPressed(pd.kButtonUp) then
		self:moveBy(0, -self.speed)
	end
	if pd.buttonIsPressed(pd.kButtonRight) then
		self:moveBy(self.speed, 0)
	end
	if pd.buttonIsPressed(pd.kButtonDown) then
		self:moveBy(0, self.speed)
	end
	if pd.buttonIsPressed(pd.kButtonLeft) then
		self:moveBy(-self.speed, 0)
	end

	if self.x < 18 then
		self:moveTo(18, self.y)
	end

	if self.y < 18 then
		self:moveTo(self.x, 18)
	end

	if self.x > 381 then
		self:moveTo(381, self.y)
	end

	if self.y > 224 then
		self:moveTo(self.x, 224)
	end
end
