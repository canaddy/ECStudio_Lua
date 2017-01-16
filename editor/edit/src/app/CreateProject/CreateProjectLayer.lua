--[[--------------------------
[ecs]仪表盘Layer

 	Copyright (c) 2017 zengbinsi.com

	- Desc: 	仪表盘Layer
	- Author: 	zengbinsi
	- Date: 	2017-01-14  

--]]--------------------------  




--========================
--  引入命名空间
--========================

local EditBoxLite 	= import(".EditBoxLite")







--[[  
	类  
--]]  




local M 	= ef.classLayer("CreateProjectLayer", function()
	return ccui.ui.loadLayerColor({color = cc.c4b(52, 52, 52, 255)})
end)


---
-- 选中的项目路径
---
selectProjectPath 	= nil 

function M:ctor()
	self:setContentSize(cc.size(960, 640))
	self:loadFrame()

	local headPanel 	= self:loadTitle()
	self:loadButtonCancel(headPanel)

	return self:loadProjectList()
end


--========================
--  功能方法
--======================== 

function M:loadTitle()
	local line 	= cc.LayerColor:create(cc.c4b(101, 77, 71, 255))

	line:setContentSize(cc.size(display.width, 2))
	line:setPosition(0, 580)
	self:addChild(line, 10)

	do 
		local icon 	= cc.Sprite:create("img/common/ecstudio_icon.png")

		icon:setScale(.25)
		icon:setPosition(30, 30)
		line:addChild(icon, 10)
	end

	do 
		local title = display.newTTFLabel({
			text 		= "ECStudio",
			})

		title:setPosition(110, 30)
		line:addChild(title, 10)
	end

	return line 
end 

-- 加载退出按钮
function M:loadButtonCancel(headPanel)
	local node 	= ccui.ui.loadLableTTF({
		text 		= "Cancel",
		}):point(800, 30):to(headPanel):bindTouch()
	local this 	= self 

	function node:onTouchBegan(x, y, event)
		self:scale(1.2)
		return true
	end
	function node:onTouchEnded(x, y, event)
		self:scale(1.0)
		return this:cancel()
	end
end

-- 加载面板内容部分
function M:loadProjectList()
	self:loadLabel()
	self:loadProjectTypeButtons()
	self:loadProjectLocationUI()
	return self:loadPackageNameUI()
end 

-- 加载标签
function M:loadLabel()
	-- 项目类型（bbframework、ECStudio、Cocos2d-JS、quick-x）
	ccui.ui.loadLableTTF({
		text 		= "Select Project Type:",
		}):point(52, 500):ax(0):to(self)
	-- 项目路径
	ccui.ui.loadLableTTF({
		text 		= "Choose Project Location:",
		}):point(52, 350):ax(0):to(self)
	-- 包名
	ccui.ui.loadLableTTF({
		text 		= "Project package name: (etc: com.mycomp.games.mygame)",
		}):point(52, 200):ax(0):to(self)
end

-- 加载项目类型按钮
function M:loadProjectTypeButtons()
	local btnBB 	= self:loadButton("bbframework", cc.c4b(69, 69, 67, 255), function(node)
		return self:selectProjectType(node)
	end):point(120, 425):to(self)

	self:selectProjectType(btnBB)

	self:loadButton("ECStudio", cc.c4b(69, 69, 67, 255), function(node)
		return self:selectProjectType(node)
	end):point(360, 425):to(self)
	self:loadButton("Cocos2d-JS", cc.c4b(69, 69, 67, 255), function(node)
		return self:selectProjectType(node)
	end):point(600, 425):to(self)
	self:loadButton("quick-x", cc.c4b(69, 69, 67, 255), function(node)
		return self:selectProjectType(node)
	end):point(840, 425):to(self)
end

-- 加载项目路径UI  
function M:loadProjectLocationUI()
	local t 				= {
        image = "#ButtonNormal.png",
        size = cc.size(display.width - 320, 50),
        x = 50,
        y = display.top - 100,
    }
    local locationEditbox 	= ex.ECSNodeEx.extend(EditBoxLite.create(t))
    	:point(50, 250):to(self)
    self.locationEditbox 	= locationEditbox


	self:loadButton("choose", cc.c4b(69, 69, 67, 255), function(node)
		local filedialog 		= PlayerProtocol:getInstance():getFileDialogService()
        local locationDirectory = filedialog:openDirectory("Choose Localtion", "")

        if string.len(locationDirectory) > 0 then
            return locationEditbox:setText(locationDirectory)
        end
	end):point(840, 275):to(self)
end

-- 加载包名UI  
function M:loadPackageNameUI()
	local t 		= {
        image = "#ButtonNormal.png",
        size = cc.size(display.width - 320, 50),
        x = 50,
        y = display.top - 100,
    }
    local locationEditbox = ex.ECSNodeEx.extend(EditBoxLite.create(t))
    	:point(50, 100):to(self)

	self:loadButton("New Project", cc.c4b(69, 69, 67, 255), function(node)
		return self:newProject()
	end):point(840, 125):to(self)
end









--========================
--  touch
--========================


function M:onTouchBegan(x, y, touches)
	return true 
end

function M:onTouchMoved(x, y, touches)
	--   
end

function M:onTouchEnded(x, y, touches)
	--  
end








--========================
--  功能方法
--======================== 

-- 加载UI图片
function M:loadFrame()
	local fileUtil 	= cc.FileUtils:getInstance()
	local fullPath 	= fileUtil:fullPathForFilename("img/common/Images_hd2x.plist")
	local fullPng 	= fileUtil:fullPathForFilename("img/common/Images_hd2x.png")
	local spCache 	= cc.SpriteFrameCache:getInstance()

	return spCache:addSpriteFrames(fullPath, fullPng)
end

--[[-
加载按钮  

<br/>  
### Useage:
  	创建一个带背景和文字的按钮。  

### Parameters:
- 	string 		**text** 				[必选] 文字内容  
- 	cc.Color4B 	**color** 				[必选] 背景颜色  
- 	function 	**callback** 			[必选] 回调函数  

### Returns: 
-   cc.Node  

--]]
function M:loadButton(text, color, callback)
 	local node 	= ccui.ui.loadNode():bindTouch()
	node.text 	= ccui.ui.loadLableTTF({
		text 		= text,  
		}):point(0, 0):to(node, 100)
	node.bg 	= ccui.ui.loadLayerColor({
		color 				= color,
		size 				= cc.size(150, 50),
		ignoreAnchorPoint 	= false, 
		}):to(node)

	function node:onTouchBegan(x, y, event)
		self:scale(.9)
		return true 
	end
	function node:onTouchEnded(x, y, event)
		 self:scale(1.0)
		 return callback(self)
	end

	return node 
end




--[[-
选择项目类型  

<br/>  
### Useage:
  	记录用户选择的项目类型  

### Parameters:
- 	cc.Node 	**node** 				[必选] 按钮对象  

--]]
function M:selectProjectType(node)
	if self.btnProjectType then 
		self.btnProjectType.bg:setColor(cc.c4b(69, 69, 67, 255))
		self.btnProjectType.text:setColor(cc.c4b(255, 255, 255, 255))
	end

	node.text:setColor(cc.c4b(169, 169, 167, 255))
 	node.bg:setColor(cc.c4b(156, 226, 233, 255))

 	self.btnProjectType 	= node
end





--[[-
新建一个项目  

<br/>  
### Useage:
  	创建一个新的项目。  

### Notice:
	注意   

--]]
function M:newProject()
 	local projectLocation 	= self.locationEditbox:getText()
 	local projectType 		= self.btnProjectType.text:getString() --  or "bbframework"

 	if (not projectLocation) or projectLocation == "" then 
 		return print("请选择一个目录！")
 	end

 	if projectType == "bbframework" then 
 		print("projectLocation = ", projectLocation)
 	elseif projectType == "ECStudio" then 

 	elseif projectType == "Cocos2d-JS" then 

 	elseif projectType == "quick-x" then 

 	else
 		return print("项目类型无效：", projectType)
 	end
end

--[[-
退出  

<br/>  
### Useage:
  	返回Dashboard首页。  

### Notice:
	注意   

--]]
function M:cancel()
 	return c.game:enterScene("DashboardScene")
end




















--========================
--  重载
--========================




function M:onEnter()

end

function M:onExit()

end

return M








