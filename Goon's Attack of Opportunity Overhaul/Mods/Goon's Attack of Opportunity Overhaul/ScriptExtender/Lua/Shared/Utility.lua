local U = {}

function U.IsGuid(value)
	if type(value) ~= "string" then
		return false
	end
	return value:match("^%x%x%x%x%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%x%x%x%x%x%x%x%x$") ~= nil
end

function U.GetEntity(raw)
	return Ext.Entity.Get(raw:sub(-36))
end

function U.GetDisplayName(uuid, fallback)
	local entity = U.GetEntity(uuid)
	if not entity then return fallback or uuid end
	if entity.CustomName then return entity.CustomName.Name end
	if entity.DisplayName then return entity.DisplayName.Name:Get() or fallback or uuid end
	return fallback or uuid
end

function U.ResolveDisplayName(handle, fallback)
	local translated = Ext.Loca.GetTranslatedString(handle, fallback)
	return (translated ~= "" and translated ~= handle) and translated or fallback
end

function U.Debug(...)
	if not (MCM and MCM.Get("Goon_CriticalMissAoO_Debug")) then return end
	print((Ext.IsServer() and "[S Goon AoO] " or "[C Goon AoO] ") .. string.format(...))
end

return U
