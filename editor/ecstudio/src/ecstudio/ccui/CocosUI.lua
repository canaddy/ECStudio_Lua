--[[--------------------------
[ecui]Cocos2d UI模块   

 	Copyright (c) 2017 zengbinsi.com

	- Desc: 	Cocos2d UI模块
	- Author: 	zengbinsi
	- Date: 	2016-01-11  

--]]--------------------------  







---
-- 命名空间
---
local M 	= M or {}  


--[[-
加载节点  

<br/>  
### Useage:
  	创建一个空的节点。  

### Aliases:
	**createNode**  

### Notice:
	注意   

### Example:
	示例  

### Parameters:
- 	类型 	**参数名** 				[必/可选] 参数说明  

### OptionParameters
	其它参数  

### Returns: 
-   cc.Node    

--]]
function M.loadNode()
 	return ex.ECSNodeEx.extend(cc.Node:create())
end
M.createNode 	= M.loadNode  

--[[-
加载精灵  

<br/>  
### Useage:
  	创建一个精灵。  

### Aliases:
	**createSprite**    

### Notice:
	注意   

### Example:
	示例  

### Parameters:
- 	string 	**fileName** 				[必选] 图片路径  
- 	number 	**x** 						[可选] 坐标  
- 	number 	**y** 						[可选] 坐标  
- 	table 	**params** 					[可选] 其它参数  

### OptionParameters
	classes 			**class** 					类对象  
	cc.Size 			**size** 					尺寸  
	cc.Rect|CapInsets 	**capInsets** 				区域  

### Returns: 
-   cc.Sprite    

--]]
function M.loadSprite(fileName, x, y, params)
 	return ex.ECSNodeEx.extend(display.newSprite(fileName, x, y, params))
end
M.createSprite 	= M.loadSprite  


--[[-
加载精灵  

<br/>  
### Useage:
  	创建一个精灵。  

### Aliases:
	**createSprite**    

### Notice:
	注意   

### Example:
	示例  

### Parameters:
- 	string 	**filePath** 				[必选] 图片路径  

### OptionParameters
	其它参数  

### Returns: 
-   cc.Lable  

--]]
function M.loadLableTTF(params)
 	return ex.ECSNodeEx.extend(display.newTTFLabel(params))
end
M.createSprite 	= M.loadSprite  







return M 








