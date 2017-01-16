--[[--------------------------

 	Copyright (c) 2017 zengbinsi.com

	- Desc: 	模拟器扩展
	- Author: 	zengbinsi
	- Date: 	2017-01-11  

--]]--------------------------  







local M 	= {}







---  
-- 事件回调集合
---  
M.eventCallbacks    = {
    -- 模拟器菜单栏点击事件回调
    playerMenuClicked   = {},
}





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
    -- M.addECStudioMenuItem({
    --     eventData            = "playerMenu_Test",
    --     menuItemText         = "&Test",
    --     onMenuClicked        = function(event) dump(event) end ,
    --     })


    

    -- File  
    M.addECStudioMenuItem({eventData = "FILE_MENU_SEP1", menuItemText = "-", parentMenuItemName = "FILE_MENU", })
    M.addECStudioMenuItem({eventData = "playerMenu_file_newProject", menuItemText = "New Project", parentMenuItemName = "FILE_MENU", })
    M.addECStudioMenuItem({eventData = "playerMenu_file_openProject", menuItemText = "Open Project", parentMenuItemName = "FILE_MENU", })

    M.addECStudioMenuItem({eventData = "FILE_MENU_SEP2", menuItemText = "-", parentMenuItemName = "FILE_MENU", })
    M.addECStudioMenuItem({eventData = "playerMenu_file_newScene", menuItemText = "New Scene", parentMenuItemName = "FILE_MENU", })
    M.addECStudioMenuItem({eventData = "playerMenu_file_openScene", menuItemText = "Open Scene", parentMenuItemName = "FILE_MENU", })
    M.addECStudioMenuItem({eventData = "playerMenu_file_saveScene", menuItemText = "Save Scene", parentMenuItemName = "FILE_MENU", })

    M.addECStudioMenuItem({eventData = "FILE_MENU_SEP3", menuItemText = "-", parentMenuItemName = "FILE_MENU", })
    M.addECStudioMenuItem({eventData = "playerMenu_file_build", menuItemText = "Build", parentMenuItemName = "FILE_MENU", })
    M.addECStudioMenuItem({eventData = "playerMenu_file_build_buildIOS", menuItemText = "Build iOS", parentMenuItemName = "playerMenu_file_build", })
    M.addECStudioMenuItem({eventData = "playerMenu_file_build_buildAndroid", menuItemText = "Build android", parentMenuItemName = "playerMenu_file_build", })


    
    --Edit
    M.addECStudioMenuItem({eventData = "playerMenu_ECStudioEdit", menuItemText = "&ECStudio Edit", })
    M.addECStudioMenuItem({eventData = "playerMenu_ECStudioEdit_editSetting", menuItemText = "Edit setting", parentMenuItemName = "playerMenu_ECStudioEdit", })
    M.addECStudioMenuItem({eventData = "playerMenu_ECStudioEdit_ECStudioSetting", menuItemText = "ECStudio setting", parentMenuItemName = "playerMenu_ECStudioEdit", })




    -- GameObject
    M.addECStudioMenuItem({eventData = "playerMenu_GameObject", menuItemText = "&GameObject", })
    M.addECStudioMenuItem({eventData = "playerMenu_GameObject_emptyGameObject", menuItemText = "Empty GameObject", parentMenuItemName = "playerMenu_GameObject", })
    M.addECStudioMenuItem({eventData = "playerMenu_GameObject_sprite", menuItemText = "Sprite", parentMenuItemName = "playerMenu_GameObject", })
    M.addECStudioMenuItem({eventData = "playerMenu_GameObject_particle", menuItemText = "Particle", parentMenuItemName = "playerMenu_GameObject", })
    M.addECStudioMenuItem({eventData = "playerMenu_GameObject_LayerColor", menuItemText = "LayerColor", parentMenuItemName = "playerMenu_GameObject", })




    -- Component
    M.addECStudioMenuItem({eventData = "playerMenu_Component", menuItemText = "&Component", })
    M.addECStudioMenuItem({eventData = "playerMenu_Component_render", menuItemText = "Render", parentMenuItemName = "playerMenu_Component", })
    M.addECStudioMenuItem({eventData = "playerMenu_Component_render_sprite", menuItemText = "Sprite", parentMenuItemName = "playerMenu_Component_render", })
    M.addECStudioMenuItem({eventData = "playerMenu_Component_render_particle", menuItemText = "Particle", parentMenuItemName = "playerMenu_Component_render", })
    M.addECStudioMenuItem({eventData = "playerMenu_Component_render_layerColor", menuItemText = "LayerColor", parentMenuItemName = "playerMenu_Component_render", })

    M.addECStudioMenuItem({eventData = "playerMenu_Component_physics", menuItemText = "Physics", parentMenuItemName = "playerMenu_Component", })
    M.addECStudioMenuItem({eventData = "playerMenu_Component_physics_rigidBody", menuItemText = "RigidBody", parentMenuItemName = "playerMenu_Component_physics", })
    
    M.addECStudioMenuItem({eventData = "COMPONENT_MENU_SEP1", menuItemText = "-", parentMenuItemName = "playerMenu_Component_physics", })
    M.addECStudioMenuItem({eventData = "playerMenu_Component_physics_boxCollider", menuItemText = "BoxCollider", parentMenuItemName = "playerMenu_Component_physics", })
    M.addECStudioMenuItem({eventData = "playerMenu_Component_physics_circleCollider", menuItemText = "CircleCollider", parentMenuItemName = "playerMenu_Component_physics", })
    
    M.addECStudioMenuItem({eventData = "COMPONENT_MENU_SEP2", menuItemText = "-", parentMenuItemName = "playerMenu_Component_physics", })
    M.addECStudioMenuItem({eventData = "playerMenu_Component_physics_joint_mouseJoint", menuItemText = "MouseJoint", parentMenuItemName = "playerMenu_Component_physics", })



    -- Run  
    M.addECStudioMenuItem({eventData = "playerMenu_Run", menuItemText = "&Run", })
    M.addECStudioMenuItem({eventData = "playerMenu_Run_runPlayer", menuItemText = "run player", parentMenuItemName = "playerMenu_Run", })
    M.addECStudioMenuItem({eventData = "playerMenu_Run_runIOS", menuItemText = "run iOS", parentMenuItemName = "playerMenu_Run", })
    M.addECStudioMenuItem({eventData = "playerMenu_Run_runAndroid", menuItemText = "run android", parentMenuItemName = "playerMenu_Run", })




    -- About
    M.addECStudioMenuItem({eventData = "playerMenu_About", menuItemText = "&About", })
    M.addECStudioMenuItem({eventData = "playerMenu_About_aboutECStudio", menuItemText = "about ECStudio", parentMenuItemName = "playerMenu_About", })



    -- View 
    M.addECStudioMenuItem({eventData = "VIEW_EDIT_SIZE_MENU_SEP", menuItemText = "-", parentMenuItemName = "VIEW_MENU", })
    local viewSize = {
        {title = "Mac OSX",   w=1420,h=850},
        {title = "Windows",   w=1200,h=800},
    }
    cc.player.screenSizeList = cc.player.screenSizeList or {}
    local s = cc.player.projectConfig_:getFrameSize()
    for i,v in ipairs(viewSize) do
        local title = string.format("%s (%dx%d)", v.title, v.w, v.h)
        local index = #cc.player.screenSizeList + 1
        local item  = M.addECStudioMenuItem({
            eventData           = "VIEWSIZE_ITEM_MENU_".. index, 
            menuItemText        = title, 
            parentMenuItemName  = "VIEW_MENU", 
            })
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
添加ECStudio编辑器的菜单    

<br/>  
### Useage:
    添加编辑器菜单。    

### Aliases:
    **addPlayerMenuItem**    

### Notice:

    该方法只在编辑模式下有效。   
    如果是添加一个菜单分组，那么menuItemText的第一个字符必须是“&”，并且不传递parentMenuItemName参数。
    **【注意】：添加分组一定要在分组下添加一个菜单项，否则分组无法显示。**  
    如果是添加一个菜单项分割线，那么menuItemText必须是“-”，且菜单项前后必须有选项，否则无法显示分割线。

### Example:
    
    ------------------
    -- 实例一：添加菜单分组(添加分组一定要在分组下添加一个菜单项，否则分组无法显示)
    ------------------ 
    local params = {}
    params.eventData            = "playerMenu_Test"
    params.menuItemText         = "&Test"
    params.onMenuClicked        = function(event) dump(event) end 
    c.playerEx.addECStudioMenuItem(params)

    ------------------
    -- 实例二：添加菜单项
    ------------------ 
    local params = {}
    params.eventData            = "playerMenu_Test_helloECStudio"
    params.menuItemText         = "Hello ECStudio"
    params.parentMenuItemName   = "playerMenu_Test"
    params.onMenuClicked        = function(event) dump(event) end 
    c.playerEx.addECStudioMenuItem(params)

    ------------------
    -- 实例三：添加菜单项分割线(分割线的前后必须有菜单项，否则无法显示)
    ------------------ 
    c.playerEx..addECStudioMenuItem({
        eventData       = "FILE_MENU_SEP_TEST_100", 
        menuItemText    = "-", 
        parentMenuItemName = "FILE_MENU", 
        })

### Parameters:
-   table     **params**                 [必选] 编辑器菜单配置  

### OptionParameters
    string    **eventData**              [必选] 菜单事件携带的数据，一般用于判断是操作了哪个菜单项。  
    string    **menuItemText**           [必选] 菜单项显示的内容。  
    string    **parentMenuItemName**     [可选] 菜单项父节点的eventData。  
    string    **onMenuClicked**          [可选] 菜单被点击的回调。  

### Returns: 
-   CCMenuBar    

--]]
function M.addECStudioMenuItem(params)
    local menuBar   = PlayerProtocol:getInstance():getMenuService()

    -- 添加菜单项回调事件
    if params.onMenuClicked then 
        M.addEventListener({
            eventType   = "playerMenuClicked",  
            eventData   = params.eventData,
            callback    = params.onMenuClicked  
            })
    end
    
    return menuBar:addItem(params.eventData, params.menuItemText, params.parentMenuItemName)
end
M.addPlayerMenuItem     = M.addECStudioMenuItem 

--[[-
注册事件监听  

<br/>  
### Useage:
    添加自定义事件的监听回调。    

### Aliases:
    别名  

### Notice:
    只对ECStudio编辑器有效。   

### Example:
    示例  

### Parameters:
-   table     **params**                 [必选] 编辑器菜单配置  

### OptionParameters
    string      **eventType**               [必选] 事件类型    
    string      **eventData**               [必选] 事件数据/标记    
    string      **callback**                [必选] 事件回调  

### Returns: 
-   返回值类型                             返回值说明  

--]]
function M.addEventListener(params)
    M.eventCallbacks[params.eventType]                      = M.eventCallbacks[params.eventType] or {}  
    M.eventCallbacks[params.eventType][params.eventData]    = params.callback
end

--[[-
ECStudio编辑器的菜单栏点击事件的回调  

<br/>  
### Useage:
    处理新增的菜单项事件。  

### Notice:
    
    event格式如下：

        {
            "data" = "FILE_NEWPROJECT_MENU"
            "name" = "menuClicked"
        }   

### Parameters:
-   table   **event**               [必选] 事件对象  

### OptionParameters
    string  **data**                [必选] 菜单项数据，用于区分点击了哪个菜单项。  
    string  **name**                [必选] 事件名称，设置为“menuClicked”即可。    

### Returns: 
-   返回事件回调的返回值。    

--]]
function M.onMenuClicked(event)
    local callback  = M.eventCallbacks.playerMenuClicked[event.data] 

    if callback then 
        return callback(event)
    end
end









--========================
--  quick-framework 重写   
--========================



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
        -- 自定义事件
        -- dump(event)
        -- 是否处于编辑器模式
        if c and c.playerEx and c.playerEx.onMenuClicked and c.IS_EDIT then 
            c.playerEx.onMenuClicked(event)
        end
    end
end 






return M 




