--[[--------------------------

 	Copyright (c) 2011-2016 Baby-Bus.com

	- Desc: 	引入组件化框架
	- Author: 	zengbinsi
	- Date: 	2017-01-04  

--]]--------------------------  







print("====================================================")
print("------------ LOAD ECStudio FRAMEWORK ---------------")
print("====================================================")
---
-- 命名空间
---
c 					= c or {}

---
-- 引入的模块
---
c.packages 			= c.packages or {}  

c.packages.base 	= true 
c.packages.ecstudio = true 


--========================
--  开始引入模块
--========================

if c.packages.base then 
	-- 引入基础模块（工具类、结构、自定义类等封装）
	import(".base.init")
end

if c.packages.ecstudio then 
	-- 引入组件化基本模块（游戏对象、组件、舞台等封装）
end

if c.packages.physics then 
	-- 引入Box2D物理模块
end

if c.packages.chipmunk then 
	-- 引入chipmunk物理模块
end

if c.packages.tiledmap then 
	-- 引入TiledMap模块
end

if c.packages.ccui then 
	-- 引入ccui模块
	import(".ccui.init")
end

if c.packages.ecui then 
	-- 引入ECStudio UI模块
	import(".ecui.init")
end

if c.packages.network then 
	-- 引入网络模块
end

if c.packages.dragonbone then 
	-- 引入DragonBone模块
end

if c.packages.spin then 
	-- 引入Spin模块
end

if c.packages.bbframework then 
	-- 引入bbframework模块
end








--========================
--  player
--========================

-- 是否处于编辑器模式
if c.IS_EDIT then 
	c.playerEx 	= import(".playerEx.PlayerEx")

	c.playerEx.initPlayerEx()
end





if DEBUG > 0 then 
	print("================================================")
	print("------------ ECStudio 模块引入结束 ---------------")
	print("================================================")
end








