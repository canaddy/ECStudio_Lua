--[[--------------------------
[base-ex]节点扩展  

 	Copyright (c) 2017 zengbinsi.com

	- Desc: 	节点扩展
	- Author: 	zengbinsi
	- Date: 	2017-01-11  

--]]--------------------------  







---
-- 节点扩展对象  
---
local M 	= {}

-- 节点
local Node 	= {}


--[[-
扩展节点方法  

<br/>  
### Useage:
  	添加方法。  

### Aliases:
	**ex**  

### Notice:
	注意   

### Example:
	示例  

### Parameters:
- 	cc.Node 	**node** 				[必选] 需要扩展的节点  

### OptionParameters
	其它参数  

### Returns: 
-   cc.Node  

--]]
function M.extend(node)
	for methodName, method in pairs(Node) do
		node[methodName] 	= method 
	end

 	return node 
end
M.ex 	= M.extend 








--========================
--  事件相关
--========================

--[[-
绑定touch事件    

<br/>  
### Useage:
  	给节点添加touch事件。  

### Aliases:
	别名  

### Notice:
	注意   

### Example:
	示例  

### Parameters:
- 	type 	**xxx** 				[必选] xxxx  

### OptionParameters
	其它参数  

### Returns: 
-   cc.Node  

--]]
function Node:bindTouch()
 	ex.EventEx.bindTouch(self)

 	return self  
end












--========================
--  属性相关
--========================


--[[-
添加到节点  

<br/>  
### Useage:
  	将自身添加到一个节点上。  

### Aliases:
	别名  

### Notice:
	注意   

### Example:
	示例  

### Parameters:
- 	cc.Node 	**parent** 				[必选] 父节点  
- 	number 		**z** 					[可选] 层级  

### OptionParameters
	其它参数  

### Returns: 
-   cc.Node    

--]]
function Node:to(parent, z)
	parent:addChild(self, z)

	return self 
end

--[[-
添加节点  

<br/>  
### Useage:
  	将一个节点添加到自身上。  

### Aliases:
	别名  

### Notice:
	注意   

### Example:
	示例  

### Parameters:
- 	cc.Node 	**child** 				[必选] 子节点  
- 	number 		**z** 					[可选] 层级  

### OptionParameters
	其它参数  

### Returns: 
-   cc.Node    

--]]
function Node:addNode(child, z)
 	self:addChild(child, z)

 	return self 
end 

--[[-
x坐标  

<br/>  
### Useage:
  	设置或者获取节点的x坐标。  

### Notice:
	当传递参数x的时候，该方法为设置坐标，并返回当前节点。
	当不传递参数x的时候，该方法为获取坐标。

### Parameters:
- 	number 	**x** 					[可选] x坐标值  

### Returns: 
-   cc.Node | number    

--]]
function Node:px(x)
 	if x then 
 		self:setPositionX(x)
 		return self 
 	else
 		self:getPositionX()
 	end
end

--[[-
y坐标  

<br/>  
### Useage:
  	设置或者获取节点的y坐标。  

### Notice:
	当传递参数y的时候，该方法为设置坐标，并返回当前节点。
	当不传递参数y的时候，该方法为获取坐标。

### Parameters:
- 	number 	**y** 					[可选] y坐标值  

### Returns: 
-   cc.Node | number    

--]]
function Node:py(y)
 	if y then 
 		self:setPositionY(y)
 		return self 
 	else
 		self:getPositionY()
 	end
end

--[[-
锚点x坐标  

<br/>  
### Useage:
  	设置或者获取节点的x坐标。  

### Notice:
	当传递参数x的时候，该方法为设置坐标，并返回当前节点。
	当不传递参数x的时候，该方法为获取坐标。

### Parameters:
- 	number 	**x** 					[可选] x坐标值  

### Returns: 
-   cc.Node | number    

--]]
function Node:ax(x)
 	if x then 
 		local y 	= self:getAnchorPoint().y

 		self:setAnchorPoint(cc.p(x, y))
 		return self 
 	else
 		return self:getAnchorPoint().x
 	end
end

--[[-
y坐标  

<br/>  
### Useage:
  	设置或者获取节点的y坐标。  

### Notice:
	当传递参数y的时候，该方法为设置坐标，并返回当前节点。
	当不传递参数y的时候，该方法为获取坐标。

### Parameters:
- 	number 	**y** 					[可选] y坐标值  

### Returns: 
-   cc.Node | number    

--]]
function Node:ay(y)
 	if y then 
 		local x 	= self:getAnchorPoint().x

 		self:setAnchorPoint(cc.p(x, y))
 		return self 
 	else
 		return self:getAnchorPoint().y
 	end
end









return M 







