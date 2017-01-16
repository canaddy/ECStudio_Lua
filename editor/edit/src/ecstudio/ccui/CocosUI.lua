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

--[[-
加载一个带有颜色的Layer    

<br/>  
### Useage:
  	创建带有背景颜色的图层。  

### Aliases:
	**loadColorLayer**  

### Notice:
	注意   

### Example:
	
	-------------  
	-- 实例一
	-------------  
	local colorLayer = ccui.ui.loadLayerColor({})
	self:addChild(colorLayer)  

### Parameters:
- 	table 	**params** 				[可选] 创建带颜色图层的参数列表  

### OptionParameters
	cc.Color4B 		**color** 			背景色  
	cc.Size 		**size** 			内容尺寸  

### Returns: 
-   cc.ColorLayer    

--]]
function M.loadLayerColor(params)
	params 			= params or {}
	-- 标题背景色：cc.c4b(52, 52, 52, 255) ，面板背景色：cc.c4b(38, 38, 38, 255)， 文字颜色：cc.c4b(189, 189, 189, 255)
	local color 	= params.color or cc.c4b(38, 38, 38, 255)
	local node 		= ex.ECSNodeEx.extend(cc.LayerColor:create(color))

	if params.size then 
		node:setContentSize(params.size)
	end

	if params.ignoreAnchorPoint ~= nil then 
		node:ignoreAnchorPointForPosition(params.ignoreAnchorPoint)
	end

 	return node 
end
M.loadColorLayer 	= M.loadLayerColor







return M 








