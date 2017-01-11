
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


	local a = cc.ui.UILabel.new({
            UILabelType = 2, text = "Hello, World", size = 64})
        :align(display.CENTER, display.cx, display.cy)
        :addTo(layer) 

	ex.EventEx.bindTouch(a)

	function a:onTouchBegan(x, y, event)
		print("ssssssssss")
		return true 
	end

	function a:onTouchMoved(x, y, touches)
		print("ssssssssss2")
	end

	function a:onTouchEnded(x, y, event)
		print("ssssssssss3")
	end
end

function MainScene:onEnter()
end

function MainScene:onExit()
end

return MainScene
