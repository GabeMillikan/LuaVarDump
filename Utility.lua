local Util = {}

function Util:print(tab, tables, depth, outputString)
	if type(tab) ~= "table" then print(tab) return end
	
	tables = tables or {}
	depth = depth or 0
	outputString = outputString or ""
	if tables[tab] then
		return outputString .. " -- repitition of " .. tostring(tab)
	end
	tables[tab] = true
	
	outputString = outputString .. string.rep("    ", depth) .. "{ -- " .. tostring(tab) .. "\n"
	for key, value in pairs(tab) do
		outputString = outputString .. string.rep("    ", depth + 1) .. tostring(key) .. " = "
		if type(value) == "table" then
			outputString = self:print(value, tables, depth + 1, outputString)
		elseif type(value) == "string" then
			outputString = outputString .. '"' .. value .. '"'
		else
			outputString = outputString .. tostring(value)
		end
		outputString = outputString .. "\n"
	end
	outputString = outputString .. string.rep("  ", depth) .. "}"
	
	if depth > 0 then
		return outputString
	else
		print(outputString)
	end
end

return Util
