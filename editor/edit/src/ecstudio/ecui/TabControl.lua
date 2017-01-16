--[[--------------------------
[ecs]选项卡  

 	Copyright (c) 2017 zengbinsi.com

	- Desc: 	选项卡
	- Author: 	zengbinsi
	- Date: 	2017-01-16  

--]]--------------------------  




--========================
--  引入命名空间
--========================







--[[  
	类  
--]]  




local M 	= class("TabControl", function(params)
	params 				= params or {}
	-- 选项卡宽度
	params.width 		= params.width or 300
	-- 选项卡高度
	params.height 		= params.height or 250
	-- 选项卡标题高度
	prarms.titleHeight 	= prarms.titleHeight or 50 

	-- 背景色
	params.colorBg 		= params.colorBg or cc.c4b(38, 38, 38, 255) 
	-- 标题背景色
	params.colorTitleBg = params.colorTitleBg or cc.c4b(52, 52, 52, 255) 
	-- 标题文字颜色
	params.colorTitle 	= params.colorTitle or cc.c4b(255, 255, 255, 255)

	-- 标题高亮背景色
	params.colorTitleHL = params.colorTitleHL or params.colorBg 

	return cc.ClippingRegionNode:create(cc.rect(0, 0, params.width, params.height))
end)

function M:ctor(params)
	params 				= params or {}  
	self.width 			= params.width
	self.height 		= params.height
	self.titleHeight 	= params.titleHeight

	self.colorBg 		= params.colorBg
	self.colorTitleBg 	= params.colorTitleBg
	self.colorTitle 	= params.colorTitle
	self.colorTitleHL 	= params.colorTitleHL


	self:loadContentPanel()
	self:loadTitlePanel()
end 

--[[-
加载内容面板  

<br/>  
### Useage:
  	显示选项卡的内容。  

### Notice:
	注意   

### Parameters:
- 	类型 	**参数名** 				[必/可选] 参数说明  

--]]
function M:loadContentPanel()
 	-- 背景色
 	ccui.ui.loadLayerColor({color = self.colorBg}):to(self, -10000) 
end

--[[-
加载选项卡标题面板  

<br/>  
### Useage:
  	显示选项卡的标题。  

### Notice:
	注意   

### Parameters:
- 	类型 	**参数名** 				[必/可选] 参数说明  

--]]
function M:loadTitlePanel()
 	--  
end





function M:onEnter()

end

function M:onExit()

end

return M








