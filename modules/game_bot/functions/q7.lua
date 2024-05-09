local function set_random_pos_button(panel)
    local button = panel:addButton("Jump!", 100, 20)
    button:setOnClickListener(function()
      local x = math.random(0, panel:getWidth() - button:getWidth())
      local y = math.random(0, panel:getHeight() - button:getHeight())
      button:setPosition(x, y)
    end)
  end