--[[--------------------------
[ecs]类

 	Copyright (c) 2017 zengbinsi.com

	- Desc: 	类
	- Author: 	zengbinsi
	- Date: 	2017-01-14  

--]]--------------------------  




--========================
--  引入命名空间
--========================







--[[  
	类  
--]]  




local M 	= ef.classScene("DashboardScene")

function M:ctor()
	self:loadLayers()
end








--========================
--  功能方法
--========================

--[[-
加载Layer  

<br/>  
### Useage:
  	创建Layer。  

### Aliases:
	别名  

### Notice:
	注意   

### Returns: 
-   cc.Scene  

--]]
function M:loadLayers()
 	local className = string.gsub(self.__cname, "Scene", "")
 	local cls 		= import("app." .. className .. "." .. className .. "Layer")
 	local layer 	= cls.new()

 	self:addChild(layer, 10)

 	return self  
end









--========================
--  重载
--========================


function M:onEnter()

end

function M:onExit()

end

return M








