--[[--------------------------
[ecs]游戏应用  

 	Copyright (c) 2017 zengbinsi.com

	- Desc: 	游戏应用
	- Author: 	zengbinsi
	- Date: 	2017-01-14  

--]]-------------------------- 




--========================
-- 引入命名空间
--========================
-- local BaseLayer = import("app.common.layer.BaseLayer")




--[[
	类
--]]


local M 	= class("Game", cc.mvc.AppBase)




--========================
-- 构造函数
--========================

function M:ctor(params)
	-- [超类调用]
	M.super.ctor(self, params)
 	-- [本类调用]

end








--========================
-- 功能函数
--========================




--========================
-- 属性
--========================




--========================
-- 父类重写
--======================== 

function M:enterScene(sceneName, args, transitionType, time, more)
    sceneName               = string.gsub(sceneName, "Scene", "")
    local scenePackageName  = "app." .. sceneName .. "." .. sceneName .. "Scene" 
    local sceneClass        = require(scenePackageName)
    local scene             = sceneClass.new(unpack(checktable(args)))

    display.replaceScene(scene, transitionType, time, more)
end 


function M:run()
    -- self:enterScene("MainScene")
    self:enterScene("DashboardScene")
end




return M








