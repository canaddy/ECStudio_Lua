--[[--------------------------

 	Copyright (c) 2017 zengbinsi.com

	- Desc: 	模拟器扩展
	- Author: 	zengbinsi
	- Date: 	2017-01-11  

--]]--------------------------  







local M 	= {}


--[[-
初始化模拟器窗口  

<br/>  
### Useage:
  	修改方向、尺寸和缩放比例。  

### Notice:
	注意   

### Example:
	示例  

### Returns: 
-   返回值类型 							返回值说明  

--]]
function M.initPlayerEx()
	M.initPlayerMenu()
	M.initPlayerForm()
end 

--[[-
初始化模拟器窗口菜单  

<br/>  
### Useage:
  	修改方向、尺寸和缩放比例。  

### Notice:
	注意   

--]]
function M.initPlayerMenu()
 	local menuBar 	= PlayerProtocol:getInstance():getMenuService()

 	-- File  
 	menuBar:addItem("EXIT_MENU_SEP1", "-", "FILE_MENU")
    menuBar:addItem("FILE_NEWPROJECT_MENU", "New Project", "FILE_MENU")
    menuBar:addItem("FILE_OPENPROJECT_MENU", "Open Project", "FILE_MENU")

    menuBar:addItem("EXIT_MENU_SEP2", "-", "FILE_MENU")
    menuBar:addItem("FILE_NEWSCENE_MENU", "New Scene", "FILE_MENU")
    menuBar:addItem("FILE_OPENSCENE_MENU", "Open Scene", "FILE_MENU")
    menuBar:addItem("FILE_SAVESCENE_MENU", "Save Scene", "FILE_MENU")

    menuBar:addItem("EXIT_MENU_SEP3", "-", "FILE_MENU")
    menuBar:addItem("FILE_BUILD_MENU", "Build", "FILE_MENU")




 	
	--Edit
    menuBar:addItem("ECSTUDIO_EDIT_MENU", "&ECStudio Edit")
    menuBar:addItem("EDIT_SETTING_MENU", "edit setting", "ECSTUDIO_EDIT_MENU")
    menuBar:addItem("ECStudio_SETTING_MENU", "ECStudio setting", "ECSTUDIO_EDIT_MENU")




    -- GameObject
    menuBar:addItem("GAMEOBJECT_MENU", "&GameObject")
    menuBar:addItem("GAMEOBJECT_EMPTY_MENU", "Empty GameObject", "GAMEOBJECT_MENU")
    menuBar:addItem("GAMEOBJECT_SPRITE_MENU", "Sprite", "GAMEOBJECT_MENU")
    menuBar:addItem("GAMEOBJECT_PARTICLE_MENU", "Particle", "GAMEOBJECT_MENU")
    menuBar:addItem("GAMEOBJECT_LAYERCOLOR_MENU", "LayerColor", "GAMEOBJECT_MENU")




    -- Component
    menuBar:addItem("COMPONENT_MENU", "&Component")
    menuBar:addItem("COMPONENT_RENDER_MENU", "Render", "COMPONENT_MENU")
    menuBar:addItem("COMPONENT_RENDER_SPRITE_MENU", "Sprite", "COMPONENT_RENDER_MENU")
    menuBar:addItem("COMPONENT_RENDER_PARTICLE_MENU", "Particle", "COMPONENT_RENDER_MENU")
    menuBar:addItem("COMPONENT_RENDER_LAYERCOLOR_MENU", "LayerColor", "COMPONENT_RENDER_MENU")

    menuBar:addItem("COMPONENT_PHYSICS_MENU", "Physics", "COMPONENT_MENU")
    menuBar:addItem("COMPONENT_PHYSICS_RIGIDBODY_MENU", "RigidBody", "COMPONENT_PHYSICS_MENU")
    menuBar:addItem("COMPONENT_PHYSICS_COLLIDER_MENU", "Collider", "COMPONENT_PHYSICS_MENU")
    menuBar:addItem("COMPONENT_PHYSICS_COLLIDER_BOX_MENU", "BoxCollider", "COMPONENT_PHYSICS_COLLIDER_MENU")
    menuBar:addItem("COMPONENT_PHYSICS_COLLIDER_CIRCLE_MENU", "CircleCollider", "COMPONENT_PHYSICS_COLLIDER_MENU")
    menuBar:addItem("COMPONENT_PHYSICS_JOINT_MENU", "Joint", "COMPONENT_PHYSICS_MENU")
    menuBar:addItem("COMPONENT_PHYSICS_COLLIDER_MOUSE_MENU", "MouseJoint", "COMPONENT_PHYSICS_JOINT_MENU")



    -- Run  
    menuBar:addItem("RUN_MENU", "&Run")
    menuBar:addItem("RUN_PLAYER_MENU", "run player", "RUN_MENU")




    -- About
    menuBar:addItem("ABOUT_MENU", "&About")
    menuBar:addItem("ABOUT_ECSTUDIO_MENU", "about ECStudio", "ABOUT_MENU")


    -- View 
    menuBar:addItem("VIEW_EDIT_SIZE_MENU_SEP", "-", "VIEW_MENU")
    local viewSize = {
		{title = "Mac OSX",   w=1420,h=850},
		{title = "Windows",   w=1200,h=800},
    }
    cc.player.screenSizeList = cc.player.screenSizeList or {}
    local s = cc.player.projectConfig_:getFrameSize()
    for i,v in ipairs(viewSize) do
        local title = string.format("%s (%dx%d)", v.title, v.w, v.h)
        local index = #cc.player.screenSizeList + 1
        local item  = menuBar:addItem("VIEWSIZE_ITEM_MENU_".. index, title, "VIEW_MENU")
        item.width  = v.w
        item.height = v.h
        cc.player.screenSizeList[index] = item

        if v.w == s.width and v.h == s.height then
            item:setChecked(true)
        elseif v.w == s.height and v.h == s.width then
            item:setChecked(true)
        end
    end
end

--[[-
初始化模拟器窗口  

<br/>  
### Useage:
  	修改方向、尺寸和缩放比例。  

### Notice:
	注意   

--]]
function M.initPlayerForm()
 	-- 窗口方向【水平】
	local menubar = PlayerProtocol:getInstance():getMenuService()
    local item    = menubar:getItem("DIRECTION_LANDSCAPE_MENU")
    cc.player:onScreenChangeDirection(item)

    -- 窗口尺寸
    local menubar = PlayerProtocol:getInstance():getMenuService()
    local item    = menubar:getItem(device.platform == "mac" and "VIEWSIZE_ITEM_MENU_13" or "VIEWSIZE_ITEM_MENU_14")
    cc.player:onScreenChangeFrameSize(item)

    -- 缩放比例
    local menubar = PlayerProtocol:getInstance():getMenuService()
    local item    = menubar:getItem("VIEW_SCALE_MENU_1")
    cc.player:onScreenZoomOut(item)
end 


--[[-
重写player模拟器的菜单点击事件的回调  

<br/>  
### Useage:
  	处理自己新增的菜单项事件。  

### Notice:
	
    event格式如下：

        {
            "data" = "FILE_NEWPROJECT_MENU"
            "name" = "menuClicked"
        }   

### Parameters:
- 	table 	**event** 				[必选] 事件对象  

### OptionParameters
	其它参数  

### Returns: 
-   返回值类型 							返回值说明  

--]]
function cc.player:onMenuClicked(event)
    local data = event.data
    if data == "CLOSE_MENU" or data == "EXIT_MENU" then
    	-- 关闭、退出
        PlayerProtocol:getInstance():quit()
    elseif data == "REFRESH_MENU" then
    	-- 刷新
        PlayerProtocol:getInstance():relaunch()
    elseif data == "WELCOME_MENU" then
    	-- 欢迎
        local config = ProjectConfig:new()
        config:resetToWelcome()
        PlayerProtocol:getInstance():openProjectWithProjectConfig(config)
    elseif string.match(data, "VIEW_SCALE_MENU_") and self.projectConfig_ then
    	-- 窗口缩放比例
        local menubar = PlayerProtocol:getInstance():getMenuService()
	    local item    = menubar:getItem("VIEW_SCALE_MENU_1")
	    self:onScreenZoomOut(item)
    elseif string.match(data, "VIEWSIZE_ITEM_MENU_") and self.projectConfig_ then
    	-- 窗口尺寸
        local menubar = PlayerProtocol:getInstance():getMenuService()
        local item    = menubar:getItem(data)
        self:onScreenChangeFrameSize(item)
    elseif string.match(data, "DIRECTION_") then
    	-- 窗口方向
        local menubar = PlayerProtocol:getInstance():getMenuService()
        local item    = menubar:getItem(data)
        self:onScreenChangeDirection(item)
    else
        dump(event)
    end
end 






return M 




