--[[--------------------------
[ecs]仪表盘Layer

 	Copyright (c) 2017 zengbinsi.com

	- Desc: 	仪表盘Layer
	- Author: 	zengbinsi
	- Date: 	2017-01-14  

--]]--------------------------  




--========================
--  引入命名空间
--========================







--[[  
	类  
--]]  




local M 	= ef.classLayer("DashboardLayer", function()
	return ccui.ui.loadLayerColor({color = cc.c4b(52, 52, 52, 255)})
end)

function M:ctor()
	self:setContentSize(cc.size(960, 640))
	self:ignoreAnchorPointForPosition(false)
	self:setAnchorPoint(cc.p(.5, .5))
	self:setPosition(display.cx, display.cy)

	self:loadPanelHead()
	self:loadPanelBody()

	self:bindTouch()
end


--========================
--  功能方法
--========================


-- 加载面板标题部分
function M:loadPanelHead()
	self:loadTitle()
	self:loadButtonNew()
	self:loadButtonOpen()
end 

-- 显示头部的”Project“标签
function M:loadTitle()
	ccui.ui.loadLableTTF({
		text 	= "Projects"
		}):px(100):py(590):to(self)
end

function M:loadButtonNew()
	ccui.ui.loadLableTTF({
		text 	= "New"
		}):px(690):py(590):to(self)
end

function M:loadButtonOpen()
	ccui.ui.loadLableTTF({
		text 	= "Open"
		}):px(770):py(590):to(self)
end

-- 加载面板内容部分
function M:loadPanelBody()

	-- 加载一个滚动的项目列表
end 









--========================
--  touch
--========================


function M:onTouchBegan(x, y, touches)
	return true 
end

function M:onTouchMoved(x, y, touches)
	--   
end

function M:onTouchEnded(x, y, touches)
	--  
end

















--========================
--  重载
--========================




function M:onEnter()

end

function M:onExit()

end

return M








