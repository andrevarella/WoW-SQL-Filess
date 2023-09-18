Emoticons_Settings={
	["CHAT_MSG_OFFICER"]=true,		--1
	["CHAT_MSG_GUILD"]=true,		--2
	["CHAT_MSG_PARTY"]=true,		--3
	["CHAT_MSG_PARTY_LEADER"]=true,		--dont count, tie to 3
	["CHAT_MSG_PARTY_GUIDE"]=true,		--dont count, tie to 3
	["CHAT_MSG_RAID"]=true,			--4
	["CHAT_MSG_RAID_LEADER"]=true,		--dont count, tie to 4
	["CHAT_MSG_RAID_WARNING"]=true,		--dont count, tie to 4
	["CHAT_MSG_SAY"]=true,			--5
	["CHAT_MSG_YELL"]=true,			--6
	["CHAT_MSG_WHISPER"]=true,		--7
	["CHAT_MSG_WHISPER_INFORM"]=true,	--dont count, tie to 7
	["CHAT_MSG_CHANNEL"]=true,		--8
	["CHAT_MSG_BN_WHISPER"]=true,	--9
	["CHAT_MSG_BN_WHISPER_INFORM"]=true,--dont count, tie to 9
	["CHAT_MSG_BN_CONVERSATION"]=true,--10
	["CHAT_MSG_INSTANCE_CHAT"]=true,--11
	["CHAT_MSG_INSTANCE_CHAT_LEADER"]=true,--dont count, tie to 11
	["MAIL"]=true,					
	["TWITCHBUTTON"]=false,
	["sliderX"]=-35,
	["sliderY"]=0,
	["MinimapPos"] = 45,
	["MINIMAPBUTTON"] = false,
	["FAVEMOTES"] = {true,true,true,true,true,true,true,true,true,true,
					true,true,true,true,true,true,true,true,true,true,
					true,true,true,true,true,true,true,true,true,true,
					true,true,true,true,true,true}
	
};
Emoticons_Eyecandy = false;



local origsettings = {
	["CHAT_MSG_OFFICER"]=true,
	["CHAT_MSG_GUILD"]=true,
	["CHAT_MSG_PARTY"]=true,
	["CHAT_MSG_PARTY_LEADER"]=true,
	["CHAT_MSG_PARTY_GUIDE"]=true,
	["CHAT_MSG_RAID"]=true,
	["CHAT_MSG_RAID_LEADER"]=true,
	["CHAT_MSG_RAID_WARNING"]=true,
	["CHAT_MSG_SAY"]=true,
	["CHAT_MSG_YELL"]=true,
	["CHAT_MSG_WHISPER"]=true,
	["CHAT_MSG_WHISPER_INFORM"]=true,
	["CHAT_MSG_BN_WHISPER"]=true,
	["CHAT_MSG_BN_WHISPER_INFORM"]=true,
	["CHAT_MSG_BN_CONVERSATION"]=true,
	["CHAT_MSG_CHANNEL"]=true,
	["CHAT_MSG_INSTANCE_CHAT"]=true,
	["MAIL"]=true,
	["TWITCHBUTTON"]=true,
	["sliderX"]=-35,
	["sliderY"]=0,
	["MinimapPos"] = 45,
	["MINIMAPBUTTON"] = true,
	["FAVEMOTES"] = {true,true,true,true,true,true,true,true,true,true,
					true,true,true,true,true,true,true,true,true,true,
					true,true,true,true,true,true,true,true,true,true,
					true,true,true,true,true,true}
};

local defaultpack={
-- AdmiralBulldog
["admiral1"]="Interface\\AddOns\\TwitchEmotes\\AdmiralBulldog\\admiral1.tga:28:28",
["admiral2"]="Interface\\AddOns\\TwitchEmotes\\AdmiralBulldog\\admiral2.tga:28:28",
["admiral3"]="Interface\\AddOns\\TwitchEmotes\\AdmiralBulldog\\admiral3.tga:28:28",
["admiral4"]="Interface\\AddOns\\TwitchEmotes\\AdmiralBulldog\\admiral4.tga:28:28",
["admiral6"]="Interface\\AddOns\\TwitchEmotes\\AdmiralBulldog\\admiral6.tga:28:28",
["admiralAlfredo"]="Interface\\AddOns\\TwitchEmotes\\AdmiralBulldog\\admiralAlfredo.tga:28:28",
["admiralBackpack"]="Interface\\AddOns\\TwitchEmotes\\AdmiralBulldog\\admiralBackpack.tga:28:28",
["admiralBanana"]="Interface\\AddOns\\TwitchEmotes\\AdmiralBulldog\\admiralBanana.tga:28:28",
["admiralCS"]="Interface\\AddOns\\TwitchEmotes\\AdmiralBulldog\\admiralCS.tga:28:28",
["admiralDong"]="Interface\\AddOns\\TwitchEmotes\\AdmiralBulldog\\admiralDong.tga:28:28",
["admiralDream"]="Interface\\AddOns\\TwitchEmotes\\AdmiralBulldog\\admiralDream.tga:28:28",
["admiralFedora"]="Interface\\AddOns\\TwitchEmotes\\AdmiralBulldog\\admiralFedora.tga:28:28",
["admiralFeels"]="Interface\\AddOns\\TwitchEmotes\\AdmiralBulldog\\admiralFeels.tga:28:28",
["admiralGame"]="Interface\\AddOns\\TwitchEmotes\\AdmiralBulldog\\admiralGame.tga:28:28",
["admiralHappy"]="Interface\\AddOns\\TwitchEmotes\\AdmiralBulldog\\admiralHappy.tga:28:28",
["admiralHug"]="Interface\\AddOns\\TwitchEmotes\\AdmiralBulldog\\admiralHug.tga:28:28",
["admiralKristin"]="Interface\\AddOns\\TwitchEmotes\\AdmiralBulldog\\admiralKristin.tga:28:28",
["admiralNox"]="Interface\\AddOns\\TwitchEmotes\\AdmiralBulldog\\admiralNox.tga:28:28",
["admiralPleb"]="Interface\\AddOns\\TwitchEmotes\\AdmiralBulldog\\admiralPleb.tga:28:28",
["admiralRapira"]="Interface\\AddOns\\TwitchEmotes\\AdmiralBulldog\\admiralRapira.tga:28:28",
["admiralS4"]="Interface\\AddOns\\TwitchEmotes\\AdmiralBulldog\\admiralS4.tga:28:28",
["admiralSexy"]="Interface\\AddOns\\TwitchEmotes\\AdmiralBulldog\\admiralSexy.tga:28:28",
["admiralSkadoosh"]="Interface\\AddOns\\TwitchEmotes\\AdmiralBulldog\\admiralSkadoosh.tga:28:28",
["admiralTI"]="Interface\\AddOns\\TwitchEmotes\\AdmiralBulldog\\admiralTI.tga:28:28",
["admiralW"]="Interface\\AddOns\\TwitchEmotes\\AdmiralBulldog\\admiralW.tga:28:28",
-- Alkaizerx
["alkFax"]="Interface\\AddOns\\TwitchEmotes\\Alkaizerx\\alkFax.tga:28:28",
["alkGuku"]="Interface\\AddOns\\TwitchEmotes\\Alkaizerx\\alkGuku.tga:28:28",
["alkKayo"]="Interface\\AddOns\\TwitchEmotes\\Alkaizerx\\alkKayo.tga:28:28",
["alkKrill"]="Interface\\AddOns\\TwitchEmotes\\Alkaizerx\\alkKrill.tga:28:28",
["alkPeasemo"]="Interface\\AddOns\\TwitchEmotes\\Alkaizerx\\alkPeasemo.tga:28:28",
["alkPlastic"]="Interface\\AddOns\\TwitchEmotes\\Alkaizerx\\alkPlastic.tga:28:28",
["alkSuper"]="Interface\\AddOns\\TwitchEmotes\\Alkaizerx\\alkSuper.tga:28:28",
["alkUpset"]="Interface\\AddOns\\TwitchEmotes\\Alkaizerx\\alkUpset.tga:28:28",
["alkW1"]="Interface\\AddOns\\TwitchEmotes\\Alkaizerx\\alkW1.tga:28:28",
["alkW2"]="Interface\\AddOns\\TwitchEmotes\\Alkaizerx\\alkW2.tga:28:28",
["alkW3"]="Interface\\AddOns\\TwitchEmotes\\Alkaizerx\\alkW3.tga:28:28",
["alkW4"]="Interface\\AddOns\\TwitchEmotes\\Alkaizerx\\alkW4.tga:28:28",
["alkW5"]="Interface\\AddOns\\TwitchEmotes\\Alkaizerx\\alkW5.tga:28:28",
["alkW6"]="Interface\\AddOns\\TwitchEmotes\\Alkaizerx\\alkW6.tga:28:28",
["alkXD"]="Interface\\AddOns\\TwitchEmotes\\Alkaizerx\\alkXD.tga:28:28",
-- AndyMilonakis
["amiloAmazing"]="Interface\\AddOns\\TwitchEmotes\\AndyMilonakis\\amiloAmazing.tga:28:28",
["amiloAnnoyed"]="Interface\\AddOns\\TwitchEmotes\\AndyMilonakis\\amiloAnnoyed.tga:28:28",
["amiloBars"]="Interface\\AddOns\\TwitchEmotes\\AndyMilonakis\\amiloBars.tga:28:28",
["amiloCallers"]="Interface\\AddOns\\TwitchEmotes\\AndyMilonakis\\amiloCallers.tga:28:28",
["amiloCrackhead"]="Interface\\AddOns\\TwitchEmotes\\AndyMilonakis\\amiloCrackhead.tga:28:28",
["amiloDerp"]="Interface\\AddOns\\TwitchEmotes\\AndyMilonakis\\amiloDerp.tga:28:28",
["amiloFeels"]="Interface\\AddOns\\TwitchEmotes\\AndyMilonakis\\amiloFeels.tga:28:28",
["amiloGasm"]="Interface\\AddOns\\TwitchEmotes\\AndyMilonakis\\amiloGasm.tga:28:28",
["amiloGOAT"]="Interface\\AddOns\\TwitchEmotes\\AndyMilonakis\\amiloGOAT.tga:28:28",
["amiloHeyGuys"]="Interface\\AddOns\\TwitchEmotes\\AndyMilonakis\\amiloHeyGuys.tga:28:28",
["amiloIcedT"]="Interface\\AddOns\\TwitchEmotes\\AndyMilonakis\\amiloIcedT.tga:28:28",
["amiloLeaked"]="Interface\\AddOns\\TwitchEmotes\\AndyMilonakis\\amiloLeaked.tga:28:28",
["amiloLeech"]="Interface\\AddOns\\TwitchEmotes\\AndyMilonakis\\amiloLeech.tga:28:28",
["amiloLive"]="Interface\\AddOns\\TwitchEmotes\\AndyMilonakis\\amiloLive.tga:28:28",
["amiloLul"]="Interface\\AddOns\\TwitchEmotes\\AndyMilonakis\\amiloLul.tga:28:28",
["amiloMeow"]="Interface\\AddOns\\TwitchEmotes\\AndyMilonakis\\amiloMeow.tga:28:28",
["amiloPhoto"]="Interface\\AddOns\\TwitchEmotes\\AndyMilonakis\\amiloPhoto.tga:28:28",
["amiloRage"]="Interface\\AddOns\\TwitchEmotes\\AndyMilonakis\\amiloRage.tga:28:28",
["amiloRip"]="Interface\\AddOns\\TwitchEmotes\\AndyMilonakis\\amiloRip.tga:28:28",
["amiloRun"]="Interface\\AddOns\\TwitchEmotes\\AndyMilonakis\\amiloRun.tga:28:28",
["amiloSabaPride"]="Interface\\AddOns\\TwitchEmotes\\AndyMilonakis\\amiloSabaPride.tga:28:28",
["amiloSaved"]="Interface\\AddOns\\TwitchEmotes\\AndyMilonakis\\amiloSaved.tga:28:28",
["amiloStare"]="Interface\\AddOns\\TwitchEmotes\\AndyMilonakis\\amiloStare.tga:28:28",
["amiloTriheart"]="Interface\\AddOns\\TwitchEmotes\\AndyMilonakis\\amiloTriheart.tga:28:28",
["amiloWut"]="Interface\\AddOns\\TwitchEmotes\\AndyMilonakis\\amiloWut.tga:28:28",
-- AnneMunation
["anneHeart"]="Interface\\AddOns\\TwitchEmotes\\AnneMunation\\anneHeart.tga:28:28",
-- AvoidingThePuddle
["atpChar"]="Interface\\AddOns\\TwitchEmotes\\AvoidingThePuddle\\atpChar.tga:28:28",
["atpCop"]="Interface\\AddOns\\TwitchEmotes\\AvoidingThePuddle\\atpCop.tga:28:28",
["atpDog"]="Interface\\AddOns\\TwitchEmotes\\AvoidingThePuddle\\atpDog.tga:28:28",
["atpFeelsBeardMan"]="Interface\\AddOns\\TwitchEmotes\\AvoidingThePuddle\\atpFeelsBeardMan.tga:28:28",
["atpGasm"]="Interface\\AddOns\\TwitchEmotes\\AvoidingThePuddle\\atpGasm.tga:28:28",
["atpHorns"]="Interface\\AddOns\\TwitchEmotes\\AvoidingThePuddle\\atpHorns.tga:28:28",
["atpIzza"]="Interface\\AddOns\\TwitchEmotes\\AvoidingThePuddle\\atpIzza.tga:28:28",
["atpLaw"]="Interface\\AddOns\\TwitchEmotes\\AvoidingThePuddle\\atpLaw.tga:28:28",
["atpLook"]="Interface\\AddOns\\TwitchEmotes\\AvoidingThePuddle\\atpLook.tga:28:28",
["atpRtsd"]="Interface\\AddOns\\TwitchEmotes\\AvoidingThePuddle\\atpRtsd.tga:28:28",
["atpRtsd1"]="Interface\\AddOns\\TwitchEmotes\\AvoidingThePuddle\\atpRtsd1.tga:28:28",
["atpRtsd2"]="Interface\\AddOns\\TwitchEmotes\\AvoidingThePuddle\\atpRtsd2.tga:28:28",
["atpRtsd3"]="Interface\\AddOns\\TwitchEmotes\\AvoidingThePuddle\\atpRtsd3.tga:28:28",
["atpRtsd4"]="Interface\\AddOns\\TwitchEmotes\\AvoidingThePuddle\\atpRtsd4.tga:28:28",
["atpShh"]="Interface\\AddOns\\TwitchEmotes\\AvoidingThePuddle\\atpShh.tga:28:28",
["atp1000"]="Interface\\AddOns\\TwitchEmotes\\AvoidingThePuddle\\atp1000.tga:28:28",
["atpSolid"]="Interface\\AddOns\\TwitchEmotes\\AvoidingThePuddle\\atpSolid.tga:28:28",
["atpStude"]="Interface\\AddOns\\TwitchEmotes\\AvoidingThePuddle\\atpStude.tga:28:28",
["atpToiler"]="Interface\\AddOns\\TwitchEmotes\\AvoidingThePuddle\\atpToiler.tga:28:28",
["atpWind"]="Interface\\AddOns\\TwitchEmotes\\AvoidingThePuddle\\atpWind.tga:28:28",
-- BobRoss
["bobrossBeli"]="Interface\\AddOns\\TwitchEmotes\\BobRoss\\bobrossBeli.tga:28:28",
["bobrossBrush"]="Interface\\AddOns\\TwitchEmotes\\BobRoss\\bobrossBrush.tga:28:28",
["bobrossCabin"]="Interface\\AddOns\\TwitchEmotes\\BobRoss\\bobrossCabin.tga:28:28",
["bobrossCanvas"]="Interface\\AddOns\\TwitchEmotes\\BobRoss\\bobrossCanvas.tga:28:28",
["bobrossCanvasA"]="Interface\\AddOns\\TwitchEmotes\\BobRoss\\bobrossCanvasA.tga:28:28",
["bobrossCanvasB"]="Interface\\AddOns\\TwitchEmotes\\BobRoss\\bobrossCanvasB.tga:28:28",
["bobrossCanvasH"]="Interface\\AddOns\\TwitchEmotes\\BobRoss\\bobrossCanvasH.tga:28:28",
["bobrossCanvasP"]="Interface\\AddOns\\TwitchEmotes\\BobRoss\\bobrossCanvasP.tga:28:28",
["bobrossChamp"]="Interface\\AddOns\\TwitchEmotes\\BobRoss\\bobrossChamp.tga:28:28",
["bobrossCloud"]="Interface\\AddOns\\TwitchEmotes\\BobRoss\\bobrossCloud.tga:28:28",
["bobrossCool"]="Interface\\AddOns\\TwitchEmotes\\BobRoss\\bobrossCool.tga:28:28",
["bobrossEve"]="Interface\\AddOns\\TwitchEmotes\\BobRoss\\bobrossEve.tga:28:28",
["bobrossFan"]="Interface\\AddOns\\TwitchEmotes\\BobRoss\\bobrossFan.tga:28:28",
["bobrossFence"]="Interface\\AddOns\\TwitchEmotes\\BobRoss\\bobrossFence.tga:28:28",
["bobrossFree"]="Interface\\AddOns\\TwitchEmotes\\BobRoss\\bobrossFree.tga:28:28",
["bobrossGG"]="Interface\\AddOns\\TwitchEmotes\\BobRoss\\bobrossGG.tga:28:28",
["bobrossHappy"]="Interface\\AddOns\\TwitchEmotes\\BobRoss\\bobrossHappy.tga:28:28",
["bobrossKappaR"]="Interface\\AddOns\\TwitchEmotes\\BobRoss\\bobrossKappaR.tga:28:28",
["bobrossMeta"]="Interface\\AddOns\\TwitchEmotes\\BobRoss\\bobrossMeta.tga:28:28",
["bobrossMini"]="Interface\\AddOns\\TwitchEmotes\\BobRoss\\bobrossMini.tga:28:28",
["bobrossMnt"]="Interface\\AddOns\\TwitchEmotes\\BobRoss\\bobrossMnt.tga:28:28",
["bobrossNED"]="Interface\\AddOns\\TwitchEmotes\\BobRoss\\bobrossNED.tga:28:28",
["bobrossOPKnife"]="Interface\\AddOns\\TwitchEmotes\\BobRoss\\bobrossOPKnife.tga:28:28",
["bobrossPal"]="Interface\\AddOns\\TwitchEmotes\\BobRoss\\bobrossPal.tga:28:28",
["bobrossRUI"]="Interface\\AddOns\\TwitchEmotes\\BobRoss\\bobrossRUI.tga:28:28",
["bobrossSaved"]="Interface\\AddOns\\TwitchEmotes\\BobRoss\\bobrossSaved.tga:28:28",
["bobrossSq"]="Interface\\AddOns\\TwitchEmotes\\BobRoss\\bobrossSq.tga:28:28",
["bobrossTap"]="Interface\\AddOns\\TwitchEmotes\\BobRoss\\bobrossTap.tga:28:28",
["bobrossTree"]="Interface\\AddOns\\TwitchEmotes\\BobRoss\\bobrossTree.tga:28:28",
["bobrossVHS"]="Interface\\AddOns\\TwitchEmotes\\BobRoss\\bobrossVHS.tga:28:28",
-- BTTV+FFZ
["bUrself"]="Interface\\AddOns\\TwitchEmotes\\BTTV+FFZ\\bUrself.tga:28:28",
["CiGrip"]="Interface\\AddOns\\TwitchEmotes\\BTTV+FFZ\\CiGrip.tga:32:32",
["ConcernDoge"]="Interface\\AddOns\\TwitchEmotes\\BTTV+FFZ\\ConcernDoge.tga:28:28",
["DogeWitIt"]="Interface\\AddOns\\TwitchEmotes\\BTTV+FFZ\\DogeWitIt.tga:28:28",
["FapFapFap"]="Interface\\AddOns\\TwitchEmotes\\BTTV+FFZ\\FapFapFap.tga:28:28",
["FeelsAmazingMan"]="Interface\\AddOns\\TwitchEmotes\\BTTV+FFZ\\FeelsAmazingMan.tga:28:28",
["FeelsBadMan"]="Interface\\AddOns\\TwitchEmotes\\BTTV+FFZ\\FeelsBadMan.tga:28:28",
["FeelsBirthdayMan"]="Interface\\AddOns\\TwitchEmotes\\BTTV+FFZ\\FeelsBirthdayMan.tga:28:28",
["FeelsDutchMan"]="Interface\\AddOns\\TwitchEmotes\\BTTV+FFZ\\FeelsDutchMan.tga:28:28",
["FeelsGoodMan"]="Interface\\AddOns\\TwitchEmotes\\BTTV+FFZ\\FeelsGoodMan.tga:28:28",
["FeelsOkayMan"]="Interface\\AddOns\\TwitchEmotes\\BTTV+FFZ\\FeelsOkayMan.tga:28:28",
["FeelsPumpkinMan"]="Interface\\AddOns\\TwitchEmotes\\BTTV+FFZ\\FeelsPumpkinMan.tga:28:28",
["FeelsSnowMan"]="Interface\\AddOns\\TwitchEmotes\\BTTV+FFZ\\FeelsSnowMan.tga:28:28",
["FeelsSnowyMan"]="Interface\\AddOns\\TwitchEmotes\\BTTV+FFZ\\FeelsSnowyMan.tga:28:28",
["FeelsTired"]="Interface\\AddOns\\TwitchEmotes\\BTTV+FFZ\\FeelsTired.tga:28:28",
["FeelsWeirdMan"]="Interface\\AddOns\\TwitchEmotes\\BTTV+FFZ\\FeelsWeirdMan.tga:28:28",
["FishMoley"]="Interface\\AddOns\\TwitchEmotes\\BTTV+FFZ\\FishMoley.tga:28:56",
["ForeverAlone"]="Interface\\AddOns\\TwitchEmotes\\BTTV+FFZ\\ForeverAlone.tga:28:28",
["forsenC"]="Interface\\AddOns\\TwitchEmotes\\BTTV+FFZ\\forsenC.tga:28:28",
["FuckYea"]="Interface\\AddOns\\TwitchEmotes\\BTTV+FFZ\\FuckYea.tga:28:56",
["GabeN"]="Interface\\AddOns\\TwitchEmotes\\BTTV+FFZ\\GabeN.tga:28:28",
["gachiGASM"]="Interface\\AddOns\\TwitchEmotes\\BTTV+FFZ\\gachiGASM.tga:28:28",
["haHAA"]="Interface\\AddOns\\TwitchEmotes\\BTTV+FFZ\\haHAA.tga:28:28",
["HerbPerve"]="Interface\\AddOns\\TwitchEmotes\\BTTV+FFZ\\HerbPerve.tga:28:28",
["Hhhehehe"]="Interface\\AddOns\\TwitchEmotes\\BTTV+FFZ\\Hhhehehe.tga:28:28",
["Kaged"]="Interface\\AddOns\\TwitchEmotes\\BTTV+FFZ\\Kaged.tga:28:28",
["KKona"]="Interface\\AddOns\\TwitchEmotes\\BTTV+FFZ\\KKona.tga:32:32",
["Krappa"]="Interface\\AddOns\\TwitchEmotes\\BTTV+FFZ\\Krappa.tga:28:28",
["LUL"]="Interface\\AddOns\\TwitchEmotes\\BTTV+FFZ\\LUL.tga:28:28",
["LULW"]="Interface\\AddOns\\TwitchEmotes\\BTTV+FFZ\\LULW.tga:28:28",
["monkaS"]="Interface\\AddOns\\TwitchEmotes\\BTTV+FFZ\\monkaS.tga:28:28",
["MEGALUL"]="Interface\\AddOns\\TwitchEmotes\\BTTV+FFZ\\MEGALUL.tga:28:28",
["nanoMEGA"]="Interface\\AddOns\\TwitchEmotes\\BTTV+FFZ\\nanoMEGA.tga:28:28",
["OMEGALUL"]="Interface\\AddOns\\TwitchEmotes\\BTTV+FFZ\\OMEGALUL.tga:28:28",
["PagChomp"]="Interface\\AddOns\\TwitchEmotes\\BTTV+FFZ\\PagChomp.tga:28:28",
["VapeNation"]="Interface\\AddOns\\TwitchEmotes\\BTTV+FFZ\\VapeNation.tga:28:28",
["ZULUL"]="Interface\\AddOns\\TwitchEmotes\\BTTV+FFZ\\ZULUL.tga:28:28",
-- cdewx
["dewD"]="Interface\\AddOns\\TwitchEmotes\\cdewx\\dewD.tga:28:28",
["dewDitch"]="Interface\\AddOns\\TwitchEmotes\\cdewx\\dewDitch.tga:28:28",
["dewDogs"]="Interface\\AddOns\\TwitchEmotes\\cdewx\\dewDogs.tga:28:28",
["dewEnergy"]="Interface\\AddOns\\TwitchEmotes\\cdewx\\dewEnergy.tga:28:28",
["dewG"]="Interface\\AddOns\\TwitchEmotes\\cdewx\\dewG.tga:28:28",
["dewKass"]="Interface\\AddOns\\TwitchEmotes\\cdewx\\dewKass.tga:28:28",
["dewLove"]="Interface\\AddOns\\TwitchEmotes\\cdewx\\dewLove.tga:28:28",
["dewLUL"]="Interface\\AddOns\\TwitchEmotes\\cdewx\\dewLUL.tga:28:28",
["dewMethod"]="Interface\\AddOns\\TwitchEmotes\\cdewx\\dewMethod.tga:28:28",
["dewMLG"]="Interface\\AddOns\\TwitchEmotes\\cdewx\\dewMLG.tga:28:28",
["dewPleb"]="Interface\\AddOns\\TwitchEmotes\\cdewx\\dewPleb.tga:28:28",
["dewRage"]="Interface\\AddOns\\TwitchEmotes\\cdewx\\dewRage.tga:28:28",
["dewRise"]="Interface\\AddOns\\TwitchEmotes\\cdewx\\dewRise.tga:28:28",
["dewS"]="Interface\\AddOns\\TwitchEmotes\\cdewx\\dewS.tga:28:28",
["dewSell"]="Interface\\AddOns\\TwitchEmotes\\cdewx\\dewSell.tga:28:28",
["dewTrig"]="Interface\\AddOns\\TwitchEmotes\\cdewx\\dewTrig.tga:28:28",
["dewVod"]="Interface\\AddOns\\TwitchEmotes\\cdewx\\dewVod.tga:28:28",
["dewW"]="Interface\\AddOns\\TwitchEmotes\\cdewx\\dewW.tga:28:28",
["dewWhip"]="Interface\\AddOns\\TwitchEmotes\\cdewx\\dewWhip.tga:28:28",
["dewYo"]="Interface\\AddOns\\TwitchEmotes\\cdewx\\dewYo.tga:28:28",
-- Custom
["chupBro"]="Interface\\AddOns\\TwitchEmotes\\Custom\\chupBro.tga:28:28",
["chupDerp"]="Interface\\AddOns\\TwitchEmotes\\Custom\\chupDerp.tga:28:28",
["chupHappy"]="Interface\\AddOns\\TwitchEmotes\\Custom\\chupHappy.tga:28:28",
["dele"]="Interface\\AddOns\\TwitchEmotes\\Custom\\Dele.tga:28:28",
["dele,"]="Interface\\AddOns\\TwitchEmotes\\Custom\\Dele.tga:28:28",
["dele's"]="Interface\\AddOns\\TwitchEmotes\\Custom\\Dele.tga:28:28",
["Dele"]="Interface\\AddOns\\TwitchEmotes\\Custom\\Dele.tga:28:28",
["Dele,"]="Interface\\AddOns\\TwitchEmotes\\Custom\\Dele.tga:28:28",
["Dele's"]="Interface\\AddOns\\TwitchEmotes\\Custom\\Dele.tga:28:28",
["endANELE"]="Interface\\AddOns\\TwitchEmotes\\Custom\\endANELE.tga:28:28",
["endBomb"]="Interface\\AddOns\\TwitchEmotes\\Custom\\endBomb.tga:28:28",
["endCreep"]="Interface\\AddOns\\TwitchEmotes\\Custom\\endCreep.tga:28:28",
["endDawg"]="Interface\\AddOns\\TwitchEmotes\\Custom\\endDawg.tga:28:28",
["endFrench"]="Interface\\AddOns\\TwitchEmotes\\Custom\\endFrench.tga:28:28",
["endHarambe"]="Interface\\AddOns\\TwitchEmotes\\Custom\\endHarambe.tga:28:28",
["endKyori"]="Interface\\AddOns\\TwitchEmotes\\Custom\\endKyori.tga:28:28",
["endNotLikeThis"]="Interface\\AddOns\\TwitchEmotes\\Custom\\endNotLikeThis.tga:28:28",
["endReee"]="Interface\\AddOns\\TwitchEmotes\\Custom\\endReee.tga:28:28",
["endRP"]="Interface\\AddOns\\TwitchEmotes\\Custom\\endRP.tga:28:28",
["endTrump"]="Interface\\AddOns\\TwitchEmotes\\Custom\\endTrump.tga:28:28",
["marcithDerp"]="Interface\\AddOns\\TwitchEmotes\\Custom\\marcithDerp.tga:28:28",
["marcithMath"]="Interface\\AddOns\\TwitchEmotes\\Custom\\marcithMath.tga:28:28",
-- DansGaming -- Outdated
["dan7"]="Interface\\AddOns\\TwitchEmotes\\DansGaming\\dan7.tga:28:28",
["dan10"]="Interface\\AddOns\\TwitchEmotes\\DansGaming\\dan10.tga:28:28",
["danBad"]="Interface\\AddOns\\TwitchEmotes\\DansGaming\\danBad.tga:28:28",
["danBoy"]="Interface\\AddOns\\TwitchEmotes\\DansGaming\\danBoy.tga:28:28",
["danCreep"]="Interface\\AddOns\\TwitchEmotes\\DansGaming\\danCreep.tga:28:28",
["danCringe"]="Interface\\AddOns\\TwitchEmotes\\DansGaming\\danCringe.tga:28:28",
["danCry"]="Interface\\AddOns\\TwitchEmotes\\DansGaming\\danCry.tga:28:28",
["danCute"]="Interface\\AddOns\\TwitchEmotes\\DansGaming\\danCute.tga:28:28",
["danDead"]="Interface\\AddOns\\TwitchEmotes\\DansGaming\\danDead.tga:28:28",
["danDerp"]="Interface\\AddOns\\TwitchEmotes\\DansGaming\\danDerp.tga:28:28",
["danDuck"]="Interface\\AddOns\\TwitchEmotes\\DansGaming\\danDuck.tga:28:28",
["danGasm"]="Interface\\AddOns\\TwitchEmotes\\DansGaming\\danGasm.tga:28:28",
["danGasp"]="Interface\\AddOns\\TwitchEmotes\\DansGaming\\danGasp.tga:28:28",
["danGOTY"]="Interface\\AddOns\\TwitchEmotes\\DansGaming\\danGOTY.tga:28:28",
["danGrump"]="Interface\\AddOns\\TwitchEmotes\\DansGaming\\danGrump.tga:28:28",
["danHype"]="Interface\\AddOns\\TwitchEmotes\\DansGaming\\danHype.tga:28:28",
["danLewd"]="Interface\\AddOns\\TwitchEmotes\\DansGaming\\danLewd.tga:28:28",
["danLol"]="Interface\\AddOns\\TwitchEmotes\\DansGaming\\danLol.tga:28:28",
["danLove"]="Interface\\AddOns\\TwitchEmotes\\DansGaming\\danLove.tga:28:28",
["danNo"]="Interface\\AddOns\\TwitchEmotes\\DansGaming\\danNo.tga:28:28",
["danPalm"]="Interface\\AddOns\\TwitchEmotes\\DansGaming\\danPalm.tga:28:28",
["danPoop"]="Interface\\AddOns\\TwitchEmotes\\DansGaming\\danPoop.tga:28:28",
["danPuzzle"]="Interface\\AddOns\\TwitchEmotes\\DansGaming\\danPuzzle.tga:28:28",
["danRage"]="Interface\\AddOns\\TwitchEmotes\\DansGaming\\danRage.tga:28:28",
["danRekt"]="Interface\\AddOns\\TwitchEmotes\\DansGaming\\danRekt.tga:28:28",
["danSad"]="Interface\\AddOns\\TwitchEmotes\\DansGaming\\danSad.tga:28:28",
["danScare"]="Interface\\AddOns\\TwitchEmotes\\DansGaming\\danScare.tga:28:28",
["danSexy"]="Interface\\AddOns\\TwitchEmotes\\DansGaming\\danSexy.tga:28:28",
["danTen"]="Interface\\AddOns\\TwitchEmotes\\DansGaming\\danTen.tga:28:28",
["danThink"]="Interface\\AddOns\\TwitchEmotes\\DansGaming\\danThink.tga:28:28",
["danTrain"]="Interface\\AddOns\\TwitchEmotes\\DansGaming\\danTrain.tga:28:28",
["danWave"]="Interface\\AddOns\\TwitchEmotes\\DansGaming\\danWave.tga:28:28",
["danWoah"]="Interface\\AddOns\\TwitchEmotes\\DansGaming\\danWoah.tga:28:28",
["danWTF"]="Interface\\AddOns\\TwitchEmotes\\DansGaming\\danWTF.tga:28:28",
["danYay"]="Interface\\AddOns\\TwitchEmotes\\DansGaming\\danYay.tga:28:28",
["danYes"]="Interface\\AddOns\\TwitchEmotes\\DansGaming\\danYes.tga:28:28",
-- Ducksauce
["duckArthas"]="Interface\\AddOns\\TwitchEmotes\\Ducksauce\\duckArthas.tga:28:28",
["duckBA"]="Interface\\AddOns\\TwitchEmotes\\Ducksauce\\duckBA.tga:28:28",
["duckBarrel"]="Interface\\AddOns\\TwitchEmotes\\Ducksauce\\duckBarrel.tga:28:28",
["duckBedHead"]="Interface\\AddOns\\TwitchEmotes\\Ducksauce\\duckBedHead.tga:28:28",
["duckBoop"]="Interface\\AddOns\\TwitchEmotes\\Ducksauce\\duckBoop.tga:28:28",
["duckCoffee"]="Interface\\AddOns\\TwitchEmotes\\Ducksauce\\duckCoffee.tga:28:28",
["duckDerp"]="Interface\\AddOns\\TwitchEmotes\\Ducksauce\\duckDerp.tga:28:28",
["duckDuckFlex"]="Interface\\AddOns\\TwitchEmotes\\Ducksauce\\duckDuckFlex.tga:28:56",
["duckGA"]="Interface\\AddOns\\TwitchEmotes\\Ducksauce\\duckGA.tga:28:28",
["duckMama"]="Interface\\AddOns\\TwitchEmotes\\Ducksauce\\duckMama.tga:28:28",
["duckParty"]="Interface\\AddOns\\TwitchEmotes\\Ducksauce\\duckParty.tga:28:28",
["duckPist"]="Interface\\AddOns\\TwitchEmotes\\Ducksauce\\duckPist.tga:28:28",
["duckQuappa"]="Interface\\AddOns\\TwitchEmotes\\Ducksauce\\duckQuappa.tga:28:28",
["duckSad"]="Interface\\AddOns\\TwitchEmotes\\Ducksauce\\duckSad.tga:28:28",
["duckSkadoosh"]="Interface\\AddOns\\TwitchEmotes\\Ducksauce\\duckSkadoosh.tga:28:56",
["duckSpread"]="Interface\\AddOns\\TwitchEmotes\\Ducksauce\\duckSpread.tga:28:28",
["duckTenTen"]="Interface\\AddOns\\TwitchEmotes\\Ducksauce\\duckTenTen.tga:28:56",
["duckTrain"]="Interface\\AddOns\\TwitchEmotes\\Ducksauce\\duckTrain.tga:28:28",
["duckZIN"]="Interface\\AddOns\\TwitchEmotes\\Ducksauce\\duckZIN.tga:28:28",
-- EGazael
["azaConrad"]="Interface\\AddOns\\TwitchEmotes\\EGazael\\azaConrad.tga:28:28",
["azaDRAIN"]="Interface\\AddOns\\TwitchEmotes\\EGazael\\azaDRAIN.tga:28:28",
["azaERASED"]="Interface\\AddOns\\TwitchEmotes\\EGazael\\azaERASED.tga:28:28",
["azaFox"]="Interface\\AddOns\\TwitchEmotes\\EGazael\\azaFox.tga:28:28",
["azaHAPPY"]="Interface\\AddOns\\TwitchEmotes\\EGazael\\azaHAPPY.tga:28:28",
["azaHHH"]="Interface\\AddOns\\TwitchEmotes\\EGazael\\azaHHH.tga:28:28",
["azaMAD"]="Interface\\AddOns\\TwitchEmotes\\EGazael\\azaMAD.tga:28:28",
["azaRAT"]="Interface\\AddOns\\TwitchEmotes\\EGazael\\azaRAT.tga:28:28",
-- Emojis
["emGun"]="Interface\\AddOns\\TwitchEmotes\\Emoji\\emGun.tga:28:28",
["emThinking"]="Interface\\AddOns\\TwitchEmotes\\Emoji\\emThinking.tga:28:28",
-- EternaLEnVyy
["envyKappa"]="Interface\\AddOns\\TwitchEmotes\\EternaLEnVyy\\envyKappa.tga:28:28",
["envyKeikaku"]="Interface\\AddOns\\TwitchEmotes\\EternaLEnVyy\\envyKeikaku.tga:28:28",
["envyOK"]="Interface\\AddOns\\TwitchEmotes\\EternaLEnVyy\\envyOK.tga:28:28",
["envyStick"]="Interface\\AddOns\\TwitchEmotes\\EternaLEnVyy\\envyStick.tga:28:28",
["envySwag"]="Interface\\AddOns\\TwitchEmotes\\EternaLEnVyy\\envySwag.tga:28:28",
["envyW"]="Interface\\AddOns\\TwitchEmotes\\EternaLEnVyy\\envyW.tga:28:28",
["envyWeLost"]="Interface\\AddOns\\TwitchEmotes\\EternaLEnVyy\\envyWeLost.tga:28:28",
["envyWeWon"]="Interface\\AddOns\\TwitchEmotes\\EternaLEnVyy\\envyWeWon.tga:28:28",
-- Forsenlol
["forsen1"]="Interface\\AddOns\\TwitchEmotes\\Forsenlol\\forsen1.tga:28:28",
["forsen2"]="Interface\\AddOns\\TwitchEmotes\\Forsenlol\\forsen2.tga:28:28",
["forsen3"]="Interface\\AddOns\\TwitchEmotes\\Forsenlol\\forsen3.tga:28:28",
["forsen4"]="Interface\\AddOns\\TwitchEmotes\\Forsenlol\\forsen4.tga:28:28",
["forsenBanned"]="Interface\\AddOns\\TwitchEmotes\\Forsenlol\\forsenBanned.tga:28:28",
["forsenBoys"]="Interface\\AddOns\\TwitchEmotes\\Forsenlol\\forsenBoys.tga:28:28",
["forsenClown"]="Interface\\AddOns\\TwitchEmotes\\Forsenlol\\forsenClown.tga:28:28",
["forsenCpooky"]="Interface\\AddOns\\TwitchEmotes\\Forsenlol\\forsenCpooky.tga:28:28",
["forsenDDK"]="Interface\\AddOns\\TwitchEmotes\\Forsenlol\\forsenDDK.tga:28:28",
["forsenDED"]="Interface\\AddOns\\TwitchEmotes\\Forsenlol\\forsenDED.tga:28:28",
["forsenDiglett"]="Interface\\AddOns\\TwitchEmotes\\Forsenlol\\forsenDiglett.tga:28:28",
["forsenOP"]="Interface\\AddOns\\TwitchEmotes\\Forsenlol\\forsenOP.tga:28:28",
["forsenE"]="Interface\\AddOns\\TwitchEmotes\\Forsenlol\\forsenE.tga:28:28",
["forsenEmote"]="Interface\\AddOns\\TwitchEmotes\\Forsenlol\\forsenEmote.tga:28:28",
["forsenEmote2"]="Interface\\AddOns\\TwitchEmotes\\Forsenlol\\forsenEmote2.tga:28:28",
["forsenFajita"]="Interface\\AddOns\\TwitchEmotes\\Forsenlol\\forsenFajita.tga:28:28",
["forsenFeels"]="Interface\\AddOns\\TwitchEmotes\\Forsenlol\\forsenFeels.tga:28:28",
["forsenGun"]="Interface\\AddOns\\TwitchEmotes\\Forsenlol\\forsenGun.tga:28:28",
["forsenH"]="Interface\\AddOns\\TwitchEmotes\\Forsenlol\\forsenH.tga:28:28",
["forsenHorsen"]="Interface\\AddOns\\TwitchEmotes\\Forsenlol\\forsenHorsen.tga:28:28",
["forsenIQ"]="Interface\\AddOns\\TwitchEmotes\\Forsenlol\\forsenIQ.tga:28:28",
["forsenKnife"]="Interface\\AddOns\\TwitchEmotes\\Forsenlol\\forsenKnife.tga:28:28",
["forsenLewd"]="Interface\\AddOns\\TwitchEmotes\\Forsenlol\\forsenLewd.tga:28:28",
["forsenLooted"]="Interface\\AddOns\\TwitchEmotes\\Forsenlol\\forsenLooted.tga:28:28",
["forsenLUL"]="Interface\\AddOns\\TwitchEmotes\\Forsenlol\\forsenLUL.tga:28:28",
["forsenMoney"]="Interface\\AddOns\\TwitchEmotes\\Forsenlol\\forsenMoney.tga:28:28",
["forsenMonkey"]="Interface\\AddOns\\TwitchEmotes\\Forsenlol\\forsenMonkey.tga:28:28",
["forsenO"]="Interface\\AddOns\\TwitchEmotes\\Forsenlol\\forsenO.tga:28:28",
["forsenODO"]="Interface\\AddOns\\TwitchEmotes\\Forsenlol\\forsenODO.tga:28:28",
["forsenOG"]="Interface\\AddOns\\TwitchEmotes\\Forsenlol\\forsenOG.tga:28:28",
["forsenPepe"]="Interface\\AddOns\\TwitchEmotes\\Forsenlol\\forsenPepe.tga:28:28",
["forsenPuke"]="Interface\\AddOns\\TwitchEmotes\\Forsenlol\\forsenPuke.tga:28:28",
["forsenPuke2"]="Interface\\AddOns\\TwitchEmotes\\Forsenlol\\forsenPuke2.tga:28:28",
["forsenPuke3"]="Interface\\AddOns\\TwitchEmotes\\Forsenlol\\forsenPuke3.tga:28:28",
["forsenPuke4"]="Interface\\AddOns\\TwitchEmotes\\Forsenlol\\forsenPuke4.tga:28:28",
["forsenR"]="Interface\\AddOns\\TwitchEmotes\\Forsenlol\\forsenR.tga:28:28",
["forsenRP"]="Interface\\AddOns\\TwitchEmotes\\Forsenlol\\forsenRP.tga:28:28",
["forsenSambool"]="Interface\\AddOns\\TwitchEmotes\\Forsenlol\\forsenSambool.tga:28:28",
["forsenSheffy"]="Interface\\AddOns\\TwitchEmotes\\Forsenlol\\forsenSheffy.tga:28:28",
["forsenSkip"]="Interface\\AddOns\\TwitchEmotes\\Forsenlol\\forsenSkip.tga:28:28",
["forsenSleeper"]="Interface\\AddOns\\TwitchEmotes\\Forsenlol\\forsenSleeper.tga:28:28",
["forsenSS"]="Interface\\AddOns\\TwitchEmotes\\Forsenlol\\forsenSS.tga:28:28",
["forsenStein"]="Interface\\AddOns\\TwitchEmotes\\Forsenlol\\forsenStein.tga:28:28",
["forsenSwag"]="Interface\\AddOns\\TwitchEmotes\\Forsenlol\\forsenSwag.tga:28:28",
["forsenTriggered"]="Interface\\AddOns\\TwitchEmotes\\Forsenlol\\forsenTriggered.tga:28:28",
["forsenW"]="Interface\\AddOns\\TwitchEmotes\\Forsenlol\\forsenW.tga:28:28",
["forsenWhip"]="Interface\\AddOns\\TwitchEmotes\\Forsenlol\\forsenWhip.tga:28:28",
["forsenWut"]="Interface\\AddOns\\TwitchEmotes\\Forsenlol\\forsenWut.tga:28:28",
["forsenX"]="Interface\\AddOns\\TwitchEmotes\\Forsenlol\\forsenX.tga:28:28",
-- Hirona
["hiroCry"]="Interface\\AddOns\\TwitchEmotes\\Hirona\\hiroCry.tga:28:28",
["hiroDerp"]="Interface\\AddOns\\TwitchEmotes\\Hirona\\hiroDerp.tga:28:28",
["hiroH"]="Interface\\AddOns\\TwitchEmotes\\Hirona\\hiroH.tga:28:28",
["hiroHail"]="Interface\\AddOns\\TwitchEmotes\\Hirona\\hiroHail.tga:28:28",
["hiroNo"]="Interface\\AddOns\\TwitchEmotes\\Hirona\\hiroNo.tga:28:28",
["hiroP"]="Interface\\AddOns\\TwitchEmotes\\Hirona\\hiroP.tga:28:28",
["hiroWave"]="Interface\\AddOns\\TwitchEmotes\\Hirona\\hiroWave.tga:28:28",
["hiroWtf"]="Interface\\AddOns\\TwitchEmotes\\Hirona\\hiroWtf.tga:28:28",
-- Hydramist
["hydraChamp"]="Interface\\AddOns\\TwitchEmotes\\Hydramist\\hydraChamp.tga:28:28",
["hydraFoot"]="Interface\\AddOns\\TwitchEmotes\\Hydramist\\hydraFoot.tga:28:28",
["hydraHEIL"]="Interface\\AddOns\\TwitchEmotes\\Hydramist\\hydraHEIL.tga:28:28",
["hydraLUNA"]="Interface\\AddOns\\TwitchEmotes\\Hydramist\\hydraLUNA.tga:28:28",
["hydraMURAT"]="Interface\\AddOns\\TwitchEmotes\\Hydramist\\hydraMURAT.tga:28:28",
["hydraPURPLE"]="Interface\\AddOns\\TwitchEmotes\\Hydramist\\hydraPURPLE.tga:28:28",
["hydraRUSSIA"]="Interface\\AddOns\\TwitchEmotes\\Hydramist\\hydraRUSSIA.tga:28:28",
["hydraSquare"]="Interface\\AddOns\\TwitchEmotes\\Hydramist\\hydraSquare.tga:28:28",
["hydraXMAS"]="Interface\\AddOns\\TwitchEmotes\\Hydramist\\hydraXMAS.tga:28:28",
-- imaqtpie
["qtp1"]="Interface\\AddOns\\TwitchEmotes\\imaqtpie\\qtp1.tga:28:28",
["qtp2"]="Interface\\AddOns\\TwitchEmotes\\imaqtpie\\qtp2.tga:28:28",
["qtp2ND"]="Interface\\AddOns\\TwitchEmotes\\imaqtpie\\qtp2ND.tga:28:28",
["qtp3"]="Interface\\AddOns\\TwitchEmotes\\imaqtpie\\qtp3.tga:28:28",
["qtp4"]="Interface\\AddOns\\TwitchEmotes\\imaqtpie\\qtp4.tga:28:28",
["qtpA"]="Interface\\AddOns\\TwitchEmotes\\imaqtpie\\qtpA.tga:28:28",
["qtpB"]="Interface\\AddOns\\TwitchEmotes\\imaqtpie\\qtpB.tga:28:28",
["qtpBAKED"]="Interface\\AddOns\\TwitchEmotes\\imaqtpie\\qtpBAKED.tga:28:28",
["qtpBLESSED"]="Interface\\AddOns\\TwitchEmotes\\imaqtpie\\qtpBLESSED.tga:28:28",
["qtpBOOSTED"]="Interface\\AddOns\\TwitchEmotes\\imaqtpie\\qtpBOOSTED.tga:28:28",
["qtpBOT"]="Interface\\AddOns\\TwitchEmotes\\imaqtpie\\qtpBOT.tga:28:28",
["qtpCOOL"]="Interface\\AddOns\\TwitchEmotes\\imaqtpie\\qtpCOOL.tga:28:28",
["qtpCULLED"]="Interface\\AddOns\\TwitchEmotes\\imaqtpie\\qtpCULLED.tga:28:28",
["qtpDAPPER"]="Interface\\AddOns\\TwitchEmotes\\imaqtpie\\qtpDAPPER.tga:28:28",
["qtpDONG"]="Interface\\AddOns\\TwitchEmotes\\imaqtpie\\qtpDONG.tga:28:28",
["qtpEDGE"]="Interface\\AddOns\\TwitchEmotes\\imaqtpie\\qtpEDGE.tga:28:28",
["qtpFEELS"]="Interface\\AddOns\\TwitchEmotes\\imaqtpie\\qtpFEELS.tga:28:28",
["qtpGIVE"]="Interface\\AddOns\\TwitchEmotes\\imaqtpie\\qtpGIVE.tga:28:28",
["qtpHAHAA"]="Interface\\AddOns\\TwitchEmotes\\imaqtpie\\qtpHAHAA.tga:28:28",
["qtpHEART"]="Interface\\AddOns\\TwitchEmotes\\imaqtpie\\qtpHEART.tga:28:28",
["qtpHEHE"]="Interface\\AddOns\\TwitchEmotes\\imaqtpie\\qtpHEHE.tga:28:28",
["qtpHONK"]="Interface\\AddOns\\TwitchEmotes\\imaqtpie\\qtpHONK.tga:28:28",
["qtpKAWAII"]="Interface\\AddOns\\TwitchEmotes\\imaqtpie\\qtpKAWAII.tga:28:28",
["qtpLEMONKEY"]="Interface\\AddOns\\TwitchEmotes\\imaqtpie\\qtpLEMONKEY.tga:28:28",
["qtpLIT"]="Interface\\AddOns\\TwitchEmotes\\imaqtpie\\qtpLIT.tga:28:28",
["qtpLUCIAN"]="Interface\\AddOns\\TwitchEmotes\\imaqtpie\\qtpLUCIAN.tga:28:28",
["qtpLUL"]="Interface\\AddOns\\TwitchEmotes\\imaqtpie\\qtpLUL.tga:28:28",
["qtpMEME"]="Interface\\AddOns\\TwitchEmotes\\imaqtpie\\qtpMEME.tga:28:28",
["qtpMEW"]="Interface\\AddOns\\TwitchEmotes\\imaqtpie\\qtpMEW.tga:28:28",
["qtpMOIST"]="Interface\\AddOns\\TwitchEmotes\\imaqtpie\\qtpMOIST.tga:28:28",
["qtpNLT"]="Interface\\AddOns\\TwitchEmotes\\imaqtpie\\qtpNLT.tga:28:28",
["qtpNO"]="Interface\\AddOns\\TwitchEmotes\\imaqtpie\\qtpNO.tga:28:28",
["qtpOWO"]="Interface\\AddOns\\TwitchEmotes\\imaqtpie\\qtpOWO.tga:28:28",
["qtpPAID"]="Interface\\AddOns\\TwitchEmotes\\imaqtpie\\qtpPAID.tga:28:28",
["qtpPLEB"]="Interface\\AddOns\\TwitchEmotes\\imaqtpie\\qtpPLEB.tga:28:28",
["qtpPOTATO"]="Interface\\AddOns\\TwitchEmotes\\imaqtpie\\qtpPOTATO.tga:28:28",
["qtpSMORC"]="Interface\\AddOns\\TwitchEmotes\\imaqtpie\\qtpSMORC.tga:28:28",
["qtpSPOOKED"]="Interface\\AddOns\\TwitchEmotes\\imaqtpie\\qtpSPOOKED.tga:28:28",
["qtpSPOOKY"]="Interface\\AddOns\\TwitchEmotes\\imaqtpie\\qtpSPOOKY.tga:28:28",
["qtpSTFU"]="Interface\\AddOns\\TwitchEmotes\\imaqtpie\\qtpSTFU.tga:28:28",
["qtpSWAG"]="Interface\\AddOns\\TwitchEmotes\\imaqtpie\\qtpSWAG.tga:28:28",
["qtpTHINKING"]="Interface\\AddOns\\TwitchEmotes\\imaqtpie\\qtpTHINKING.tga:28:28",
["qtpTHUMP"]="Interface\\AddOns\\TwitchEmotes\\imaqtpie\\qtpTHUMP.tga:28:28",
["qtpTILT"]="Interface\\AddOns\\TwitchEmotes\\imaqtpie\\qtpTILT.tga:28:28",
["qtpURGOD"]="Interface\\AddOns\\TwitchEmotes\\imaqtpie\\qtpURGOD.tga:28:28",
["qtpUSA"]="Interface\\AddOns\\TwitchEmotes\\imaqtpie\\qtpUSA.tga:28:28",
["qtpW"]="Interface\\AddOns\\TwitchEmotes\\imaqtpie\\qtpW.tga:28:28",
["qtpWAVE"]="Interface\\AddOns\\TwitchEmotes\\imaqtpie\\qtpWAVE.tga:28:28",
["qtpWEEB"]="Interface\\AddOns\\TwitchEmotes\\imaqtpie\\qtpWEEB.tga:28:28",
["qtpWHAT"]="Interface\\AddOns\\TwitchEmotes\\imaqtpie\\qtpWHAT.tga:28:28",
-- Lauren07
["laurGasm"]="Interface\\AddOns\\TwitchEmotes\\Lauren07\\laurGasm.tga:28:28",
["laurHey"]="Interface\\AddOns\\TwitchEmotes\\Lauren07\\laurHey.tga:28:28",
["laurHic"]="Interface\\AddOns\\TwitchEmotes\\Lauren07\\laurHic.tga:28:28",
["laurLove"]="Interface\\AddOns\\TwitchEmotes\\Lauren07\\laurLove.tga:28:28",
["laurMeow"]="Interface\\AddOns\\TwitchEmotes\\Lauren07\\laurMeow.tga:28:28",
["laurRage"]="Interface\\AddOns\\TwitchEmotes\\Lauren07\\laurRage.tga:28:28",
["laurThump"]="Interface\\AddOns\\TwitchEmotes\\Lauren07\\laurThump.tga:28:28",
["laurWat"]="Interface\\AddOns\\TwitchEmotes\\Lauren07\\laurWat.tga:28:28",
-- Lirik
["lirikA"]="Interface\\AddOns\\TwitchEmotes\\Lirik\\lirikA.tga:28:28",
["lirikAppa"]="Interface\\AddOns\\TwitchEmotes\\Lirik\\lirikAppa.tga:28:28",
["lirikBB"]="Interface\\AddOns\\TwitchEmotes\\Lirik\\lirikBB.tga:28:28",
["lirikBLIND"]="Interface\\AddOns\\TwitchEmotes\\Lirik\\lirikBLIND.tga:28:28",
["lirikC"]="Interface\\AddOns\\TwitchEmotes\\Lirik\\lirikC.tga:28:28",
["lirikCHAMP"]="Interface\\AddOns\\TwitchEmotes\\Lirik\\lirikCHAMP.tga:28:28",
["lirikCLAP"]="Interface\\AddOns\\TwitchEmotes\\Lirik\\lirikCLAP.tga:28:28",
["lirikCLENCH"]="Interface\\AddOns\\TwitchEmotes\\Lirik\\lirikCLENCH.tga:28:28",
["lirikCRASH"]="Interface\\AddOns\\TwitchEmotes\\Lirik\\lirikCRASH.tga:28:28",
["lirikDJ"]="Interface\\AddOns\\TwitchEmotes\\Lirik\\lirikDJ.tga:28:28",
["lirikF"]="Interface\\AddOns\\TwitchEmotes\\Lirik\\lirikF.tga:28:28",
["lirikFAKE"]="Interface\\AddOns\\TwitchEmotes\\Lirik\\lirikFAKE.tga:28:28",
["lirikFEELS"]="Interface\\AddOns\\TwitchEmotes\\Lirik\\lirikFEELS.tga:28:28",
["lirikFR"]="Interface\\AddOns\\TwitchEmotes\\Lirik\\lirikFR.tga:28:28",
["lirikGasm"]="Interface\\AddOns\\TwitchEmotes\\Lirik\\lirikGasm.tga:28:28",
["lirikGOTY"]="Interface\\AddOns\\TwitchEmotes\\Lirik\\lirikGOTY.tga:28:28",
["lirikGREAT"]="Interface\\AddOns\\TwitchEmotes\\Lirik\\lirikGREAT.tga:28:28",
["lirikH"]="Interface\\AddOns\\TwitchEmotes\\Lirik\\lirikH.tga:28:28",
["lirikHOLD"]="Interface\\AddOns\\TwitchEmotes\\Lirik\\lirikHOLD.tga:28:28",
["lirikHug"]="Interface\\AddOns\\TwitchEmotes\\Lirik\\lirikHug.tga:28:28",
["lirikHYPE"]="Interface\\AddOns\\TwitchEmotes\\Lirik\\lirikHYPE.tga:28:28",
["lirikL"]="Interface\\AddOns\\TwitchEmotes\\Lirik\\lirikL.tga:28:28",
["lirikLEAN"]="Interface\\AddOns\\TwitchEmotes\\Lirik\\lirikLEAN.tga:28:28",
["lirikLEWD"]="Interface\\AddOns\\TwitchEmotes\\Lirik\\lirikLEWD.tga:28:28",
["lirikLOOT"]="Interface\\AddOns\\TwitchEmotes\\Lirik\\lirikLOOT.tga:28:28",
["lirikLUL"]="Interface\\AddOns\\TwitchEmotes\\Lirik\\lirikLUL.tga:28:28",
["lirikMLG"]="Interface\\AddOns\\TwitchEmotes\\Lirik\\lirikMLG.tga:28:28",
["lirikN"]="Interface\\AddOns\\TwitchEmotes\\Lirik\\lirikN.tga:28:28",
["lirikNICE"]="Interface\\AddOns\\TwitchEmotes\\Lirik\\lirikNICE.tga:28:28",
["lirikNON"]="Interface\\AddOns\\TwitchEmotes\\Lirik\\lirikNON.tga:28:28",
["lirikNOT"]="Interface\\AddOns\\TwitchEmotes\\Lirik\\lirikNOT.tga:28:28",
["lirikO"]="Interface\\AddOns\\TwitchEmotes\\Lirik\\lirikO.tga:28:28",
["lirikOBESE"]="Interface\\AddOns\\TwitchEmotes\\Lirik\\lirikOBESE.tga:28:28",
["lirikOHGOD"]="Interface\\AddOns\\TwitchEmotes\\Lirik\\lirikOHGOD.tga:28:28",
["lirikOK"]="Interface\\AddOns\\TwitchEmotes\\Lirik\\lirikOK.tga:28:28",
["lirikP"]="Interface\\AddOns\\TwitchEmotes\\Lirik\\lirikP.tga:28:28",
["lirikPOOL"]="Interface\\AddOns\\TwitchEmotes\\Lirik\\lirikPOOL.tga:28:28",
["lirikPOOP"]="Interface\\AddOns\\TwitchEmotes\\Lirik\\lirikPOOP.tga:28:28",
["lirikPUKE"]="Interface\\AddOns\\TwitchEmotes\\Lirik\\lirikPUKE.tga:28:28",
["lirikREKT"]="Interface\\AddOns\\TwitchEmotes\\Lirik\\lirikREKT.tga:28:28",
["lirikRIP"]="Interface\\AddOns\\TwitchEmotes\\Lirik\\lirikRIP.tga:28:28",
["lirikS"]="Interface\\AddOns\\TwitchEmotes\\Lirik\\lirikS.tga:28:28",
["lirikSALT"]="Interface\\AddOns\\TwitchEmotes\\Lirik\\lirikSALT.tga:28:28",
["lirikSCARED"]="Interface\\AddOns\\TwitchEmotes\\Lirik\\lirikSCARED.tga:28:28",
["lirikSHUCKS"]="Interface\\AddOns\\TwitchEmotes\\Lirik\\lirikSHUCKS.tga:28:28",
["lirikSMART"]="Interface\\AddOns\\TwitchEmotes\\Lirik\\lirikSMART.tga:28:28",
["lirikTEN"]="Interface\\AddOns\\TwitchEmotes\\Lirik\\lirikTEN.tga:28:28",
["lirikTENK"]="Interface\\AddOns\\TwitchEmotes\\Lirik\\lirikTENK.tga:28:28",
["lirikThump"]="Interface\\AddOns\\TwitchEmotes\\Lirik\\lirikThump.tga:28:28",
["lirikW"]="Interface\\AddOns\\TwitchEmotes\\Lirik\\lirikW.tga:28:28",
-- Pandamonium -- Outdated
["chingAus"]="Interface\\AddOns\\TwitchEmotes\\Pandamonium\\chingAus.tga:28:28",
["chingBday"]="Interface\\AddOns\\TwitchEmotes\\Pandamonium\\chingBday.tga:28:28",
["chingBig"]="Interface\\AddOns\\TwitchEmotes\\Pandamonium\\chingBig.tga:28:28",
["chingBinbash"]="Interface\\AddOns\\TwitchEmotes\\Pandamonium\\chingBinbash.tga:28:28",
["chingBomb"]="Interface\\AddOns\\TwitchEmotes\\Pandamonium\\chingBomb.tga:28:28",
["chingEdge"]="Interface\\AddOns\\TwitchEmotes\\Pandamonium\\chingEdge.tga:28:28",
["chingFace"]="Interface\\AddOns\\TwitchEmotes\\Pandamonium\\chingFace.tga:28:28",
["chingHype"]="Interface\\AddOns\\TwitchEmotes\\Pandamonium\\chingHype.tga:28:28",
["chingJail"]="Interface\\AddOns\\TwitchEmotes\\Pandamonium\\chingJail.tga:28:28",
["chingMaiku"]="Interface\\AddOns\\TwitchEmotes\\Pandamonium\\chingMaiku.tga:28:28",
["chingMod"]="Interface\\AddOns\\TwitchEmotes\\Pandamonium\\chingMod.tga:28:28",
["chingMoney"]="Interface\\AddOns\\TwitchEmotes\\Pandamonium\\chingMoney.tga:28:28",
["chingPanda"]="Interface\\AddOns\\TwitchEmotes\\Pandamonium\\chingPanda.tga:28:28",
["chingPotato"]="Interface\\AddOns\\TwitchEmotes\\Pandamonium\\chingPotato.tga:28:28",
["chingS"]="Interface\\AddOns\\TwitchEmotes\\Pandamonium\\chingS.tga:28:28",
["chingSense"]="Interface\\AddOns\\TwitchEmotes\\Pandamonium\\chingSense.tga:28:28",
["chingSub"]="Interface\\AddOns\\TwitchEmotes\\Pandamonium\\chingSub.tga:28:28",
["chingTgi"]="Interface\\AddOns\\TwitchEmotes\\Pandamonium\\chingTgi.tga:28:28",
["chingTroll"]="Interface\\AddOns\\TwitchEmotes\\Pandamonium\\chingTroll.tga:28:28",
["chingW"]="Interface\\AddOns\\TwitchEmotes\\Pandamonium\\chingW.tga:28:28",
-- Quin69
["quinBoss"]="Interface\\AddOns\\TwitchEmotes\\Quin69\\quinBoss.tga:28:28",
["quinBot"]="Interface\\AddOns\\TwitchEmotes\\Quin69\\quinBot.tga:28:28",
["quinBully"]="Interface\\AddOns\\TwitchEmotes\\Quin69\\quinBully.tga:28:28",
["quinC"]="Interface\\AddOns\\TwitchEmotes\\Quin69\\quinC.tga:28:28",
["quinD"]="Interface\\AddOns\\TwitchEmotes\\Quin69\\quinD.tga:28:28",
["quinDOIT"]="Interface\\AddOns\\TwitchEmotes\\Quin69\\quinDOIT.tga:28:28",
["quinDom"]="Interface\\AddOns\\TwitchEmotes\\Quin69\\quinDom.tga:28:28",
["quinGun"]="Interface\\AddOns\\TwitchEmotes\\Quin69\\quinGun.tga:28:28",
["quinHappy"]="Interface\\AddOns\\TwitchEmotes\\Quin69\\quinHappy.tga:28:28",
["quinJesus"]="Interface\\AddOns\\TwitchEmotes\\Quin69\\quinJesus.tga:28:28",
["quinJudy"]="Interface\\AddOns\\TwitchEmotes\\Quin69\\quinJudy.tga:28:28",
["quinJuice"]="Interface\\AddOns\\TwitchEmotes\\Quin69\\quinJuice.tga:28:28",
["quinL"]="Interface\\AddOns\\TwitchEmotes\\Quin69\\quinL.tga:28:28",
["quinLeech"]="Interface\\AddOns\\TwitchEmotes\\Quin69\\quinLeech.tga:28:28",
["quinMask"]="Interface\\AddOns\\TwitchEmotes\\Quin69\\quinMask.tga:28:28",
["quinPaca"]="Interface\\AddOns\\TwitchEmotes\\Quin69\\quinPaca.tga:28:28",
["quinPalm"]="Interface\\AddOns\\TwitchEmotes\\Quin69\\quinPalm.tga:28:28",
["quinPukana"]="Interface\\AddOns\\TwitchEmotes\\Quin69\\quinPukana.tga:28:28",
["quinR"]="Interface\\AddOns\\TwitchEmotes\\Quin69\\quinR.tga:28:28",
["quinRat"]="Interface\\AddOns\\TwitchEmotes\\Quin69\\quinRat.tga:28:28",
["quinSplat"]="Interface\\AddOns\\TwitchEmotes\\Quin69\\quinSplat.tga:28:28",
["quinThump"]="Interface\\AddOns\\TwitchEmotes\\Quin69\\quinThump.tga:28:28",
["quinTip"]="Interface\\AddOns\\TwitchEmotes\\Quin69\\quinTip.tga:28:28",
["quinWtf"]="Interface\\AddOns\\TwitchEmotes\\Quin69\\quinWtf.tga:28:28",
["quinWut"]="Interface\\AddOns\\TwitchEmotes\\Quin69\\quinWut.tga:28:28",
-- Summit1g
["sum1g"]="Interface\\AddOns\\TwitchEmotes\\Summit1g\\sum1g.tga:28:28",
["sum100"]="Interface\\AddOns\\TwitchEmotes\\Summit1g\\sum100.tga:28:28",
["sumAbby"]="Interface\\AddOns\\TwitchEmotes\\Summit1g\\sumAbby.tga:28:28",
["sumAyo"]="Interface\\AddOns\\TwitchEmotes\\Summit1g\\sumAyo.tga:28:28",
["sumBag"]="Interface\\AddOns\\TwitchEmotes\\Summit1g\\sumBag.tga:28:28",
["sumBlind"]="Interface\\AddOns\\TwitchEmotes\\Summit1g\\sumBlind.tga:28:28",
["sumBuhblam"]="Interface\\AddOns\\TwitchEmotes\\Summit1g\\sumBuhblam.tga:28:28",
["sumCrash"]="Interface\\AddOns\\TwitchEmotes\\Summit1g\\sumCrash.tga:28:28",
["sumCreeper"]="Interface\\AddOns\\TwitchEmotes\\Summit1g\\sumCreeper.tga:28:28",
["sumDerp"]="Interface\\AddOns\\TwitchEmotes\\Summit1g\\sumDerp.tga:28:28",
["sumDesi"]="Interface\\AddOns\\TwitchEmotes\\Summit1g\\sumDesi.tga:28:28",
["sumFail"]="Interface\\AddOns\\TwitchEmotes\\Summit1g\\sumFail.tga:28:28",
["sumFood"]="Interface\\AddOns\\TwitchEmotes\\Summit1g\\sumFood.tga:28:28",
["sumFuse"]="Interface\\AddOns\\TwitchEmotes\\Summit1g\\sumFuse.tga:28:28",
["sumGasm"]="Interface\\AddOns\\TwitchEmotes\\Summit1g\\sumGasm.tga:28:28",
["sumGG"]="Interface\\AddOns\\TwitchEmotes\\Summit1g\\sumGG.tga:28:28",
["sumGodflash"]="Interface\\AddOns\\TwitchEmotes\\Summit1g\\sumGodflash.tga:28:28",
["sumHassan"]="Interface\\AddOns\\TwitchEmotes\\Summit1g\\sumHassan.tga:28:28",
["sumHassin"]="Interface\\AddOns\\TwitchEmotes\\Summit1g\\sumHassin.tga:28:28",
["sumHorse"]="Interface\\AddOns\\TwitchEmotes\\Summit1g\\sumHorse.tga:28:28",
["sumLove"]="Interface\\AddOns\\TwitchEmotes\\Summit1g\\sumLove.tga:28:28",
["sumMolly"]="Interface\\AddOns\\TwitchEmotes\\Summit1g\\sumMolly.tga:28:28",
["sumOhface"]="Interface\\AddOns\\TwitchEmotes\\Summit1g\\sumOhface.tga:28:28",
["sumOrc"]="Interface\\AddOns\\TwitchEmotes\\Summit1g\\sumOrc.tga:28:28",
["sumOreo"]="Interface\\AddOns\\TwitchEmotes\\Summit1g\\sumOreo.tga:28:28",
["sumPluto"]="Interface\\AddOns\\TwitchEmotes\\Summit1g\\sumPluto.tga:28:28",
["sumPotato"]="Interface\\AddOns\\TwitchEmotes\\Summit1g\\sumPotato.tga:28:28",
["sumPuzzle"]="Interface\\AddOns\\TwitchEmotes\\Summit1g\\sumPuzzle.tga:28:28",
["sumRage"]="Interface\\AddOns\\TwitchEmotes\\Summit1g\\sumRage.tga:28:28",
["sumRekt"]="Interface\\AddOns\\TwitchEmotes\\Summit1g\\sumRekt.tga:28:28",
["sumRip"]="Interface\\AddOns\\TwitchEmotes\\Summit1g\\sumRip.tga:28:28",
["sumStache"]="Interface\\AddOns\\TwitchEmotes\\Summit1g\\sumStache.tga:28:28",
["sumSuh"]="Interface\\AddOns\\TwitchEmotes\\Summit1g\\sumSuh.tga:28:28",
["sumSwag"]="Interface\\AddOns\\TwitchEmotes\\Summit1g\\sumSwag.tga:28:28",
["sumThump"]="Interface\\AddOns\\TwitchEmotes\\Summit1g\\sumThump.tga:28:28",
["sumUp"]="Interface\\AddOns\\TwitchEmotes\\Summit1g\\sumUp.tga:28:28",
["sumVac"]="Interface\\AddOns\\TwitchEmotes\\Summit1g\\sumVac.tga:28:28",
["sumVac2"]="Interface\\AddOns\\TwitchEmotes\\Summit1g\\sumVac2.tga:28:28",
["sumW"]="Interface\\AddOns\\TwitchEmotes\\Summit1g\\sumW.tga:28:28",
["sumWhat"]="Interface\\AddOns\\TwitchEmotes\\Summit1g\\sumWhat.tga:28:28",
["sumWTF"]="Interface\\AddOns\\TwitchEmotes\\Summit1g\\sumWTF.tga:28:28",
["sumWut"]="Interface\\AddOns\\TwitchEmotes\\Summit1g\\sumWut.tga:28:28",
-- TwitchPresents
["tpAIYIYI"]="Interface\\AddOns\\TwitchEmotes\\TwitchPresents\\tpAIYIYI.tga:28:28",
["tpBlack"]="Interface\\AddOns\\TwitchEmotes\\TwitchPresents\\tpBlack.tga:28:28",
["tpBaboo"]="Interface\\AddOns\\TwitchEmotes\\TwitchPresents\\tpBaboo.tga:28:28",
["tpBLBLBL"]="Interface\\AddOns\\TwitchEmotes\\TwitchPresents\\tpBLBLBL.tga:28:28",
["tpBlue"]="Interface\\AddOns\\TwitchEmotes\\TwitchPresents\\tpBlue.tga:28:28",
["tpBulk"]="Interface\\AddOns\\TwitchEmotes\\TwitchPresents\\tpBulk.tga:28:28",
["tpFree"]="Interface\\AddOns\\TwitchEmotes\\TwitchPresents\\tpFree.tga:28:28",
["tpFX1"]="Interface\\AddOns\\TwitchEmotes\\TwitchPresents\\tpFX1.tga:28:28",
["tpGG"]="Interface\\AddOns\\TwitchEmotes\\TwitchPresents\\tpGG.tga:28:28",
["tpGreen"]="Interface\\AddOns\\TwitchEmotes\\TwitchPresents\\tpGreen.tga:28:28",
["tpHeresTommy"]="Interface\\AddOns\\TwitchEmotes\\TwitchPresents\\tpHeresTommy.tga:28:28",
["tpLokar"]="Interface\\AddOns\\TwitchEmotes\\TwitchPresents\\tpLokar.tga:28:28",
["tpNasus"]="Interface\\AddOns\\TwitchEmotes\\TwitchPresents\\tpNasus.tga:28:28",
["tpPink"]="Interface\\AddOns\\TwitchEmotes\\TwitchPresents\\tpPink.tga:28:28",
["tpRed"]="Interface\\AddOns\\TwitchEmotes\\TwitchPresents\\tpRed.tga:28:28",
["tpSquatt"]="Interface\\AddOns\\TwitchEmotes\\TwitchPresents\\tpSquatt.tga:28:28",
["tpWhite"]="Interface\\AddOns\\TwitchEmotes\\TwitchPresents\\tpWhite.tga:28:28",
["tpYellow"]="Interface\\AddOns\\TwitchEmotes\\TwitchPresents\\tpYellow.tga:28:28",
["tpZedd"]="Interface\\AddOns\\TwitchEmotes\\TwitchPresents\\tpZedd.tga:28:28",
-- TwitchTV
["4Head"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\4Head.tga:28:28",
["ANELE"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\ANELE.tga:28:28",
["AMPEnergy"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\AMPEnergy.tga:28:28",
["AMPEnergyCherry"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\AMPEnergyCherry.tga:28:28",
["AMPTropPunch"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\AMPTropPunch.tga:28:28",
["ArgieB8"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\ArgieB8.tga:28:28",
["ArigatoNas"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\ArigatoNas.tga:28:28",
["ArsonNoSexy"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\ArsonNoSexy.tga:28:28",
["AsianGlow"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\AsianGlow.tga:28:28",
["BabyRage"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\BabyRage.tga:28:28",
["BasedGod"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\BasedGod.tga:28:28",
["BatChest"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\BatChest.tga:28:28",
["BCouch"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\BCouch.tga:28:28",
["BCWarrior"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\BCWarrior.tga:28:28",
["BegWan"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\BegWan.tga:28:28",
["BibleThump"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\BibleThump.tga:28:28",
["BigBrother"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\BigBrother.tga:28:28",
["BigPhish"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\BigPhish.tga:28:28",
["BlargNaut"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\BlargNaut.tga:28:28",
["bleedPurple"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\bleedPurple.tga:28:28",
["BlessRNG"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\BlessRNG.tga:28:28",
["BloodTrail"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\BloodTrail.tga:28:56",
["BrainSlug"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\BrainSlug.tga:28:28",
["BrokeBack"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\BrokeBack.tga:28:28",
["BudBlast"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\BudBlast.tga:28:28",
["BuddhaBar"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\BuddhaBar.tga:28:28",
["BudStar"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\BudStar.tga:28:28",
["CarlSmile"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\CarlSmile.tga:28:28",
["ChefFrank"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\ChefFrank.tga:28:28",
["Clarmy"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\Clarmy.tga:28:28",
["cmonBruh"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\cmonBruh.tga:28:28",
["CoolCat"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\CoolCat.tga:28:28",
["CoolStoryBob"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\CoolStoryBob.tga:28:28",
["copyThis"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\copyThis.tga:28:28",
["CorgiDerp"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\CorgiDerp.tga:28:28",
["DAESuppy"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\DAESuppy.tga:28:28",
["DansGame"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\DansGame.tga:28:28",
["DatSheffy"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\DatSheffy.tga:28:28",
["DBstyle"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\DBstyle.tga:28:28",
["DendiFace"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\DendiFace.tga:28:28",
["DogFace"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\DogFace.tga:28:28",
["DoritosChip"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\DoritosChip.tga:28:28",
["duDudu"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\duDudu.tga:28:28",
["DxAbomb"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\DxAbomb.tga:28:28",
["DxCat"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\DxCat.tga:28:28",
["EagleEye"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\EagleEye.tga:28:28",
["EleGiggle"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\EleGiggle.tga:28:28",
["FailFish"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\FailFish.tga:28:28",
["FPSMarksman"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\FPSMarksman.tga:28:28",
["FrankerZ"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\FrankerZ.tga:28:56",
["FreakinStinkin"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\FreakinStinkin.tga:28:28",
["FUNgineer"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\FUNgineer.tga:28:28",
["FunRun"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\FunRun.tga:28:28",
["FutureMan"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\FutureMan.tga:28:28",
["GingerPower"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\GingerPower.tga:28:28",
["GivePLZ"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\GivePLZ.tga:28:28",
["GOWSkull"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\GOWSkull.tga:28:28",
["GrammarKing"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\GrammarKing.tga:28:28",
["HassaanChop"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\HassaanChop.tga:28:28",
["HassanChop"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\HassanChop.tga:28:28",
["HeyGuys"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\HeyGuys.tga:28:28",
["HotPokket"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\HotPokket.tga:28:28",
["HumbleLife"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\HumbleLife.tga:28:28",
["imGlitch"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\imGlitch.tga:28:28",
["InuyoFace"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\InuyoFace.tga:28:28",
["ItsBoshyTime"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\ItsBoshyTime.tga:28:28",
["Jebaited"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\Jebaited.tga:28:28",
["JKanStyle"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\JKanStyle.tga:28:28",
["JonCarnage"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\JonCarnage.tga:28:28",
["KAPOW"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\KAPOW.tga:28:28",
["Kappa"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\Kappa.tga:28:28",
["KappaClaus"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\KappaClaus.tga:28:28",
["KappaPride"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\KappaPride.tga:28:28",
["KappaRoss"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\KappaRoss.tga:28:28",
["KappaWealth"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\KappaWealth.tga:28:28",
["Keepo"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\Keepo.tga:28:28",
["KevinTurtle"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\KevinTurtle.tga:28:28",
["Kippa"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\Kippa.tga:28:28",
["Kreygasm"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\Kreygasm.tga:28:28",
["Mau5"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\Mau5.tga:28:28",
["mcaT"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\mcaT.tga:28:28",
["MikeHogu"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\MikeHogu.tga:28:28",
["MingLee"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\MingLee.tga:28:28",
["MorphinTime"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\MorphinTime.tga:28:28",
["MrDestructoid"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\MrDestructoid.tga:28:28",
["MVGame"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\MVGame.tga:28:28",
["NerfBlueBlaster"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\NerfBlueBlaster.tga:28:28",
["NerfRedBlaster"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\NerfRedBlaster.tga:28:28",
["NinjaGrumpy"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\NinjaGrumpy.tga:28:28",
["NomNom"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\NomNom.tga:28:28",
["NotAtk"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\NotAtk.tga:28:28",
["NotLikeThis"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\NotLikeThis.tga:28:28",
["OhMyDog"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\OhMyDog.tga:28:28",
["OneHand"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\OneHand.tga:28:28",
["OpieOP"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\OpieOP.tga:28:28",
["OptimizePrime"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\OptimizePrime.tga:28:28",
["OSfrog"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\OSfrog.tga:28:28",
["OSkomodo"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\OSkomodo.tga:28:28",
["OSsloth"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\OSsloth.tga:28:28",
["panicBasket"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\panicBasket.tga:28:28",
["PanicVis"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\PanicVis.tga:28:28",
["PartyTime"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\PartyTime.tga:28:28",
["pastaThat"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\pastaThat.tga:28:28",
["PeoplesChamp"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\PeoplesChamp.tga:28:28",
["PermaSmug"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\PermaSmug.tga:28:28",
["PeteZaroll"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\PeteZaroll.tga:28:28",
["PeteZarollTie"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\PeteZarollTie.tga:28:28",
["PicoMause"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\PicoMause.tga:28:28",
["PipeHype"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\PipeHype.tga:28:28",
["PJSalt"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\PJSalt.tga:28:28",
["PJSugar"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\PJSugar.tga:28:28",
["PMSTwin"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\PMSTwin.tga:28:28",
["PogChamp"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\PogChamp.tga:28:28",
["Poooound"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\Poooound.tga:28:28",
["PraiseIt"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\PraiseIt.tga:28:28",
["PRChase"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\PRChase.tga:28:28",
["PrimeMe"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\PrimeMe.tga:28:28",
["PunchTrees"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\PunchTrees.tga:28:28",
["PunOko"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\PunOko.tga:28:28",
["RaccAttack"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\RaccAttack.tga:28:28",
["RalpherZ"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\RalpherZ.tga:28:28",
["RedCoat"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\RedCoat.tga:28:28",
["ResidentSleeper"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\ResidentSleeper.tga:28:28",
["riPepperonis"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\riPepperonis.tga:28:28",
["RitzMitz"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\RitzMitz.tga:28:28",
["RlyTho"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\RlyTho.tga:28:28",
["RuleFive"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\RuleFive.tga:28:28",
["SabaPing"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\SabaPing.tga:28:28",
["SeemsGood"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\SeemsGood.tga:28:28",
["ShadyLulu"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\ShadyLulu.tga:28:28",
["ShazBotstix"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\ShazBotstix.tga:28:28",
["SmoocherZ"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\SmoocherZ.tga:28:28",
["SMOrc"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\SMOrc.tga:28:28",
["SoBayed"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\SoBayed.tga:28:28",
["SoonerLater"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\SoonerLater.tga:28:28",
["SSSsss"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\SSSsss.tga:28:28",
["StinkyCheese"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\StinkyCheese.tga:28:28",
["StoneLightning"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\StoneLightning.tga:28:28",
["StrawBeary"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\StrawBeary.tga:28:28",
["SuperVinlin"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\SuperVinlin.tga:28:28",
["SwiftRage"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\SwiftRage.tga:28:28",
["TakeNRG"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\TakeNRG.tga:28:28",
["TBAngel"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\TBAngel.tga:28:28",
["TBCheesePull"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\TBCheesePull.tga:28:28",
["TBTacoLeft"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\TBTacoLeft.tga:28:28",
["TBTacoRight"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\TBTacoRight.tga:28:28",
["TearGlove"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\TearGlove.tga:28:28",
["TehePelo"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\TehePelo.tga:28:28",
["TF2John"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\TF2John.tga:28:28",
["ThankEgg"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\ThankEgg.tga:28:28",
["TheIlluminati"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\TheIlluminati.tga:28:28",
["TheRinger"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\TheRinger.tga:28:28",
["TheTarFu"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\TheTarFu.tga:28:28",
["TheThing"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\TheThing.tga:28:28",
["ThunBeast"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\ThunBeast.tga:28:28",
["TinyFace"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\TinyFace.tga:28:28",
["TooSpicy"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\TooSpicy.tga:28:28",
["TriHard"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\TriHard.tga:28:28",
["TTours"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\TTours.tga:28:28",
["twitchRaid"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\twitchRaid.tga:28:28",
["TwitchRPG"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\TwitchRPG.tga:28:28",
["UncleNox"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\UncleNox.tga:28:28",
["UnSane"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\UnSane.tga:28:28",
["UWot"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\UWot.tga:28:28",
["VoHiYo"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\VoHiYo.tga:28:28",
["VoteNay"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\VoteNay.tga:28:28",
["VoteYea"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\VoteYea.tga:28:28",
["WholeWheat"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\WholeWheat.tga:28:28",
["WTRuck"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\WTRuck.tga:28:28",
["WutFace"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\WutFace.tga:28:28",
["YouDontSay"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\YouDontSay.tga:28:28",
["YouWHY"]="Interface\\AddOns\\TwitchEmotes\\TwitchTV\\YouWHY.tga:28:28",
-- witwix
["wix1"]="Interface\\AddOns\\TwitchEmotes\\witwix\\wix1.tga:28:28",
["wix2"]="Interface\\AddOns\\TwitchEmotes\\witwix\\wix2.tga:28:28",
["wix3"]="Interface\\AddOns\\TwitchEmotes\\witwix\\wix3.tga:28:28",
["wix4"]="Interface\\AddOns\\TwitchEmotes\\witwix\\wix4.tga:28:28",
["wixAyyLmar"]="Interface\\AddOns\\TwitchEmotes\\witwix\\wixAyyLmar.tga:28:28",
["wixB"]="Interface\\AddOns\\TwitchEmotes\\witwix\\wixB.tga:28:28",
["wixBlind"]="Interface\\AddOns\\TwitchEmotes\\witwix\\wixBlind.tga:28:28",
["wixBod"]="Interface\\AddOns\\TwitchEmotes\\witwix\\wixBod.tga:28:28",
["wixBowsey"]="Interface\\AddOns\\TwitchEmotes\\witwix\\wixBowsey.tga:28:28",
["wixBrix"]="Interface\\AddOns\\TwitchEmotes\\witwix\\wixBrix.tga:28:28",
["wixCheese"]="Interface\\AddOns\\TwitchEmotes\\witwix\\wixCheese.tga:28:28",
["wixD"]="Interface\\AddOns\\TwitchEmotes\\witwix\\wixD.tga:28:28",
["wixDankey"]="Interface\\AddOns\\TwitchEmotes\\witwix\\wixDankey.tga:28:28",
["wixGold"]="Interface\\AddOns\\TwitchEmotes\\witwix\\wixGold.tga:28:28",
["wixH"]="Interface\\AddOns\\TwitchEmotes\\witwix\\wixH.tga:28:28",
["wixHA"]="Interface\\AddOns\\TwitchEmotes\\witwix\\wixHA.tga:28:28",
["wixHassanCop"]="Interface\\AddOns\\TwitchEmotes\\witwix\\wixHassanCop.tga:28:28",
["wixK"]="Interface\\AddOns\\TwitchEmotes\\witwix\\wixK.tga:28:28",
["wixL"]="Interface\\AddOns\\TwitchEmotes\\witwix\\wixL.tga:28:28",
["wixLUL"]="Interface\\AddOns\\TwitchEmotes\\witwix\\wixLUL.tga:28:28",
["wixMagoo"]="Interface\\AddOns\\TwitchEmotes\\witwix\\wixMagoo.tga:28:28",
["wixMerio"]="Interface\\AddOns\\TwitchEmotes\\witwix\\wixMerio.tga:28:28",
["wixMini"]="Interface\\AddOns\\TwitchEmotes\\witwix\\wixMini.tga:28:28",
["wixNis"]="Interface\\AddOns\\TwitchEmotes\\witwix\\wixNis.tga:28:28",
["wixR"]="Interface\\AddOns\\TwitchEmotes\\witwix\\wixR.tga:28:28",
["wixSanic"]="Interface\\AddOns\\TwitchEmotes\\witwix\\wixSanic.tga:28:28",
["wixSkerp"]="Interface\\AddOns\\TwitchEmotes\\witwix\\wixSkerp.tga:28:28",
["wixT"]="Interface\\AddOns\\TwitchEmotes\\witwix\\wixT.tga:28:28",
["wixW1"]="Interface\\AddOns\\TwitchEmotes\\witwix\\wixW1.tga:28:28",
["wixW2"]="Interface\\AddOns\\TwitchEmotes\\witwix\\wixW2.tga:28:28",
["wixW3"]="Interface\\AddOns\\TwitchEmotes\\witwix\\wixW3.tga:28:28",
["wixW4"]="Interface\\AddOns\\TwitchEmotes\\witwix\\wixW4.tga:28:28",
["wixWeeb"]="Interface\\AddOns\\TwitchEmotes\\witwix\\wixWeeb.tga:28:28",
["wixWerio"]="Interface\\AddOns\\TwitchEmotes\\witwix\\wixWerio.tga:28:28",
["wixZaldo"]="Interface\\AddOns\\TwitchEmotes\\witwix\\wixZaldo.tga:28:28",
};
local emoticons={
-- AdmiralBulldog
["admiral1"]="admiral1",
["admiral2"]="admiral2",
["admiral3"]="admiral3",
["admiral4"]="admiral4",
["admiral6"]="admiral6",
["admiralAlfredo"]="admiralAlfredo",
["admiralBackpack"]="admiralBackpack",
["admiralBanana"]="admiralBanana",
["admiralCS"]="admiralCS",
["admiralDong"]="admiralDong",
["admiralDream"]="admiralDream",
["admiralFedora"]="admiralFedora",
["admiralFeels"]="admiralFeels",
["admiralGame"]="admiralGame",
["admiralHappy"]="admiralHappy",
["admiralHug"]="admiralHug",
["admiralKristin"]="admiralKristin",
["admiralNox"]="admiralNox",
["admiralPleb"]="admiralPleb",
["admiralRapira"]="admiralRapira",
["admiralS4"]="admiralS4",
["admiralSexy"]="admiralSexy",
["admiralSkadoosh"]="admiralSkadoosh",
["admiralTI"]="admiralTI",
["admiralW"]="admiralW",
-- Alkaizerx
["alkFax"]="alkFax",
["alkGuku"]="alkGuku",
["alkKayo"]="alkKayo",
["alkKrill"]="alkKrill",
["alkPeasemo"]="alkPeasemo",
["alkSuper"]="alkSuper",
["alkPlastic"]="alkPlastic",
["alkUpset"]="alkUpset",
["alkW1"]="alkW1",
["alkW2"]="alkW2",
["alkW3"]="alkW3",
["alkW4"]="alkW4",
["alkW5"]="alkW5",
["alkW6"]="alkW6",
["alkXD"]="alkXD",
-- AndyMilonakis
["amiloAmazing"]="amiloAmazing",
["amiloAnnoyed"]="amiloAnnoyed",
["amiloBars"]="amiloBars",
["amiloCallers"]="amiloCallers",
["amiloCrackhead"]="amiloCrackhead",
["amiloDerp"]="amiloDerp",
["amiloFeels"]="amiloFeels",
["amiloGasm"]="amiloGasm",
["amiloGOAT"]="amiloGOAT",
["amiloHeyGuys"]="amiloHeyGuys",
["amiloIcedT"]="amiloIcedT",
["amiloLeaked"]="amiloLeaked",
["amiloLeech"]="amiloLeech",
["amiloLive"]="amiloLive",
["amiloLul"]="amiloLul",
["amiloMeow"]="amiloMeow",
["amiloPhoto"]="amiloPhoto",
["amiloRage"]="amiloRage",
["amiloRip"]="amiloRip",
["amiloRun"]="amiloRun",
["amiloSabaPride"]="amiloSabaPride",
["amiloSaved"]="amiloSaved",
["amiloStare"]="amiloStare",
["amiloTriheart"]="amiloTriheart",
["amiloWut"]="amiloWut",	
-- AnneMunation
["anneHeart"]="anneHeart",
-- AvoidingThePuddle
["atp1000"]="atp1000",
["atpChar"]="atpChar",
["atpCop"]="atpCop",
["atpDog"]="atpDog",
["atpFeelsBeardMan"]="atpFeelsBeardMan",
["atpGasm"]="atpGasm",
["atpHorns"]="atpHorns",
["atpIzza"]="atpIzza",
["atpLaw"]="atpLaw",
["atpLook"]="atpLook",
["atpRtsd"]="atpRtsd",
["atpRtsd1"]="atpRtsd1",
["atpRtsd2"]="atpRtsd2",
["atpRtsd3"]="atpRtsd3",
["atpRtsd4"]="atpRtsd4",
["atpShh"]="atpShh",
["atpSolid"]="atpSolid",
["atpStude"]="atpStude",
["atpToiler"]="atpToiler",
["atpWind"]="atpWind",
-- BobRoss
["bobrossBeli"]="bobrossBeli",
["bobrossBrush"]="bobrossBrush",
["bobrossCabin"]="bobrossCabin",
["bobrossCanvas"]="bobrossCanvas",
["bobrossCanvasA"]="bobrossCanvasA",
["bobrossCanvasB"]="bobrossCanvasB",
["bobrossCanvasH"]="bobrossCanvasH",
["bobrossCanvasP"]="bobrossCanvasP",
["bobrossChamp"]="bobrossChamp",
["bobrossCloud"]="bobrossCloud",
["bobrossCool"]="bobrossCool",
["bobrossEve"]="bobrossEve",
["bobrossFan"]="bobrossFan",
["bobrossFence"]="bobrossFence",
["bobrossFree"]="bobrossFree",
["bobrossGG"]="bobrossGG",
["bobrossHappy"]="bobrossHappy",
["bobrossKappaR"]="bobrossKappaR",
["bobrossMeta"]="bobrossMeta",
["bobrossMini"]="bobrossMini",
["bobrossMnt"]="bobrossMnt",
["bobrossNED"]="bobrossNED",
["bobrossOPKnife"]="bobrossOPKnife",
["bobrossPal"]="bobrossPal",
["bobrossRUI"]="bobrossRUI",
["bobrossSaved"]="bobrossSaved",
["bobrossSq"]="bobrossSq",
["bobrossTap"]="bobrossTap",
["bobrossTree"]="bobrossTree",
["bobrossVHS"]="bobrossVHS",
-- BTTV+FFZ
["bUrself"]="bUrself",
["CiGrip"]="CiGrip",
["ConcernDoge"]="ConcernDoge",
["DogeWitIt"]="DogeWitIt",
["FapFapFap"]="FapFapFap",
["FeelsAmazingMan"]="FeelsAmazingMan",
["FeelsBadMan"]="FeelsBadMan",
["FeelsBirthdayMan"]="FeelsBirthdayMan",
["FeelsDutchMan"]="FeelsDutchMan",
["FeelsGoodMan"]="FeelsGoodMan",
["FeelsOkayMan"]="FeelsOkayMan",
["FeelsPumpkinMan"]="FeelsPumpkinMan",
["FeelsSnowMan"]="FeelsSnowMan",
["FeelsSnowyMan"]="FeelsSnowyMan",
["FeelsTired"]="FeelsTired",
["FeelsWeirdMan"]="FeelsWeirdMan",
["FishMoley"]="FishMoley",
["ForeverAlone"]="ForeverAlone",
["forsenC"]="forsenC",
["FuckYea"]="FuckYea",
["GabeN"]="GabeN",
["gachiGASM"]="gachiGASM",
["haHAA"]="haHAA",
["HerbPerve"]="HerbPerve",
["Hhhehehe"]="Hhhehehe",
["Kaged"]="Kaged",
["KKona"]="KKona",
["Krappa"]="Krappa",
["LUL"]="LUL",
["LULW"]="LULW",
["MEGALUL"]="MEGALUL",
["monkaS"]="monkaS",
["nanoMEGA"]="nanoMEGA",
["OMEGALUL"]="OMEGALUL",
["PagChomp"]="PagChomp",
["VapeNation"]="VapeNation",
["ZULUL"]="ZULUL",
-- cdewx
["dewD"]="dewD",
["dewDitch"]="dewDitch",
["dewDogs"]="dewDogs",
["dewEnergy"]="dewEnergy",
["dewG"]="dewG",
["dewKass"]="dewKass",
["dewLove"]="dewLove",
["dewLUL"]="dewLUL",
["dewMethod"]="dewMethod",
["dewMLG"]="dewMLG",
["dewPleb"]="dewPleb",
["dewRage"]="dewRage",
["dewRise"]="dewRise",
["dewS"]="dewS",
["dewSell"]="dewSell",
["dewTrig"]="dewTrig",
["dewVod"]="dewVod",
["dewW"]="dewW",
["dewWhip"]="dewWhip",
["dewYo"]="dewYo",
-- Custom
["chupBro"]="chupBro",
["chupDerp"]="chupDerp",
["chupHappy"]="chupHappy",
["dele"]="dele",
["dele,"]="dele,",
["dele's"]="dele's",
["Dele"]="Dele",
["Dele,"]="Dele,",
["Dele's"]="Dele's",
["endANELE"]="endANELE",
["endBomb"]="endBomb",
["endCreep"]="endCreep",
["endDawg"]="endDawg",
["endFrench"]="endFrench",
["endHarambe"]="endHarambe",
["endKyori"]="endKyori",
["endNotLikeThis"]="endNotLikeThis",
["endReee"]="endReee",
["endRP"]="endRP",
["endTrump"]="endTrump",
["marcithDerp"]="marcithDerp",
["marcithMath"]="marcithMath",
-- DansGaming
["dan7"]="dan7",
["dan10"]="dan10",
["danBad"]="danBad",
["danBoy"]="danBoy",
["danCreep"]="danCreep",
["danCringe"]="danCringe",
["danCry"]="danCry",
["danCute"]="danCute",
["danDead"]="danDead",
["danDerp"]="danDerp",
["danDuck"]="danDuck",
["danGasm"]="danGasm",
["danGasp"]="danGasp",
["danGOTY"]="danGOTY",
["danGrump"]="danGrump",
["danHype"]="danHype",
["danLewd"]="danLewd",
["danLol"]="danLol",
["danLove"]="danLove",
["danNo"]="danNo",
["danPalm"]="danPalm",
["danPoop"]="danPoop",
["danPuzzle"]="danPuzzle",
["danRage"]="danRage",
["danRekt"]="danRekt",
["danSad"]="danSad",
["danScare"]="danScare",
["danSexy"]="danSexy",
["danTen"]="danTen",
["danThink"]="danThink",
["danTrain"]="danTrain",
["danWave"]="danWave",
["danWTF"]="danWTF",
["danYay"]="danYay",
["danYes"]="danYes",
-- Ducksauce
["duckArthas"]="duckArthas",
["duckBA"]="duckBA",
["duckBarrel"]="duckBarrel",
["duckBedHead"]="duckBedHead",
["duckBoop"]="duckBoop",
["duckCoffee"]="duckCoffee",
["duckDerp"]="duckDerp",
["duckDuckFlex"]="duckDuckFlex",
["duckGA"]="duckGA",
["duckMama"]="duckMama",
["duckParty"]="duckParty",
["duckPist"]="duckPist",
["duckQuappa"]="duckQuappa",
["duckSad"]="duckSad",
["duckSkadoosh"]="duckSkadoosh",
["duckSpread"]="duckSpread",
["duckTenTen"]="duckTenTen",
["duckTrain"]="duckTrain",
["duckZIN"]="duckZIN",
-- EGazael
["azaConrad"]="azaConrad",
["azaDRAIN"]="azaDRAIN",
["azaERASED"]="azaERASED",
["azaFox"]="azaFox",
["azaHAPPY"]="azaHAPPY",
["azaHHH"]="azaHHH",
["azaMAD"]="azaMAD",
["azaRAT"]="azaRAT",
-- Emojis
["emGun"]="emGun",
["emThinking"]="emThinking",
-- EternaLEnVyy
["envyKappa"]="envyKappa",
["envyKeikaku"]="envyKeikaku",
["envyOK"]="envyOK",
["envyStick"]="envyStick",
["envySwag"]="envySwag",
["envyW"]="envyW",
["envyWeLost"]="envyWeLost",
["envyWeWon"]="envyWeWon",
-- Forsenlol
["forsen1"]="forsen1",
["forsen2"]="forsen2",
["forsen3"]="forsen3",
["forsen4"]="forsen4",
["forsenBanned"]="forsenBanned",
["forsenBoys"]="forsenBoys",
["forsenClown"]="forsenClown",
["forsenCpooky"]="forsenCpooky",
["forsenDDK"]="forsenDDK",
["forsenDED"]="forsenDED",
["forsenDiglett"]="forsenDiglett",
["forsenOP"]="forsenOP",
["forsenE"]="forsenE",
["forsenEmote"]="forsenEmote",
["forsenEmote2"]="forsenEmote2",
["forsenFajita"]="forsenFajita",
["forsenFeels"]="forsenFeels",
["forsenGun"]="forsenGun",
["forsenH"]="forsenH",
["forsenHorsen"]="forsenHorsen",
["forsenIQ"]="forsenIQ",
["forsenKnife"]="forsenKnife",
["forsenLewd"]="forsenLewd",
["forsenLooted"]="forsenLooted",
["forsenLUL"]="forsenLUL",
["forsenMoney"]="forsenMoney",
["forsenMonkey"]="forsenMonkey",
["forsenO"]="forsenO",
["forsenODO"]="forsenODO",
["forsenOG"]="forsenOG",
["forsenPepe"]="forsenPepe",
["forsenPuke"]="forsenPuke",
["forsenPuke2"]="forsenPuke2",
["forsenPuke3"]="forsenPuke3",
["forsenPuke4"]="forsenPuke4",
["forsenR"]="forsenR",
["forsenRP"]="forsenRP",
["forsenSambool"]="forsenSambool",
["forsenSheffy"]="forsenSheffy",
["forsenSkip"]="forsenSkip",
["forsenSleeper"]="forsenSleeper",
["forsenSS"]="forsenSS",
["forsenStein"]="forsenStein",
["forsenSwag"]="forsenSwag",
["forsenTriggered"]="forsenTriggered",
["forsenW"]="forsenW",
["forsenWhip"]="forsenWhip",
["forsenWut"]="forsenWut",
["forsenX"]="forsenX",
-- Hirona
["hiroCry"]="hiroCry",
["hiroDerp"]="hiroDerp",
["hiroH"]="hiroH",
["hiroHail"]="hiroHail",
["hiroNo"]="hiroNo",
["hiroP"]="hiroP",
["hiroWave"]="hiroWave",
["hiroWtf"]="hiroWtf",
-- Hydramist
["hydraChamp"]="hydraChamp",
["hydraFoot"]="hydraFoot",
["hydraHEIL"]="hydraHEIL",
["hydraLUNA"]="hydraLUNA",
["hydraMURAT"]="hydraMURAT",
["hydraPURPLE"]="hydraPURPLE",
["hydraRUSSIA"]="hydraRUSSIA",
["hydraSquare"]="hydraSquare",
["hydraXMAS"]="hydraXMAS",
-- imaqtpie
["qtp1"]="qtp1",
["qtp2"]="qtp2",
["qtp2ND"]="qtp2ND",
["qtp3"]="qtp3",
["qtp4"]="qtp4",
["qtpA"]="qtpA",
["qtpB"]="qtpB",
["qtpBAKED"]="qtpBAKED",
["qtpBLESSED"]="qtpBLESSED",
["qtpBOOSTED"]="qtpBOOSTED",
["qtpBOT"]="qtpBOT",
["qtpCOOL"]="qtpCOOL",
["qtpCULLED"]="qtpCULLED",
["qtpDAPPER"]="qtpDAPPER",
["qtpDONG"]="qtpDONG",
["qtpEDGE"]="qtpEDGE",
["qtpFEELS"]="qtpFEELS",
["qtpGIVE"]="qtpGIVE",
["qtpHAHAA"]="qtpHAHAA",
["qtpHEART"]="qtpHEART",
["qtpHEHE"]="qtpHEHE",
["qtpHONK"]="qtpHONK",
["qtpKAWAII"]="qtpKAWAII",
["qtpLEMONKEY"]="qtpLEMONKEY",
["qtpLIT"]="qtpLIT",
["qtpLUCIAN"]="qtpLUCIAN",
["qtpLUL"]="qtpLUL",
["qtpMEME"]="qtpMEME",
["qtpMEW"]="qtpMEW",
["qtpMOIST"]="qtpMOIST",
["qtpNLT"]="qtpNLT",
["qtpNO"]="qtpNO",
["qtpOWO"]="qtpOWO",
["qtpPAID"]="qtpPAID",
["qtpPLEB"]="qtpPLEB",
["qtpPOTATO"]="qtpPOTATO",
["qtpSMORC"]="qtpSMORC",
["qtpSPOOKED"]="qtpSPOOKED",
["qtpSPOOKY"]="qtpSPOOKY",
["qtpSTFU"]="qtpSTFU",
["qtpSWAG"]="qtpSWAG",
["qtpTHINKING"]="qtpTHINKING",
["qtpTHUMP"]="qtpTHUMP",
["qtpTILT"]="qtpTILT",
["qtpURGOD"]="qtpURGOD",
["qtpUSA"]="qtpUSA",
["qtpW"]="qtpW",
["qtpWAVE"]="qtpWAVE",
["qtpWEEB"]="qtpWEEB",
["qtpWHAT"]="qtpWHAT",
-- Lauren07
["laurGasm"]="laurGasm",
["laurHey"]="laurHey",
["laurHic"]="laurHic",
["laurLove"]="laurLove",
["laurMeow"]="laurMeow",
["laurRage"]="laurRage",
["laurThump"]="laurThump",
["laurWat"]="laurWat",
-- Lirik
["lirikA"]="lirikA",
["lirikAppa"]="lirikAppa",
["lirikBB"]="lirikBB",
["lirikBLIND"]="lirikBLIND",
["lirikC"]="lirikC",
["lirikCHAMP"]="lirikCHAMP",
["lirikCLAP"]="lirikCLAP",
["lirikCLENCH"]="lirikCLENCH",
["lirikCRASH"]="lirikCRASH",
["lirikDJ"]="lirikDJ",
["lirikF"]="lirikF",
["lirikFAKE"]="lirikFAKE",
["lirikFEELS"]="lirikFEELS",
["lirikFR"]="lirikFR",
["lirikGasm"]="lirikGasm",
["lirikGOTY"]="lirikGOTY",
["lirikGREAT"]="lirikGREAT",
["lirikH"]="lirikH",
["lirikHOLD"]="lirikHOLD",
["lirikHug"]="lirikHug",
["lirikHYPE"]="lirikHYPE",
["lirikL"]="lirikL",
["lirikLEAN"]="lirikLEAN",
["lirikLEWD"]="lirikLEWD",
["lirikLOOT"]="lirikLOOT",
["lirikLUL"]="lirikLUL",
["lirikMLG"]="lirikMLG",
["lirikN"]="lirikN",
["lirikNICE"]="lirikNICE",
["lirikNON"]="lirikNON",
["lirikNOT"]="lirikNOT",
["lirikO"]="lirikO",
["lirikOBESE"]="lirikOBESE",
["lirikOHGOD"]="lirikOHGOD",
["lirikOK"]="lirikOK",
["lirikP"]="lirikP",
["lirikPOOL"]="lirikPOOL",
["lirikPOOP"]="lirikPOOP",
["lirikPUKE"]="lirikPUKE",
["lirikREKT"]="lirikREKT",
["lirikRIP"]="lirikRIP",
["lirikS"]="lirikS",
["lirikSALT"]="lirikSALT",
["lirikSCARED"]="lirikSCARED",
["lirikSHUCKS"]="lirikSHUCKS",
["lirikSMART"]="lirikSMART",
["lirikTEN"]="lirikTEN",
["lirikTENK"]="lirikTENK",
["lirikThump"]="lirikThump",
["lirikW"]="lirikW",
-- Pandamonium
["chingAus"]="chingAus",
["chingBday"]="chingBday",
["chingBig"]="chingBig",
["chingBinbash"]="chingBinbash",
["chingBomb"]="chingBomb",
["chingEdge"]="chingEdge",
["chingFace"]="chingFace",
["chingHype"]="chingHype",
["chingJail"]="chingJail",
["chingMaiku"]="chingMaiku",
["chingMod"]="chingMod",
["chingMoney"]="chingMoney",
["chingPanda"]="chingPanda",
["chingPotato"]="chingPotato",
["chingS"]="chingS",
["chingSense"]="chingSense",
["chingSub"]="chingSub",
["chingTgi"]="chingTgi",
["chingTroll"]="chingTroll",
["chingW"]="chingW",
-- Quin69
["quinBoss"]="quinBoss",
["quinBot"]="quinBot",
["quinBully"]="quinBully",
["quinC"]="quinC",
["quinD"]="quinD",
["quinDOIT"]="quinDOIT",
["quinDom"]="quinDom",
["quinGun"]="quinGun",
["quinHappy"]="quinHappy",
["quinJesus"]="quinJesus",
["quinJudy"]="quinJudy",
["quinJuice"]="quinJuice",
["quinL"]="quinL",
["quinLeech"]="quinLeech",
["quinMask"]="quinMask",
["quinPaca"]="quinPaca",
["quinPalm"]="quinPalm",
["quinPukana"]="quinPukana",
["quinR"]="quinR",
["quinRat"]="quinRat",
["quinSplat"]="quinSplat",
["quinThump"]="quinThump",
["quinTip"]="quinTip",
["quinWtf"]="quinWtf",
["quinWut"]="quinWut",
-- Summit1g
["sum1g"]="sum1g",
["sum100"]="sum100",
["sumAbby"]="sumAbby",
["sumAyo"]="sumAyo",
["sumBag"]="sumBag",
["sumBlind"]="sumBlind",
["sumBuhblam"]="sumBuhblam",
["sumCrash"]="sumCrash",
["sumCreeper"]="sumCreeper",
["sumDerp"]="sumDerp",
["sumDesi"]="sumDesi",
["sumFail"]="sumFail",
["sumFood"]="sumFood",
["sumFuse"]="sumFuse",
["sumGasm"]="sumGasm",
["sumGG"]="sumGG",
["sumGodflash"]="sumGodflash",
["sumHassan"]="sumHassan",
["sumHassin"]="sumHassin",
["sumHorse"]="sumHorse",
["sumLove"]="sumLove",
["sumMolly"]="sumMolly",
["sumOhface"]="sumOhface",
["sumOrc"]="sumOrc",
["sumOreo"]="sumOreo",
["sumPluto"]="sumPluto",
["sumPotato"]="sumPotato",
["sumPuzzle"]="sumPuzzle",
["sumRage"]="sumRage",
["sumRekt"]="sumRekt",
["sumRip"]="sumRip",
["sumStache"]="sumStache",
["sumSuh"]="sumSuh",
["sumSwag"]="sumSwag",
["sumThump"]="sumThump",
["sumUp"]="sumUp",
["sumVac"]="sumVac",
["sumVac2"]="sumVac2",
["sumW"]="sumW",
["sumWhat"]="sumWhat",
["sumWTF"]="sumWTF",
["sumWut"]="sumWut",
-- TwitchPresents
["tpAIYIYI"]="tpAIYIYI",
["tpBlack"]="tpBlack",
["tpBaboo"]="tpBaboo",
["tpBLBLBL"]="tpBLBLBL",
["tpBlue"]="tpBlue",
["toBulk"]="tpBulk",
["tpFree"]="tpFree",
["tpFX1"]="tpFX1",
["tpGG"]="tpGG",
["tpGreen"]="tpGreen",
["tpHeresTommy"]="tpHeresTommy",
["tpLokar"]="tpLokar",
["tpNasus"]="tpNasus",
["tpPink"]="tpPink",
["tpRed"]="tpRed",
["tpSquatt"]="tpSquatt",
["tpWhite"]="tpWhite",
["tpYellow"]="tpYellow",
["tpZedd"]="tpZedd",
-- TwitchTV
["4Head"]="4Head",
["AMPEnergy"]="AMPEnergy",
["AMPEnergyCherry"]="AMPEnergyCherry",
["AMPTropPunch"]="AMPTropPunch",
["ANELE"]="ANELE",
["anneHeart"]="anneHeart",
["ArgieB8"]="ArgieB8",
["ArigatoNas"]="ArigatoNas",
["ArsonNoSexy"]="ArsonNoSexy",
["AsianGlow"]="AsianGlow",
["BabyRage"]="BabyRage",
["BasedGod"]="BasedGod",
["Batappa"]="Batappa",
["BatChest"]="BatChest",
["BCouch"]="BCouch",
["BCWarrior"]="BCWarrior",
["BegWan"]="BegWan",
["BibleThump"]="BibleThump",
["BigBrother"]="BigBrother",
["BigPhish"]="BigPhish",
["BionicBunion"]="BionicBunion",
["BlargNaut"]="BlargNaut",
["bleedPurple"]="bleedPurple",
["BlessRNG"]="BlessRNG",
["BloodTrail"]="BloodTrail",
["BrainSlug"]="BrainSlug",
["BrokeBack"]="BrokeBack",
["BudBlast"]="BudBlast",
["BuddhaBar"]="BuddhaBar",
["BudStar"]="BudStar",
["CarlSmile"]="CarlSmile",
["ChefFrank"]="ChefFrank",
["Clarmy"]="Clarmy",
["cmonBruh"]="cmonBruh",
["CoolCat"]="CoolCat",
["CoolStoryBob"]="CoolStoryBob",
["copyThis"]="copyThis",
["CorgiDerp"]="CorgiDerp",
["DAESuppy"]="DAESuppy",
["DansGame"]="DansGame",
["DatSheffy"]="DatSheffy",
["DBstyle"]="DBstyle",
["DendiFace"]="DendiFace",
["DogFace"]="DogFace",
["DoritosChip"]="DoritosChip",
["duDudu"]="duDudu",
["DxAbomb"]="DxAbomb",
["DxCat"]="DxCat",
["EagleEye"]="EagleEye",
["EleGiggle"]="EleGiggle",
["FailFish"]="FailFish",
["FPSMarksman"]="FPSMarksman",
["FrankerZ"]="FrankerZ",
["FreakinStinkin"]="FreakinStinkin",
["FUNgineer"]="FUNgineer",
["FunRun"]="FunRun",
["FutureMan"]="FutureMan",
["GingerPower"]="GingerPower",
["GivePLZ"]="GivePLZ",
["GOWSkull"]="GOWSkull",
["GrammarKing"]="GrammarKing",
["HassaanChop"]="HassaanChop",
["HassanChop"]="HassanChop",
["HeyGuys"]="HeyGuys",
["HotPokket"]="HotPokket",
["HumbleLife"]="HumbleLife",
["imGlitch"]="imGlitch",
["InuyoFace"]="InuyoFace",
["ItsBoshyTime"]="ItsBoshyTime",
["Jebaited"]="Jebaited",
["JKanStyle"]="JKanStyle",
["JonCarnage"]="JonCarnage",
["KAPOW"]="KAPOW",
["Kappa"]="Kappa",
["KappaClaus"]="KappaClaus",
["KappaPride"]="KappaPride",
["KappaRoss"]="KappaRoss",
["KappaWealth"]="KappaWealth",
["Keepo"]="Keepo",
["KevinTurtle"]="KevinTurtle",
["Kippa"]="Kippa",
["Kreygasm"]="Kreygasm",
["Mau5"]="Mau5",
["mcaT"]="mcaT",
["MikeHogu"]="MikeHogu",
["MingLee"]="MingLee",
["MorphinTime"]="MorphinTime",
["MrDestructoid"]="MrDestructoid",
["MVGame"]="MVGame",
["NerfBlueBlaster"]="NerfBlueBlaster",
["NerfRedBlaster"]="NerfRedBlaster",
["NinjaGrumpy"]="NinjaGrumpy",
["NomNom"]="NomNom",
["NotAtk"]="NotAtk",
["NotLikeThis"]="NotLikeThis",
["OhMyDog"]="OhMyDog",
["OneHand"]="OneHand",
["OpieOP"]="OpieOP",
["OptimizePrime"]="OptimizePrime",
["OSfrog"]="OSfrog",
["OSkomodo"]="OSkomodo",
["OSsloth"]="OSsloth",
["panicBasket"]="panicBasket",
["PanicVis"]="PanicVis",
["PartyTime"]="PartyTime",
["pastaThat"]="pastaThat",
["PeoplesChamp"]="PeoplesChamp",
["PermaSmug"]="PermaSmug",
["PeteZaroll"]="PeteZaroll",
["PeteZarollTie"]="PeteZarollTie",
["PicoMause"]="PicoMause",
["PipeHype"]="PipeHype",
["PJSalt"]="PJSalt",
["PJSugar"]="PJSugar",
["PMSTwin"]="PMSTwin",
["PogChamp"]="PogChamp",
["Poooound"]="Poooound",
["PraiseIt"]="PraiseIt",
["PRChase"]="PRChase",
["PrimeMe"]="PrimeMe",
["PunchTrees"]="PunchTrees",
["PunOko"]="PunOko",
["RaccAttack"]="RaccAttack",
["RalpherZ"]="RalpherZ",
["RedCoat"]="RedCoat",
["ResidentSleeper"]="ResidentSleeper",
["riPepperonis"]="riPepperonis",
["RitzMitz"]="RitzMitz",
["RlyTho"]="RlyTho",
["RuleFive"]="RuleFive",
["SabaPing"]="SabaPing",
["SeemsGood"]="SeemsGood",
["ShadyLulu"]="ShadyLulu",
["ShazBotstix"]="ShazBotstix",
["SmoocherZ"]="SmoocherZ",
["SMOrc"]="SMOrc",
["SoBayed"]="SoBayed",
["SoonerLater"]="SoonerLater",
["SSSsss"]="SSSsss",
["StinkyCheese"]="StinkyCheese",
["StoneLightning"]="StoneLightning",
["StrawBeary"]="StrawBeary",
["SuperVinlin"]="SuperVinlin",
["SwiftRage"]="SwiftRage",
["TakeNRG"]="TakeNRG",
["TBAngel"]="TBAngel",
["TBCheesePull"]="TBCheesePull",
["TBTacoLeft"]="TBTacoLeft",
["TBTacoRight"]="TBTacoRight",
["TearGlove"]="TearGlove",
["TehePelo"]="TehePelo",
["TF2John"]="TF2John",
["ThankEgg"]="ThankEgg",
["TheIlluminati"]="TheIlluminati",
["TheRinger"]="TheRinger",
["TheTarFu"]="TheTarFu",
["TheThing"]="TheThing",
["ThunBeast"]="ThunBeast",
["TinyFace"]="TinyFace",
["TooSpicy"]="TooSpicy",
["TriHard"]="TriHard",
["TTours"]="TTours",
["twitchRaid"]="twitchRaid",
["TwitchRPG"]="TwitchRPG",
["UncleNox"]="UncleNox",
["UnSane"]="UnSane",
["UWot"]="UWot",
["VoHiYo"]="VoHiYo",
["VoteNay"]="VoteNay",
["VoteYea"]="VoteYea",
["WholeWheat"]="WholeWheat",
["WTRuck"]="WTRuck",
["WutFace"]="WutFace",
["YouDontSay"]="YouDontSay",
["YouWHY"]="YouWHY",
-- witwix
["wix1"]="wix1",
["wix2"]="wix2",
["wix3"]="wix3",
["wix4"]="wix4",
["wixAyyLmar"]="wixAyyLmar",
["wixB"]="wixB",
["wixBlind"]="wixBlind",
["wixBod"]="wixBod",
["wixBowsey"]="wixBowsey",
["wixBrix"]="wixBrix",
["wixCheese"]="wixCheese",
["wixD"]="wixD",
["wixDankey"]="wixDankey",
["wixGold"]="wixGold",
["wixH"]="wixH",
["wixHA"]="wixHA",
["wixHassanCop"]="wixHassanCop",
["wixK"]="wixK",
["wixL"]="wixL",
["wixLUL"]="wixLUL",
["wixMagoo"]="wixMagoo",
["wixMerio"]="wixMerio",
["wixMini"]="wixMini",
["wixNis"]="wixNis",
["wixR"]="wixR",
["wixSanic"]="wixSanic",
["wixSkerp"]="wixSkerp",
["wixT"]="wixT",
["wixW1"]="wixW1",
["wixW2"]="wixW2",
["wixW3"]="wixW3",
["wixW4"]="wixW4",
["wixWeeb"]="wixWeeb",
["wixWerio"]="wixWerio",
["wixZaldo"]="wixZaldo",
};
local dropdown_options={
[1] = {"AdmiralBulldog","admiral1","admiral2","admiral3","admiral4","admiral6","admiralAlfredo","admiralBackpack","admiralBanana","admiralCS","admiralDong","admiralDream","admiralFedora","admiralFeels","admiralGame","admiralHappy","admiralHug","admiralKristin","admiralNox","admiralPleb","admiralRapira","admiralS4","admiralSexy","admiralSkadoosh","admiralTI","admiralW"},
[2]=  {"Alkaizerx","alkFax","alkGuku","alkKayo","alkKrill","alkPeasemo","alkPlastic","alkSuper","alkUpset","alkW1","alkW2","alkW3","alkW4","alkW5","alkW6","alkXD"},
[3]=  {"AndyMilonakis","amiloAmazing","amiloAnnoyed","amiloBars","amiloCallers","amiloCrackhead","amiloDerp","amiloFeels","amiloGasm","amiloGOAT","amiloHeyGuys","amiloIcedT","amiloLeaked","amiloLeech","amiloLive","amiloLul","amiloMeow","amiloPhoto","amiloRage","amiloRip","amiloRun","amiloSabaPride","amiloSaved","amiloStare","amiloTriheart","amiloWut"},
[4]=  {"AnneMunation","anneHeart"},
[5]=  {"AvodingThePuddle","atp1000","atpChar","atpCop","atpDog","atpFeelsBeardMan","atpGasm","atpHorns","atpIzza","atpLaw","atpLook","atpRtsd","atpRtsd1","atpRtsd2","atpRtsd3","atpRtsd4","atpShh","atpSolid","atpStude","atpToiler","atpWind"},
[6]=  {"BobRoss","bobrossBeli","bobrossBrush","bobrossCabin","bobrossCanvas","bobrossCanvasA","bobrossCanvasB","bobrossCanvasH","bobrossCanvasP","bobrossChamp","bobrossCloud","bobrossCool","bobrossEve","bobrossFan","bobrossFence","bobrossFree","bobrossGG","bobrossHappy","bobrossKappaR","bobrossMeta","bobrossMini","bobrossMnt","bobrossNED","bobrossOPKnife","bobrossPal","bobrossRUI","bobrossSaved","bobrossSq","bobrossTap","bobrossTree"},
[7]=  {"BTTV+FFZ","bUrself","CiGrip","ConcernDoge","DogeWitIt","FapFapFap","FeelsAmazingMan","FeelsBadMan","FeelsBirthdayMan","FeelsDutchMan","FeelsGoodMan","FeelsOkayMan","FeelsPumpkinMan","FeelsSnowMan","FeelsSnowyMan","FeelsTired","FeelsWeirdMan","FishMoley","ForeverAlone","forsenC","FuckYea","GabeN","gachiGASM","haHAA","HerbPerve","Hhhehehe","Kaged","KKona","Krappa","LUL","LULW","MEGALUL","monkaS","nanoMEGA","OMEGALUL","PagChomp","VapeNation","ZULUL"},
[8]=  {"cdewx","dewD","dewDitch","dewDogs","dewEnergy","dewG","dewKass","dewLove","dewLUL","dewMethod","dewMLG","dewPleb","dewRage","dewRise","dewS","dewSell","dewTrig","dewVod","dewW","dewWhip","dewYo"},
[9]=  {"Custom","chupBro","chupDerp","chupHappy","Dele","endANELE","endBomb","endCreep","endDawg","endFrench","endHarambe","endKyori","endNotLikeThis","endReee","endRP","endTrump","marcithDerp","marcithMath"},
[10]= {"DansGaming","dan7","dan10","danBad","danBoy","danCreep","danCringe","danCry","danCute","danDead","danDerp","danDuck","danGasm","danGasp","danGOTY","danGrump","danHype","danLewd","danLol","danLove","danNo","danPalm","danPoop","danPuzzle","danRage","danRekt","danSad","danScare","danSexy","danTen","danThink","danTrain","danWave","danWoah","danWTF","danYay","danYes"},
[11]= {"Ducksauce","duckArthas","duckBA","duckBarrel","duckBedHead","duckBoop","duckCoffee","duckDerp","duckDuckFlex","duckGA","duckMama","duckParty","duckPist","duckQuappa","duckSad","duckSkadoosh","duckSpread","duckTenTen","duckTrain","duckZIN"},
[12]= {"EGazael","azaConrad","azaDRAIN","azaERASED","azaFox","azaHAPPY","azaHHH","azaMAD","azaRAT"},
[13]= {"Emojis","emGun","emThinking"},
[14]= {"EternaLEnVyy","envyKappa","envyKeikaku","envyOK","envyStick","envySwag","envyW","envyWeLost","envyWeWon"},
[15]= {"Forsenlol 1","forsen1","forsen2","forsen3","forsen4","forsenBanned","forsenBoys","forsenClown","forsenCpooky","forsenDDK","forsenDED","forsenDiglett","forsenOP","forsenE","forsenEmote","forsenEmote2","forsenFajita","forsenFeels","forsenGun","forsenH","forsenHorsen","forsenIQ","forsenKnife","forsenLewd","forsenLooted","forsenLUL"},
[16]= {"Forsenlol 2","forsenMoney","forsenMonkey","forsenO","forsenODO","forsenOG","forsenPepe","forsenPuke","forsenPuke2","forsenPuke3","forsenPuke4","forsenR","forsenRP","forsenSambool","forsenSheffy","forsenSkip","forsenSleeper","forsenSS","forsenStein","forsenSwag","forsenTriggered","forsenW","forsenWhip","forsenWut","forsenX"},
[17]= {"Hirona","hiroCry","hiroDerp","hiroH","hiroHail","hiroNo","hiroP","hiroWave","hiroWtf"},
[18]= {"Hydramist","hydraChamp","hydraFoot","hydraHEIL","hydraLUNA","hydraMURAT","hydraPURPLE","hydraRUSSIA","hydraSquare","hydraXMAS"},
[19]= {"imaqtpie 1","qtp1","qtp2","qtp2ND","qtp3","qtp4","qtpA","qtpB","qtpBAKED","qtpBLESSED","qtpBOOSTED","qtpBOT","qtpCOOL","qtpCULLED","qtpDAPPER","qtpDONG","qtpEDGE","qtpFEELS","qtpGIVE","qtpHAHAA","qtpHEART","qtpHEHE","qtpHONK","qtpKAWAII","qtpLEMONKEY","qtpLIT"},
[20]= {"imaqtpie 2","qtpLUCIAN","qtpLUL","qtpMEME","qtpMEW","qtpMOIST","qtpNLT","qtpNO","qtpOWO","qtpPAID","qtpPLEB","qtpPOTATO","qtpSMORC","qtpSPOOKED","qtpSPOOKY","qtpSTFU","qtpSWAG","qtpTHINKING","qtpTHUMP","qtpTILT","qtpURGOD","qtpUSA","qtpW","qtpWAVE","qtpWEEB","qtpWHAT"},
[21]= {"Laurne07","laurGasm","laurHey","laurHic","laurLove","laurMeow","laurRage","laurThump","laurWat"},
[22]= {"Lirik 1","lirikA","lirikAppa","lirikBB","lirikBLIND","lirikC","lirikCHAMP","lirikCLAP","lirikCLENCH","lirikCRASH","lirikDJ","lirikF","lirikFAKE","lirikFEELS","lirikFR","lirikGasm","lirikGOTY","lirikGREAT","lirikH","lirikHOLD","lirikHug","lirikHYPE","lirikL","lirikLEAN","lirikLEWD","lirikLOOT","lirikLUL"},
[23]= {"Lirik 2","lirikMLG","lirikN","lirikNICE","lirikNON","lirikNOT","lirikO","lirikOBESE","lirikOHGOD","lirikOK","lirikP","lirikPOOL","lirikPOOP","lirikPUKE","lirikREKT","lirikRIP","lirikS","lirikSALT","lirikSCARED","lirikSHUCKS","lirikSMART","lirikTEN","lirikTENK","lirikThump","lirikW"},
[24]= {"Pandamonium","chingAus","chingBday","chingBig","chingBinbash","chingBomb","chingEdge","chingFace","chingHype","chingJail","chingMaiku","chingMod","chingMoney","chingPanda","chingPotato","chingS","chingSense","chingSub","chingTgi","chingTroll","chingW"},
[25]= {"Quin69","quinBoss","quinBot","quinBully","quinC","quinD","quinDOIT","quinDom","quinGun","quinHappy","quinJesus","quinJudy","quinJuice","quinL","quinLeech","quinMask","quinPaca","quinPalm","quinPukana","quinR","quinRat","quinSplat","quinThump","quinTip","quinWtf","quinWut"},
[26]= {"Summit1g","sum1g","sum100","sumAbby","sumAyo","sumBag","sumBlind","sumBuhblam","sumCrash","sumCreeper","sumDerp","sumDesi","sumFail","sumFood","sumFuse","sumGasm","sumGG","sumGodflash","sumHassan","sumHassin","sumHorse","sumLove","sumMolly","sumOhface","sumOrc","sumOreo","sumPluto","sumPotato","sumPuzzle","sumRage","sumRekt","sumRip","sumStache","sumSuh","sumSwag","sumThump","sumUp","sumVac","sumVac2","sumW","sumWhat","sumWTF","sumWut"},
[27]= {"TwitchPresents","tpAIYIYI","tpBaboo","tpBlack","tpBLBLBL","tpBlue","tpBulk","tpFree","tpFX1","tpGG","tpGreen","tpHeresTommy","tpLokar","tpNasus","tpPink","tpRed","tpSquatt","tpWhite","tpYellow","tpZedd"},
[28]= {"TwitchTV 1","4Head","AMPEnergy","AMPEnergyCherry","AMPTropPunch","ANELE","ArgieB8","ArigatoNas","ArsonNoSexy","AsianGlow","BabyRage","BatChest","BCouch","BCWarrior","BegWan","BibleThump","BigBrother","BigPhish","BlargNaut","bleedPurple","BlessRNG","BloodTrail","BrainSlug","BrokeBack","BudBlast","BuddhaBar","BudStar","CarlSmile","ChefFrank","Clarmy","cmonBruh","CoolCat","CoolStoryBob","copyThis","CorgiDerp","DAESuppy","DansGame","DatSheffy","DBstyle","DendiFace","DogFace","DoritosChip","duDudu","DxAbomb","DxCat"},
[29]= {"TwitchTV 2","EagleEye","EleGiggle","FailFish","FPSMarksman","FrankerZ","FreakinStinkin","FUNgineer","FunRun","GingerPower","GivePLZ","GOWSkull","GrammarKing","HassaanChop","HassanChop","HeyGuys","HotPokket","HumbleLife","imGlitch","InuyoFace","ItsBoshyTime","Jebaited","JKanStyle","JonCarnage","KAPOW","Kappa","KappaClaus","KappaPride","KappaRoss","KappaWealth","Keepo","KevinTurtle","Kippa","Kreygasm","Mau5","mcaT","MikeHogu","MingLee","MorphinTime","MrDestructoid","MVGame"},
[30]= {"TwitchTV 3","NerfBlueBlaster","NerfRedBlaster","NinjaGrumpy","NomNom","NotAtk","NotLikeThis","OhMyDog","OneHand","OpieOP","OptimizePrime","OSfrog","panicBasket","PartyTime","pastaThat","PanicVis","PeoplesChamp","PeteZaroll","PeteZarollTie","PermaSmug","PicoMause","PipeHype","PJSalt","PJSugar","PMSTwin","PogChamp","Poooound","PraiseIt","PRChase","PrimeMe","PunchTrees","PunOko","RaccAttack","RalpherZ","RedCoat","ResidentSleeper","riPepperonis","RitzMitz","RlyTho","RuleFive","SabaPing","SeemsGood"},
[31]= {"TwitchTV 4","ShadyLulu","ShazBotstix","SmoocherZ","SMOrc","SoBayed","SoonerLater","SSSsss","StinkyCheese","StoneLightning","StrawBeary","SuperVinlin","SwiftRage","TakeNRG","TBAngel","TBCheesePull","TBTacoLeft","TBTacoRight","TearGlove","TehePelo","TF2John","ThankEgg","TheIlluminati","TheRinger","TheTarFu","TheThing","ThunBeast","TinyFace","TooSpicy","TriHard","TTours","twitchRaid","TwitchRPG","UncleNox","UnSane","UWot","VoHiYo","VoteNay","VoteYea","WholeWheat","WTRuck","WutFace","YouDontSay","YouWHY"},
[32]= {"witwix","wix1","wix2","wix3","wix4","wixAyyLmar","wixB","wixBlind","wixBod","wixBowsey","wixBrix","wixCheese","wixD","wixDankey","wixGold","wixH","wixHA","wixHassanCop","wixK","wixL","wixLUL","wixMagoo","wixMerio","wixMini","wixNis","wixR","wixSanic","wixSkerp","wixT","wixW1","wixW2","wixW3","wixW4","wixWeeb","wixWerio","wixZaldo"},
};  


local ItemTextFrameSetText = ItemTextPageText.SetText;



-- Call this in a mod's initialization to move the minimap button to its saved position (also used in its movement)
-- ** do not call from the mod's OnLoad, VARIABLES_LOADED or later is fine. **
function MyMod_MinimapButton_Reposition()
	MyMod_MinimapButton:SetPoint("TOPLEFT","Minimap","TOPLEFT",52-(80*cos(Emoticons_Settings["MinimapPos"])),(80*sin(Emoticons_Settings["MinimapPos"]))-52)
end

-- Only while the button is dragged this is called every frame
function MyMod_MinimapButton_DraggingFrame_OnUpdate()

	local xpos,ypos = GetCursorPosition()
	local xmin,ymin = Minimap:GetLeft(), Minimap:GetBottom()
	MyMod_MinimapButton:SetToplevel(true)
	xpos = xmin-xpos/UIParent:GetScale()+70 -- get coordinates as differences from the center of the minimap
	ypos = ypos/UIParent:GetScale()-ymin-70

	Emoticons_Settings["MinimapPos"] = math.deg(math.atan2(ypos,xpos)) -- save the degrees we are relative to the minimap center
	MyMod_MinimapButton_Reposition() -- move the button
end

-- Put your code that you want on a minimap button click here.  arg1="LeftButton", "RightButton", etc
function MyMod_MinimapButton_OnClick()
		Lib_ToggleDropDownMenu(1, nil, EmoticonChatFrameDropDown, MyMod_MinimapButton, 0, 0);
end

function ItemTextPageText.SetText(self,msg,...)
	if(Emoticons_Settings["MAIL"] and msg ~= nil) then
		msg = Emoticons_RunReplacement(msg);
	end
	ItemTextFrameSetText(self,msg,...);
end

local OpenMailBodyTextSetText = OpenMailBodyText.SetText;
function OpenMailBodyText.SetText(self,msg,...)
	if(Emoticons_Settings["MAIL"] and msg ~= nil) then
		msg = Emoticons_RunReplacement(msg);
	end
	OpenMailBodyTextSetText(self,msg,...);
end

function Emoticons_LoadChatFrameDropdown(self, level, menuList)
	local info          = Lib_UIDropDownMenu_CreateInfo();
	if (level or 1) == 1 then
		for k,v in ipairs(dropdown_options) do
			if (Emoticons_Settings["FAVEMOTES"][k]) then
				info.hasArrow = true;
				info.text = v[1];
				info.value = false;
				info.menuList = k;
				Lib_UIDropDownMenu_AddButton(info);
			end
		end
	else
		first=true;
		for ke,va in ipairs(dropdown_options[menuList]) do
			if (first) then
				first = false;
			else
				--print(ke.." "..va);
				info.text       = "|T"..defaultpack[va].."|t "..va;
				info.value      = va;
				info.func = Emoticons_Dropdown_OnClick;
				Lib_UIDropDownMenu_AddButton(info, level);
			end
		end
		
	end
end

function Emoticons_Setxposi(x)
	Emoticons_Settings["sliderX"]=x;
	b:SetPoint("TOPLEFT",Emoticons_Settings["sliderX"],Emoticons_Settings["sliderY"]);
end

function Emoticons_Setyposi(y)
	Emoticons_Settings["sliderY"]=y;
	b:SetPoint("TOPLEFT",Emoticons_Settings["sliderX"],Emoticons_Settings["sliderY"]);
end

function Emoticons_Dropdown_OnClick(self,arg1,arg2,arg3)
	if(ACTIVE_CHAT_EDIT_BOX ~= nil) then
		ACTIVE_CHAT_EDIT_BOX:Insert(self.value);
	end
end

function Emoticons_MailFrame_OnChar(self)
	local msg = self:GetText();
	if(Emoticons_Eyecandy and Emoticons_Settings["MAIL"] and string.sub(msg,1,1) ~= "/") then
		self:SetText(Emoticons_RunReplacement(msg));
	end
end

local sm = SendMail;
function SendMail(recipient,subject,msg,...)
	if(Emoticons_Eyecandy and Emoticons_Settings["MAIL"]) then
		msg = Emoticons_Deformat(msg);
	end
	sm(recipient,subject,msg,...);
end



local scm = SendChatMessage;
function SendChatMessage(msg,...)
	if(Emoticons_Eyecandy) then
		msg = Emoticons_Deformat(msg);
	end
	scm(msg,...);
end

local bnsw = BNSendWhisper;
function BNSendWhisper(id,msg,...)
	if(Emoticons_Eyecandy) then
		msg = Emoticons_Deformat(msg);
	end
	bnsw(id,msg,...);
end

function Emoticons_UpdateChatFilters()
	for k,v in pairs(Emoticons_Settings) do
		if(k ~= "MAIL" and k ~= "TWITCHBUTTON" and k ~= "sliderX" and k ~= "sliderY") then
			if(v) then
				ChatFrame_AddMessageEventFilter(k,Emoticons_MessageFilter)
			else
				ChatFrame_RemoveMessageEventFilter(k,Emoticons_MessageFilter);
			end
		end
	end
end

function Emoticons_MessageFilter(self, event, msg, ...)
	
	msg = Emoticons_RunReplacement(msg);
	
	return false, msg, ...
end
-- addon hat saved vars geladen
function Emoticons_OnEvent(self,event,...)
	if(event == "ADDON_LOADED" and select(1,...) == "TwitchEmotes") then
		for k,v in pairs(origsettings) do
			if(Emoticons_Settings[k] == nil) then
				Emoticons_Settings[k] = v;
			end
		end
		Emoticons_UpdateChatFilters();
		

b:SetPoint("TOPLEFT",Emoticons_Settings["sliderX"],Emoticons_Settings["sliderY"]);
b:SetWidth(24);
b:SetHeight(24);
b:RegisterForClicks("AnyUp", "AnyDown");
b:SetNormalTexture("Interface\\AddOns\\TwitchEmotes\\1337.tga");
Emoticons_SetTwitchButton(Emoticons_Settings["TWITCHBUTTON"]);
Emoticons_SetMinimapButton(Emoticons_Settings["MINIMAPBUTTON"]);
MyMod_MinimapButton_Reposition();		
		
		
		
		
		
	end
end



function Emoticons_OptionsWindow_OnShow(self)
	for k,v in pairs(Emoticons_Settings) do 
		local cb = getglobal("EmoticonsOptionsControlsPanel"..k);
	
		if(cb ~= nil) then
			cb:SetChecked(Emoticons_Settings[k]);
		end
	end
	SliderXText:SetText("Position X: "..Emoticons_Settings["sliderX"]);
	SliderYText:SetText("Position Y: "..Emoticons_Settings["sliderY"]);
	--EmoticonsOptionsControlsPanelEyecandy:SetChecked(Emoticons_Eyecandy);
	
	favall = CreateFrame("CheckButton", "favall_GlobalName", EmoticonsOptionsControlsPanelTrenner3,"UIRadioButtonTemplate" );
	--getglobal("favall_GlobalName"):SetChecked(false);
	favall:SetPoint("TOPLEFT", 0,-16);
	getglobal(favall:GetName().."Text"):SetText("Check all");
	favall.tooltip = "Check all boxes below.";
	getglobal("favall_GlobalName"):SetScript("OnClick", 
	  function(self)
		if (self:GetChecked()) then
			if (getglobal("favnone_GlobalName"):GetChecked() == true) then
				getglobal("favnone_GlobalName"):SetChecked(false);
			end
			self:SetChecked(true);
			for n,m in ipairs(Emoticons_Settings["FAVEMOTES"]) do
				Emoticons_Settings["FAVEMOTES"][n] = true;
				--print("favCheckButton_"..dropdown_options[n][1]);
				if (getglobal("favCheckButton_"..dropdown_options[n][1]):GetChecked() == false) then
					getglobal("favCheckButton_"..dropdown_options[n][1]):SetChecked(true);
				end
			end
		else
			--Emoticons_Settings["FAVEMOTES"][a] = false;
		end
	  end
	);

	favnone = CreateFrame("CheckButton", "favnone_GlobalName", favall_GlobalName,"UIRadioButtonTemplate" );
	--getglobal("favnone_GlobalName"):SetChecked(false);
	favnone:SetPoint("TOPLEFT", 110,0);
	getglobal(favnone:GetName().."Text"):SetText("Uncheck all");
	favnone.tooltip = "Uncheck all boxes below.";
	getglobal("favnone_GlobalName"):SetScript("OnClick", 
		function(self)
			if (self:GetChecked()) then
				if (getglobal("favall_GlobalName"):GetChecked() == true) then
					getglobal("favall_GlobalName"):SetChecked(false);
				end
				self:SetChecked(true);
				for n,m in ipairs(Emoticons_Settings["FAVEMOTES"]) do
					Emoticons_Settings["FAVEMOTES"][n] = false;
					if (getglobal("favCheckButton_"..dropdown_options[n][1]):GetChecked()==true) then
						getglobal("favCheckButton_"..dropdown_options[n][1]):SetChecked(false);
					end
				end
				--Emoticons_Settings["FAVEMOTES"][a] = true;
			else
				--Emoticons_Settings["FAVEMOTES"][a] = false;
			end
		end
	);

	favframe = CreateFrame("Frame", "favframe_GlobalName", favall_GlobalName);
	favframe:SetPoint("TOPLEFT", 0,-24);
	favframe:SetSize(590,175);
	
	favframe:SetBackdrop({bgFile="Interface\\ChatFrame\\ChatFrameBackground",edgeFile="Interface\\Tooltips\\UI-Tooltip-Border",tile=true,tileSize=5,edgeSize= 2,});
favframe:SetBackdropColor(0, 0, 0,0.5);
first=true;
itemcnt=0
for a,c in ipairs(dropdown_options) do
	
	if first then 
		favCheckButton = CreateFrame("CheckButton", "favCheckButton_"..c[1], favframe_GlobalName, "ChatConfigCheckButtonTemplate");
		first=false;
		favCheckButton:SetPoint("TOPLEFT", 0, 3);
	else 
		--favbuttonlist=loadstring("favCheckButton_"..anchor);

		favCheckButton = CreateFrame("CheckButton", "favCheckButton_"..c[1], favframe_GlobalName, "ChatConfigCheckButtonTemplate");
		favCheckButton:SetParent("favCheckButton_"..anchor);
		if ((itemcnt % 10) ~= 0) then
			favCheckButton:SetPoint("TOPLEFT", 0, -16);
		else
		
			favCheckButton:SetPoint("TOPLEFT", 110, 9*16);
		end
	end
	itemcnt=itemcnt+1;
	anchor=c[1];

--code=[[print("favCheckButton_"..b[1]..":SetText(b[1])")]];

	getglobal(favCheckButton:GetName().."Text"):SetText(c[1]);
	if (getglobal("favCheckButton_"..c[1]):GetChecked() ~= Emoticons_Settings["FAVEMOTES"][a]) then
		getglobal("favCheckButton_"..c[1]):SetChecked(Emoticons_Settings["FAVEMOTES"][a]);
	end
	favCheckButton.tooltip = "Checked boxes will show in the dropdownlist.";
	favCheckButton:SetScript("OnClick", 
	  function(self)
		if (self:GetChecked()) then
			Emoticons_Settings["FAVEMOTES"][a] = true;
		else
			Emoticons_Settings["FAVEMOTES"][a] = false;
		end
	  end
	);
	
end

	
	
end

function Emoticons_Deformat(msg)
	for k,v in pairs(emoticons) do
		msg=string.gsub(msg,"|T"..defaultpack[k].."%:28%:28|t",v);
	end
	return msg;
end

function Emoticons_RunReplacement(msg)
	
	--remember to watch out for |H|h|h's
	
	local outstr = "";
	local origlen = string.len(msg);
	local startpos = 1;
	local endpos;

	while(startpos <= origlen) do
		endpos = origlen;
		local pos = string.find(msg,"|H",startpos,true);
		if(pos ~= nil) then
			endpos = pos;
		end
		outstr = outstr .. Emoticons_InsertEmoticons(string.sub(msg,startpos,endpos)); --run replacement on this bit
		startpos = endpos + 1;
		if(pos ~= nil) then
			endpos = string.find(msg,"|h",startpos,true);
			if(endpos == nil) then
				endpos = origlen;
			end
			if(startpos < endpos) then
				outstr = outstr .. string.sub(msg,startpos,endpos); --don't run replacement on this bit
				startpos = endpos + 1;
			end
		end
	end
	
	return outstr;
end

function Emoticons_SetEyecandy(state)
	if(state) then
		Emoticons_Eyecandy = true;
		if(ACTIVE_CHAT_EDIT_BOX~=nil) then
			ACTIVE_CHAT_EDIT_BOX:SetText(Emoticons_RunReplacement(ACTIVE_CHAT_EDIT_BOX:GetText()));
		end
	else
		Emoticons_Eyecandy = false;
		if(ACTIVE_CHAT_EDIT_BOX~=nil) then
			ACTIVE_CHAT_EDIT_BOX:SetText(Emoticons_Deformat(ACTIVE_CHAT_EDIT_BOX:GetText()));
		end
	end
end

function Emoticons_SetTwitchButton(state)
	if(state) then
		state = true;
	else
		state = false;
	end
	Emoticons_Settings["TWITCHBUTTON"]=state;
	if(state) then
		TestButton:Show();
	else
		TestButton:Hide();
	end
end

function Emoticons_SetMinimapButton(state)
	if(state) then
		state = true;
	else
		state = false;
	end
	Emoticons_Settings["MINIMAPBUTTON"]=state;
	if(state) then
		MyMod_MinimapButton:Show();
	else
		MyMod_MinimapButton:Hide();
	end
end


function Emoticons_InsertEmoticons(msg)
	

	
	--print(table.getn(words)) ;
	for k,v in pairs(emoticons) do
		if (string.find(msg,k,1,true)) then
			msg = string.gsub(msg,"(%s)"..k.."(%s)","%1|T"..defaultpack[v].."|t%2");
			msg = string.gsub(msg,"(%s)"..k.."$","%1|T"..defaultpack[v].."|t");
			msg = string.gsub(msg,"^"..k.."(%s)","|T"..defaultpack[v].."|t%1");
			msg = string.gsub(msg,"^"..k.."$","|T"..defaultpack[v].."|t");
			msg = string.gsub(msg,"(%s)"..k.."(%c)","%1|T"..defaultpack[v].."|t%2");
			msg = string.gsub(msg,"(%s)"..k.."(%s)","%1|T"..defaultpack[v].."|t%2");
		end
	end
	
	
	
	--print(abc);
	return msg;
end

function Emoticons_SetType(chattype,state)
	if(state) then
		state = true;
	else
		state = false;
	end
	if(chattype == "CHAT_MSG_RAID") then
		Emoticons_Settings["CHAT_MSG_RAID_LEADER"] = state;
		Emoticons_Settings["CHAT_MSG_RAID_WARNING"] = state;
	end
	if(chattype == "CHAT_MSG_PARTY") then
		Emoticons_Settings["CHAT_MSG_PARTY_LEADER"] = state;
		Emoticons_Settings["CHAT_MSG_PARTY_GUIDE"] = state;
	end
	if(chattype == "CHAT_MSG_WHISPER") then
		Emoticons_Settings["CHAT_MSG_WHISPER_INFORM"] = state;
	end
	if(chattype == "CHAT_MSG_INSTANCE_CHAT") then
		Emoticons_Settings["CHAT_MSG_INSTANCE_CHAT_LEADER"] = state;
	end
	if(chattype == "CHAT_MSG_BN_WHISPER") then
		Emoticons_Settings["CHAT_MSG_BN_WHISPER_INFORM"] = state;
	end
	
	Emoticons_Settings[chattype] = state;
	Emoticons_UpdateChatFilters();
end

b = CreateFrame("Button", "TestButton", ChatFrame1, "UIPanelButtonTemplate");

