local s=string.match;local F=string.gsub;local d=pairs;local n=ipairs;local h=_G;local r;local i;local l;local f=false;local u={};local I={{command="^ACTIONBUTTON(%d+)$",attributes={{"type","macro"},{"actionbutton","%1"}}},{command="^MULTIACTIONBAR1BUTTON(%d+)$",attributes={{"type","click"},{"clickbutton","MultiBarBottomLeftButton%1"}}},{command="^MULTIACTIONBAR2BUTTON(%d+)$",attributes={{"type","click"},{"clickbutton","MultiBarBottomRightButton%1"}}},{command="^MULTIACTIONBAR3BUTTON(%d+)$",attributes={{"type","click"},{"clickbutton","MultiBarRightButton%1"}}},{command="^MULTIACTIONBAR4BUTTON(%d+)$",attributes={{"type","click"},{"clickbutton","MultiBarLeftButton%1"}}},{command="^SHAPESHIFTBUTTON(%d+)$",attributes={{"type","click"},{"clickbutton","ShapeshiftButton%1"}}},{command="^BONUSACTIONBUTTON(%d+)$",attributes={{"type","click"},{"clickbutton","PetActionButton%1"}}},{command="^MULTICASTSUMMONBUTTON(%d+)$",attributes={{"type","click"},{"multicastsummon","%1"}}},{command="^MULTICASTRECALLBUTTON1$",attributes={{"type","click"},{"clickbutton","MultiCastRecallSpellButton"}}},{command="^CLICK (.+):([^:]+)$",attributes={{"type","click"},{"clickbutton","%1"}}},{command="^MACRO (.+)$",attributes={{"type","macro"},{"macro","%1"}}},{command="^SPELL (.+)$",attributes={{"type","spell"},{"spell","%1"}}},{command="^ITEM (.+)$",attributes={{"type","item"},{"item","%1"}}},};local c=true;local o=CreateFrame("Frame");local m={["actionbar"]=true,["action"]=true,["pet"]=true,["multispell"]=true,["spell"]=true,["item"]=true,["macro"]=true,["cancelaura"]=true,["stop"]=true,["target"]=true,["focus"]=true,["assist"]=true,["maintank"]=true,["mainassist"]=true};local b=SnowfallKeyPress.settings.keys;local T=SnowfallKeyPress.settings.modifiers;local B={};local function S(e,o,t,n)local r=t[o];if(not r)then
table.insert(n,e);return;end
local o=o+1;S(e,o,t,n);S(e..r.."-",o,t,n);end
S("",1,T,B);local function a(n,o)local e,t;e=string.gsub(n,"^.*%-(.+)","%1",1);t=string.gsub(o,"^.*%-(.+)","%1",1);if(e<t)then
return true;elseif(e>t)then
return false;end
e=string.match(n,"ALT%-");t=string.match(o,"ALT%-");if(not e and t)then
return true;elseif(e and not t)then
return false;end
e=string.match(n,"CTRL%-");t=string.match(o,"CTRL%-");if(not e and t)then
return true;elseif(e and not t)then
return false;end
e=string.match(n,"SHIFT%-");t=string.match(o,"SHIFT%-");if(not e and t)then
return true;elseif(e and not t)then
return false;end
return nil;end
local function t(o)i[o]=true;local t,e;e=0;for n,r in n(r)do
t=a(o,r);if(t==nil)then
return nil;elseif(t==true)then
break;end
e=n;end
e=e+1;table.insert(r,e,o);return e;end
local function A(e)i[e]=nil;for t,n in n(r)do
if(e==n)then
table.remove(r,t);return t;end
end
return false;end
local a;local function p()wipe(i);wipe(r);for o,e in n(b)do
if(s(e,"-."))then
t(s(e,"^-?(.*)$"));else
for o,n in n(B)do
t(n..e);end
end
end
end
local e=CreateFrame("Frame",nil,UIParent);e:SetWidth(420);e:SetHeight(310);e:SetPoint("TOPLEFT",200,-200);e:SetBackdrop({edgeFile="Interface\\Tooltips\\UI-Tooltip-Border",edgeSize=16,insets={left=4,right=4,top=4,bottom=4},});e:Hide();e.name="SnowfallKeyPress";e.title=e:CreateFontString(nil,"ARTWORK","GameFontNormalLarge");e.title:SetPoint("TOPLEFT",16,-16);e.title:SetPoint("RIGHT");e.title:SetText(e.name);e.title:SetJustifyH("LEFT");local b;do
local e=1;local t={"Sound\\Spells\\bloodlust_player_cast_head.wav","Sound\\Creature\\Doomwalker\\GRULLAIR_Doom_Over02.wav",};function b()if(SnowfallKeyPressSV.enable)then
PlaySoundFile(t[e]);e=(e%#t)+1;end
end
end
local B={};S("",1,T,B);local function S(o,e)if(e=="UNKNOWN"or e=="LSHIFT"or e=="RSHIFT"or e=="LCTRL"or e=="RCTRL"or e=="LALT"or e=="RALT")then
return;end
if(e=="LeftButton")then
e="BUTTON1"elseif(e=="RightButton")then
e="BUTTON2"elseif(e=="MiddleButton")then
e="BUTTON3"else
e=string.gsub(e,"^Button(%d+)$","BUTTON%1");end
local o;for o,n in n(B)do
t(n..e);end
a();l();end
local function T(n,e)if(e=="UNKNOWN"or e=="LSHIFT"or e=="RSHIFT"or e=="LCTRL"or e=="RCTRL"or e=="LALT"or e=="RALT")then
return;end
if(e=="LeftButton")then
e="BUTTON1"elseif(e=="RightButton")then
e="BUTTON2"elseif(e=="MiddleButton")then
e="BUTTON3"else
e=string.gsub(e,"^Button(%d+)$","BUTTON%1");end
if(IsShiftKeyDown())then
e="SHIFT-"..e;end
if(IsControlKeyDown())then
e="CTRL-"..e;end
if(IsAltKeyDown())then
e="ALT-"..e;end
t(e);a();l();end
local function O(t,e)if(e=="UNKNOWN"or e=="LSHIFT"or e=="RSHIFT"or e=="LCTRL"or e=="RCTRL"or e=="LALT"or e=="RALT")then
return;end
if(e=="LeftButton")then
e="BUTTON1"elseif(e=="RightButton")then
e="BUTTON2"elseif(e=="MiddleButton")then
e="BUTTON3"else
e=string.gsub(e,"^Button(%d+)$","BUTTON%1");end
local t;for n,t in n(B)do
A(t..e);end
a();l();end
local function B(n,t)if(t=="UNKNOWN"or t=="LSHIFT"or t=="RSHIFT"or t=="LCTRL"or t=="RCTRL"or t=="LALT"or t=="RALT")then
return;end
if(t=="LeftButton")then
t="BUTTON1"elseif(t=="RightButton")then
t="BUTTON2"elseif(t=="MiddleButton")then
t="BUTTON3"else
t=string.gsub(t,"^Button(%d+)$","BUTTON%1");end
if(IsShiftKeyDown())then
t="SHIFT-"..t;end
if(IsControlKeyDown())then
t="CTRL-"..t;end
if(IsAltKeyDown())then
t="ALT-"..t;end
A(t);a();l();end
e.addAllButton=CreateFrame("Button",nil,e,"UIPanelButtonTemplate");e.addAllButton:SetWidth(130);e.addAllButton:SetHeight(44);e.addAllButton:SetPoint("TOPLEFT",16,-42);e.addAllButton:SetText("+\n("..MODIFIERS_COLON.." "..ALL..")");e.addAllButton:SetFrameStrata("DIALOG");e.addAllButton:SetScript("OnEnter",function(e)e:EnableKeyboard(true);end);e.addAllButton:SetScript("OnLeave",function(e)e:EnableKeyboard(false);end);e.addAllButton:SetScript("OnKeyDown",S);e.addAllButton:SetScript("OnClick",S);e.addAllButton:RegisterForClicks("AnyUp");e.addButton=CreateFrame("Button",nil,e,"UIPanelButtonTemplate");e.addButton:SetWidth(65);e.addButton:SetHeight(22);e.addButton:SetPoint("TOPLEFT",e.addAllButton,"BOTTOMLEFT",0,0);e.addButton:SetText("+");e.addButton:SetFrameStrata("DIALOG");e.addButton:SetScript("OnEnter",function(e)e:EnableKeyboard(true);end);e.addButton:SetScript("OnLeave",function(e)e:EnableKeyboard(false);end);e.addButton:SetScript("OnKeyDown",T);e.addButton:SetScript("OnClick",T);e.addButton:RegisterForClicks("AnyUp");e.subButton=CreateFrame("Button",nil,e,"UIPanelButtonTemplate");e.subButton:SetWidth(65);e.subButton:SetHeight(22);e.subButton:SetPoint("TOPLEFT",e.addButton,"TOPRIGHT",0,0);e.subButton:SetText("-");e.subButton:SetFrameStrata("DIALOG");e.subButton:SetScript("OnEnter",function(e)e:EnableKeyboard(true);end);e.subButton:SetScript("OnLeave",function(e)e:EnableKeyboard(false);end);e.subButton:SetScript("OnKeyDown",B);e.subButton:SetScript("OnClick",B);e.subButton:RegisterForClicks("AnyUp");e.subAllButton=CreateFrame("Button",nil,e,"UIPanelButtonTemplate");e.subAllButton:SetWidth(130);e.subAllButton:SetHeight(44);e.subAllButton:SetPoint("TOPRIGHT",e.subButton,"BOTTOMRIGHT",0,0);e.subAllButton:SetText("-\n("..MODIFIERS_COLON.." "..ALL..")");e.subAllButton:SetFrameStrata("DIALOG");e.subAllButton:SetScript("OnEnter",function(e)e:EnableKeyboard(true);end);e.subAllButton:SetScript("OnLeave",function(e)e:EnableKeyboard(false);end);e.subAllButton:SetScript("OnKeyDown",O);e.subAllButton:SetScript("OnClick",O);e.subAllButton:RegisterForClicks("AnyUp");e.clearAllButton=CreateFrame("Button",nil,e,"UIPanelButtonTemplate");e.clearAllButton:SetWidth(130);e.clearAllButton:SetHeight(22);e.clearAllButton:SetPoint("TOPLEFT",e.addAllButton,"TOPRIGHT",40,0);e.clearAllButton:SetText(CLEAR_ALL);e.clearAllButton:SetScript("OnClick",function()wipe(i);wipe(r);a();l();end);e.resetDefaultButton=CreateFrame("Button",nil,e,"UIPanelButtonTemplate");e.resetDefaultButton:SetWidth(130);e.resetDefaultButton:SetHeight(22);e.resetDefaultButton:SetPoint("TOPRIGHT",e.clearAllButton,"BOTTOMRIGHT",0,0);e.resetDefaultButton:SetText(RESET_TO_DEFAULT);e.resetDefaultButton:SetScript("OnClick",function()p();a();l();end);e.animationButton=CreateFrame("CheckButton","SnowfallKeyPress_configFrameAnimationButton",e,"UICheckButtonTemplate");e.animationButton:SetWidth(22);e.animationButton:SetHeight(22);e.animationButton:SetPoint("TOPLEFT",e.resetDefaultButton,"BOTTOMLEFT",0,-10);SnowfallKeyPress_configFrameAnimationButtonText:SetText(ANIMATION);e.animationButton:SetScript("OnClick",function(e)if(e:GetChecked())then SnowfallKeyPressSV.animation=true;else SnowfallKeyPressSV.animation=false;end end);e.enableButton=CreateFrame("CheckButton","SnowfallKeyPress_configFrameEnableButton",e,"UICheckButtonTemplate");e.enableButton:SetWidth(22);e.enableButton:SetHeight(22);e.enableButton:SetPoint("TOPLEFT",e.resetDefaultButton,"BOTTOMLEFT",0,-40);SnowfallKeyPress_configFrameEnableButtonText:SetText(ENABLE);e.enableButton:SetScript("OnClick",function(e)if(e:GetChecked())then SnowfallKeyPressSV.enable=true;o:RegisterEvent("UPDATE_BINDINGS");l();b();else SnowfallKeyPressSV.enable=false;l();end end);e.keyFrame=CreateFrame("Frame",nil,e);e.keyFrame:SetWidth(322);e.keyFrame:SetHeight(16*16+12);e.keyFrame:SetPoint("TOPLEFT",16,-155);e.keyFrame:SetBackdrop({bgFile="Interface\\BUTTONS\\WHITE8X8.BLP",edgeFile="Interface\\DialogFrame\\UI-DialogBox-Border",edgeSize=16,insets={left=4,right=4,top=4,bottom=4},});e.keyFrame:SetBackdropColor(0,0,0,0);local S=16;e.keyRows={};for t=1,16 do
e.keyRows[t]=e:CreateFontString(nil,"ARTWORK","NumberFontNormalSmall");e.keyRows[t]:SetWidth(314);e.keyRows[t]:SetHeight(16);e.keyRows[t]:SetPoint("TOPLEFT",16,-146-16*t);e.keyRows[t]:SetJustifyH("RIGHT");e.keyRows[t]:SetText(t);end
function a()FauxScrollFrame_Update(e.scrollBar,#r,S,16);local n=FauxScrollFrame_GetOffset(e.scrollBar);for t=1,16 do
e.keyRows[t]:SetText(r[n+t]);end
end
e.scrollBar=CreateFrame("ScrollFrame","SnowfallKeyPress_configFrameScrollBar",e,"FauxScrollFrameTemplate");e.scrollBar:SetWidth(316);e.scrollBar:SetHeight(16*16);e.scrollBar:SetPoint("TOPLEFT",16,-162);e.scrollBar:SetScript("OnVerticalScroll",function(e,t)FauxScrollFrame_OnVerticalScroll(e,t,16,a);end);e.scrollBarTextureTop=e.scrollBar:CreateTexture();e.scrollBarTextureTop:SetTexture("Interface\\PaperDollInfoFrame\\UI-Character-ScrollBar");e.scrollBarTextureTop:SetWidth(31);e.scrollBarTextureTop:SetHeight(256);e.scrollBarTextureTop:SetPoint("TOPLEFT",e.scrollBar,"TOPRIGHT",-2,5);e.scrollBarTextureTop:SetTexCoord(0,.484375,0,1);e.scrollBarTextureBottom=e.scrollBar:CreateTexture();e.scrollBarTextureBottom:SetTexture("Interface\\PaperDollInfoFrame\\UI-Character-ScrollBar");e.scrollBarTextureBottom:SetWidth(31);e.scrollBarTextureBottom:SetHeight(106);e.scrollBarTextureBottom:SetPoint("BOTTOMLEFT",e.scrollBar,"BOTTOMRIGHT",-2,-2);e.scrollBarTextureBottom:SetTexCoord(.515625,1,0,.4140625);hooksecurefunc("ShowUIPanel",function()if(KeyBindingFrame)then KeyBindingFrame.mode=nil;end end);local A;local S;do
local t={};local n=0;function A()local e;if(#t>0)then
e=table.remove(t);else
n=n+1;e=CreateFrame("Button","SnowfallKeyPress_Button_"..tostring(n),nil,"SecureActionButtonTemplate");e:RegisterForClicks("AnyDown");SecureHandlerSetFrameRef(e,"VehicleMenuBar",VehicleMenuBar);SecureHandlerSetFrameRef(e,"BonusActionBarFrame",BonusActionBarFrame);SecureHandlerSetFrameRef(e,"MultiCastSummonSpellButton",MultiCastSummonSpellButton);SecureHandlerExecute(e,[[
          VehicleMenuBar = self:GetFrameRef("VehicleMenuBar");
          BonusActionBarFrame = self:GetFrameRef("BonusActionBarFrame");
          MultiCastSummonSpellButton = self:GetFrameRef("MultiCastSummonSpellButton");
        ]]);end
return e;end
function S(e)if(e)then
table.insert(t,e);end
end
end
local function C(e)return not not(type(e)=="table"and type(e.IsObjectType)=="function"and issecurevariable(e,"IsObjectType")and e:IsObjectType("Button")and select(2,e:IsProtected()));end
local T;do
local u=5;local i={};do
local a,t,e,o,d,l,r,n;for u=1,u do
a=CreateFrame("Frame");t=a:CreateTexture();t:SetTexture([[Interface\Cooldown\star4]]);t:SetAlpha(0);t:SetAllPoints();t:SetBlendMode("ADD");e=t:CreateAnimationGroup();o=e:CreateAnimation("Alpha");o:SetChange(1);o:SetDuration(0);o:SetOrder(1);l=e:CreateAnimation("Scale");l:SetScale(2,2);l:SetDuration(0);l:SetOrder(1);r=e:CreateAnimation("Scale");r:SetScale(0,0);r:SetDuration(.2);r:SetOrder(2);n=e:CreateAnimation("Rotation");n:SetDegrees(90);n:SetDuration(.2);n:SetOrder(2);i[u]={frame=a,animationGroup=e};end
end
do
local t=1;function T(e)if(not SnowfallKeyPressSV.animation)then
return;end
local e=e.clickButtonName;if(not e)then
return;end
local e=h[e];if(not e or not e:IsVisible())then
return;end
local o=i[t];local n=o.frame;local o=o.animationGroup;n:SetFrameStrata(e:GetFrameStrata());n:SetFrameLevel(e:GetFrameLevel()+10);n:SetAllPoints(e);o:Stop();o:Play();t=(t%u)+1;end
end
end
local function B(L,p,b,S,i)local e;local a,t;local l,f,O;local d,u,c;local B,r;i.override=nil;SetOverrideBinding(o,false,b,nil);for I,o in n(I)do
if(s(S,o.command))then
if(o.attributes)then
B,l=s(S,"^CLICK (.+):([^:]+)$");if(B)then
r=h[B];if(not C(r)or r:GetAttribute("","downbutton",l))then
return;end
f=SecureButton_GetModifiedAttribute(r,"harmbutton",l);O=SecureButton_GetModifiedAttribute(r,"helpbutton",l);d=SecureButton_GetModifiedAttribute(r,"type",l);u=SecureButton_GetModifiedAttribute(r,"type",f);c=SecureButton_GetModifiedAttribute(r,"type",O);if(d and not m[d]or u and not m[u]or c and not m[c])then
return;end
else
l="LeftButton";end
e=i.button;if(not e)then
e=A();i.button=e;end
SecureHandlerUnwrapScript(e,"OnClick");for r,n in n(o.attributes)do
a=n[1];t=F(S,o.command,n[2],1);if(a=="clickbutton")then
e:SetAttribute(a,h[t]);e.clickButtonName=t;e:SetScript("PostClick",T);elseif(a=="actionbutton")then
SecureHandlerWrapScript(e,"OnClick",e,[[
                if (VehicleMenuBar:IsProtected() and VehicleMenuBar:IsShown() and ]]..tostring(tonumber(t)<=VEHICLE_MAX_ACTIONBUTTONS)..[[) then
                  self:SetAttribute("macrotext", "/click VehicleMenuBarActionButton]]..t..[[");
                elseif (BonusActionBarFrame:IsProtected() and BonusActionBarFrame:IsShown()) then
                  self:SetAttribute("macrotext", "/click BonusActionButton]]..t..[[");
                else
                  self:SetAttribute("macrotext", "/click ActionButton]]..t..[[");
                end
              ]]);e:SetScript("PostClick",function(e)e.clickButtonName=string.sub(e:GetAttribute("macrotext"),8);T(e);end);elseif(a=="multicastsummon")then
SecureHandlerWrapScript(e,"OnClick",e,[[
                lastID = MultiCastSummonSpellButton:GetID();
                MultiCastSummonSpellButton:SetID(]]..t..[[);
              ]],[[
                MultiCastSummonSpellButton:SetID(lastID);
              ]]);e:SetAttribute("clickbutton",MultiCastSummonSpellButton);e.clickButtonName="MultiCastSummonSpellButton";else
e:SetAttribute(a,t);end
end
i.override="CLICK "..e:GetName()..":"..l;SetOverrideBinding(L,p,b,i.override);end
return;end
end
end
function l()if(InCombatLockdown())then
return;end
c=false;if(not SnowfallKeyPressSV.enable)then
o:UnregisterEvent("UPDATE_BINDINGS");ClearOverrideBindings(o);for t,e in d(u)do
for n,e in n(e.normals)do
SetOverrideBinding(e.owner,false,t,e.command);end
for n,e in n(e.prioritys)do
SetOverrideBinding(e.owner,true,t,e.command);end
end
c=true;f=true;return;end
boundKeyColor=not boundKeyColor;local r,e;for t in d(i)do
r=GetBindingAction(t);if(r)then
e=u[t];if(not e)then
e={normals={},prioritys={}};u[t]=e;end
e.color=boundKeyColor;e.command=r;B(o,false,t,r,e);if(e.override)then
for n,e in n(e.normals)do
SetOverrideBinding(e.owner,false,t,e.override);end
end
end
end
for t,e in d(u)do
if(e.command and e.color~=boundKeyColor)then
e.command=nil;if(e.override)then
e.override=nil;SetOverrideBinding(o,false,t,nil);end
end
end
if(f)then
f=false;for t,o in d(u)do
for n,e in n(o.normals)do
if(e.override)then
SetOverrideBinding(e.owner,false,t,e.override);else
B(e.owner,false,t,e.command,e);end
end
for n,e in n(o.prioritys)do
if(e.override)then
SetOverrideBinding(e.owner,true,t,e.override);else
B(e.owner,true,t,e.command,e);end
end
end
end
c=true;end
local function T(t,e)local n;for n,o in d(e.normals)do
if(o.owner==t)then
return table.remove(e.normals,n);end
end
for n,o in d(e.prioritys)do
if(o.owner==t)then
return table.remove(e.prioritys,n);end
end
end
local function s(o,l,n,r)if(not c)then
return;end
local e=u[n];if(not e)then
e={normals={},prioritys={}};u[n]=e;end
if(not r)then
local e=T(o,e);if(e)then
S(e.button);end
return;end
local t=T(o,e)or{owner=o};t.command=r;t.override=nil;if(i[n]and SnowfallKeyPressSV.enable)then
if(InCombatLockdown())then
f=true;else
c=false;B(o,l,n,r,t);c=true;end
end
if(l)then
table.insert(e.prioritys,t);else
table.insert(e.normals,t);end
end
local function T(t,r,o,n,e)if(not e)then
e="LeftButton";end
s(t,r,o,"CLICK "..n..":"..e);end
local function f(o,n,e,t)s(o,n,e,"SPELL "..t);end
local function t(e,n,t,o)s(e,n,t,"ITEM "..o);end
local function B(e,o,n,t)s(e,o,n,"MACRO "..t);end
hooksecurefunc("SetOverrideBinding",s);hooksecurefunc("SetOverrideBindingClick",T);hooksecurefunc("SetOverrideBindingSpell",f);hooksecurefunc("SetOverrideBindingItem",t);hooksecurefunc("SetOverrideBindingMacro",B);local function s(o)if(not c)then
return;end
local e;for n,t in d(u)do
for n=#t.normals,1,-1 do
e=t.normals[n];if(e.owner==o)then
S(e.button);table.remove(t.normals,n);end
end
for n=#t.prioritys,1,-1 do
e=t.prioritys[n];if(e.owner==o)then
S(e.button);table.remove(t.prioritys,n);end
end
end
end
hooksecurefunc("ClearOverrideBindings",s);local function t()if(not SnowfallKeyPressSV)then
SnowfallKeyPressSV={keys={},animation=true,enable=true};end
r=SnowfallKeyPressSV.keys;i={};for n,t in n(r)do
i[t]=true;end
e.enableButton:SetChecked(SnowfallKeyPressSV.enable);e.animationButton:SetChecked(SnowfallKeyPressSV.animation);if(#r==0)then
p();end
a();InterfaceOptions_AddCategory(e);o:UnregisterAllEvents();o:SetScript("OnEvent",l);o:RegisterEvent("UPDATE_BINDINGS");end
o:SetScript("OnEvent",t);o:RegisterEvent("ADDON_LOADED");