-- See LICENSE for terms

local tostring,type = tostring,type

local MsgPopup = ChoGGi.ComFuncs.MsgPopup
local Strings = ChoGGi.Strings
local Translate = ChoGGi.ComFuncs.Translate
--~	local RetName = ChoGGi.ComFuncs.RetName

function ChoGGi.MenuFuncs.SetRoverWorkRadius()
	local default_setting = ChoGGi.Consts.RCRoverMaxRadius
	local item_list = {
		{text = Translate(1000121--[[Default--]]) .. ": " .. default_setting,value = default_setting},
		{text = 40,value = 40},
		{text = 80,value = 80},
		{text = 160,value = 160},
		{text = 320,value = 320,hint = Strings[302535920000111--[[Cover the entire map from the centre.--]]]},
		{text = 640,value = 640,hint = Strings[302535920000112--[[Cover the entire map from a corner.--]]]},
	}

	--other hint type
	local hint = default_setting
	if ChoGGi.UserSettings.RCRoverMaxRadius then
		hint = ChoGGi.UserSettings.RCRoverMaxRadius
	end

	local function CallBackFunc(choice)
		if choice.nothing_selected then
			return
		end
		local value = choice[1].value
		if type(value) == "number" then

			ChoGGi.ComFuncs.SetSavedSetting("RCRoverMaxRadius",value)
			--we need to set this so the hex grid during placement is enlarged
			const.RCRoverMaxRadius = value

			local objs = UICity.labels.RCRover or ""
			for i = 1, #objs do
				objs[i]:SetWorkRadius(value)
			end

			ChoGGi.SettingFuncs.WriteSettings()
			MsgPopup(
				Strings[302535920000883--[[%s: I can see for miles and miles.--]]]:format(ChoGGi.ComFuncs.SettingState(ChoGGi.UserSettings.RCRoverMaxRadius)),
				Strings[302535920000505--[[Work Radius RC Rover--]]],
				"UI/Icons/Upgrades/service_bots_04.tga"
			)
		end
	end

	ChoGGi.ComFuncs.OpenInListChoice{
		callback = CallBackFunc,
		items = item_list,
		title = Strings[302535920000884--[[Set Rover Work Radius--]]],
		hint = Strings[302535920000106--[[Current--]]] .. ": " .. hint .. "\n\n"
			.. Strings[302535920000115--[[Toggle selection to update visible hex grid.--]]],
		skip_sort = true,
	}
end

function ChoGGi.MenuFuncs.SetDroneType()
	local icons = Presets.EncyclopediaArticle.Vehicles
	local item_list = {
		{
			text = Translate(10278--[[Wasp Drone--]]),
			value = "FlyingDrone",
			hint = "<image " .. icons.FlyingDrone.image .. ">\n\n" .. Translate(10278--[[Wasp Drone--]]),
		},
		{
			text = Translate(1681--[[Drone--]]),
			value = "Drone",
			hint = "<image " .. icons.Drone.image .. ">\n\n" .. Translate(1681--[[Drone--]]),
		},
	}
	local sponsor = GetMissionSponsor()

	local function CallBackFunc(choice)
		if choice.nothing_selected then
			return
		end
		sponsor.drone_class = choice[1].value
		MsgPopup(
			Strings[302535920001405--[[Drones will now spawn as: %s--]]]:format(choice[1].text),
			Strings[302535920001403--[[Drone Type--]]]
		)
	end

	-- if nothing is set than it's regular drones
	local name = g_Classes[sponsor.drone_class]
	name = name and name.display_name or 1681--[[Drone--]]

	ChoGGi.ComFuncs.OpenInListChoice{
		callback = CallBackFunc,
		items = item_list,
		title = Strings[302535920001403--[[Drone Type--]]],
		hint = Strings[302535920000106--[[Current--]]] .. ": " .. Translate(name) .. "\n"
			.. Strings[302535920001406--[["Hubs can only have one type of drone, so you'll need pack/unpack all drones for each hub you wish to change (or use Drones>%s)."--]]]:format(Strings[302535920000513--[[Change Amount of Drones in Hub--]]]),
	}
end

function ChoGGi.MenuFuncs.SetDroneHubWorkRadius()
	local default_setting = ChoGGi.Consts.CommandCenterMaxRadius
	local item_list = {
		{text = Translate(1000121--[[Default--]]) .. ": " .. default_setting,value = default_setting},
		{text = 40,value = 40},
		{text = 80,value = 80},
		{text = 160,value = 160},
		{text = 320,value = 320,hint = Strings[302535920000111--[[Cover the entire map from the centre.--]]]},
		{text = 640,value = 640,hint = Strings[302535920000112--[[Cover the entire map from a corner.--]]]},
	}

	--other hint type
	local hint = default_setting
	if ChoGGi.UserSettings.CommandCenterMaxRadius then
		hint = ChoGGi.UserSettings.CommandCenterMaxRadius
	end

	local function CallBackFunc(choice)
		if choice.nothing_selected then
			return
		end
		local value = choice[1].value
		if type(value) == "number" then

			ChoGGi.ComFuncs.SetSavedSetting("CommandCenterMaxRadius",value)
			-- we need to set this so the hex grid during placement is enlarged
			const.CommandCenterMaxRadius = value

			local objs = UICity.labels.DroneHub or ""
			for i = 1, #objs do
				objs[i]:SetWorkRadius(value)
			end

			ChoGGi.SettingFuncs.WriteSettings()
			MsgPopup(
				Strings[302535920000883--[[%s: I can see for miles and miles--]]]:format(ChoGGi.ComFuncs.SettingState(ChoGGi.UserSettings.CommandCenterMaxRadius)),
				Strings[302535920000507--[[Work Radius DroneHub--]]],
				"UI/Icons/Upgrades/service_bots_04.tga"
			)
		end
	end

	ChoGGi.ComFuncs.OpenInListChoice{
		callback = CallBackFunc,
		items = item_list,
		title = Strings[302535920000886--[[Set DroneHub Work Radius--]]],
		hint = Strings[302535920000106--[[Current--]]] .. ": " .. hint .. "\n\n"
			.. Strings[302535920000115--[[Toggle selection to update visible hex grid.--]]],
		skip_sort = true,
	}
end

function ChoGGi.MenuFuncs.SetDroneRockToConcreteSpeed()
	local default_setting = ChoGGi.Consts.DroneTransformWasteRockObstructorToStockpileAmount
	local item_list = {
		{text = Translate(1000121--[[Default--]]) .. ": " .. default_setting,value = default_setting},
		{text = 0,value = 0},
		{text = 25,value = 25},
		{text = 50,value = 50},
		{text = 75,value = 75},
		{text = 100,value = 100},
		{text = 250,value = 250},
		{text = 500,value = 500},
	}

	local hint = default_setting
	if ChoGGi.UserSettings.DroneTransformWasteRockObstructorToStockpileAmount then
		hint = ChoGGi.UserSettings.DroneTransformWasteRockObstructorToStockpileAmount
	end

	local function CallBackFunc(choice)
		if choice.nothing_selected then
			return
		end
		local value = choice[1].value
		if type(value) == "number" then
			ChoGGi.ComFuncs.SetConstsG("DroneTransformWasteRockObstructorToStockpileAmount",value)

			ChoGGi.ComFuncs.SetSavedSetting("DroneTransformWasteRockObstructorToStockpileAmount",Consts.DroneTransformWasteRockObstructorToStockpileAmount)
			MsgPopup(
				ChoGGi.ComFuncs.SettingState(choice[1].text,Strings[302535920000769--[[Selected--]]]),
				Strings[302535920000509--[[Drone Rock To Concrete Speed--]]]
			)
		end
	end

	ChoGGi.ComFuncs.OpenInListChoice{
		callback = CallBackFunc,
		items = item_list,
		title = Strings[302535920000509--[[Drone Rock To Concrete Speed--]]],
		hint = Strings[302535920000106--[[Current--]]] .. ": " .. hint,
		skip_sort = true,
	}
end

function ChoGGi.MenuFuncs.SetDroneMoveSpeed()
	local r = ChoGGi.Consts.ResourceScale
	local default_setting = ChoGGi.Consts.SpeedDrone
	local UpgradedSetting = ChoGGi.ComFuncs.GetResearchedTechValue("SpeedDrone")
	local item_list = {
		{text = Translate(1000121--[[Default--]]) .. ": " .. (default_setting / r),value = default_setting,hint = Strings[302535920000889--[[base speed--]]]},
		{text = 5,value = 5 * r},
		{text = 10,value = 10 * r},
		{text = 15,value = 15 * r},
		{text = 25,value = 25 * r},
		{text = 50,value = 50 * r},
		{text = 100,value = 100 * r},
		{text = 1000,value = 1000 * r},
		{text = 10000,value = 10000 * r},
	}
	if default_setting ~= UpgradedSetting then
		table.insert(item_list,2,{text = Strings[302535920000890--[[Upgraded--]]] .. ": " .. (UpgradedSetting / r),value = UpgradedSetting,hint = Strings[302535920000891--[[apply tech unlocks--]]]})
	end

	local hint = UpgradedSetting
	if ChoGGi.UserSettings.SpeedDrone then
		hint = ChoGGi.UserSettings.SpeedDrone
	end

	local function CallBackFunc(choice)
		if choice.nothing_selected then
			return
		end
		local value = choice[1].value
		if type(value) == "number" then
			local objs = UICity.labels.Drone or ""
			for i = 1, #objs do
				objs[i]:SetMoveSpeed(value)
			end
			ChoGGi.ComFuncs.SetSavedSetting("SpeedDrone",value)

			ChoGGi.SettingFuncs.WriteSettings()
			MsgPopup(
				ChoGGi.ComFuncs.SettingState(choice[1].text,Strings[302535920000769--[[Selected--]]]),
				Strings[302535920000511--[[Drone Move Speed--]]]
			)
		end
	end

	ChoGGi.ComFuncs.OpenInListChoice{
		callback = CallBackFunc,
		items = item_list,
		title = Strings[302535920000511--[[Drone Move Speed--]]],
		hint = Strings[302535920000106--[[Current--]]] .. ": " .. hint,
		skip_sort = true,
	}
end

function ChoGGi.MenuFuncs.SetDroneAmountDroneHub()
	local obj = ChoGGi.ComFuncs.SelObject()
	if not obj or not obj:IsKindOf("DroneControl") then
		return
	end

	local CurrentAmount = obj:GetDronesCount()
	local item_list = {
		{text = Strings[302535920000894--[[Current amount--]]] .. ": " .. CurrentAmount,value = CurrentAmount},
		{text = 1,value = 1},
		{text = 5,value = 5},
		{text = 10,value = 10},
		{text = 25,value = 25},
		{text = 50,value = 50},
		{text = 100,value = 100},
		{text = 250,value = 250},
	}

	local function CallBackFunc(choice)
		if choice.nothing_selected then
			return
		end
		local value = choice[1].value
		if type(value) == "number" then

			local change = Strings[302535920000746--[[added--]]]
			if choice[1].check1 then
				change = Strings[302535920000917--[[packed--]]]
				for _ = 1, value do
					obj:ConvertDroneToPrefab()
				end
			else
				for _ = 1, value do
					obj:UseDronePrefab()
				end
			end

			MsgPopup(
				choice[1].text .. ": " .. Translate(517--[[Drones--]]) .. " " .. change,
				Strings[302535920000513--[[Change Amount Of Drones In Hub--]]]
			)
		end
	end

	ChoGGi.ComFuncs.OpenInListChoice{
		callback = CallBackFunc,
		items = item_list,
		title = Strings[302535920000895--[[Change Amount Of Drones--]]],
		hint = Strings[302535920000896--[[Drones in hub--]]] .. ": " .. CurrentAmount .. " "
			.. Strings[302535920000897--[[Drone prefabs--]]] .. ": " .. UICity.drone_prefabs,
		skip_sort = true,
		checkboxes = {
			{
				title = Strings[302535920000898--[[Pack Drones--]]],
				hint = Strings[302535920000899--[[Check this to pack drone(s) into prefabs (number can be higher than attached drones).--]]],
			},
		},
	}
end

function ChoGGi.MenuFuncs.SetDroneFactoryBuildSpeed()
	local default_setting = ChoGGi.Consts.DroneFactoryBuildSpeed
	local item_list = {
		{text = Translate(1000121--[[Default--]]) .. ": " .. default_setting,value = default_setting},
		{text = 25,value = 25},
		{text = 50,value = 50},
		{text = 75,value = 75},
		{text = 100,value = 100},
		{text = 250,value = 250},
		{text = 500,value = 500},
		{text = 1000,value = 1000},
		{text = 2500,value = 2500},
		{text = 5000,value = 5000},
		{text = 10000,value = 10000},
		{text = 25000,value = 25000},
		{text = 50000,value = 50000},
		{text = 100000,value = 100000},
	}

	if not ChoGGi.UserSettings.BuildingSettings.DroneFactory then
		ChoGGi.UserSettings.BuildingSettings.DroneFactory = {}
	end
	local setting = ChoGGi.UserSettings.BuildingSettings.DroneFactory

	local hint = default_setting
	if setting.performance_notauto then
		hint = tostring(setting.performance_notauto)
	end

	local function CallBackFunc(choice)
		if choice.nothing_selected then
			return
		end
		local value = choice[1].value
		if type(value) == "number" then
			local objs = UICity.labels.DroneFactory or ""
			for i = 1, #objs do
				objs[i].performance = value
			end
		end

		if value == default_setting then
			setting.performance_notauto = nil
		else
			setting.performance_notauto = value
		end

		ChoGGi.SettingFuncs.WriteSettings()
		MsgPopup(
			ChoGGi.ComFuncs.SettingState(choice[1].text),
			Strings[302535920000515--[[DroneFactory Build Speed--]]]
		)
	end

	ChoGGi.ComFuncs.OpenInListChoice{
		callback = CallBackFunc,
		items = item_list,
		title = Strings[302535920000901--[[Set Drone Factory Build Speed--]]],
		hint = Strings[302535920000106--[[Current--]]] .. ": " .. hint,
		skip_sort = true,
	}
end

function ChoGGi.MenuFuncs.DroneBatteryInfinite_Toggle()
	local list = {
		"DroneMoveBatteryUse",
		"DroneCarryBatteryUse",
		"DroneConstructBatteryUse",
		"DroneBuildingRepairBatteryUse",
		"DroneDeconstructBatteryUse",
		"DroneTransformWasteRockObstructorToStockpileBatteryUse",
	}

	local Consts = Consts
	local cConsts = ChoGGi.Consts
	local SetConstsG = ChoGGi.ComFuncs.SetConstsG
	local NumRetBool = ChoGGi.ComFuncs.NumRetBool
	local SetSavedSetting = ChoGGi.ComFuncs.SetSavedSetting
	for i = 1, #list do
		local name = list[i]
		SetConstsG(name,NumRetBool(Consts[name],0,cConsts[name]))
		SetSavedSetting(name,Consts[name])
	end

	ChoGGi.SettingFuncs.WriteSettings()
	MsgPopup(
		ChoGGi.ComFuncs.SettingState(ChoGGi.UserSettings.DroneMoveBatteryUse),
		Strings[302535920000519--[[Drone Battery Infinite--]]]
	)
end

function ChoGGi.MenuFuncs.DroneBuildSpeed_Toggle()
	ChoGGi.ComFuncs.SetConstsG("DroneConstructAmount",ChoGGi.ComFuncs.ValueRetOpp(Consts.DroneConstructAmount,max_int,ChoGGi.Consts.DroneConstructAmount))
	ChoGGi.ComFuncs.SetConstsG("DroneBuildingRepairAmount",ChoGGi.ComFuncs.ValueRetOpp(Consts.DroneBuildingRepairAmount,max_int,ChoGGi.Consts.DroneBuildingRepairAmount))
	ChoGGi.ComFuncs.SetSavedSetting("DroneConstructAmount",Consts.DroneConstructAmount)
	ChoGGi.ComFuncs.SetSavedSetting("DroneBuildingRepairAmount",Consts.DroneBuildingRepairAmount)

	ChoGGi.SettingFuncs.WriteSettings()
	MsgPopup(
		ChoGGi.ComFuncs.SettingState(ChoGGi.UserSettings.DroneConstructAmount),
		Strings[302535920000521--[[Drone Build Speed--]]]
	)
end

function ChoGGi.MenuFuncs.DroneRechargeTime_Toggle()
	ChoGGi.ComFuncs.SetConstsG("DroneRechargeTime",ChoGGi.ComFuncs.NumRetBool(Consts.DroneRechargeTime,0,ChoGGi.Consts.DroneRechargeTime))
	ChoGGi.ComFuncs.SetSavedSetting("DroneRechargeTime",Consts.DroneRechargeTime)

	ChoGGi.SettingFuncs.WriteSettings()
	MsgPopup(
		Strings[302535920000907--[[%s: Well, if jacking on'll make strangers think I'm cool, I'll do it!--]]]:format(ChoGGi.ComFuncs.SettingState(ChoGGi.UserSettings.DroneRechargeTime)),
		Translate(4645--[[Drone Recharge Time--]]),
		"UI/Icons/Notifications/low_battery.tga",
		true
	)
end

function ChoGGi.MenuFuncs.DroneRepairSupplyLeak_Toggle()
	ChoGGi.ComFuncs.SetConstsG("DroneRepairSupplyLeak",ChoGGi.ComFuncs.ValueRetOpp(Consts.DroneRepairSupplyLeak,1,ChoGGi.Consts.DroneRepairSupplyLeak))
	ChoGGi.ComFuncs.SetSavedSetting("DroneRepairSupplyLeak",Consts.DroneRepairSupplyLeak)

	ChoGGi.SettingFuncs.WriteSettings()
	MsgPopup(
		Strings[302535920000908--[[%s: You know what they say about leaky pipes.--]]]:format(ChoGGi.ComFuncs.SettingState(ChoGGi.UserSettings.DroneRepairSupplyLeak)),
		Strings[302535920000527--[[Drone Repair Supply Leak Speed--]]]
	)
end

function ChoGGi.MenuFuncs.SetDroneCarryAmount()
	local default_setting = ChoGGi.ComFuncs.GetResearchedTechValue("DroneResourceCarryAmount")
	local hinttoolarge = Strings[302535920000909--[["If you set this amount larger then a building's ""Storage"" amount then the drones will NOT pick up storage (See: Fixes>%s)."--]]]:format(Strings[302535920000613--[[Drone Carry Amount--]]])
	local item_list = {
		{text = Translate(1000121--[[Default--]]) .. ": " .. default_setting,value = default_setting},
		{text = 5,value = 5},
		{text = 10,value = 10},
		{text = 25,value = 25,hint = hinttoolarge},
		{text = 50,value = 50,hint = hinttoolarge},
		{text = 75,value = 75,hint = hinttoolarge},
		{text = 100,value = 100,hint = hinttoolarge},
		{text = 250,value = 250,hint = hinttoolarge},
		{text = 500,value = 500,hint = hinttoolarge},
		{text = 1000,value = 1000,hint = hinttoolarge .. "\n\n" .. Strings[302535920000910--[[Somewhere above 1000 will delete the save (when it's full)--]]]},
	}

	local hint = default_setting
	if ChoGGi.UserSettings.DroneResourceCarryAmount then
		hint = ChoGGi.UserSettings.DroneResourceCarryAmount
	end

	local function CallBackFunc(choice)
		if choice.nothing_selected then
			return
		end
		local value = choice[1].value
		if type(value) == "number" then
			-- somewhere above 1000 screws the save
			if value > 1000 then
				value = 1000
			end
			ChoGGi.ComFuncs.SetConstsG("DroneResourceCarryAmount",value)
			UpdateDroneResourceUnits()
			ChoGGi.ComFuncs.SetSavedSetting("DroneResourceCarryAmount",value)

			ChoGGi.SettingFuncs.WriteSettings()
			MsgPopup(
				Strings[302535920000911--[[Drones can carry %s items.--]]]:format(choice[1].text),
				Strings[302535920000529--[[Drone Carry Amount--]]]
			)
		end
	end

	ChoGGi.ComFuncs.OpenInListChoice{
		callback = CallBackFunc,
		items = item_list,
		title = Strings[302535920000913--[[Set Drone Carry Capacity--]]],
		hint = Strings[302535920000914--[[Current capacity--]]] .. ": " .. hint
			.. "\n\n" .. hinttoolarge .. "\n\n" .. Strings[302535920000834--[[Max--]]]
			.. ": 1000.",
		skip_sort = true,
	}
end

function ChoGGi.MenuFuncs.SetDronesPerDroneHub()
	local default_setting = ChoGGi.ComFuncs.GetResearchedTechValue("CommandCenterMaxDrones")
	local item_list = {
		{text = Translate(1000121--[[Default--]]) .. ": " .. default_setting,value = default_setting},
		{text = 5,value = 5},
		{text = 10,value = 10},
		{text = 25,value = 25},
		{text = 50,value = 50},
		{text = 75,value = 75},
		{text = 100,value = 100},
		{text = 250,value = 250},
		{text = 500,value = 500},
		{text = 1000,value = 1000},
	}

	local hint = default_setting
	if ChoGGi.UserSettings.CommandCenterMaxDrones then
		hint = ChoGGi.UserSettings.CommandCenterMaxDrones
	end

	local function CallBackFunc(choice)
		if choice.nothing_selected then
			return
		end
		local value = choice[1].value
		if type(value) == "number" then
			ChoGGi.ComFuncs.SetConstsG("CommandCenterMaxDrones",value)
			ChoGGi.ComFuncs.SetSavedSetting("CommandCenterMaxDrones",value)

			ChoGGi.SettingFuncs.WriteSettings()
			MsgPopup(
				Strings[302535920000916--[[DroneHubs can control %s drones.--]]]:format(choice[1].text),
				Strings[302535920000531--[[Drones Per Drone Hub--]]]
			)
		end
	end

	ChoGGi.ComFuncs.OpenInListChoice{
		callback = CallBackFunc,
		items = item_list,
		title = Strings[302535920000918--[[Set DroneHub Drone Capacity--]]],
		hint = Strings[302535920000914--[[Current capacity--]]] .. ": " .. hint,
		skip_sort = true,
	}
end

function ChoGGi.MenuFuncs.SetDronesPerRCRover()
	local default_setting = ChoGGi.ComFuncs.GetResearchedTechValue("RCRoverMaxDrones")
	local item_list = {
		{text = Translate(1000121--[[Default--]]) .. ": " .. default_setting,value = default_setting},
		{text = 5,value = 5},
		{text = 10,value = 10},
		{text = 25,value = 25},
		{text = 50,value = 50},
		{text = 75,value = 75},
		{text = 100,value = 100},
		{text = 250,value = 250},
		{text = 500,value = 500},
		{text = 1000,value = 1000},
	}

	local hint = default_setting
	if ChoGGi.UserSettings.RCRoverMaxDrones then
		hint = ChoGGi.UserSettings.RCRoverMaxDrones
	end

	local function CallBackFunc(choice)
		if choice.nothing_selected then
			return
		end
		local value = choice[1].value
		if type(value) == "number" then
			ChoGGi.ComFuncs.SetConstsG("RCRoverMaxDrones",value)
			ChoGGi.ComFuncs.SetSavedSetting("RCRoverMaxDrones",value)

			ChoGGi.SettingFuncs.WriteSettings()
			MsgPopup(
				Strings[302535920000921--[[RC Rovers can control %s drones.--]]]:format(choice[1].text),
				Strings[302535920000533--[[Drones Per RC Rover--]]]
			)
		end
	end

	ChoGGi.ComFuncs.OpenInListChoice{
		callback = CallBackFunc,
		items = item_list,
		title = Strings[302535920000924--[[Set RC Rover Drone Capacity--]]],
		hint = Strings[302535920000914--[[Current capacity--]]] .. ": " .. hint,
		skip_sort = true,
	}
end

function ChoGGi.MenuFuncs.SetGravityDrones()
	local default_setting = ChoGGi.Consts.GravityDrone
	local r = ChoGGi.Consts.ResourceScale
	local item_list = {
		{text = Translate(1000121--[[Default--]]) .. ": " .. default_setting,value = default_setting},
		{text = 1,value = 1},
		{text = 2,value = 2},
		{text = 3,value = 3},
		{text = 4,value = 4},
		{text = 5,value = 5},
		{text = 10,value = 10},
		{text = 15,value = 15},
		{text = 25,value = 25},
		{text = 50,value = 50},
		{text = 75,value = 75},
		{text = 100,value = 100},
		{text = 250,value = 250},
		{text = 500,value = 500},
	}

	local hint = default_setting
	if ChoGGi.UserSettings.GravityDrone then
		hint = ChoGGi.UserSettings.GravityDrone / r
	end
	local function CallBackFunc(choice)
		if choice.nothing_selected then
			return
		end
		local value = choice[1].value
		if type(value) == "number" then
			local value = value * r
			--loop through and set all
			local objs = UICity.labels.Drone or ""
			for i = 1, #objs do
				objs[i]:SetGravity(value)
			end
			ChoGGi.ComFuncs.SetSavedSetting("GravityDrone",value)

			ChoGGi.SettingFuncs.WriteSettings()
			MsgPopup(
				Strings[302535920000919--[[RC gravity is now %s.--]]]:format(choice[1].text),
				Strings[302535920000517--[[Drone Gravity--]]]
			)
		end
	end

	ChoGGi.ComFuncs.OpenInListChoice{
		callback = CallBackFunc,
		items = item_list,
		title = Strings[302535920000923--[[Set Drone Gravity--]]],
		hint = Strings[302535920000841--[[Current gravity: %s--]]]:format(hint),
		skip_sort = true,
	}
end