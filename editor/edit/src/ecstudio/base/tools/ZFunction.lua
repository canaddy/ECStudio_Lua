--[[--------------------------
[ecs]游戏应用  

 	Copyright (c) 2017 zengbinsi.com

	- Desc: 	游戏应用
	- Author: 	zengbinsi
	- Date: 	2017-01-14  

--]]-------------------------- 








--========================
--  命名空间
--========================

ef 		= ef or {}








--[[-
定义一个场景类对象  

<br/>  
### Useage:
  	定义一个类。  

### Notice:
	注意   

### Parameters:
- 	string 	**className** 				[必选] 类名  
- 	class 	**superClass** 				[可选] 父类对象    

### Returns: 
-   cc.Scene   						

--]]
function ef.classScene(className, superClass)
	local Scene = class(className, superClass or function()
	    return display.newScene(className)
	end)

	return Scene
end

--[[-
定义一个Layer类对象  

<br/>  
### Useage:
  	定义一个类。  

### Notice:
	注意   

### Parameters:
- 	string 	**className** 				[必选] 类名  
- 	class 	**superClass** 				[可选] 父类对象    

### Returns: 
-   cc.Layer   						

--]]
function ef.classLayer(className, superClass)
	local Layer = class(className, superClass or function()
	    return cc.Layer:create()
	end)

	return Layer
end





return ef 

