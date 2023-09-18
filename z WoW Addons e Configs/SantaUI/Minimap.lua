-- Clean it up
MinimapCluster:SetScale(0.85)
MinimapCluster:SetPoint("TOPRIGHT", "UIParent", "TOPRIGHT", -5, 5)
MinimapZoomIn:Hide()
MinimapZoomOut:Hide()
MiniMapWorldMapButton:Hide()
MinimapZoneTextButton:Hide()
MinimapBorderTop:Hide()

-- Minimap scrolling (Credit: Thek)
Minimap:EnableMouseWheel(true)
Minimap:SetScript("OnMouseWheel", function() 
    if ( arg1 > 0 and Minimap:GetZoom() < 5 ) then 
	Minimap:SetZoom(Minimap:GetZoom() + 1 )
    elseif ( arg1 < 0 and Minimap:GetZoom() > 0 ) then 
	Minimap:SetZoom(Minimap:GetZoom() - 1 ) 
    end
end)