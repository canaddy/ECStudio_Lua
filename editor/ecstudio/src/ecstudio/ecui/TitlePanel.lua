--[[--------------------------

 	Copyright (c) 2011-2016 Baby-Bus.com

	- Desc: 	
	- Author: zengbinsi
	- Date: 	2016-0-0  

--]]-------------------------- 




--========================
-- 引入命名空间
--========================
-- local BaseLayer = import("app.common.layer.BaseLayer")




--[[
	类
--]]


local M 	= class("SpriteName", function(parms)
	local panel 		= ccui.ui.loadLayerColor()
	local titleLable 	= ccui.ui.loadLableTTF({text = "panel",}):ax(0):to(panel)

	return panel 
end)




--========================
-- 构造函数
--========================

function M:ctor(params)
	-- [超类调用]
	M.super.ctor(self, params)
 	-- [本类调用]

end

--========================
-- 渲染
--========================


--========================
-- 析构
--========================

function M:onDestructor()
	-- [超类调用]
	M.super.onDestructor(self)
 	-- [本类调用]

end








--========================
-- 触控
--======================== 

function M:onTouchBegan(x, y, touches)
	--  触控有效
	return SIGN_TOUCH_BEGAN_SWALLOWS 
end

function M:onTouchMoved(x, y, touches)
	--   
end

function M:onTouchEnded(x, y, touches)
	--  
end








--========================
-- 功能函数
--========================




--========================
-- 属性
--========================




--========================
-- 父类重写
--======================== 




return M






