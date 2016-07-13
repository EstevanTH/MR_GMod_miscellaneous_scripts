local ToRemove = {
	-- This list contains the MapCreationID of every entity to remove.
	[2091]=true,
	[2086]=true,
	[2082]=true,
}
local function RemoveMapEntities()
	for _,ent in ipairs( ents.GetAll() ) do
		if ToRemove[ent:MapCreationID()] then
			ent:Remove()
		end
	end
end
hook.Add( "InitPostEntity", "RemoveMapEntities", RemoveMapEntities )
hook.Add( "PostCleanupMap", "RemoveMapEntities", RemoveMapEntities )
