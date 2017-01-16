
-- 0 - disable debug info, 1 - less debug info, 2 - verbose debug info
DEBUG = 2

-- display FPS stats on screen
DEBUG_FPS = true

-- dump memory info every 10 seconds
DEBUG_MEM = false

-- load deprecated API
LOAD_DEPRECATED_API = false

-- load shortcodes API
LOAD_SHORTCODES_API = true

-- screen orientation
CONFIG_SCREEN_ORIENTATION = "landscape"

-- design resolution
-- CONFIG_SCREEN_WIDTH  = 1420
-- CONFIG_SCREEN_HEIGHT = 850

CONFIG_SCREEN_WIDTH  = 960
CONFIG_SCREEN_HEIGHT = 640

-- auto scale mode
CONFIG_SCREEN_AUTOSCALE = "FIXED_HEIGHT"












--========================
--  编辑器配置
--========================

c 	= c or {}

-- 是否是编辑器模式
c.IS_EDIT 	= true 








--========================
--  ECStudio 框架配置
--========================
c.packages 	= c.packages or {
	ecui = true, 
	ccui = true, 
}












