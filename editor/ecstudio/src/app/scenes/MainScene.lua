
local MainScene = class("MainScene", function()
    return display.newScene("MainScene")
end)

function MainScene:ctor()
    



	local t1 	= ecui.TreeViewItem.new({text = "gameObject1", level = 0})

	t1:setPosition(400, 400)
	self:addChild(t1, 1000)

	t11 	= ecui.TreeViewItem.new({text = "gameObject11", level = 1})
	t1:addItem(t11)

	t12 	= ecui.TreeViewItem.new({text = "gameObject12", level = 1})
	t1:addItem(t12)

	t111 	= ecui.TreeViewItem.new({text = "gameObject111", level = 2})
	t11:addItem(t111)
	
	t1111 	= ecui.TreeViewItem.new({text = "gameObject1111", level = 3})
	t111:addItem(t1111)

	t112 	= ecui.TreeViewItem.new({text = "gameObject112", level = 2})
	t11:addItem(t112)	


	local layer = cc.Layer:create()
	self:addChild(layer, 100)




	local colorLayer = ccui.ui.loadLayerColor({color = cc.c4b(52, 52, 52, 255)})
	self:addChild(colorLayer)

	-- ecui.TitlePanel.new():to(self)
end

function MainScene:onEnter()
end

function MainScene:onExit()
end

return MainScene
