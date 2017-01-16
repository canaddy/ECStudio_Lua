--[[--------------------------
[ecui]树形控件节点

 	Copyright (c) 2011-2016 Baby-Bus.com

	- Desc: 	树形控件节点
	- Author: 	zengbinsi
	- Date: 	2016-0-0  

--]]-------------------------- 




--========================
-- 引入命名空间
--========================
-- local BaseLayer = import("app.common.layer.BaseLayer")





--[[

	self:bindTouch() 

	local TreeViewItem 	= import("app.common.cs.ecui.TreeViewItem")
	local t1 	= TreeViewItem.new({text = "item1", level = 0}):to(self, 1000):pc()

	F.delayCall(2, function()
		 t11 	= TreeViewItem.new({text = "item11", level = 1})
		t1:addItem(t11)
	end)

	F.delayCall(4, function()
		 t12 	= TreeViewItem.new({text = "item12", level = 1})
		t1:addItem(t12)
	end)

	F.delayCall(6, function()
		 t111 	= TreeViewItem.new({text = "item111", level = 2})
		t11:addItem(t111)
	end)
	F.delayCall(8, function()
		 t1111 	= TreeViewItem.new({text = "item1111", level = 3})
		t111:addItem(t1111)
	end)

	F.delayCall(10, function()
		 t112 	= TreeViewItem.new({text = "item112", level = 2})
		t11:addItem(t112)
	end)	
	




]]



--[[
	类
--]]


local M 	= class("TreeView", function(params)
	params 		= params or {}
	local lable = cc.LabelTTF:create(params.text or "unname", nil, 18)
	local item 	= ccui.ui.loadNode()

	item:setAnchorPoint(cc.p(0, 1))
	item:setContentSize(cc.size(300, lable:getContentSize().height))
	item:addChild(lable)

	lable:setPosition((params.level or 0) * 20, item:getContentSize().height / 2)
	lable:setAnchorPoint(cc.p(0, 0.5))
	lable:setColor(cc.c4b(189, 189, 189, 255))

	return item
end)




--========================
-- 构造函数
--========================

function M:ctor(params)
	-- [超类调用]
	-- M.super.ctor(self, params)
	params 				= params or {}  

 	-- [本类调用]
 	-- 标题（用于显示）
 	self.text 			= params.text or "unname"
 	-- 子级是否处于展开状态
 	self.isOpenCascade 	= true  
 	-- 子级对象
 	self.items 			= {} 
 	-- 级别
 	self.level 			= params.level or 0 
 	-- 缩进
 	self.tabLen 		= 20 
 	-- 用户数据
 	self.userData 		= params.userData or self  


 	-- 事件回调
 	self.touchBegan 	= params.touchBegan
 	self.touchMoved 	= params.touchMoved
 	self.touchEnded 	= params.touchEnded
 	self.touchCancelled = params.touchCancelled

 	self:bindTouch() 
end




--========================
-- 析构
--========================

function M:onDestructor()
	-- [超类调用]
	-- M.super.onDestructor(self)
 	-- [本类调用]

end








--========================
-- 触控
--======================== 

function M:onTouchBegan(x, y, touches)
	self.preTouch 	= cc.p(x, y)

	if self.touchBegan then 
		self.touchBegan({target = self.text, x = x, y = y, touches = touches, })
	end
	--  触控有效
	return true  
end

function M:onTouchMoved(x, y, touches)
	if self.touchMoved then 
		self.touchMoved({target = self.text, x = x, y = y, touches = touches, })
	end
end

function M:onTouchEnded(x, y, touches)
	if self.touchEnded then 
		self.touchEnded({target = self.text, x = x, y = y, touches = touches, })
	end

	if cc.pGetDistance(self.preTouch, cc.p(x, y)) > 50 then 
		return 
	end

	if self.isOpenCascade then 
		self:closeItems()
	else
		self:openItems()
	end
end








--========================
-- 功能函数
--======================== 

--[[-
更新子级坐标  

<br/>  
### Useage:
  	用途  

### Notice:
	注意   

--]]
function M:updateItemsPosition()
 	local y 	= 0
	
	for i, item in ipairs(self.items) do
		item:setPositionY(y)
		y = y - item:getItemSize().height 
	end

	local parent = self:getParent()

	if parent and parent.updateItemsPosition then 
		return parent:updateItemsPosition()
	end
end

--[[-
添加子级  

<br/>  
### Useage:
  	添加子级目录。  

### Notice:
	注意   

### Parameters:
- 	TreeViewItem 	**newItem** 				[必选] 子级对象  

### Returns: 
-   TreeViewItem  

--]]
function M:addItem(newItem)
	if self.isOpenCascade then 
		newItem:setVisible(true)
	else
		newItem:setVisible(false)
	end
	self:addChild(newItem)
	table.insert(self.items, newItem)

	self:updateItemsPosition()

 	return newItem 
end 

--[[-
展开子级  

<br/>  
### Useage:
  	用途  

### Notice:
	注意   

### Returns: 
-   返回值类型 							返回值说明  

--]]
function M:openItems(isCascade)
 	self.isOpenCascade = true 

 	for i, item in ipairs(self.items) do
 		if isCascade then 
	 		item:openItems(isCascade)
	 	end
 		item:setVisible(true)
 	end

 	self:updateItemsPosition()
end

--[[-
关闭子级  

<br/>  
### Useage:
  	用途  

### Notice:
	注意   

### Returns: 
-   返回值类型 							返回值说明  

--]]
function M:closeItems(isCascade)
 	self.isOpenCascade = nil  

 	for i, item in ipairs(self.items) do
 		item:setVisible(false)
 		if isCascade then 
	 		item:closeItems(isCascade)
	 	end
 	end

 	self:updateItemsPosition()
end




--========================
-- 属性
--======================== 

--[[-
设置文字内容  

<br/>  
### Useage:
  	设置显示的文字内容  

### Notice:
	注意   

### Parameters:
- 	string 	**text** 				[必选] 文字内容  

### Returns: 
-   返回值类型 							返回值说明  

--]]
function M:setString(text)
 	self.contextLabel:setString(text)
end
M.setText 	= M.setString 


--[[-
获取选项尺寸  

<br/>  
### Useage:
  	获取选项的大小。  

### Notice:
	注意   

### Parameters:
- 	类型 	**参数名** 				[必/可选] 参数说明  

### Returns: 
-   CCSize  

--]]
function M:getItemSize()
	local size 	= self:getContentSize()
	local w, h 	= size.width, size.height  

 	if self.isOpenCascade then 
 		for i, item in ipairs(self.items) do
 			h 	= h + item:getItemSize().height 
 		end
 	end

 	return cc.size(w, h)
end




--========================
-- 父类重写
--======================== 




return M







