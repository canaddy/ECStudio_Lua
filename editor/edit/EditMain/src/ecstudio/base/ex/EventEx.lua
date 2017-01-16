--[[--------------------------
[base-ex]事件扩展  

 	Copyright (c) 2017 zengbinsi.com

	- Desc: 	事件扩展
	- Author: 	zengbinsi
	- Date: 	2017-01-11  

--]]--------------------------  







---
-- 命名空间
---
local M 	= {}




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
function M.bindTouch(node)
 	node:addNodeEventListener(cc.NODE_TOUCH_EVENT, function(event)
 		-- 为了move的性能，把move放在第一个位置，减少一次if判断的执行  
		if event.name == "moved" then 
			if node.onTouchMoved then 
				return node:onTouchMoved(event.x, event.y, event)
			end
		elseif event.name == "began" then 
			if node.onTouchBegan then 
				return node:onTouchBegan(event.x, event.y, event)
			else
				return false   
			end
		elseif event.name == "ended" then 
			if node.onTouchEnded then 
				return node:onTouchEnded(event.x, event.y, event)
			end
		elseif event.name == "cancelled" then 
			if node.onTouchCancelled then 
				return node:onTouchCancelled(event.x, event.y, event)
			end
		end
	end)
	node:setTouchEnabled(true)

	return node
end








return M 








