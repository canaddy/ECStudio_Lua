
function __G__TRACKBACK__(errorMessage)
    print("----------------------------------------")
    print("ECStudio LUA ERROR: " .. tostring(errorMessage) .. "\n")
    print(debug.traceback("", 2))
    print("----------------------------------------")
end

-- 添加代码检索路径
package.path = package.path .. ";src/?.lua;src/framework/protobuf/?.lua"

cc.FileUtils:getInstance():setPopupNotify(false)
-- 添加资源检索路径
cc.FileUtils:getInstance():addSearchPath("res/")




--========================
--  init
--========================
-- 引入项目配置文件
require("config")
-- 初始化cocos框架
require("cocos.init")
-- 初始化quick框架  
require("framework.init")

-- 20170104: Add import ECStudio by zengbinsi  
require("ecstudio.init")








--========================
--  game start 
--========================
c.game 	= require("game").new()

c.game:run()	









