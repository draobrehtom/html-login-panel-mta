--[[
Usefull functions:
executeBrowserJavascript(theBrowser, 'document.getElementById("demo").innerHTML = "' .. msg ..'"')
]]

local screenWidth, screenHeight = guiGetScreenSize()

-- local page = "http://mta/html-login-panel/html/login.html"
local page = "http://mta/html-login-panel/index.html"
local initBrowser = guiCreateBrowser(0, 0, screenWidth, screenHeight, true, false, false)
local theBrowser = guiGetBrowser(initBrowser)

addEventHandler("onClientBrowserCreated", theBrowser, 
	function()
		loadBrowserURL(source, page)
		showCursor(true)
		
		
		
	end
)

addEvent("onClientPlayerLogin", true)
addEventHandler("onClientPlayerLogin", root,
	function()
		destroyElement(initBrowser)
		showCursor(false)
	end
)

function cmsg(login, password, command)
	if (command == "login") then
		triggerServerEvent("login", resourceRoot, login, password)
	elseif (command == "register") then
		triggerServerEvent("register", resourceRoot, login, password)
	end
end
addEvent("cmsg", true)
addEventHandler("cmsg", root, cmsg)

-- addEventHandler("onClientRender", root, 
	-- function()	
		-- dxDrawImage(screenWidth*0.205,screenHeight*0.15,1890/2.5,1417/2.5,"Test.png", 0,0,0,tocolor(255,255,255,255),true)
	-- end
-- )