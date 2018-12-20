return PlaceObj("ModDef", {
	"title", "Remove Unwanted Colonists v0.2",
	"version", 2,
	"saved", 1545220800,
	"image", "Preview.png",
	"id", "ChoGGi_RemoveUnwantedColonists",
	"steam_id", "1594867237",
	"author", "ChoGGi",
	"lua_revision", LuaRevision,
	"code", {
		"Code/Script.lua",
		"Code/MurderPod.lua",
	},
	"description", [[Adds a button to the colonist selection menu to send them back to Earth.
A pod will come down and hover around the colonist till they make the mistake of going outside.
If you change your mind; you can toggle it before they get sucked up.

Once they go outside it'll then suck them up and take them back to Earth (truthfully just outside the atmosphere before spacing them).


Unfortunately frozen bodies don't have any propulsion systems. They'll come back as human shaped meteors (in a few Sols).
On the bright side there won't be much left on impact, so other colonists won't be affected.]],
})