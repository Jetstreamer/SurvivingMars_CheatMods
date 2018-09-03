local DelayedLoadEntity = DelayedLoadEntity
local PlaceObj = PlaceObj
local StringFormat = string.format

-- Mars Marx, eh close enough
local mod = Mods.ChoGGi_CommieMarxLogos
local ent_path = StringFormat("%sEntities/%s.ent",mod.env.CurrentModPath,"%s")

local function LoadDecal(name)
	pcall(function()
		-- needs to happen before the decal object is placed
		DelayedLoadEntity(mod,name,ent_path:format(name))

		PlaceObj("Decal", {
			"name",name,
			"entity_name",name,
		})
	end)
end
LoadDecal("Chilean_Communist_Party")
LoadDecal("Coat_of_Arms_Byelorussian_Soviet_Socialist_Republic")
LoadDecal("Coat_of_Arms_of_East_Germany_(1953-1955)")
LoadDecal("Coat_of_Arms_of_PCR")
LoadDecal("Coat_of_Arms_of_the_Popular_Republic_of_Romania_1948")
LoadDecal("Coat_of_Arms_of_the_Socialist_Republic_of_Bosnia_and_Herzegovina")
LoadDecal("Coat_of_Arms_of_the_Socialist_Republic_of_Serbia")
LoadDecal("Coat_of_Arms_of_the_Soviet_Union")
LoadDecal("Coat_Soviet_Canuck")
LoadDecal("Colombian_Communist_Party")
LoadDecal("Communist_Brazil_coat_of_arms")
LoadDecal("Communist_California")
LoadDecal("Communist_Party_of_Argentina")
LoadDecal("Communist_Party_of_Belarus")
LoadDecal("Communist_Party_of_Brazil")
LoadDecal("Communist_Party_of_Canada")
LoadDecal("Communist_Party_of_Chile")
LoadDecal("Communist_Party_of_China")
LoadDecal("Communist_Party_of_Finland")
LoadDecal("Communist_Party_of_Greece")
LoadDecal("Communist_Party_of_Ireland")
LoadDecal("Communist_Party_of_Pakistan")
LoadDecal("Communist_Party_of_Spain")
LoadDecal("Communist_Party_of_Sweden")
LoadDecal("Communist_Party_of_the_Russian_Federation")
LoadDecal("Communist_Party_of_Turkey")
LoadDecal("Communist_Party_of_Venezuela")
LoadDecal("Communist_Party_USSA")
LoadDecal("Emblem_of_the_Ukrainian_SSR")
LoadDecal("Flag_of_the_Hungarian_Communist_Party")
LoadDecal("Jordanian_Communist_Party")
LoadDecal("Lebanese_Communist_Party")
LoadDecal("New_Communist_Party_of_Britain")
LoadDecal("Party_of_Italian_Communists")
LoadDecal("Party_of_Mexican_Communists")
LoadDecal("Peoples_Party_of_Panama")
LoadDecal("Portuguese_Communist_Party")
LoadDecal("Progressive_Party_of_Working_People_(Cyprus)")
LoadDecal("Redneck_Commies")
LoadDecal("Russian_Soviet_Federative_Socialist_Republic")
LoadDecal("South_African_Communist_Party")
LoadDecal("Swiss_Party_of_Labour")
LoadDecal("Taiwan_Communist_Party")
LoadDecal("USSR")
LoadDecal("Workers_Party_of_New_Zealand")

local logo_path = StringFormat("%sUI/%s.png",mod.env.CurrentModPath,"%s")
local function LoadLogo(name,display)
	PlaceObj("MissionLogoPreset", {
		display_name = StringFormat("Commie Marx: %s",display),
		decal_entity = name,
		entity_name = name,
		id = StringFormat("CommieMarsLogos_%s",name),
		image = logo_path:format(name),
	})
end

function OnMsg.ClassesPostprocess()
	LoadLogo("Chilean_Communist_Party","Chilean Communist Party")
	LoadLogo("Coat_of_Arms_Byelorussian_Soviet_Socialist_Republic","Coat of Arms Byelorussian Soviet Socialist Republic")
	LoadLogo("Coat_of_Arms_of_East_Germany_(1953-1955)","Coat of Arms of East Germany (1953-1955)")
	LoadLogo("Coat_of_Arms_of_PCR","Coat of Arms of PCR")
	LoadLogo("Coat_of_Arms_of_the_Popular_Republic_of_Romania_1948","Coat of Arms of the Popular Republic of Romania 1948")
	LoadLogo("Coat_of_Arms_of_the_Socialist_Republic_of_Bosnia_and_Herzegovina","Coat of Arms of the Socialist Republic of Bosnia and Herzegovina")
	LoadLogo("Coat_of_Arms_of_the_Socialist_Republic_of_Serbia","Coat of Arms of the Socialist Republic of Serbia")
	LoadLogo("Coat_of_Arms_of_the_Soviet_Union","Coat of Arms of the Soviet Union")
	LoadLogo("Coat_Soviet_Canuck","Coat Soviet Canuck")
	LoadLogo("Colombian_Communist_Party","Colombian Communist Party")
	LoadLogo("Communist_Brazil_coat_of_arms","Communist Brazil coat of arms")
	LoadLogo("Communist_California","Communist California")
	LoadLogo("Communist_Party_of_Argentina","Communist Party of Argentina")
	LoadLogo("Communist_Party_of_Belarus","Communist Party of Belarus")
	LoadLogo("Communist_Party_of_Brazil","Communist Party of Brazil")
	LoadLogo("Communist_Party_of_Canada","Communist Party of Canada")
	LoadLogo("Communist_Party_of_Chile","Communist Party of Chile")
	LoadLogo("Communist_Party_of_China","Communist Party of China")
	LoadLogo("Communist_Party_of_Finland","Communist Party of Finland")
	LoadLogo("Communist_Party_of_Greece","Communist Party of Greece")
	LoadLogo("Communist_Party_of_Ireland","Communist Party of Ireland")
	LoadLogo("Communist_Party_of_Pakistan","Communist Party of Pakistan")
	LoadLogo("Communist_Party_of_Spain","Communist Party of Spain")
	LoadLogo("Communist_Party_of_Sweden","Communist Party of Sweden")
	LoadLogo("Communist_Party_of_the_Russian_Federation","Communist Party of the Russian Federation")
	LoadLogo("Communist_Party_of_Turkey","Communist Party of Turkey")
	LoadLogo("Communist_Party_of_Venezuela","Communist Party of Venezuela")
	LoadLogo("Communist_Party_USSA","Communist Party USSA")
	LoadLogo("Emblem_of_the_Ukrainian_SSR","Emblem of the Ukrainian SSR")
	LoadLogo("Flag_of_the_Hungarian_Communist_Party","Flag of the Hungarian Communist Party")
	LoadLogo("Jordanian_Communist_Party","Jordanian Communist Party")
	LoadLogo("Lebanese_Communist_Party","Lebanese Communist Party")
	LoadLogo("New_Communist_Party_of_Britain","New Communist Party of Britain")
	LoadLogo("Party_of_Italian_Communists","Party of Italian Communists")
	LoadLogo("Party_of_Mexican_Communists","Party of Mexican Communists")
	LoadLogo("Peoples_Party_of_Panama","People's Party of Panama")
	LoadLogo("Portuguese_Communist_Party","Portuguese Communist Party")
	LoadLogo("Progressive_Party_of_Working_People_(Cyprus)","Progressive Party of Working People (Cyprus)")
	LoadLogo("Redneck_Commies","Redneck Commies")
	LoadLogo("Russian_Soviet_Federative_Socialist_Republic","Russian Soviet Federative Socialist Republic")
	LoadLogo("South_African_Communist_Party","South African Communist Party")
	LoadLogo("Swiss_Party_of_Labour","Swiss Party of Labour")
	LoadLogo("Taiwan_Communist_Party","Taiwan Communist Party")
	LoadLogo("USSR","USSR")
	LoadLogo("Workers_Party_of_New_Zealand","Workers Party of New Zealand")
end
