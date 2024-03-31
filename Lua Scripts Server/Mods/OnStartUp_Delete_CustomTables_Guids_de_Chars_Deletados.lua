
local function OnStartUpDeleteEntriesOfCustomTablesFromDeletedCharacters()
	local delayedDeleteDeletedCharsEntriesFromCustomTablesOnStartUp = function()
		local custom_tables = 
		{
			{name = "custom_save_talents_glyphs", column = "guid"},
			{name = "custom_save_talents", column = "guid"},
			{name = "custom_save_talents_actionbar", column = "guid"},
			{name = "custom_transmogrification", column = "Owner"},
			{name = "custom_transmogrification_sets", column = "Owner"},
			{name = "custom_unlocked_appearances", column = "account_id"}, -- atualmente deleta guids do character, mas se nao mudar na config, vai mudar guids da conta toda
			{name = "custom_druid_form_display", column = "player_guid"},
			{name = "custom_racialshift", column = "guid"},
			{name = "custom_bonusxp", column = "guid"},
			{name = "custom_character_warmode", column = "guid"},
		}
		for _, table_info in ipairs(custom_tables) do
			local query = CharDBQuery("SELECT " .. table_info.column .. " FROM " .. table_info.name)
			if query then
				repeat
					local charentry = query:GetUInt32(0)

					local characterExistsQuery = CharDBQuery("SELECT guid FROM characters WHERE guid = " .. charentry)
					if not characterExistsQuery then
						CharDBExecute("DELETE FROM " .. table_info.name .. " WHERE " .. table_info.column .. " = " .. charentry)
						print("O registro do personagem id " .. charentry .. " foi removido da tabela " .. table_info.name .. " por que o personagem nao existe mais.")
					end
				until not query:NextRow()
			end
		end
	end
    CreateLuaEvent(delayedDeleteDeletedCharsEntriesFromCustomTablesOnStartUp, 6000, 1)
end


RegisterServerEvent(14, OnStartUpDeleteEntriesOfCustomTablesFromDeletedCharacters)




--[[
local function OnStartUpDeleteEntriesOfCustomTablesFromRecentlyDeletedCharacters()
    local query = CharDBQuery("SELECT guid FROM characters WHERE deleteInfos_name IS NOT NULL")
    if query then
        repeat
            local charentry = query:GetUInt32(0)
            CharDBExecute("DELETE FROM custom_save_talents_glyphs WHERE guid = " .. charentry)
            CharDBExecute("DELETE FROM custom_save_talents WHERE guid = " .. charentry)
            CharDBExecute("DELETE FROM custom_save_talents_buildname WHERE guid = " .. charentry)
			CharDBExecute("DELETE FROM custom_transmogrification WHERE Owner = " .. charentry)
			CharDBExecute("DELETE FROM custom_transmogrification_sets WHERE Owner = " .. charentry)
			CharDBExecute("DELETE FROM custom_unlocked_appearances WHERE account_id = " .. charentry)
			CharDBExecute("DELETE FROM custom_druid_form_display WHERE player_guid = " .. charentry)
			CharDBExecute("DELETE FROM custom_racialshift WHERE guid = " .. charentry)
			CharDBExecute("DELETE FROM custom_bonusxp WHERE guid = " .. charentry)
			CharDBExecute("DELETE FROM custom_character_warmode WHERE guid = " .. charentry)
			
            print("Os registros do personagem " .. charentry .. " foram removidos das tabelas customs.")
        until not query:NextRow()
    end
end


RegisterServerEvent(14, OnStartUpDeleteEntriesOfCustomTablesFromRecentlyDeletedCharacters)
--]]