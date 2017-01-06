
require("config")
require("cocos.init")
require("framework.init")

-- 20170104: Add import ECStudio by zengbinsi  
require("ecstudio.init")


local MyApp = class("MyApp", cc.mvc.AppBase)

function MyApp:ctor()
    MyApp.super.ctor(self)
end

function MyApp:run()
    cc.FileUtils:getInstance():addSearchPath("res/")
    self:enterScene("MainScene")


    local menuBar 	= PlayerProtocol:getInstance():getMenuService()
    local fileMenu 	= menuBar:addItem("RUN_MENU", "&Run")
    menuBar:addItem("RUN_IOS_MENU", "run iOS", "RUN_MENU")

    -- 重置窗体
    -- local item    = PlayerProtocol:getInstance():getMenuService():getItem("VIEWSIZE_ITEM_MENU_6")
    -- cc.player:onScreenChangeFrameSize(item)


    function cc.player:onMenuClicked(event)
	    local data = event.data
	    if data == "CLOSE_MENU" or data == "EXIT_MENU" then
	        PlayerProtocol:getInstance():quit()
	    elseif data == "REFRESH_MENU" then
	        PlayerProtocol:getInstance():relaunch()
	    elseif data == "WELCOME_MENU" then
	        local config = ProjectConfig:new()
	        config:resetToWelcome()
	        PlayerProtocol:getInstance():openProjectWithProjectConfig(config)
	    elseif string.match(data, "VIEW_SCALE_MENU_") and self.projectConfig_ then
	        local menubar = PlayerProtocol:getInstance():getMenuService()
	        local item    = menubar:getItem(data)
	        self:onScreenZoomOut(item)
	    elseif string.match(data, "VIEWSIZE_ITEM_MENU_") and self.projectConfig_ then
	        local menubar = PlayerProtocol:getInstance():getMenuService()
	        local item    = menubar:getItem(data)
	        self:onScreenChangeFrameSize(item)
	    elseif string.match(data, "DIRECTION_") then
	        local menubar = PlayerProtocol:getInstance():getMenuService()
	        local item    = menubar:getItem(data)
	        self:onScreenChangeDirection(item)
	    else
	    	print("========123")
	        dump(event)
	    end

	end
end

return MyApp
