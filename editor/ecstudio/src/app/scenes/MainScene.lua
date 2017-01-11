
local MainScene = class("MainScene", function()
    return display.newScene("MainScene")
end)

function MainScene:ctor()
    cc.ui.UILabel.new({
            UILabelType = 2, text = "Hello, World", size = 64})
        :align(display.CENTER, display.cx, display.cy)
        :addTo(self)



	-- local t1 	= ecui.TreeViewItem.new({text = "item1", level = 0})

	-- t1:setPosition(400, 400)
	-- self:addChild(t1, 1000)

	-- t11 	= ecui.TreeViewItem.new({text = "item11", level = 1})
	-- t1:addItem(t11)

	-- t12 	= ecui.TreeViewItem.new({text = "item12", level = 1})
	-- t1:addItem(t12)

	-- t111 	= ecui.TreeViewItem.new({text = "item111", level = 2})
	-- t11:addItem(t111)
	
	-- t1111 	= ecui.TreeViewItem.new({text = "item1111", level = 3})
	-- t111:addItem(t1111)

	-- t112 	= ecui.TreeViewItem.new({text = "item112", level = 2})
	-- t11:addItem(t112)	


	local layer = cc.Layer:create()
	self:addChild(layer, 100)

	-- layer:addNodeEventListener(c.NODE_TOUCH_EVENT, function(event)
	-- 	dump(event)
	-- end)
end

function MainScene:onEnter()
end

function MainScene:onExit()
end

return MainScene
