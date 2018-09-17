function OnMsg.ClassesPostprocess()

	PlaceObj('BuildingTemplate', {


		'production_per_day1', 15000,
		'construction_cost_Concrete', 1500,
		'construction_cost_Metals', 1500,
		'construction_cost_Electronics', 1500,


		'Group', "Life-Support",
		'Id', "FungalFarm",
		'template_class', "FungalFarm",
		'resource_produced1', "Food",
		'max_storage1', 30000,
		'build_points', 6000,
		'is_tall', true,
		'dome_forbidden', true,
		'upgrade1_id', "SuperfungusUpgrade",
		'upgrade1_display_name', T{5081, --[[BuildingTemplate FungalFarm upgrade1_display_name]] "Superfungus"},
		'upgrade1_description', T{5082, --[[BuildingTemplate FungalFarm upgrade1_description]] "+<upgrade1_mul_value_1>% Production; +<upgrade1_mul_value_2>% Oxygen Consumption."},
		'upgrade1_icon', "UI/Icons/Upgrades/superfungus_01.tga",
		'upgrade1_upgrade_cost_Polymers', 10000,
		'upgrade1_mod_label_1', "FungalFarm",
		'upgrade1_mod_prop_id_1', "production_per_day1",
		'upgrade1_mul_value_1', 50,
		'upgrade1_mod_label_2', "FungalFarm",
		'upgrade1_mod_prop_id_2', "air_consumption",
		'upgrade1_mul_value_2', 100,
		'upgrade2_id', "FungalFarm_Automation",
		'upgrade2_display_name', T{5056, --[[BuildingTemplate FungalFarm upgrade2_display_name]] "Automation"},
		'upgrade2_description', T{5057, --[[BuildingTemplate FungalFarm upgrade2_description]] "Decreases Workplaces by <abs(upgrade2_add_value_1)>."},
		'upgrade2_icon', "UI/Icons/Upgrades/automation_01.tga",
		'upgrade2_upgrade_cost_Electronics', 10000,
		'upgrade2_mod_label_1', "FungalFarm",
		'upgrade2_mod_prop_id_1', "max_workers",
		'upgrade2_add_value_1', -2,
		'maintenance_resource_type', "Metals",
		'display_name', T{5083, --[[BuildingTemplate FungalFarm display_name]] "Fungal Farm"},
		'display_name_pl', T{5084, --[[BuildingTemplate FungalFarm display_name_pl]] "Fungal Farms"},
		'description', T{5085, --[[BuildingTemplate FungalFarm description]] "Produces Food."},
		'build_category', "Life-Support",
		'display_icon', "UI/Icons/Buildings/fungal_farm.tga",
		'build_pos', 11,
		'entity', "FungalFarm",
		'encyclopedia_id', "FungalFarm",
		'encyclopedia_image', "UI/Encyclopedia/FungalFarm.tga",
		'label1', "OutsideBuildings",
		'label2', "OutsideBuildingsTargets",
		'palettes', "FungalFarm",
		'demolish_sinking', range(10, 20),
		'electricity_consumption', 10000,
		'water_consumption', 500,
		'air_consumption', 2000,
		'active_shift', 1,
		'enabled_shift_2', false,
		'enabled_shift_3', false,
		'max_workers', 6,
		'specialist', "botanist",
	})
end