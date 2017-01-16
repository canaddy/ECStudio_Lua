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
- 	节点对象 	**node** 				[必选] 要绑定事件的节点对象  

### OptionParameters
	其它参数  

### Returns: 
-   cc.Node  

--]]
function Node:bindTouchLocate()
 	self:addNodeEventListener(cc.NODE_TOUCH_EVENT, function(event)
 		local localPoint 	= self:getParent():convertToNodeSpace(cc.p(event.x, event.y))  
 		local x, y 			= localPoint.x, localPoint.y 

 		-- 为了move的性能，把move放在第一个位置，减少一次if判断的执行  
 		if event.name == "began" then 
			self.pre = {x = x, y = y} 
			return true 
		elseif event.name == "moved" then 
			local ox, oy 	= x - self.pre.x, y - self.pre.y 

			self:px(self:px() + ox):py(self:py() + oy)

			self.pre = {x = x, y = y} 
		elseif event.name == "ended" then 
			x, y 				= math.floor(x), math.floor(y) 
			event.x, event.y 	= math.floor(event.x), math.floor(event.y) 
			
			print("Node localPosition = cc.p(" .. x .. ", " .. y .. "), worldPosition = cc.p(" .. event.x .. ", " .. event.y .. ")。")
		end
	end)
	self:setTouchEnabled(true)

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
	parent:addChild(self, z or 0)

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
坐标  

<br/>  
### Useage:
  	设置或者获取节点的坐标。  

### Aliases:
	**p**  

### Notice:
	当传递参数的时候，该方法为设置坐标，并返回当前节点。
	当不传递参数的时候，该方法为获取坐标。
	当第一个参数为CCPoint对象时，第二个参数必须省略。

### Parameters:
- 	number | CCPoint 	**x** 					[可选] x坐标值  
- 	number 	 			**y** 					[可选] y坐标值  

### Returns: 
-   cc.Node | number    

--]]
function Node:point(x, y)
	if not x then 
		return self:getPosition() 
	end

	if not y then 
		self:setPosition(x)
	else
		self:setPosition(x, y)
	end

 	return self 
end
Node.p 	= Node.point  

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
 		return self:getPositionX()
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
 		return self:getPositionY()
 	end
end



--[[-
锚点  

<br/>  
### Useage:
  	设置或者获取节点的锚点。  

### Aliases:
	**ap**  
	**anchorPoint**  

### Notice:
	当传递参数的时候，该方法为设置锚点，并返回当前节点。
	当不传递参数的时候，该方法为获取锚点。
	当第一个参数为CCPoint对象时，第二个参数必须省略。

### Parameters:
- 	number | CCPoint 	**x** 					[可选] x锚点值  
- 	number 	 			**y** 					[可选] y锚点值  

### Returns: 
-   cc.Node | number    

--]]
function Node:anchor(x, y)
	if not x then 
		return self:getAnchorPoint() 
	end

	if not y then 
		self:setAnchorPoint(x)
	else
		self:setAnchorPoint(cc.p(x, y))
	end

 	return self 
end
Node.ap 			= Node.anchor  
Node.anchorPoint 	= Node.anchor  

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






