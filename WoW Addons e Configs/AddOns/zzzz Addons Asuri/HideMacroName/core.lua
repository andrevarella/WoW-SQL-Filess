local r={"MultiBarBottomLeft", "MultiBarBottomRight", "Action", "MultiBarLeft", "MultiBarRight"}for b=1,#r do for i=1,12 do _G[r[b].."Button"..i.."Name"]:SetAlpha(0)end end

SLASH_HideMacroName1 = "/hmn";
SlashCmdList["HideMacroName"] = function() 
   local r={"MultiBarBottomLeft", "MultiBarBottomRight", "Action", "MultiBarLeft", "MultiBarRight"}for b=1,#r do for i=1,12 do _G[r[b].."Button"..i.."Name"]:SetAlpha(0)end end; 
end

SLASH_ShowMacroName1 = "/smn";
SlashCmdList["ShowMacroName"] = function() 
   local r={"MultiBarBottomLeft", "MultiBarBottomRight", "Action", "MultiBarLeft", "MultiBarRight"}for b=1,#r do for i=1,12 do _G[r[b].."Button"..i.."Name"]:SetAlpha(1)end end; 
end
