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







--[[  
	类  
--]]  




local M 	= ef.classLayer("DashboardLayer", function()
	return ccui.ui.loadLayerColor({color = cc.c4b(52, 52, 52, 255)})
end)


---
-- 选中的项目路径
---
selectProjectPath 	= nil 

function M:ctor()
	self:setContentSize(cc.size(960, 640))

	local headPanel 	= self:loadTitle()
	self:loadButtonNew(headPanel)
	self:loadButtonOpen(headPanel)
	self:loadProjectList()

	-- self:bindTouch()
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

-- 加载新建项目按钮
function M:loadButtonNew(headPanel)
	local node 	= ccui.ui.loadLableTTF({
		text 		= "New",
		}):point(700, 30):to(headPanel):bindTouch()
	local this 	= self 

	function node:onTouchBegan(x, y, event)
		self:scale(1.2)
		return true
	end
	function node:onTouchEnded(x, y, event)
		self:scale(1.0)
		this:newProject()
	end
end

-- 加载打开项目按钮
function M:loadButtonOpen(headPanel)
	local node 	= ccui.ui.loadLableTTF({
		text 		= "Open",
		}):point(800, 30):to(headPanel):bindTouch()
	local this 	= self 

	function node:onTouchBegan(x, y, event)
		self:scale(1.2)
		return true
	end
	function node:onTouchEnded(x, y, event)
		self:scale(1.0)
		this:openProject()
	end
end

-- 加载面板内容部分
function M:loadProjectList()

	-- 加载一个滚动的项目列表
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

--[[-
新建一个项目  

<br/>  
### Useage:
  	创建一个新的项目。  

### Notice:
	注意   

--]]
function M:newProject()
 	return c.game:enterScene("CreateProjectScene")
end

--[[-
打开项目  

<br/>  
### Useage:
  	打开一个项目。  

### Notice:
	注意   

--]]
function M:openProject()
 	local arguments = {
 		-- quick-x根路径
 		"-quick", 
 		"/Users/zengbinsi/workspace/00_git/ECStudio_Lua/quick_cocos2d_x/Quick-Cocos2dx-Community-master/",

 		-- 项目路径
 		"-workdir", 
 		selectProjectPath or "/Users/zengbinsi/workspace/00_git/ECStudio_Lua/editor/ecstudio/",

 		-- 项目主文件
 		"-file",
 		(selectProjectPath .. "src/main.lua") or "/Users/zengbinsi/workspace/00_git/ECStudio_Lua/editor/ecstudio/src/main.lua",

 		-- 写入目录
 		"-writable",
 		selectProjectPath or "/Users/zengbinsi/workspace/00_git/ECStudio_Lua/editor/ecstudio/",

 		-- player窗口尺寸
 		"-size",
 		(device.platform == "mac") and "1420x850" or "1200x800",

 		"-write-debug-log",
 		"-console",
 		"-disable-load-framework",
 		"-offset",
 		"{50,5}",
 		"-disable-debugger"
 	}
 	local projectConfig 	= ProjectConfig:new()
    local argumentVector 	= vector_string_:new_local()
    
    for _,v in ipairs(arguments) do
        argumentVector:push_back(v)
    end

    projectConfig:parseCommandLine(argumentVector)
    return PlayerProtocol:getInstance():openNewPlayerWithProjectConfig(projectConfig)
end



















--========================
--  重载
--========================




function M:onEnter()

end

function M:onExit()
	
end

return M








