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

function M:ctor()
	self:setContentSize(cc.size(960, 640))
	self:ignoreAnchorPointForPosition(false)
	self:setAnchorPoint(cc.p(.5, .5))
	self:setPosition(display.cx, display.cy)

	self:loadPanelHead()
	self:loadPanelBody()

	self:bindTouch()
end


--========================
--  功能方法
--========================


-- 加载面板标题部分
function M:loadPanelHead()
	self:loadTitle()
	self:loadButtonNew()
	self:loadButtonOpen()
end 

-- 显示头部的”Project“标签
function M:loadTitle()
	ccui.ui.loadLableTTF({
		text 	= "Projects"
		}):px(100):py(590):to(self)
end

function M:loadButtonNew()
	ccui.ui.loadLableTTF({
		text 	= "New"
		}):px(690):py(590):to(self)
end

function M:loadButtonOpen()
	local btnOpen = ccui.ui.loadLableTTF({
		text 	= "Open"
		}):px(770):py(590):to(self):bindTouch()
	local this = self 

	function btnOpen:onTouchBegan(x, y)
		return true 
	end

	function btnOpen:onTouchEnded(x, y, event)
		this:openProject()
	end
end

-- 加载面板内容部分
function M:loadPanelBody()

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
方法  

<br/>  
### Useage:
  	用途  

### Aliases:
	别名  

### Notice:
	注意   

### Example:
	示例  

### Parameters:
- 	类型 	**参数名** 				[必/可选] 参数说明  

### OptionParameters
	其它参数  

### Returns: 
-   返回值类型 							返回值说明  

--]]
function M:openProject()
 	-- PlayerProtocol:getInstance():openNewPlayerWithProjectConfig(self.projectConfig)

 	local args = {
 		-- 参数
 		"-quick", 
 		-- quick-x根路径
 		"/Users/zengbinsi/workspace/00_git/ECStudio_Lua/quick_cocos2d_x/Quick-Cocos2dx-Community-master/",
 		-- 参数
 		"-workdir", 
 		-- 项目路径
 		"/Users/zengbinsi/workspace/00_git/ECStudio_Lua/editor/ecstudio/",
 		-- 项目主文件
 		"-file",
 		"/Users/zengbinsi/workspace/00_git/ECStudio_Lua/editor/ecstudio/src/main.lua",
 		-- 写入目录
 		"-writable",
 		"/Users/zengbinsi/workspace/00_git/ECStudio_Lua/editor/ecstudio/",
 		-- player窗口尺寸
 		"-size",
 		"960x540",
 		"-write-debug-log",
 		"-console",
 		"-disable-load-framework",
 		"-offset",
 		"{50,5}",
 		"-disable-debugger"
 	}

 	local projectConfig = ProjectConfig:new()
    local argumentVector = vector_string_:new_local()
    local arguments = args
    for _,v in ipairs(arguments) do
        argumentVector:push_back(v)
    end
    projectConfig:parseCommandLine(argumentVector)
    PlayerProtocol:getInstance():openNewPlayerWithProjectConfig(projectConfig)
end



















--========================
--  重载
--========================




function M:onEnter()

end

function M:onExit()

end

return M








