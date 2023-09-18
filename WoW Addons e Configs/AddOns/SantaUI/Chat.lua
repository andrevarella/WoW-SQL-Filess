-- Show/hide chat menu on mouse over
local enableMouseOver = function(frame)
	local show = function()
		frame:SetAlpha(1)
	end

	local hide = function()
		frame:SetAlpha(0)
	end
	
	frame:EnableMouse(true)
	frame:HookScript("OnEnter", show)
	frame:HookScript("OnLeave", hide)
	hide()
end

enableMouseOver(FriendsMicroButton)
enableMouseOver(ChatFrameMenuButton)
enableMouseOver(ChatFrame1ButtonFrameBottomButton)
enableMouseOver(ChatFrame2ButtonFrameBottomButton)
enableMouseOver(ChatFrame3ButtonFrameBottomButton)
enableMouseOver(ChatFrame1ButtonFrameDownButton)
enableMouseOver(ChatFrame2ButtonFrameDownButton)
enableMouseOver(ChatFrame3ButtonFrameDownButton)
enableMouseOver(ChatFrame1ButtonFrameUpButton)
enableMouseOver(ChatFrame2ButtonFrameUpButton)
enableMouseOver(ChatFrame3ButtonFrameUpButton)

-- Hide background texture
for i = 1, NUM_CHAT_WINDOWS do
	for j = 1, #CHAT_FRAME_TEXTURES do
		_G["ChatFrame"..i..CHAT_FRAME_TEXTURES[j]]:SetTexture(nil)
	end
end