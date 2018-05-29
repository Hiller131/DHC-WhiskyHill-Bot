----- DH Farming Script ------
debug = false
immersive = true
scriptDimension = 2560
Settings:setScriptDimension(true, scriptDimension)
Settings:setCompareDimension(true, scriptDimension)
setImmersiveMode(immersive)
local index = 1
farmList = {}
arenaList = {}
localPath = scriptPath()
imagePath = localPath .. "/" .. "images"

------ battle -----
farmList[index] = {target =  "battle.png", region = Region(2177, 1168, 300, 300), id = "battle", action = 'click', sleep = 0}
index = index + 1
------ yes -----
farmList[index] = {target =  "yes.png", region = Region(1366, 791, 300, 300), id = "yes", action = 'click', sleep = 0}
index = index + 1
------ sell small -----
farmList[index] = {target =  "sell_small.png", region = Region(848, 853, 300, 300), id = "sell_small", action = 'click', sleep = 0}
index = index + 1
------ sell -----
farmList[index] = {target =  "sell.png", region = Region(1368, 796, 300, 300), id = "sell", action = 'click', sleep = 0}
index = index + 1
------ close -----
farmList[index] = {target =  "close.png", region = Region(1858, 95, 300, 300), id = "close", action = 'click', sleep = 0}
index = index + 1
------ replay -----
farmList[index] = {target =  "replay.png", region = Region(1547, 1155, 300, 300), id = "replay", action = 'click', sleep = 60}
index = index + 1
------ sell small2 -----
farmList[index] = {target =  "sell_small2.png", region = Region(829, 841, 300, 300), id = "sell_small2", action = 'click', sleep = 0}
index = index + 1
------ ok -----
farmList[index] = {target =  "ok.png", region = Region(1141, 838, 300, 300), id = "ok", action = 'click', sleep = 0}
index = index + 1

function farm()
	while true do
		local length = table.getn(farmList)
		
		setImagePath(imagePath)
		
		for i = 1, length do
			local t = farmList[i]
			if (t.action == "click") then
				if (debug and t.region) then 
					toast(t.target)
					t.region:highlight(0.2)
				end
				if (t.region and (t.region):existsClick(t.target, 0)) then
					wait(t.sleep)
				end
			end
			wait(.5)
		end
	end
end

index = 1
------ arena -----
arenaList[index] = {target =  "arena.png", region = Region(586, 1183, 250, 250), id = "arena", action = 'click', sleep = 5}
index = index + 1
------ arena_competitor -----
arenaList[index] = {target =  "arena_competitor.png", region = Region(1354, 353, 300, 1000), id = "arena_competitor", action = 'click', sleep = 0}
index = index + 1
------ battle  -----
arenaList[index] = {target =  "battle.png", region = Region(2177, 1168, 300, 300), id = "battle", action = 'click', sleep = 30}
index = index + 1
------ close -----
arenaList[index] = {target =  "close.png", region = Region(1858, 95, 300, 300), id = "close", action = 'click', sleep = 0}
index = index + 1
------ ok -----
arenaList[index] = {target =  "ok.png", region = Region(1141, 838, 300, 300), id = "ok", action = 'click', sleep = 2}
index = index + 1
------ arena_victory -----
arenaList[index] = {target =  "arena_victory.png", region = Region(1359, 97, 250, 250), id = "arena_victory", action = 'click', sleep = 0}
index = index + 1
------ arena_refresh -----
arenaList[index] = {target =  "arena_refresh.png", region = Region(2190, 1261, 250, 250), id = "arena_refresh", action = 'click', sleep = 0}
index = index + 1

function arena()
	while true do
		local length = table.getn(arenaList)
		
		setImagePath(imagePath)
		
		for i = 1, length do
			local t = arenaList[i]
			if (t.action == "click") then
				if (debug and t.region) then 
					toast(t.target)
					t.region:highlight(0.2)
					wait(2)
				end
				if (t.region and (t.region):existsClick(t.target, 0)) then
					wait(t.sleep)
				end
			end
			wait(.5)
		end
	end
end

---- Main ----
dialogInit()
addTextView("Choose your mode:")
newRow()
addRadioGroup("actionSelect", 1)
addRadioButton("Farming", 1)
addRadioButton("Arena", 2)
dialogShowFullScreen("Dungeon Hunter Champions Bot")

if (actionSelect == 2) then
	arena()
else
	farm()
end
