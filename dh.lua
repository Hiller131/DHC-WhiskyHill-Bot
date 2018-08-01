----- DH Farming Script ------
debug = false
immersive = true
scriptDimension = 2560
Settings:setScriptDimension(true, scriptDimension)
Settings:setCompareDimension(true, scriptDimension)
setImmersiveMode(immersive)
local index = 1
local gearStars = 0
local timer = 0
local timeLeft = 0
local timeInMinutes = 0
local gearAmountKept = 0
local gearAmountSold = 0
farmList = {}
bossList = {}
arenaList = {}
blitzList = {}
MaxLevelList = {}
localPath = scriptPath()
imagePath = localPath .. "/" .. "images"

refillRegion = Region(1167, 662, 600, 600)
refillOkRegion = Region(1107, 660, 600, 600)
resultRegion = Region(2000, 200, 700, 250)

------ 1 -----
MaxLevelList[index] = {target =  "MaxLevel.png", region = Region(497, 591, 600, 600), id = "1", action = 'click'}
index = index + 1
------ 2 -----
MaxLevelList[index] = {target =  "MaxLevel.png", region = Region(1052, 353, 600, 600), id = "2", action = 'click'}
index = index + 1
------ 3 -----
MaxLevelList[index] = {target =  "MaxLevel.png", region = Region(1060, 647, 600, 600), id = "3", action = 'click'}
index = index + 1

index = 1
------ battle -----
farmList[index] = {target =  "battle.png", region = Region(2177, 1168, 1000, 300), id = "battle", action = 'click', sleep = 0}
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
farmList[index] = {target =  "replay.png", region = Region(1547, 1155, 300, 300), id = "replay", action = 'click', sleep = 0}
index = index + 1
------ sell small2 -----
farmList[index] = {target =  "sell_small2.png", region = Region(829, 841, 300, 300), id = "sell_small2", action = 'click', sleep = 0}
index = index + 1
------ ok -----
farmList[index] = {target =  "ok.png", region = Region(1141, 838, 300, 300), id = "ok", action = 'click', sleep = 0}
index = index + 1
------ Level Up OK --
farmList[index] = {target =  "LevelOk.png", region = Region(1923, 1016, 600, 600), id = "LevelOk", action = 'click', sleep = 0}
index = index + 1
------ Auto On -----
farmList[index] = {target =  "AutoOn.png", region = Region(916, 984, 600, 600), id = "AutoOn", action = 'click', sleep = 0}
index = index + 1


function farm()
	while true do
		local length = table.getn(farmList)
		local MaxLevelLength = table.getn(MaxLevelList)
		
		setImagePath(imagePath)
		
		showBattleResult()
		
		for i = 1, length do
			local t = farmList[i]
			if (t.action == "click") then
				if (debug and t.region) then 
					toast(t.target)
					t.region:highlight(2)
				end
				if (t.id == "replay") then
					if (t.region and (t.region):exists(t.target, 0)) then
						for j = 1, MaxLevelLength do
							local x = MaxLevelList[j]
							if (x.region and (x.region):exists(x.target, 0)) then
								scriptExit("Max Level Monsters")
							end
						end
					end
				end
				if (t.region and (t.region):existsClick(t.target, 0)) then
					wait(t.sleep)
				end
			end	
			wait(.5)
		end
		-- Check for energy refill
		if refillEnergy then
			refillRegion:existsClick(Pattern("Refill.png"), 0.1)
			refillOkRegion:existsClick(Pattern("RefillOK.png"), 0.1)
		end
	end
end

index = 1
------ boss battle -----
bossList[index] = {target =  "battle.png", region = Region(1950, 1280, 500, 200), id = "battle", action = 'click', sleep = 0}
index = index + 1
------ yes -----
bossList[index] = {target =  "yes.png", region = Region(1366, 791, 300, 300), id = "yes", action = 'click', sleep = 0}
index = index + 1
------ sell small -----
--bossList[index] = {target =  "sell_small.png", region = Region(848, 853, 300, 300), id = "sell_small", action = 'click', sleep = 0}
--index = index + 1
------ sell -----
--bossList[index] = {target =  "sell.png", region = Region(1368, 796, 300, 300), id = "sell", action = 'click', sleep = 0}
--index = index + 1
------ close -----
bossList[index] = {target =  "close.png", region = Region(1858, 95, 300, 300), id = "close", action = 'click', sleep = 0}
index = index + 1
------ replay -----
bossList[index] = {target =  "replay2.png", region = Region(1300, 1180, 300, 300), id = "replay", action = 'click', sleep = 00}
index = index + 1
------ sell small2 -----
--bossList[index] = {target =  "sell_small2.png", region = Region(829, 841, 300, 300), id = "sell_small2", action = 'click', sleep = 0}
--index = index + 1
------ ok -----
bossList[index] = {target =  "ok.png", region = Region(1141, 838, 300, 300), id = "ok", action = 'click', sleep = 0}
index = index + 1
------ ok get gear -----
bossList[index] = {target =  "ok.png", region = Region(1366, 791, 300, 300), id = "okGear", action = 'click', sleep = 0}
index = index + 1
------ Auto On -----
bossList[index] = {target =  "AutoOn.png", region = Region(916, 984, 600, 600), id = "AutoOn", action = 'click', sleep = 0}
index = index + 1
------ replay on fail -----
bossList[index] = {target =  "replay2.png", region = Region(1950, 1180, 500, 200), id = "replay", action = 'click', sleep = 0}
index = index + 1

local sellRegion = Region(1368, 796, 300, 300)
function boss()
	while true do
		local length = table.getn(bossList)
		setImagePath(imagePath)
		showBattleResult()
		
		for i = 1, length do
			local t = bossList[i]
			
			if (t.action == "click") then
				if (debug and t.region) then 
					toast(t.target)
					t.region:highlight(2)
				end
				if t.id == "okGear" then
					if t.region:exists(Pattern(t.target), 0.1) then
						findGearStars()
						if gearStars < KeepGearAbove then
							sellRegion:existsClick("sell.png", 0)
							gearAmountSold = gearAmountSold + 1
						else
							gearAmountKept = gearAmountKept + 1
						end
							
					end
				end
				if (t.region and (t.region):existsClick(t.target, 0)) then
					wait(t.sleep)
				end
			end
			wait(.5)
		end
		-- Check for energy refill
		if refillEnergy then
			refillRegion:existsClick(Pattern("Refill.png"), 0.1)
			refillOkRegion:existsClick(Pattern("RefillOK.png"), 0.1)
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

index = 1
------ battle  -----
blitzList[index] = {target =  "battle.png", region = Region(2177, 1168, 300, 300), id = "battle", action = 'click', sleep = 0}
index = index + 1
------ next  -----
blitzList[index] = {target =  "next.png", region = Region(1925, 1138, 300, 300), id = "next", action = 'click', sleep = 0}
index = index + 1
------ ok -----
blitzList[index] = {target =  "ok.png", region = Region(1141, 838, 300, 300), id = "ok", action = 'click', sleep = 0}
index = index + 1
------ Auto On -----
blitzList[index] = {target =  "AutoOn.png", region = Region(916, 984, 600, 600), id = "AutoOn", action = 'click', sleep = 0}
index = index + 1

function blitz()
	while true do
		local length = table.getn(blitzList)
		
		setImagePath(imagePath)
		
		for i = 1, length do
			local t = blitzList[i]
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

function findGearStars()
	
	local threeStarLocation = Location(1079, 705)
	local fourStarLocation = Location(1109, 705)
	local fiveStarLocation = Location(1139, 705)
	local sixStarLocation = Location(1169, 705)
	--locRegion = Region(1079, 705, 5, 5)
	--locRegion:highlight(1)
	
	local r, g, b = getColor(sixStarLocation)
	if (r == 250 and g == 200 and b == 94) then
		gearStars = 6
	else
		local r, g, b = getColor(fiveStarLocation)
		if (r == 250 and g == 200 and b == 94) then
			gearStars = 5
		else
			local r, g, b = getColor(fourStarLocation)		
			if (r == 250 and g == 200 and b == 94) then
				gearStars = 4
			else
				local r, g, b = getColor(threeStarLocation)
				if (r == 250 and g == 200 and b == 94) then
					gearStars = 3
				end
			end
		end
	end	
	toast(gearStars)
	
		
end

function showBattleResult()
	local message = ""
  
	if timeLimitCheckBox then
		timeInMinutes = math.floor(timer:check()/60)
		timeLeft = timeLimit - timeInMinutes
		message = ("Time Left: " .. timeLeft .. " minutes")
		resultRegion:highlightOff()
		resultRegion:highlight(message)
		if timeLeft <= 0 then
			print("Timed Run Complete")
				scriptExit()
		end
	end
	--Boss Battle Message
	if actionSelect == 3 then
		message = ("Gear Kept: " .. gearAmountKept .. "   Gear Sold: " .. gearAmountSold .. "")
		resultRegion:highlightOff()
		resultRegion:highlight(message)
	end
end

---- Main ----
setHighlightTextStyle(16777215, 4294967295, 12)
spinnerMinGearLevel = {
    "1",
    "2",
    "3",
    "4",
    "5",
    "6"
  }
  
dialogInit()
addTextView("Choose your mode:")
newRow()
addRadioGroup("actionSelect", 1)
addRadioButton("Farming", 1)
addRadioButton("Arena", 2)
addRadioButton("Boss Battle", 3)
addRadioButton("Blitz", 4)
newRow()
addTextView("--------Options--------")
newRow()
addTextView("If Farming, Stop @ Max Level:")
addCheckBox("MaxLevelSlot2", "Slot 2 ", false)
addCheckBox("MaxLevelSlot3", "Slot 3 ", false)
addCheckBox("MaxLevelSlot4", "Slot 4 ", false)
newRow()
addTextView("Keep Gear Above ")
addSpinner("minGearLevel", spinnerMinGearLevel, spinnerMinGearLevel[5])
addTextView(" Stars in Boss Mode")
newRow()
addCheckBox("refillEnergy", "Refill Energy? ", false)
addCheckBox("timeLimitCheckBox", "Time Limit?", false)
addEditNumber("timeLimit", 60)


dialogShowFullScreen("Dungeon Hunter Champions Bot")

timer = Timer()

if minGearLevel == spinnerMinGearLevel[1] then
	KeepGearAbove = 1
elseif minGearLevel == spinnerMinGearLevel[2] then
	KeepGearAbove = 2
elseif minGearLevel == spinnerMinGearLevel[3] then
	KeepGearAbove = 3
elseif minGearLevel == spinnerMinGearLevel[4] then
	KeepGearAbove = 4
elseif minGearLevel == spinnerMinGearLevel[5] then
	KeepGearAbove = 5
elseif minGearLevel == spinnerMinGearLevel[6] then
	KeepGearAbove = 6
end
	

if (actionSelect == 2) then
	arena()
elseif (actionSelect == 3) then
	boss()
elseif (actionSelect == 4) then
	blitz()
else
	farm()
end
