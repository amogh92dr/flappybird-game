
ScoreState = Class{__includes = BaseState}

--[[
    When we enter the score state, we expect to receive the score
    from the play state so we know what to render to the State.
]]

local GOLD_MEDAL = love.graphics.newImage('asset/image/gold.png')
local SILVER_MEDAL = love.graphics.newImage('asset/image/silver.png')
local BRONZE_MEDAL = love.graphics.newImage('asset/image/bronze.png')
function ScoreState:enter(params)
  self.score = params.score
end

function ScoreState:update(dt)
  -- go back to play if enter is pressed
  if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
    gStateMachine:change('countdown')
  end
end

function ScoreState:render()
  -- simply render the score to the middle of the screen
  love.graphics.setFont(flappyFont)
  love.graphics.printf('Oof! You lost!', 0, 64, VIRTUAL_WIDTH, 'center')

  love.graphics.setFont(mediumFont)
  love.graphics.printf('Score: ' .. tostring(self.score), 0, 120, VIRTUAL_WIDTH, 'center')
  if(self.score >= 25) then
    love.graphics.draw(GOLD_MEDAL, (VIRTUAL_WIDTH / 2) + 40, 100, 0, 0.1, 0.1)
    else if(self.score >= 20) then
      love.graphics.draw(SILVER_MEDAL, (VIRTUAL_WIDTH / 2) + 40, 100, 0, 0.1, 0.1)
      else if (self.score >= 15) then
        love.graphics.draw(BRONZE_MEDAL, (VIRTUAL_WIDTH / 2) + 40, 100, 0, 0.1, 0.1)
      end
    end
  end
  love.graphics.printf('Press Enter to Play Again!', 0, 160, VIRTUAL_WIDTH, 'center')
end
