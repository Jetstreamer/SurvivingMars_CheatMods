-- See LICENSE for terms

function OnMsg.ModsLoaded()
	if not table.find(ModsLoaded,"id","ChoGGi_Library") then
		print([[Error: This mod requires ChoGGi's Library:
https://steamcommunity.com/sharedfiles/filedetails/?id=1504386374
Check Mod Manager to make sure it's enabled.]])
	end
end

-- nope not hacky at all
local is_loaded
function OnMsg.ClassesGenerate()
	Msg("ChoGGi_Library_Loaded","ChoGGi_RestoreRequestMaintenance")
end
function OnMsg.ChoGGi_Library_Loaded(mod_id)
	if is_loaded or mod_id and mod_id ~= "ChoGGi_RestoreRequestMaintenance" then
		return
	end
	is_loaded = true

	local T,PlayFX,IsKindOf,XTemplates = T,PlayFX,IsKindOf,XTemplates
	local RebuildInfopanel,IsMassUIModifierPressed = RebuildInfopanel,IsMassUIModifierPressed

	--removed functions
	function RequiresMaintenance:GetUIRequestMaintenanceStatus()
		if self.accumulated_maintenance_points > 0 then
			if self.maintenance_phase == false then
				return T{7329, "Maintenance needed"}
			else
				return T{389, "Maintenance already requested"}
			end
		end
		return T{390, "No deterioration"}
	end
	function RequiresMaintenance:UIRequestMaintenance()
		RebuildInfopanel(self)
		return self:RequestMaintenance(true)
	end

	function OnMsg.ClassesBuilt()

		if XTemplates.ipBuilding.ChoGGi_RestoreMain then
			table.remove(XTemplates.ipBuilding[1][1],#XTemplates.ipBuilding[1][1])
			XTemplates.ipBuilding.ChoGGi_RestoreMain = nil
		end

		--restore the button
		ChoGGi.CodeFuncs.RemoveXTemplateSections(XTemplates.ipBuilding[1][1],"ChoGGi_RestoreMaintenance")
		XTemplates.ipBuilding[1][1][#XTemplates.ipBuilding[1][1]+1] = PlaceObj("XTemplateTemplate", {
			"ChoGGi_RestoreMaintenance", true,
			"__condition", function(parent, context)
				return IsKindOf(context, "RequiresMaintenance") and context:DoesRequireMaintenance()
			end,
			"__template", "InfopanelButton",
			"RolloverText", T{182273828429, "Request maintenance from nearby Drones. The required maintenance resource must be available in the area.<newline><newline>Status: <em><UIRequestMaintenanceStatus></em>"},
			"RolloverDisabledText", T{513214256397, "Maintenance already requested."},
			"RolloverTitle", T{425734571364, "Request Maintenance"},
			"RolloverHint", T{238148642034, "<left_click> Activate <newline><em>Ctrl + <left_click></em> Activate for all <display_name_pl>"},
			"RolloverHintGamepad", T{919224409562, "<ButtonA> Activate <newline><ButtonX> Activate for all <display_name_pl>"},
			"OnContextUpdate", function(self, context)
				--changed it so it only shows the button when main is needed/requested
				self:SetVisible(context.accumulated_maintenance_points > 0)
				self:SetEnabled(context.accumulated_maintenance_points > 0 and context.maintenance_phase == false)
			end,
			"OnPressParam", "UIRequestMaintenance",
			"OnPress", function(self, gamepad)
				PlayFX("UIRequestMaintenance")
				self.context:UIRequestMaintenance(not gamepad and IsMassUIModifierPressed())
			end,
			"AltPress", true,
			"OnAltPress", function(self, gamepad)
				if gamepad then
					self.context:UIRequestMaintenance(true)
				end
			end,
			"Icon", "UI/Icons/IPButtons/rebuild.tga"
		})
	end

end