print("Last Second version 1.2")
--in movie psychic horror hit me twice instantaneously
--icons get stuck when combat log doesnt see cc end

drlevel={3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3}
drtime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
ccstatus={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
cctime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
lastcc={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
ccapplytime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}

party1drlevel={3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3}
party1drtime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
party1ccstatus={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
party1cctime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
party1lastcc={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
party1ccapplytime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}

party2drlevel={3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3}
party2drtime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
party2ccstatus={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
party2cctime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
party2lastcc={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
party2ccapplytime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}

party3drlevel={3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3}
party3drtime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
party3ccstatus={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
party3cctime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
party3lastcc={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
party3ccapplytime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}

party4drlevel={3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3}
party4drtime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
party4ccstatus={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
party4cctime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
party4lastcc={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
party4ccapplytime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}

arena1drlevel={3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3}
arena1drtime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
arena1ccstatus={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
arena1cctime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
arena1lastcc={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
arena1ccapplytime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}

arena2drlevel={3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3}
arena2drtime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
arena2ccstatus={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
arena2cctime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
arena2lastcc={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
arena2ccapplytime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}

arena3drlevel={3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3}
arena3drtime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
arena3ccstatus={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
arena3cctime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
arena3lastcc={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
arena3ccapplytime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}

arena4drlevel={3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3}
arena4drtime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
arena4ccstatus={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
arena4cctime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
arena4lastcc={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
arena4ccapplytime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}

arena5drlevel={3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3}
arena5drtime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
arena5ccstatus={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
arena5cctime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
arena5lastcc={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
arena5ccapplytime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}

save1drlevel={3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3}
save1drtime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
save1ccstatus={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
save1cctime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
save1lastcc={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
save1ccapplytime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}

save2drlevel={3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3}
save2drtime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
save2ccstatus={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
save2cctime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
save2lastcc={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
save2ccapplytime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}

save3drlevel={3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3}
save3drtime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
save3ccstatus={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
save3cctime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
save3lastcc={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
save3ccapplytime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}

save4drlevel={3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3}
save4drtime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
save4ccstatus={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
save4cctime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
save4lastcc={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
save4ccapplytime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}

save5drlevel={3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3}
save5drtime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
save5ccstatus={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
save5cctime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
save5lastcc={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
save5ccapplytime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}

save6drlevel={3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3}
save6drtime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
save6ccstatus={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
save6cctime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
save6lastcc={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
save6ccapplytime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}

save7drlevel={3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3}
save7drtime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
save7ccstatus={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
save7cctime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
save7lastcc={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
save7ccapplytime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}

save8drlevel={3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3}
save8drtime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
save8ccstatus={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
save8cctime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
save8lastcc={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
save8ccapplytime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}

save9drlevel={3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3}
save9drtime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
save9ccstatus={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
save9cctime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
save9lastcc={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
save9ccapplytime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}

save10drlevel={3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3}
save10drtime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
save10ccstatus={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
save10cctime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
save10lastcc={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
save10ccapplytime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}

save11drlevel={3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3}
save11drtime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
save11ccstatus={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
save11cctime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
save11lastcc={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
save11ccapplytime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}

save12drlevel={3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3}
save12drtime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
save12ccstatus={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
save12cctime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
save12lastcc={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
save12ccapplytime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}

save13drlevel={3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3}
save13drtime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
save13ccstatus={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
save13cctime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
save13lastcc={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
save13ccapplytime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}

save14drlevel={3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3}
save14drtime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
save14ccstatus={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
save14cctime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
save14lastcc={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
save14ccapplytime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}

save15drlevel={3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3}
save15drtime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
save15ccstatus={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
save15cctime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
save15lastcc={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
save15ccapplytime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}

save16drlevel={3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3}
save16drtime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
save16ccstatus={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
save16cctime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
save16lastcc={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
save16ccapplytime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}

save17drlevel={3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3}
save17drtime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
save17ccstatus={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
save17cctime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
save17lastcc={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
save17ccapplytime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}

save18drlevel={3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3}
save18drtime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
save18ccstatus={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
save18cctime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
save18lastcc={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
save18ccapplytime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}

save19drlevel={3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3}
save19drtime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
save19ccstatus={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
save19cctime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
save19lastcc={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
save19ccapplytime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}

save20drlevel={3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3}
save20drtime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
save20ccstatus={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
save20cctime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
save20lastcc={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
save20ccapplytime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}

saveGUIDs={1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1}
saveupdatetime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}

targetdrlevel={3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3}
targetdrtime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
targetccstatus={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
targetcctime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
targetlastcc={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
targetccapplytime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}

focusdrlevel={3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3}
focusdrtime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
focusccstatus={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
focuscctime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
focuslastcc={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
focusccapplytime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}


function SetGUIDs(destGUID)
--	print("setting GUID", destGUID)
--	print("target GUID", UnitGUID("target"))
	local i
	local foundGUIDmatch=0
	for i=1, 20 do
		if saveGUIDs[i]==destGUID then
			foundGUIDmatch=1
--			print("found GUID match")
			break
		end
		i=i+1
	end
--	print("got here")
	if foundGUIDmatch==0 then
--		print("got here too")
		local oldestdata=saveupdatetime[1]
		local oldestdataindex=1
		for i=2, 20 do
			if oldestdata>saveupdatetime[i] then
				oldestdata=saveupdatetime[i]
				oldestdataindex=i
			end
			i=i+1
		end
--		print("oldestdataindex", oldestdataindex)
		if oldestdataindex==1 then
			saveGUIDs[1]=destGUID
			--if saveupdatetime[1]+15>GetTime() then print("erased nonempty datacell") end
			save1drlevel={3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3}
			save1drtime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
			save1ccstatus={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
			save1cctime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
			save1lastcc={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
			save1ccapplytime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
		elseif oldestdataindex==2 then
			saveGUIDs[2]=destGUID
			--if saveupdatetime[2]+15>GetTime() then print("erased nonempty datacell") end
			save2drlevel={3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3}
			save2drtime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
			save2ccstatus={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
			save2cctime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
			save2lastcc={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
			save2ccapplytime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
		elseif oldestdataindex==3 then
			saveGUIDs[3]=destGUID
			--if saveupdatetime[3]+15>GetTime() then print("erased nonempty datacell") end
			save3drlevel={3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3}
			save3drtime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
			save3ccstatus={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
			save3cctime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
			save3lastcc={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
			save3ccapplytime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
		elseif oldestdataindex==4 then
			saveGUIDs[4]=destGUID
			--if saveupdatetime[4]+15>GetTime() then print("erased nonempty datacell") end
			save4drlevel={3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3}
			save4drtime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
			save4ccstatus={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
			save4cctime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
			save4lastcc={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
			save4ccapplytime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
		elseif oldestdataindex==5 then
			saveGUIDs[5]=destGUID
			--if saveupdatetime[5]+15>GetTime() then print("erased nonempty datacell") end
			save5drlevel={3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3}
			save5drtime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
			save5ccstatus={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
			save5cctime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
			save5lastcc={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
			save5ccapplytime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
		elseif oldestdataindex==6 then
			saveGUIDs[6]=destGUID
			--if saveupdatetime[6]+15>GetTime() then print("erased nonempty datacell") end
			save6drlevel={3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3}
			save6drtime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
			save6ccstatus={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
			save6cctime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
			save6lastcc={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
			save6ccapplytime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
		elseif oldestdataindex==7 then
			saveGUIDs[7]=destGUID
			--if saveupdatetime[7]+15>GetTime() then print("erased nonempty datacell") end
			save7drlevel={3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3}
			save7drtime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
			save7ccstatus={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
			save7cctime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
			save7lastcc={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
			save7ccapplytime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
		elseif oldestdataindex==8 then
			saveGUIDs[8]=destGUID
			--if saveupdatetime[8]+15>GetTime() then print("erased nonempty datacell") end
			save8drlevel={3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3}
			save8drtime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
			save8ccstatus={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
			save8cctime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
			save8lastcc={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
			save8ccapplytime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
		elseif oldestdataindex==9 then
			saveGUIDs[9]=destGUID
			--if saveupdatetime[9]+15>GetTime() then print("erased nonempty datacell") end
			save9drlevel={3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3}
			save9drtime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
			save9ccstatus={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
			save9cctime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
			save9lastcc={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
			save9ccapplytime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
		elseif oldestdataindex==10 then
			saveGUIDs[10]=destGUID
			--if saveupdatetime[10]+15>GetTime() then print("erased nonempty datacell") end
			save10drlevel={3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3}
			save10drtime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
			save10ccstatus={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
			save10cctime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
			save10lastcc={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
			save10ccapplytime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
		elseif oldestdataindex==11 then
			saveGUIDs[11]=destGUID
			--if saveupdatetime[11]+15>GetTime() then print("erased nonempty datacell") end
			save11drlevel={3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3}
			save11drtime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
			save11ccstatus={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
			save11cctime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
			save11lastcc={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
			save11ccapplytime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
		elseif oldestdataindex==12 then
			saveGUIDs[12]=destGUID
			--if saveupdatetime[12]+15>GetTime() then print("erased nonempty datacell") end
			save12drlevel={3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3}
			save12drtime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
			save12ccstatus={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
			save12cctime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
			save12lastcc={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
			save12ccapplytime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
		elseif oldestdataindex==13 then
			saveGUIDs[13]=destGUID
			--if saveupdatetime[13]+15>GetTime() then print("erased nonempty datacell") end
			save13drlevel={3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3}
			save13drtime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
			save13ccstatus={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
			save13cctime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
			save13lastcc={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
			save13ccapplytime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
		elseif oldestdataindex==14 then
			saveGUIDs[14]=destGUID
			--if saveupdatetime[14]+15>GetTime() then print("erased nonempty datacell") end
			save14drlevel={3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3}
			save14drtime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
			save14ccstatus={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
			save14cctime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
			save14lastcc={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
			save14ccapplytime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
		elseif oldestdataindex==15 then
			saveGUIDs[15]=destGUID
			--if saveupdatetime[15]+15>GetTime() then print("erased nonempty datacell") end
			save15drlevel={3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3}
			save15drtime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
			save15ccstatus={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
			save15cctime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
			save15lastcc={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
			save15ccapplytime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
		elseif oldestdataindex==16 then
			saveGUIDs[16]=destGUID
			--if saveupdatetime[16]+15>GetTime() then print("erased nonempty datacell") end
			save16drlevel={3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3}
			save16drtime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
			save16ccstatus={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
			save16cctime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
			save16lastcc={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
			save16ccapplytime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
		elseif oldestdataindex==17 then
			saveGUIDs[17]=destGUID
			--if saveupdatetime[17]+15>GetTime() then print("erased nonempty datacell") end
			save17drlevel={3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3}
			save17drtime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
			save17ccstatus={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
			save17cctime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
			save17lastcc={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
			save17ccapplytime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
		elseif oldestdataindex==18 then
			saveGUIDs[18]=destGUID
			--if saveupdatetime[18]+15>GetTime() then print("erased nonempty datacell") end
			save18drlevel={3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3}
			save18drtime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
			save18ccstatus={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
			save18cctime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
			save18lastcc={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
			save18ccapplytime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
		elseif oldestdataindex==19 then
			saveGUIDs[19]=destGUID
			--if saveupdatetime[19]+15>GetTime() then print("erased nonempty datacell") end
			save19drlevel={3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3}
			save19drtime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
			save19ccstatus={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
			save19cctime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
			save19lastcc={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
			save19ccapplytime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
		elseif oldestdataindex==20 then
			saveGUIDs[20]=destGUID
			--if saveupdatetime[20]+15>GetTime() then print("erased nonempty datacell") end
			save20drlevel={3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3}
			save20drtime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
			save20ccstatus={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
			save20cctime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
			save20lastcc={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
			save20ccapplytime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
		end
	end
end
local example=0
local colorconstant=.8
local onoffcombatlog=0
local index
local updatetime
local addonstarttime=GetTime()
local sizeonce=1
local anchorstatus=0
local ininstance
local instancetype
local addonloaded=0
local lengthofdr=18
--cconoffstatus={1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1}
--cconoffstatus={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
--print (cconoffstatus[1], cconoffstatus[2], cconoffstatus[3], cconoffstatus[4], cconoffstatus[5], cconoffstatus[6], cconoffstatus[7], cconoffstatus[8], cconoffstatus[9],
--cconoffstatus[10], cconoffstatus[11], cconoffstatus[12], cconoffstatus[13], cconoffstatus[14], cconoffstatus[15], cconoffstatus[16], cconoffstatus[17])

function SetTargetAndFocusReference()
	local targetGUID=UnitGUID("target")
	local focusGUID=UnitGUID("focus")
--	print(focusGUID)
	if targetGUID==saveGUIDs[1] then
		targetdrlevel=save1drlevel
		targetdrtime=save1drtime
		targetccstatus=save1ccstatus
		targetcctime=save1cctime
		targetlastcc=save1lastcc
		targetccapplytime=save1ccapplytime
	elseif targetGUID==saveGUIDs[2] then
		targetdrlevel=save2drlevel
		targetdrtime=save2drtime
		targetccstatus=save2ccstatus
		targetcctime=save2cctime
		targetlastcc=save2lastcc
		targetccapplytime=save2ccapplytime
	elseif targetGUID==saveGUIDs[3] then
		targetdrlevel=save3drlevel
		targetdrtime=save3drtime
		targetccstatus=save3ccstatus
		targetcctime=save3cctime
		targetlastcc=save3lastcc
		targetccapplytime=save3ccapplytime
	elseif targetGUID==saveGUIDs[4] then
		targetdrlevel=save4drlevel
		targetdrtime=save4drtime
		targetccstatus=save4ccstatus
		targetcctime=save4cctime
		targetlastcc=save4lastcc
		targetccapplytime=save4ccapplytime
	elseif targetGUID==saveGUIDs[5] then
		targetdrlevel=save5drlevel
		targetdrtime=save5drtime
		targetccstatus=save5ccstatus
		targetcctime=save5cctime
		targetlastcc=save5lastcc
		targetccapplytime=save5ccapplytime
	elseif targetGUID==saveGUIDs[6] then
		targetdrlevel=save6drlevel
		targetdrtime=save6drtime
		targetccstatus=save6ccstatus
		targetcctime=save6cctime
		targetlastcc=save6lastcc
		targetccapplytime=save6ccapplytime
	elseif targetGUID==saveGUIDs[7] then
		targetdrlevel=save7drlevel
		targetdrtime=save7drtime
		targetccstatus=save7ccstatus
		targetcctime=save7cctime
		targetlastcc=save7lastcc
		targetccapplytime=save7ccapplytime
	elseif targetGUID==saveGUIDs[8] then
		targetdrlevel=save8drlevel
		targetdrtime=save8drtime
		targetccstatus=save8ccstatus
		targetcctime=save8cctime
		targetlastcc=save8lastcc
		targetccapplytime=save8ccapplytime
	elseif targetGUID==saveGUIDs[9] then
		targetdrlevel=save9drlevel
		targetdrtime=save9drtime
		targetccstatus=save9ccstatus
		targetcctime=save9cctime
		targetlastcc=save9lastcc
		targetccapplytime=save9ccapplytime
	elseif targetGUID==saveGUIDs[10] then
		targetdrlevel=save10drlevel
		targetdrtime=save10drtime
		targetccstatus=save10ccstatus
		targetcctime=save10cctime
		targetlastcc=save10lastcc
		targetccapplytime=save10ccapplytime
	elseif targetGUID==saveGUIDs[11] then
		targetdrlevel=save11drlevel
		targetdrtime=save11drtime
		targetccstatus=save11ccstatus
		targetcctime=save11cctime
		targetlastcc=save11lastcc
		targetccapplytime=save11ccapplytime
	elseif targetGUID==saveGUIDs[12] then
		targetdrlevel=save12drlevel
		targetdrtime=save12drtime
		targetccstatus=save12ccstatus
		targetcctime=save12cctime
		targetlastcc=save12lastcc
		targetccapplytime=save12ccapplytime
	elseif targetGUID==saveGUIDs[13] then
		targetdrlevel=save13drlevel
		targetdrtime=save13drtime
		targetccstatus=save13ccstatus
		targetcctime=save13cctime
		targetlastcc=save13lastcc
		targetccapplytime=save13ccapplytime
	elseif targetGUID==saveGUIDs[14] then
		targetdrlevel=save14drlevel
		targetdrtime=save14drtime
		targetccstatus=save14ccstatus
		targetcctime=save14cctime
		targetlastcc=save14lastcc
		targetccapplytime=save14ccapplytime
	elseif targetGUID==saveGUIDs[15] then
		targetdrlevel=save15drlevel
		targetdrtime=save15drtime
		targetccstatus=save15ccstatus
		targetcctime=save15cctime
		targetlastcc=save15lastcc
		targetccapplytime=save15ccapplytime
	elseif targetGUID==saveGUIDs[16] then
		targetdrlevel=save16drlevel
		targetdrtime=save16drtime
		targetccstatus=save16ccstatus
		targetcctime=save16cctime
		targetlastcc=save16lastcc
		targetccapplytime=save16ccapplytime
	elseif targetGUID==saveGUIDs[17] then
		targetdrlevel=save17drlevel
		targetdrtime=save17drtime
		targetccstatus=save17ccstatus
		targetcctime=save17cctime
		targetlastcc=save17lastcc
		targetccapplytime=save17ccapplytime
	elseif targetGUID==saveGUIDs[18] then
		targetdrlevel=save18drlevel
		targetdrtime=save18drtime
		targetccstatus=save18ccstatus
		targetcctime=save18cctime
		targetlastcc=save18lastcc
		targetccapplytime=save18ccapplytime
	elseif targetGUID==saveGUIDs[19] then
		targetdrlevel=save19drlevel
		targetdrtime=save19drtime
		targetccstatus=save19ccstatus
		targetcctime=save19cctime
		targetlastcc=save19lastcc
		targetccapplytime=save19ccapplytime
	elseif targetGUID==saveGUIDs[20] then
		targetdrlevel=save20drlevel
		targetdrtime=save20drtime
		targetccstatus=save20ccstatus
		targetcctime=save20cctime
		targetlastcc=save20lastcc
		targetccapplytime=save20ccapplytime
	else
		targetdrlevel={3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3}
		targetdrtime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
		targetccstatus={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
		targetcctime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
		targetlastcc={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
		targetccapplytime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
	end
	if focusGUID==saveGUIDs[1] then
		focusdrlevel=save1drlevel
		focusdrtime=save1drtime
		focusccstatus=save1ccstatus
		focuscctime=save1cctime
		focuslastcc=save1lastcc
		focusccapplytime=save1ccapplytime
	elseif focusGUID==saveGUIDs[2] then
		focusdrlevel=save2drlevel
		focusdrtime=save2drtime
		focusccstatus=save2ccstatus
		focuscctime=save2cctime
		focuslastcc=save2lastcc
		focusccapplytime=save2ccapplytime
	elseif focusGUID==saveGUIDs[3] then
		focusdrlevel=save3drlevel
		focusdrtime=save3drtime
		focusccstatus=save3ccstatus
		focuscctime=save3cctime
		focuslastcc=save3lastcc
		focusccapplytime=save3ccapplytime
	elseif focusGUID==saveGUIDs[4] then
		focusdrlevel=save4drlevel
		focusdrtime=save4drtime
		focusccstatus=save4ccstatus
		focuscctime=save4cctime
		focuslastcc=save4lastcc
		focusccapplytime=save4ccapplytime
	elseif focusGUID==saveGUIDs[5] then
		focusdrlevel=save5drlevel
		focusdrtime=save5drtime
		focusccstatus=save5ccstatus
		focuscctime=save5cctime
		focuslastcc=save5lastcc
		focusccapplytime=save5ccapplytime
	elseif focusGUID==saveGUIDs[6] then
		focusdrlevel=save6drlevel
		focusdrtime=save6drtime
		focusccstatus=save6ccstatus
		focuscctime=save6cctime
		focuslastcc=save6lastcc
		focusccapplytime=save6ccapplytime
	elseif focusGUID==saveGUIDs[7] then
		focusdrlevel=save7drlevel
		focusdrtime=save7drtime
		focusccstatus=save7ccstatus
		focuscctime=save7cctime
		focuslastcc=save7lastcc
		focusccapplytime=save7ccapplytime
	elseif focusGUID==saveGUIDs[8] then
		focusdrlevel=save8drlevel
		focusdrtime=save8drtime
		focusccstatus=save8ccstatus
		focuscctime=save8cctime
		focuslastcc=save8lastcc
		focusccapplytime=save8ccapplytime
	elseif focusGUID==saveGUIDs[9] then
		focusdrlevel=save9drlevel
		focusdrtime=save9drtime
		focusccstatus=save9ccstatus
		focuscctime=save9cctime
		focuslastcc=save9lastcc
		focusccapplytime=save9ccapplytime
	elseif focusGUID==saveGUIDs[10] then
		focusdrlevel=save10drlevel
		focusdrtime=save10drtime
		focusccstatus=save10ccstatus
		focuscctime=save10cctime
		focuslastcc=save10lastcc
		focusccapplytime=save10ccapplytime
	elseif focusGUID==saveGUIDs[11] then
		focusdrlevel=save11drlevel
		focusdrtime=save11drtime
		focusccstatus=save11ccstatus
		focuscctime=save11cctime
		focuslastcc=save11lastcc
		focusccapplytime=save11ccapplytime
	elseif focusGUID==saveGUIDs[12] then
		focusdrlevel=save12drlevel
		focusdrtime=save12drtime
		focusccstatus=save12ccstatus
		focuscctime=save12cctime
		focuslastcc=save12lastcc
		focusccapplytime=save12ccapplytime
	elseif focusGUID==saveGUIDs[13] then
		focusdrlevel=save13drlevel
		focusdrtime=save13drtime
		focusccstatus=save13ccstatus
		focuscctime=save13cctime
		focuslastcc=save13lastcc
		focusccapplytime=save13ccapplytime
	elseif focusGUID==saveGUIDs[14] then
		focusdrlevel=save14drlevel
		focusdrtime=save14drtime
		focusccstatus=save14ccstatus
		focuscctime=save14cctime
		focuslastcc=save14lastcc
		focusccapplytime=save14ccapplytime
	elseif focusGUID==saveGUIDs[15] then
		focusdrlevel=save15drlevel
		focusdrtime=save15drtime
		focusccstatus=save15ccstatus
		focuscctime=save15cctime
		focuslastcc=save15lastcc
		focusccapplytime=save15ccapplytime
	elseif focusGUID==saveGUIDs[16] then
		focusdrlevel=save16drlevel
		focusdrtime=save16drtime
		focusccstatus=save16ccstatus
		focuscctime=save16cctime
		focuslastcc=save16lastcc
		focusccapplytime=save16ccapplytime
	elseif focusGUID==saveGUIDs[17] then
		focusdrlevel=save17drlevel
		focusdrtime=save17drtime
		focusccstatus=save17ccstatus
		focuscctime=save17cctime
		focuslastcc=save17lastcc
		focusccapplytime=save17ccapplytime
	elseif focusGUID==saveGUIDs[18] then
		focusdrlevel=save18drlevel
		focusdrtime=save18drtime
		focusccstatus=save18ccstatus
		focuscctime=save18cctime
		focuslastcc=save18lastcc
		focusccapplytime=save18ccapplytime
	elseif focusGUID==saveGUIDs[19] then
		focusdrlevel=save19drlevel
		focusdrtime=save19drtime
		focusccstatus=save19ccstatus
		focuscctime=save19cctime
		focuslastcc=save19lastcc
		focusccapplytime=save19ccapplytime
	elseif focusGUID==saveGUIDs[20] then
		focusdrlevel=save20drlevel
		focusdrtime=save20drtime
		focusccstatus=save20ccstatus
		focuscctime=save20cctime
		focuslastcc=save20lastcc
		focusccapplytime=save20ccapplytime
	else
		focusdrlevel={3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3}
		focusdrtime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
		focusccstatus={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
		focuscctime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
		focuslastcc={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
		focusccapplytime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
	end
end

function LastSecondOnLoad()
	LastSecondFrame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
	LastSecondFrame:RegisterEvent("ADDON_LOADED")
	LastSecondFrame:RegisterEvent("PLAYER_FOCUS_CHANGED")
	LastSecondFrame:RegisterEvent("PLAYER_TARGET_CHANGED")
	SLASH_LASTSECONDSIZE1='/lssize'
	SLASH_LASTSECONDWINDOW1='/lastsecond'
end

function increasesize()
	lastsecondwindowsize=lastsecondwindowsize+5
	changesize(lastsecondwindowsize)
end

function decreasesize()
	lastsecondwindowsize=lastsecondwindowsize-5
	changesize(lastsecondwindowsize)
end

function SlashCmdList.LASTSECONDSIZE(size)
	changesize(size)
	lastsecondwindowsize=size
end

local liststatus=0
function HideShowList()
	print("showlogin", showlogin)
	if liststatus==0 then
		print("list shown")
		liststatus=1
	else
		print("list hidden")
		liststatus=0
	end
end
function changesize(lastsecondwindowsize)
	LastSecondDisplayAnchor:SetHeight(lastsecondwindowsize)
	LastSecondDisplayAnchor:SetWidth(lastsecondwindowsize*2)
	LastSecondDisplay10:SetHeight(lastsecondwindowsize)
	LastSecondDisplay10:SetWidth(lastsecondwindowsize)
	LastSecondDisplay11:SetHeight(lastsecondwindowsize)
	LastSecondDisplay11:SetWidth(lastsecondwindowsize)
	LastSecondDisplay12:SetHeight(lastsecondwindowsize)
	LastSecondDisplay12:SetWidth(lastsecondwindowsize)
	LastSecondDisplay13:SetHeight(lastsecondwindowsize)
	LastSecondDisplay13:SetWidth(lastsecondwindowsize)
	LastSecondDisplay14:SetHeight(lastsecondwindowsize)
	LastSecondDisplay14:SetWidth(lastsecondwindowsize)
	LastSecondDisplay15:SetHeight(lastsecondwindowsize)
	LastSecondDisplay15:SetWidth(lastsecondwindowsize)
	LastSecondDisplay16:SetHeight(lastsecondwindowsize)
	LastSecondDisplay16:SetWidth(lastsecondwindowsize)
	LastSecondDisplay17:SetHeight(lastsecondwindowsize)
	LastSecondDisplay17:SetWidth(lastsecondwindowsize)
	LastSecondDisplay10Text:SetTextHeight(lastsecondwindowsize/2)
	LastSecondDisplay11Text:SetTextHeight(lastsecondwindowsize/2)
	LastSecondDisplay12Text:SetTextHeight(lastsecondwindowsize/2)
	LastSecondDisplay13Text:SetTextHeight(lastsecondwindowsize/2)
	LastSecondDisplay14Text:SetTextHeight(lastsecondwindowsize/2)
	LastSecondDisplay15Text:SetTextHeight(lastsecondwindowsize/2)
	LastSecondDisplay16Text:SetTextHeight(lastsecondwindowsize/2)
	LastSecondDisplay17Text:SetTextHeight(lastsecondwindowsize/2)

	LastSecondTargetDisplayAnchor:SetHeight(lastsecondwindowsize)
	LastSecondTargetDisplayAnchor:SetWidth(lastsecondwindowsize*2)
	LastSecondTargetDisplay10:SetHeight(lastsecondwindowsize)
	LastSecondTargetDisplay10:SetWidth(lastsecondwindowsize)
	LastSecondTargetDisplay11:SetHeight(lastsecondwindowsize)
	LastSecondTargetDisplay11:SetWidth(lastsecondwindowsize)
	LastSecondTargetDisplay12:SetHeight(lastsecondwindowsize)
	LastSecondTargetDisplay12:SetWidth(lastsecondwindowsize)
	LastSecondTargetDisplay13:SetHeight(lastsecondwindowsize)
	LastSecondTargetDisplay13:SetWidth(lastsecondwindowsize)
	LastSecondTargetDisplay14:SetHeight(lastsecondwindowsize)
	LastSecondTargetDisplay14:SetWidth(lastsecondwindowsize)
	LastSecondTargetDisplay15:SetHeight(lastsecondwindowsize)
	LastSecondTargetDisplay15:SetWidth(lastsecondwindowsize)
	LastSecondTargetDisplay16:SetHeight(lastsecondwindowsize)
	LastSecondTargetDisplay16:SetWidth(lastsecondwindowsize)
	LastSecondTargetDisplay17:SetHeight(lastsecondwindowsize)
	LastSecondTargetDisplay17:SetWidth(lastsecondwindowsize)
	LastSecondTargetDisplay10Text:SetTextHeight(lastsecondwindowsize/2)
	LastSecondTargetDisplay11Text:SetTextHeight(lastsecondwindowsize/2)
	LastSecondTargetDisplay12Text:SetTextHeight(lastsecondwindowsize/2)
	LastSecondTargetDisplay13Text:SetTextHeight(lastsecondwindowsize/2)
	LastSecondTargetDisplay14Text:SetTextHeight(lastsecondwindowsize/2)
	LastSecondTargetDisplay15Text:SetTextHeight(lastsecondwindowsize/2)
	LastSecondTargetDisplay16Text:SetTextHeight(lastsecondwindowsize/2)
	LastSecondTargetDisplay17Text:SetTextHeight(lastsecondwindowsize/2)
	
	LastSecondFocusDisplayAnchor:SetHeight(lastsecondwindowsize)
	LastSecondFocusDisplayAnchor:SetWidth(lastsecondwindowsize*2)
	LastSecondFocusDisplay10:SetHeight(lastsecondwindowsize)
	LastSecondFocusDisplay10:SetWidth(lastsecondwindowsize)
	LastSecondFocusDisplay11:SetHeight(lastsecondwindowsize)
	LastSecondFocusDisplay11:SetWidth(lastsecondwindowsize)
	LastSecondFocusDisplay12:SetHeight(lastsecondwindowsize)
	LastSecondFocusDisplay12:SetWidth(lastsecondwindowsize)
	LastSecondFocusDisplay13:SetHeight(lastsecondwindowsize)
	LastSecondFocusDisplay13:SetWidth(lastsecondwindowsize)
	LastSecondFocusDisplay14:SetHeight(lastsecondwindowsize)
	LastSecondFocusDisplay14:SetWidth(lastsecondwindowsize)
	LastSecondFocusDisplay15:SetHeight(lastsecondwindowsize)
	LastSecondFocusDisplay15:SetWidth(lastsecondwindowsize)
	LastSecondFocusDisplay16:SetHeight(lastsecondwindowsize)
	LastSecondFocusDisplay16:SetWidth(lastsecondwindowsize)
	LastSecondFocusDisplay17:SetHeight(lastsecondwindowsize)
	LastSecondFocusDisplay17:SetWidth(lastsecondwindowsize)
	LastSecondFocusDisplay10Text:SetTextHeight(lastsecondwindowsize/2)
	LastSecondFocusDisplay11Text:SetTextHeight(lastsecondwindowsize/2)
	LastSecondFocusDisplay12Text:SetTextHeight(lastsecondwindowsize/2)
	LastSecondFocusDisplay13Text:SetTextHeight(lastsecondwindowsize/2)
	LastSecondFocusDisplay14Text:SetTextHeight(lastsecondwindowsize/2)
	LastSecondFocusDisplay15Text:SetTextHeight(lastsecondwindowsize/2)
	LastSecondFocusDisplay16Text:SetTextHeight(lastsecondwindowsize/2)
	LastSecondFocusDisplay17Text:SetTextHeight(lastsecondwindowsize/2)

	LastSecondParty1DisplayAnchor:SetHeight(lastsecondwindowsize)
	LastSecondParty1DisplayAnchor:SetWidth(lastsecondwindowsize*2)
	LastSecondParty1Display10:SetHeight(lastsecondwindowsize)
	LastSecondParty1Display10:SetWidth(lastsecondwindowsize)
	LastSecondParty1Display11:SetHeight(lastsecondwindowsize)
	LastSecondParty1Display11:SetWidth(lastsecondwindowsize)
	LastSecondParty1Display12:SetHeight(lastsecondwindowsize)
	LastSecondParty1Display12:SetWidth(lastsecondwindowsize)
	LastSecondParty1Display13:SetHeight(lastsecondwindowsize)
	LastSecondParty1Display13:SetWidth(lastsecondwindowsize)
	LastSecondParty1Display14:SetHeight(lastsecondwindowsize)
	LastSecondParty1Display14:SetWidth(lastsecondwindowsize)
	LastSecondParty1Display15:SetHeight(lastsecondwindowsize)
	LastSecondParty1Display15:SetWidth(lastsecondwindowsize)
	LastSecondParty1Display16:SetHeight(lastsecondwindowsize)
	LastSecondParty1Display16:SetWidth(lastsecondwindowsize)
	LastSecondParty1Display17:SetHeight(lastsecondwindowsize)
	LastSecondParty1Display17:SetWidth(lastsecondwindowsize)
	LastSecondParty1Display10Text:SetTextHeight(lastsecondwindowsize/2)
	LastSecondParty1Display11Text:SetTextHeight(lastsecondwindowsize/2)
	LastSecondParty1Display12Text:SetTextHeight(lastsecondwindowsize/2)
	LastSecondParty1Display13Text:SetTextHeight(lastsecondwindowsize/2)
	LastSecondParty1Display14Text:SetTextHeight(lastsecondwindowsize/2)
	LastSecondParty1Display15Text:SetTextHeight(lastsecondwindowsize/2)
	LastSecondParty1Display16Text:SetTextHeight(lastsecondwindowsize/2)
	LastSecondParty1Display17Text:SetTextHeight(lastsecondwindowsize/2)

	LastSecondParty2DisplayAnchor:SetHeight(lastsecondwindowsize)
	LastSecondParty2DisplayAnchor:SetWidth(lastsecondwindowsize*2)
	LastSecondParty2Display10:SetHeight(lastsecondwindowsize)
	LastSecondParty2Display10:SetWidth(lastsecondwindowsize)
	LastSecondParty2Display11:SetHeight(lastsecondwindowsize)
	LastSecondParty2Display11:SetWidth(lastsecondwindowsize)
	LastSecondParty2Display12:SetHeight(lastsecondwindowsize)
	LastSecondParty2Display12:SetWidth(lastsecondwindowsize)
	LastSecondParty2Display13:SetHeight(lastsecondwindowsize)
	LastSecondParty2Display13:SetWidth(lastsecondwindowsize)
	LastSecondParty2Display14:SetHeight(lastsecondwindowsize)
	LastSecondParty2Display14:SetWidth(lastsecondwindowsize)
	LastSecondParty2Display15:SetHeight(lastsecondwindowsize)
	LastSecondParty2Display15:SetWidth(lastsecondwindowsize)
	LastSecondParty2Display16:SetHeight(lastsecondwindowsize)
	LastSecondParty2Display16:SetWidth(lastsecondwindowsize)
	LastSecondParty2Display17:SetHeight(lastsecondwindowsize)
	LastSecondParty2Display17:SetWidth(lastsecondwindowsize)
	LastSecondParty2Display10Text:SetTextHeight(lastsecondwindowsize/2)
	LastSecondParty2Display11Text:SetTextHeight(lastsecondwindowsize/2)
	LastSecondParty2Display12Text:SetTextHeight(lastsecondwindowsize/2)
	LastSecondParty2Display13Text:SetTextHeight(lastsecondwindowsize/2)
	LastSecondParty2Display14Text:SetTextHeight(lastsecondwindowsize/2)
	LastSecondParty2Display15Text:SetTextHeight(lastsecondwindowsize/2)
	LastSecondParty2Display16Text:SetTextHeight(lastsecondwindowsize/2)
	LastSecondParty2Display17Text:SetTextHeight(lastsecondwindowsize/2)

	LastSecondParty3DisplayAnchor:SetHeight(lastsecondwindowsize)
	LastSecondParty3DisplayAnchor:SetWidth(lastsecondwindowsize*2)
	LastSecondParty3Display10:SetHeight(lastsecondwindowsize)
	LastSecondParty3Display10:SetWidth(lastsecondwindowsize)
	LastSecondParty3Display11:SetHeight(lastsecondwindowsize)
	LastSecondParty3Display11:SetWidth(lastsecondwindowsize)
	LastSecondParty3Display12:SetHeight(lastsecondwindowsize)
	LastSecondParty3Display12:SetWidth(lastsecondwindowsize)
	LastSecondParty3Display13:SetHeight(lastsecondwindowsize)
	LastSecondParty3Display13:SetWidth(lastsecondwindowsize)
	LastSecondParty3Display14:SetHeight(lastsecondwindowsize)
	LastSecondParty3Display14:SetWidth(lastsecondwindowsize)
	LastSecondParty3Display15:SetHeight(lastsecondwindowsize)
	LastSecondParty3Display15:SetWidth(lastsecondwindowsize)
	LastSecondParty3Display16:SetHeight(lastsecondwindowsize)
	LastSecondParty3Display16:SetWidth(lastsecondwindowsize)
	LastSecondParty3Display17:SetHeight(lastsecondwindowsize)
	LastSecondParty3Display17:SetWidth(lastsecondwindowsize)
	LastSecondParty3Display10Text:SetTextHeight(lastsecondwindowsize/2)
	LastSecondParty3Display11Text:SetTextHeight(lastsecondwindowsize/2)
	LastSecondParty3Display12Text:SetTextHeight(lastsecondwindowsize/2)
	LastSecondParty3Display13Text:SetTextHeight(lastsecondwindowsize/2)
	LastSecondParty3Display14Text:SetTextHeight(lastsecondwindowsize/2)
	LastSecondParty3Display15Text:SetTextHeight(lastsecondwindowsize/2)
	LastSecondParty3Display16Text:SetTextHeight(lastsecondwindowsize/2)
	LastSecondParty3Display17Text:SetTextHeight(lastsecondwindowsize/2)

	LastSecondParty4DisplayAnchor:SetHeight(lastsecondwindowsize)
	LastSecondParty4DisplayAnchor:SetWidth(lastsecondwindowsize*2)
	LastSecondParty4Display10:SetHeight(lastsecondwindowsize)
	LastSecondParty4Display10:SetWidth(lastsecondwindowsize)
	LastSecondParty4Display11:SetHeight(lastsecondwindowsize)
	LastSecondParty4Display11:SetWidth(lastsecondwindowsize)
	LastSecondParty4Display12:SetHeight(lastsecondwindowsize)
	LastSecondParty4Display12:SetWidth(lastsecondwindowsize)
	LastSecondParty4Display13:SetHeight(lastsecondwindowsize)
	LastSecondParty4Display13:SetWidth(lastsecondwindowsize)
	LastSecondParty4Display14:SetHeight(lastsecondwindowsize)
	LastSecondParty4Display14:SetWidth(lastsecondwindowsize)
	LastSecondParty4Display15:SetHeight(lastsecondwindowsize)
	LastSecondParty4Display15:SetWidth(lastsecondwindowsize)
	LastSecondParty4Display16:SetHeight(lastsecondwindowsize)
	LastSecondParty4Display16:SetWidth(lastsecondwindowsize)
	LastSecondParty4Display17:SetHeight(lastsecondwindowsize)
	LastSecondParty4Display17:SetWidth(lastsecondwindowsize)
	LastSecondParty4Display10Text:SetTextHeight(lastsecondwindowsize/2)
	LastSecondParty4Display11Text:SetTextHeight(lastsecondwindowsize/2)
	LastSecondParty4Display12Text:SetTextHeight(lastsecondwindowsize/2)
	LastSecondParty4Display13Text:SetTextHeight(lastsecondwindowsize/2)
	LastSecondParty4Display14Text:SetTextHeight(lastsecondwindowsize/2)
	LastSecondParty4Display15Text:SetTextHeight(lastsecondwindowsize/2)
	LastSecondParty4Display16Text:SetTextHeight(lastsecondwindowsize/2)
	LastSecondParty4Display17Text:SetTextHeight(lastsecondwindowsize/2)

	LastSecondArena1DisplayAnchor:SetHeight(lastsecondwindowsize)
	LastSecondArena1DisplayAnchor:SetWidth(lastsecondwindowsize*2)
	LastSecondArena1Display10:SetHeight(lastsecondwindowsize)
	LastSecondArena1Display10:SetWidth(lastsecondwindowsize)
	LastSecondArena1Display11:SetHeight(lastsecondwindowsize)
	LastSecondArena1Display11:SetWidth(lastsecondwindowsize)
	LastSecondArena1Display12:SetHeight(lastsecondwindowsize)
	LastSecondArena1Display12:SetWidth(lastsecondwindowsize)
	LastSecondArena1Display13:SetHeight(lastsecondwindowsize)
	LastSecondArena1Display13:SetWidth(lastsecondwindowsize)
	LastSecondArena1Display14:SetHeight(lastsecondwindowsize)
	LastSecondArena1Display14:SetWidth(lastsecondwindowsize)
	LastSecondArena1Display15:SetHeight(lastsecondwindowsize)
	LastSecondArena1Display15:SetWidth(lastsecondwindowsize)
	LastSecondArena1Display16:SetHeight(lastsecondwindowsize)
	LastSecondArena1Display16:SetWidth(lastsecondwindowsize)
	LastSecondArena1Display17:SetHeight(lastsecondwindowsize)
	LastSecondArena1Display17:SetWidth(lastsecondwindowsize)
	LastSecondArena1Display10Text:SetTextHeight(lastsecondwindowsize/2)
	LastSecondArena1Display11Text:SetTextHeight(lastsecondwindowsize/2)
	LastSecondArena1Display12Text:SetTextHeight(lastsecondwindowsize/2)
	LastSecondArena1Display13Text:SetTextHeight(lastsecondwindowsize/2)
	LastSecondArena1Display14Text:SetTextHeight(lastsecondwindowsize/2)
	LastSecondArena1Display15Text:SetTextHeight(lastsecondwindowsize/2)
	LastSecondArena1Display16Text:SetTextHeight(lastsecondwindowsize/2)
	LastSecondArena1Display17Text:SetTextHeight(lastsecondwindowsize/2)

	LastSecondArena2DisplayAnchor:SetHeight(lastsecondwindowsize)
	LastSecondArena2DisplayAnchor:SetWidth(lastsecondwindowsize*2)
	LastSecondArena2Display10:SetHeight(lastsecondwindowsize)
	LastSecondArena2Display10:SetWidth(lastsecondwindowsize)
	LastSecondArena2Display11:SetHeight(lastsecondwindowsize)
	LastSecondArena2Display11:SetWidth(lastsecondwindowsize)
	LastSecondArena2Display12:SetHeight(lastsecondwindowsize)
	LastSecondArena2Display12:SetWidth(lastsecondwindowsize)
	LastSecondArena2Display13:SetHeight(lastsecondwindowsize)
	LastSecondArena2Display13:SetWidth(lastsecondwindowsize)
	LastSecondArena2Display14:SetHeight(lastsecondwindowsize)
	LastSecondArena2Display14:SetWidth(lastsecondwindowsize)
	LastSecondArena2Display15:SetHeight(lastsecondwindowsize)
	LastSecondArena2Display15:SetWidth(lastsecondwindowsize)
	LastSecondArena2Display16:SetHeight(lastsecondwindowsize)
	LastSecondArena2Display16:SetWidth(lastsecondwindowsize)
	LastSecondArena2Display17:SetHeight(lastsecondwindowsize)
	LastSecondArena2Display17:SetWidth(lastsecondwindowsize)
	LastSecondArena2Display10Text:SetTextHeight(lastsecondwindowsize/2)
	LastSecondArena2Display11Text:SetTextHeight(lastsecondwindowsize/2)
	LastSecondArena2Display12Text:SetTextHeight(lastsecondwindowsize/2)
	LastSecondArena2Display13Text:SetTextHeight(lastsecondwindowsize/2)
	LastSecondArena2Display14Text:SetTextHeight(lastsecondwindowsize/2)
	LastSecondArena2Display15Text:SetTextHeight(lastsecondwindowsize/2)
	LastSecondArena2Display16Text:SetTextHeight(lastsecondwindowsize/2)
	LastSecondArena2Display17Text:SetTextHeight(lastsecondwindowsize/2)

	LastSecondArena3DisplayAnchor:SetHeight(lastsecondwindowsize)
	LastSecondArena3DisplayAnchor:SetWidth(lastsecondwindowsize*2)
	LastSecondArena3Display10:SetHeight(lastsecondwindowsize)
	LastSecondArena3Display10:SetWidth(lastsecondwindowsize)
	LastSecondArena3Display11:SetHeight(lastsecondwindowsize)
	LastSecondArena3Display11:SetWidth(lastsecondwindowsize)
	LastSecondArena3Display12:SetHeight(lastsecondwindowsize)
	LastSecondArena3Display12:SetWidth(lastsecondwindowsize)
	LastSecondArena3Display13:SetHeight(lastsecondwindowsize)
	LastSecondArena3Display13:SetWidth(lastsecondwindowsize)
	LastSecondArena3Display14:SetHeight(lastsecondwindowsize)
	LastSecondArena3Display14:SetWidth(lastsecondwindowsize)
	LastSecondArena3Display15:SetHeight(lastsecondwindowsize)
	LastSecondArena3Display15:SetWidth(lastsecondwindowsize)
	LastSecondArena3Display16:SetHeight(lastsecondwindowsize)
	LastSecondArena3Display16:SetWidth(lastsecondwindowsize)
	LastSecondArena3Display17:SetHeight(lastsecondwindowsize)
	LastSecondArena3Display17:SetWidth(lastsecondwindowsize)
	LastSecondArena3Display10Text:SetTextHeight(lastsecondwindowsize/2)
	LastSecondArena3Display11Text:SetTextHeight(lastsecondwindowsize/2)
	LastSecondArena3Display12Text:SetTextHeight(lastsecondwindowsize/2)
	LastSecondArena3Display13Text:SetTextHeight(lastsecondwindowsize/2)
	LastSecondArena3Display14Text:SetTextHeight(lastsecondwindowsize/2)
	LastSecondArena3Display15Text:SetTextHeight(lastsecondwindowsize/2)
	LastSecondArena3Display16Text:SetTextHeight(lastsecondwindowsize/2)
	LastSecondArena3Display17Text:SetTextHeight(lastsecondwindowsize/2)

	LastSecondArena4DisplayAnchor:SetHeight(lastsecondwindowsize)
	LastSecondArena4DisplayAnchor:SetWidth(lastsecondwindowsize*2)
	LastSecondArena4Display10:SetHeight(lastsecondwindowsize)
	LastSecondArena4Display10:SetWidth(lastsecondwindowsize)
	LastSecondArena4Display11:SetHeight(lastsecondwindowsize)
	LastSecondArena4Display11:SetWidth(lastsecondwindowsize)
	LastSecondArena4Display12:SetHeight(lastsecondwindowsize)
	LastSecondArena4Display12:SetWidth(lastsecondwindowsize)
	LastSecondArena4Display13:SetHeight(lastsecondwindowsize)
	LastSecondArena4Display13:SetWidth(lastsecondwindowsize)
	LastSecondArena4Display14:SetHeight(lastsecondwindowsize)
	LastSecondArena4Display14:SetWidth(lastsecondwindowsize)
	LastSecondArena4Display15:SetHeight(lastsecondwindowsize)
	LastSecondArena4Display15:SetWidth(lastsecondwindowsize)
	LastSecondArena4Display16:SetHeight(lastsecondwindowsize)
	LastSecondArena4Display16:SetWidth(lastsecondwindowsize)
	LastSecondArena4Display17:SetHeight(lastsecondwindowsize)
	LastSecondArena4Display17:SetWidth(lastsecondwindowsize)
	LastSecondArena4Display10Text:SetTextHeight(lastsecondwindowsize/2)
	LastSecondArena4Display11Text:SetTextHeight(lastsecondwindowsize/2)
	LastSecondArena4Display12Text:SetTextHeight(lastsecondwindowsize/2)
	LastSecondArena4Display13Text:SetTextHeight(lastsecondwindowsize/2)
	LastSecondArena4Display14Text:SetTextHeight(lastsecondwindowsize/2)
	LastSecondArena4Display15Text:SetTextHeight(lastsecondwindowsize/2)
	LastSecondArena4Display16Text:SetTextHeight(lastsecondwindowsize/2)
	LastSecondArena4Display17Text:SetTextHeight(lastsecondwindowsize/2)

	LastSecondArena5DisplayAnchor:SetHeight(lastsecondwindowsize)
	LastSecondArena5DisplayAnchor:SetWidth(lastsecondwindowsize*2)
	LastSecondArena5Display10:SetHeight(lastsecondwindowsize)
	LastSecondArena5Display10:SetWidth(lastsecondwindowsize)
	LastSecondArena5Display11:SetHeight(lastsecondwindowsize)
	LastSecondArena5Display11:SetWidth(lastsecondwindowsize)
	LastSecondArena5Display12:SetHeight(lastsecondwindowsize)
	LastSecondArena5Display12:SetWidth(lastsecondwindowsize)
	LastSecondArena5Display13:SetHeight(lastsecondwindowsize)
	LastSecondArena5Display13:SetWidth(lastsecondwindowsize)
	LastSecondArena5Display14:SetHeight(lastsecondwindowsize)
	LastSecondArena5Display14:SetWidth(lastsecondwindowsize)
	LastSecondArena5Display15:SetHeight(lastsecondwindowsize)
	LastSecondArena5Display15:SetWidth(lastsecondwindowsize)
	LastSecondArena5Display16:SetHeight(lastsecondwindowsize)
	LastSecondArena5Display16:SetWidth(lastsecondwindowsize)
	LastSecondArena5Display17:SetHeight(lastsecondwindowsize)
	LastSecondArena5Display17:SetWidth(lastsecondwindowsize)
	LastSecondArena5Display10Text:SetTextHeight(lastsecondwindowsize/2)
	LastSecondArena5Display11Text:SetTextHeight(lastsecondwindowsize/2)
	LastSecondArena5Display12Text:SetTextHeight(lastsecondwindowsize/2)
	LastSecondArena5Display13Text:SetTextHeight(lastsecondwindowsize/2)
	LastSecondArena5Display14Text:SetTextHeight(lastsecondwindowsize/2)
	LastSecondArena5Display15Text:SetTextHeight(lastsecondwindowsize/2)
	LastSecondArena5Display16Text:SetTextHeight(lastsecondwindowsize/2)
	LastSecondArena5Display17Text:SetTextHeight(lastsecondwindowsize/2)
end


function LastSecondWindow(panel)
	panel.name = "Last Second"
	panel.refresh = function(self)
		LastSecondAnchorButton:SetChecked(anchorstatus)
		ControlledRootCheckbox:SetChecked(cconoffstatus[1])
		ControlledStunCheckbox:SetChecked(cconoffstatus[2])
		DisarmCheckbox:SetChecked(cconoffstatus[3])
		DisorientCheckbox:SetChecked(cconoffstatus[4])
		FearCheckbox:SetChecked(cconoffstatus[5])
		HorrorCheckbox:SetChecked(cconoffstatus[6])
		OpenerStunCheckbox:SetChecked(cconoffstatus[7])
		RandomRootCheckbox:SetChecked(cconoffstatus[8])
		RandomStunCheckbox:SetChecked(cconoffstatus[9])
		SilenceCheckbox:SetChecked(cconoffstatus[10])
		BanishCheckbox:SetChecked(cconoffstatus[11])
		ChargeCheckbox:SetChecked(cconoffstatus[12])
		CycloneCheckbox:SetChecked(cconoffstatus[13])
		HibernateCheckbox:SetChecked(cconoffstatus[14])
		EntrapmentCheckbox:SetChecked(cconoffstatus[15])
		ScattershotCheckbox:SetChecked(cconoffstatus[16])
		MindControlCheckbox:SetChecked(cconoffstatus[17])
		ReEnableLoginScreenCheckbox:SetChecked(showlogin)
		SelfEnableArenaCheckbox:SetChecked(selfarenashow)
		PartyEnableArenaCheckbox:SetChecked(partyarenashow)
		OpponentEnableArenaCheckbox:SetChecked(opponentarenashow)
		TargetEnableArenaCheckbox:SetChecked(targetarenashow)
		FocusEnableArenaCheckbox:SetChecked(focusarenashow)
		SelfEnableOtherCheckbox:SetChecked(selfothershow)
		PartyEnableOtherCheckbox:SetChecked(partyothershow)
		TargetEnableOtherCheckbox:SetChecked(targetothershow)
		FocusEnableOtherCheckbox:SetChecked(focusothershow)
	end
	InterfaceOptions_AddCategory(panel);
	function SlashCmdList.LASTSECONDWINDOW(msg, editbox)
		InterfaceOptionsFrame_OpenToCategory(panel);
	end
end

function OpenWindow()
	LastSecondLoginButton:Hide()
	LastSecondLoginBackground:Hide()
	LastSecondLoginText:Hide()
	LastSecondLoginCheckbox:Hide()
	InterfaceOptionsFrame_OpenToCategory("Last Second")
end

function LoginCheckbox()
	if LastSecondLoginCheckbox:GetChecked() then showlogin=0 end
end

--Region:SetPoint("TOP", relativeframe);

function SelfLeftAlign()
	selfalignment=0
	aligndisplay()
end
function SelfRightAlign()
	selfalignment=1
	aligndisplay()
end
function PartyLeftAlign()
	partyalignment=0
	aligndisplay()
end
function PartyRightAlign()
	partyalignment=1
	aligndisplay()
end
function TargetLeftAlign()
	targetalignment=0
	aligndisplay()
end
function TargetRightAlign()
	targetalignment=1
	aligndisplay()
end
function ArenaLeftAlign()
	arenaalignment=0
	aligndisplay()
end
function ArenaRightAlign()
	arenaalignment=1
	aligndisplay()
end
function FocusLeftAlign()
	focusalignment=0
	aligndisplay()
end
function FocusRightAlign()
	focusalignment=1
	aligndisplay()
end

function aligndisplay()
	LastSecondDisplay17:ClearAllPoints()
	LastSecondDisplay16:ClearAllPoints()
	LastSecondDisplay15:ClearAllPoints()
	LastSecondDisplay14:ClearAllPoints()
	LastSecondDisplay13:ClearAllPoints()
	LastSecondDisplay12:ClearAllPoints()
	LastSecondDisplay11:ClearAllPoints()
	LastSecondDisplay10:ClearAllPoints()
	if selfalignment==0 then
		LastSecondDisplay17:SetPoint("LEFT", LastSecondDisplayAnchor, "LEFT")
		LastSecondDisplay16:SetPoint("LEFT", LastSecondDisplay17, "RIGHT")
		LastSecondDisplay15:SetPoint("LEFT", LastSecondDisplay16, "RIGHT")
		LastSecondDisplay14:SetPoint("LEFT", LastSecondDisplay15, "RIGHT")
		LastSecondDisplay13:SetPoint("LEFT", LastSecondDisplay14, "RIGHT")
		LastSecondDisplay12:SetPoint("LEFT", LastSecondDisplay13, "RIGHT")
		LastSecondDisplay11:SetPoint("LEFT", LastSecondDisplay12, "RIGHT")
		LastSecondDisplay10:SetPoint("LEFT", LastSecondDisplay11, "RIGHT")
	else
		LastSecondDisplay17:SetPoint("RIGHT", LastSecondDisplayAnchor, "RIGHT")
		LastSecondDisplay16:SetPoint("RIGHT", LastSecondDisplay17, "LEFT")
		LastSecondDisplay15:SetPoint("RIGHT", LastSecondDisplay16, "LEFT")
		LastSecondDisplay14:SetPoint("RIGHT", LastSecondDisplay15, "LEFT")
		LastSecondDisplay13:SetPoint("RIGHT", LastSecondDisplay14, "LEFT")
		LastSecondDisplay12:SetPoint("RIGHT", LastSecondDisplay13, "LEFT")
		LastSecondDisplay11:SetPoint("RIGHT", LastSecondDisplay12, "LEFT")
		LastSecondDisplay10:SetPoint("RIGHT", LastSecondDisplay11, "LEFT")
	end

	LastSecondFocusDisplay17:ClearAllPoints()
	LastSecondFocusDisplay16:ClearAllPoints()
	LastSecondFocusDisplay15:ClearAllPoints()
	LastSecondFocusDisplay14:ClearAllPoints()
	LastSecondFocusDisplay13:ClearAllPoints()
	LastSecondFocusDisplay12:ClearAllPoints()
	LastSecondFocusDisplay11:ClearAllPoints()
	LastSecondFocusDisplay10:ClearAllPoints()
	if focusalignment==0 then
		LastSecondFocusDisplay17:SetPoint("LEFT", LastSecondFocusDisplayAnchor, "LEFT")
		LastSecondFocusDisplay16:SetPoint("LEFT", LastSecondFocusDisplay17, "RIGHT")
		LastSecondFocusDisplay15:SetPoint("LEFT", LastSecondFocusDisplay16, "RIGHT")
		LastSecondFocusDisplay14:SetPoint("LEFT", LastSecondFocusDisplay15, "RIGHT")
		LastSecondFocusDisplay13:SetPoint("LEFT", LastSecondFocusDisplay14, "RIGHT")
		LastSecondFocusDisplay12:SetPoint("LEFT", LastSecondFocusDisplay13, "RIGHT")
		LastSecondFocusDisplay11:SetPoint("LEFT", LastSecondFocusDisplay12, "RIGHT")
		LastSecondFocusDisplay10:SetPoint("LEFT", LastSecondFocusDisplay11, "RIGHT")
	else
		LastSecondFocusDisplay17:SetPoint("RIGHT", LastSecondFocusDisplayAnchor, "RIGHT")
		LastSecondFocusDisplay16:SetPoint("RIGHT", LastSecondFocusDisplay17, "LEFT")
		LastSecondFocusDisplay15:SetPoint("RIGHT", LastSecondFocusDisplay16, "LEFT")
		LastSecondFocusDisplay14:SetPoint("RIGHT", LastSecondFocusDisplay15, "LEFT")
		LastSecondFocusDisplay13:SetPoint("RIGHT", LastSecondFocusDisplay14, "LEFT")
		LastSecondFocusDisplay12:SetPoint("RIGHT", LastSecondFocusDisplay13, "LEFT")
		LastSecondFocusDisplay11:SetPoint("RIGHT", LastSecondFocusDisplay12, "LEFT")
		LastSecondFocusDisplay10:SetPoint("RIGHT", LastSecondFocusDisplay11, "LEFT")
	end

	LastSecondParty1Display17:ClearAllPoints()
	LastSecondParty1Display16:ClearAllPoints()
	LastSecondParty1Display15:ClearAllPoints()
	LastSecondParty1Display14:ClearAllPoints()
	LastSecondParty1Display13:ClearAllPoints()
	LastSecondParty1Display12:ClearAllPoints()
	LastSecondParty1Display11:ClearAllPoints()
	LastSecondParty1Display10:ClearAllPoints()
	if partyalignment==0 then
		LastSecondParty1Display17:SetPoint("LEFT", LastSecondParty1DisplayAnchor, "LEFT")
		LastSecondParty1Display16:SetPoint("LEFT", LastSecondParty1Display17, "RIGHT")
		LastSecondParty1Display15:SetPoint("LEFT", LastSecondParty1Display16, "RIGHT")
		LastSecondParty1Display14:SetPoint("LEFT", LastSecondParty1Display15, "RIGHT")
		LastSecondParty1Display13:SetPoint("LEFT", LastSecondParty1Display14, "RIGHT")
		LastSecondParty1Display12:SetPoint("LEFT", LastSecondParty1Display13, "RIGHT")
		LastSecondParty1Display11:SetPoint("LEFT", LastSecondParty1Display12, "RIGHT")
		LastSecondParty1Display10:SetPoint("LEFT", LastSecondParty1Display11, "RIGHT")
	else
		LastSecondParty1Display17:SetPoint("RIGHT", LastSecondParty1DisplayAnchor, "RIGHT")
		LastSecondParty1Display16:SetPoint("RIGHT", LastSecondParty1Display17, "LEFT")
		LastSecondParty1Display15:SetPoint("RIGHT", LastSecondParty1Display16, "LEFT")
		LastSecondParty1Display14:SetPoint("RIGHT", LastSecondParty1Display15, "LEFT")
		LastSecondParty1Display13:SetPoint("RIGHT", LastSecondParty1Display14, "LEFT")
		LastSecondParty1Display12:SetPoint("RIGHT", LastSecondParty1Display13, "LEFT")
		LastSecondParty1Display11:SetPoint("RIGHT", LastSecondParty1Display12, "LEFT")
		LastSecondParty1Display10:SetPoint("RIGHT", LastSecondParty1Display11, "LEFT")
	end

	LastSecondParty2Display17:ClearAllPoints()
	LastSecondParty2Display16:ClearAllPoints()
	LastSecondParty2Display15:ClearAllPoints()
	LastSecondParty2Display14:ClearAllPoints()
	LastSecondParty2Display13:ClearAllPoints()
	LastSecondParty2Display12:ClearAllPoints()
	LastSecondParty2Display11:ClearAllPoints()
	LastSecondParty2Display10:ClearAllPoints()
	if partyalignment==0 then
		LastSecondParty2Display17:SetPoint("LEFT", LastSecondParty2DisplayAnchor, "LEFT")
		LastSecondParty2Display16:SetPoint("LEFT", LastSecondParty2Display17, "RIGHT")
		LastSecondParty2Display15:SetPoint("LEFT", LastSecondParty2Display16, "RIGHT")
		LastSecondParty2Display14:SetPoint("LEFT", LastSecondParty2Display15, "RIGHT")
		LastSecondParty2Display13:SetPoint("LEFT", LastSecondParty2Display14, "RIGHT")
		LastSecondParty2Display12:SetPoint("LEFT", LastSecondParty2Display13, "RIGHT")
		LastSecondParty2Display11:SetPoint("LEFT", LastSecondParty2Display12, "RIGHT")
		LastSecondParty2Display10:SetPoint("LEFT", LastSecondParty2Display11, "RIGHT")
	else
		LastSecondParty2Display17:SetPoint("RIGHT", LastSecondParty2DisplayAnchor, "RIGHT")
		LastSecondParty2Display16:SetPoint("RIGHT", LastSecondParty2Display17, "LEFT")
		LastSecondParty2Display15:SetPoint("RIGHT", LastSecondParty2Display16, "LEFT")
		LastSecondParty2Display14:SetPoint("RIGHT", LastSecondParty2Display15, "LEFT")
		LastSecondParty2Display13:SetPoint("RIGHT", LastSecondParty2Display14, "LEFT")
		LastSecondParty2Display12:SetPoint("RIGHT", LastSecondParty2Display13, "LEFT")
		LastSecondParty2Display11:SetPoint("RIGHT", LastSecondParty2Display12, "LEFT")
		LastSecondParty2Display10:SetPoint("RIGHT", LastSecondParty2Display11, "LEFT")
	end

	LastSecondParty3Display17:ClearAllPoints()
	LastSecondParty3Display16:ClearAllPoints()
	LastSecondParty3Display15:ClearAllPoints()
	LastSecondParty3Display14:ClearAllPoints()
	LastSecondParty3Display13:ClearAllPoints()
	LastSecondParty3Display12:ClearAllPoints()
	LastSecondParty3Display11:ClearAllPoints()
	LastSecondParty3Display10:ClearAllPoints()
	if partyalignment==0 then
		LastSecondParty3Display17:SetPoint("LEFT", LastSecondParty3DisplayAnchor, "LEFT")
		LastSecondParty3Display16:SetPoint("LEFT", LastSecondParty3Display17, "RIGHT")
		LastSecondParty3Display15:SetPoint("LEFT", LastSecondParty3Display16, "RIGHT")
		LastSecondParty3Display14:SetPoint("LEFT", LastSecondParty3Display15, "RIGHT")
		LastSecondParty3Display13:SetPoint("LEFT", LastSecondParty3Display14, "RIGHT")
		LastSecondParty3Display12:SetPoint("LEFT", LastSecondParty3Display13, "RIGHT")
		LastSecondParty3Display11:SetPoint("LEFT", LastSecondParty3Display12, "RIGHT")
		LastSecondParty3Display10:SetPoint("LEFT", LastSecondParty3Display11, "RIGHT")
	else
		LastSecondParty3Display17:SetPoint("RIGHT", LastSecondParty3DisplayAnchor, "RIGHT")
		LastSecondParty3Display16:SetPoint("RIGHT", LastSecondParty3Display17, "LEFT")
		LastSecondParty3Display15:SetPoint("RIGHT", LastSecondParty3Display16, "LEFT")
		LastSecondParty3Display14:SetPoint("RIGHT", LastSecondParty3Display15, "LEFT")
		LastSecondParty3Display13:SetPoint("RIGHT", LastSecondParty3Display14, "LEFT")
		LastSecondParty3Display12:SetPoint("RIGHT", LastSecondParty3Display13, "LEFT")
		LastSecondParty3Display11:SetPoint("RIGHT", LastSecondParty3Display12, "LEFT")
		LastSecondParty3Display10:SetPoint("RIGHT", LastSecondParty3Display11, "LEFT")
	end

	LastSecondParty4Display17:ClearAllPoints()
	LastSecondParty4Display16:ClearAllPoints()
	LastSecondParty4Display15:ClearAllPoints()
	LastSecondParty4Display14:ClearAllPoints()
	LastSecondParty4Display13:ClearAllPoints()
	LastSecondParty4Display12:ClearAllPoints()
	LastSecondParty4Display11:ClearAllPoints()
	LastSecondParty4Display10:ClearAllPoints()
	if partyalignment==0 then
		LastSecondParty4Display17:SetPoint("LEFT", LastSecondParty4DisplayAnchor, "LEFT")
		LastSecondParty4Display16:SetPoint("LEFT", LastSecondParty4Display17, "RIGHT")
		LastSecondParty4Display15:SetPoint("LEFT", LastSecondParty4Display16, "RIGHT")
		LastSecondParty4Display14:SetPoint("LEFT", LastSecondParty4Display15, "RIGHT")
		LastSecondParty4Display13:SetPoint("LEFT", LastSecondParty4Display14, "RIGHT")
		LastSecondParty4Display12:SetPoint("LEFT", LastSecondParty4Display13, "RIGHT")
		LastSecondParty4Display11:SetPoint("LEFT", LastSecondParty4Display12, "RIGHT")
		LastSecondParty4Display10:SetPoint("LEFT", LastSecondParty4Display11, "RIGHT")
	else
		LastSecondParty4Display17:SetPoint("RIGHT", LastSecondParty4DisplayAnchor, "RIGHT")
		LastSecondParty4Display16:SetPoint("RIGHT", LastSecondParty4Display17, "LEFT")
		LastSecondParty4Display15:SetPoint("RIGHT", LastSecondParty4Display16, "LEFT")
		LastSecondParty4Display14:SetPoint("RIGHT", LastSecondParty4Display15, "LEFT")
		LastSecondParty4Display13:SetPoint("RIGHT", LastSecondParty4Display14, "LEFT")
		LastSecondParty4Display12:SetPoint("RIGHT", LastSecondParty4Display13, "LEFT")
		LastSecondParty4Display11:SetPoint("RIGHT", LastSecondParty4Display12, "LEFT")
		LastSecondParty4Display10:SetPoint("RIGHT", LastSecondParty4Display11, "LEFT")
	end

	LastSecondArena1Display17:ClearAllPoints()
	LastSecondArena1Display16:ClearAllPoints()
	LastSecondArena1Display15:ClearAllPoints()
	LastSecondArena1Display14:ClearAllPoints()
	LastSecondArena1Display13:ClearAllPoints()
	LastSecondArena1Display12:ClearAllPoints()
	LastSecondArena1Display11:ClearAllPoints()
	LastSecondArena1Display10:ClearAllPoints()
	if arenaalignment==0 then
		LastSecondArena1Display17:SetPoint("LEFT", LastSecondArena1DisplayAnchor, "LEFT")
		LastSecondArena1Display16:SetPoint("LEFT", LastSecondArena1Display17, "RIGHT")
		LastSecondArena1Display15:SetPoint("LEFT", LastSecondArena1Display16, "RIGHT")
		LastSecondArena1Display14:SetPoint("LEFT", LastSecondArena1Display15, "RIGHT")
		LastSecondArena1Display13:SetPoint("LEFT", LastSecondArena1Display14, "RIGHT")
		LastSecondArena1Display12:SetPoint("LEFT", LastSecondArena1Display13, "RIGHT")
		LastSecondArena1Display11:SetPoint("LEFT", LastSecondArena1Display12, "RIGHT")
		LastSecondArena1Display10:SetPoint("LEFT", LastSecondArena1Display11, "RIGHT")
	else
		LastSecondArena1Display17:SetPoint("RIGHT", LastSecondArena1DisplayAnchor, "RIGHT")
		LastSecondArena1Display16:SetPoint("RIGHT", LastSecondArena1Display17, "LEFT")
		LastSecondArena1Display15:SetPoint("RIGHT", LastSecondArena1Display16, "LEFT")
		LastSecondArena1Display14:SetPoint("RIGHT", LastSecondArena1Display15, "LEFT")
		LastSecondArena1Display13:SetPoint("RIGHT", LastSecondArena1Display14, "LEFT")
		LastSecondArena1Display12:SetPoint("RIGHT", LastSecondArena1Display13, "LEFT")
		LastSecondArena1Display11:SetPoint("RIGHT", LastSecondArena1Display12, "LEFT")
		LastSecondArena1Display10:SetPoint("RIGHT", LastSecondArena1Display11, "LEFT")
	end

	LastSecondArena2Display17:ClearAllPoints()
	LastSecondArena2Display16:ClearAllPoints()
	LastSecondArena2Display15:ClearAllPoints()
	LastSecondArena2Display14:ClearAllPoints()
	LastSecondArena2Display13:ClearAllPoints()
	LastSecondArena2Display12:ClearAllPoints()
	LastSecondArena2Display11:ClearAllPoints()
	LastSecondArena2Display10:ClearAllPoints()
	if arenaalignment==0 then
		LastSecondArena2Display17:SetPoint("LEFT", LastSecondArena2DisplayAnchor, "LEFT")
		LastSecondArena2Display16:SetPoint("LEFT", LastSecondArena2Display17, "RIGHT")
		LastSecondArena2Display15:SetPoint("LEFT", LastSecondArena2Display16, "RIGHT")
		LastSecondArena2Display14:SetPoint("LEFT", LastSecondArena2Display15, "RIGHT")
		LastSecondArena2Display13:SetPoint("LEFT", LastSecondArena2Display14, "RIGHT")
		LastSecondArena2Display12:SetPoint("LEFT", LastSecondArena2Display13, "RIGHT")
		LastSecondArena2Display11:SetPoint("LEFT", LastSecondArena2Display12, "RIGHT")
		LastSecondArena2Display10:SetPoint("LEFT", LastSecondArena2Display11, "RIGHT")
	else
		LastSecondArena2Display17:SetPoint("RIGHT", LastSecondArena2DisplayAnchor, "RIGHT")
		LastSecondArena2Display16:SetPoint("RIGHT", LastSecondArena2Display17, "LEFT")
		LastSecondArena2Display15:SetPoint("RIGHT", LastSecondArena2Display16, "LEFT")
		LastSecondArena2Display14:SetPoint("RIGHT", LastSecondArena2Display15, "LEFT")
		LastSecondArena2Display13:SetPoint("RIGHT", LastSecondArena2Display14, "LEFT")
		LastSecondArena2Display12:SetPoint("RIGHT", LastSecondArena2Display13, "LEFT")
		LastSecondArena2Display11:SetPoint("RIGHT", LastSecondArena2Display12, "LEFT")
		LastSecondArena2Display10:SetPoint("RIGHT", LastSecondArena2Display11, "LEFT")
	end

	LastSecondArena3Display17:ClearAllPoints()
	LastSecondArena3Display16:ClearAllPoints()
	LastSecondArena3Display15:ClearAllPoints()
	LastSecondArena3Display14:ClearAllPoints()
	LastSecondArena3Display13:ClearAllPoints()
	LastSecondArena3Display12:ClearAllPoints()
	LastSecondArena3Display11:ClearAllPoints()
	LastSecondArena3Display10:ClearAllPoints()
	if arenaalignment==0 then
		LastSecondArena3Display17:SetPoint("LEFT", LastSecondArena3DisplayAnchor, "LEFT")
		LastSecondArena3Display16:SetPoint("LEFT", LastSecondArena3Display17, "RIGHT")
		LastSecondArena3Display15:SetPoint("LEFT", LastSecondArena3Display16, "RIGHT")
		LastSecondArena3Display14:SetPoint("LEFT", LastSecondArena3Display15, "RIGHT")
		LastSecondArena3Display13:SetPoint("LEFT", LastSecondArena3Display14, "RIGHT")
		LastSecondArena3Display12:SetPoint("LEFT", LastSecondArena3Display13, "RIGHT")
		LastSecondArena3Display11:SetPoint("LEFT", LastSecondArena3Display12, "RIGHT")
		LastSecondArena3Display10:SetPoint("LEFT", LastSecondArena3Display11, "RIGHT")
	else
		LastSecondArena3Display17:SetPoint("RIGHT", LastSecondArena3DisplayAnchor, "RIGHT")
		LastSecondArena3Display16:SetPoint("RIGHT", LastSecondArena3Display17, "LEFT")
		LastSecondArena3Display15:SetPoint("RIGHT", LastSecondArena3Display16, "LEFT")
		LastSecondArena3Display14:SetPoint("RIGHT", LastSecondArena3Display15, "LEFT")
		LastSecondArena3Display13:SetPoint("RIGHT", LastSecondArena3Display14, "LEFT")
		LastSecondArena3Display12:SetPoint("RIGHT", LastSecondArena3Display13, "LEFT")
		LastSecondArena3Display11:SetPoint("RIGHT", LastSecondArena3Display12, "LEFT")
		LastSecondArena3Display10:SetPoint("RIGHT", LastSecondArena3Display11, "LEFT")
	end

	LastSecondArena4Display17:ClearAllPoints()
	LastSecondArena4Display16:ClearAllPoints()
	LastSecondArena4Display15:ClearAllPoints()
	LastSecondArena4Display14:ClearAllPoints()
	LastSecondArena4Display13:ClearAllPoints()
	LastSecondArena4Display12:ClearAllPoints()
	LastSecondArena4Display11:ClearAllPoints()
	LastSecondArena4Display10:ClearAllPoints()
	if arenaalignment==0 then
		LastSecondArena4Display17:SetPoint("LEFT", LastSecondArena4DisplayAnchor, "LEFT")
		LastSecondArena4Display16:SetPoint("LEFT", LastSecondArena4Display17, "RIGHT")
		LastSecondArena4Display15:SetPoint("LEFT", LastSecondArena4Display16, "RIGHT")
		LastSecondArena4Display14:SetPoint("LEFT", LastSecondArena4Display15, "RIGHT")
		LastSecondArena4Display13:SetPoint("LEFT", LastSecondArena4Display14, "RIGHT")
		LastSecondArena4Display12:SetPoint("LEFT", LastSecondArena4Display13, "RIGHT")
		LastSecondArena4Display11:SetPoint("LEFT", LastSecondArena4Display12, "RIGHT")
		LastSecondArena4Display10:SetPoint("LEFT", LastSecondArena4Display11, "RIGHT")
	else
		LastSecondArena4Display17:SetPoint("RIGHT", LastSecondArena4DisplayAnchor, "RIGHT")
		LastSecondArena4Display16:SetPoint("RIGHT", LastSecondArena4Display17, "LEFT")
		LastSecondArena4Display15:SetPoint("RIGHT", LastSecondArena4Display16, "LEFT")
		LastSecondArena4Display14:SetPoint("RIGHT", LastSecondArena4Display15, "LEFT")
		LastSecondArena4Display13:SetPoint("RIGHT", LastSecondArena4Display14, "LEFT")
		LastSecondArena4Display12:SetPoint("RIGHT", LastSecondArena4Display13, "LEFT")
		LastSecondArena4Display11:SetPoint("RIGHT", LastSecondArena4Display12, "LEFT")
		LastSecondArena4Display10:SetPoint("RIGHT", LastSecondArena4Display11, "LEFT")
	end

	LastSecondArena5Display17:ClearAllPoints()
	LastSecondArena5Display16:ClearAllPoints()
	LastSecondArena5Display15:ClearAllPoints()
	LastSecondArena5Display14:ClearAllPoints()
	LastSecondArena5Display13:ClearAllPoints()
	LastSecondArena5Display12:ClearAllPoints()
	LastSecondArena5Display11:ClearAllPoints()
	LastSecondArena5Display10:ClearAllPoints()
	if arenaalignment==0 then
		LastSecondArena5Display17:SetPoint("LEFT", LastSecondArena5DisplayAnchor, "LEFT")
		LastSecondArena5Display16:SetPoint("LEFT", LastSecondArena5Display17, "RIGHT")
		LastSecondArena5Display15:SetPoint("LEFT", LastSecondArena5Display16, "RIGHT")
		LastSecondArena5Display14:SetPoint("LEFT", LastSecondArena5Display15, "RIGHT")
		LastSecondArena5Display13:SetPoint("LEFT", LastSecondArena5Display14, "RIGHT")
		LastSecondArena5Display12:SetPoint("LEFT", LastSecondArena5Display13, "RIGHT")
		LastSecondArena5Display11:SetPoint("LEFT", LastSecondArena5Display12, "RIGHT")
		LastSecondArena5Display10:SetPoint("LEFT", LastSecondArena5Display11, "RIGHT")
	else
		LastSecondArena5Display17:SetPoint("RIGHT", LastSecondArena5DisplayAnchor, "RIGHT")
		LastSecondArena5Display16:SetPoint("RIGHT", LastSecondArena5Display17, "LEFT")
		LastSecondArena5Display15:SetPoint("RIGHT", LastSecondArena5Display16, "LEFT")
		LastSecondArena5Display14:SetPoint("RIGHT", LastSecondArena5Display15, "LEFT")
		LastSecondArena5Display13:SetPoint("RIGHT", LastSecondArena5Display14, "LEFT")
		LastSecondArena5Display12:SetPoint("RIGHT", LastSecondArena5Display13, "LEFT")
		LastSecondArena5Display11:SetPoint("RIGHT", LastSecondArena5Display12, "LEFT")
		LastSecondArena5Display10:SetPoint("RIGHT", LastSecondArena5Display11, "LEFT")
	end

	LastSecondTargetDisplay17:ClearAllPoints()
	LastSecondTargetDisplay16:ClearAllPoints()
	LastSecondTargetDisplay15:ClearAllPoints()
	LastSecondTargetDisplay14:ClearAllPoints()
	LastSecondTargetDisplay13:ClearAllPoints()
	LastSecondTargetDisplay12:ClearAllPoints()
	LastSecondTargetDisplay11:ClearAllPoints()
	LastSecondTargetDisplay10:ClearAllPoints()
	if targetalignment==0 then
		LastSecondTargetDisplay17:SetPoint("LEFT", LastSecondTargetDisplayAnchor, "LEFT")
		LastSecondTargetDisplay16:SetPoint("LEFT", LastSecondTargetDisplay17, "RIGHT")
		LastSecondTargetDisplay15:SetPoint("LEFT", LastSecondTargetDisplay16, "RIGHT")
		LastSecondTargetDisplay14:SetPoint("LEFT", LastSecondTargetDisplay15, "RIGHT")
		LastSecondTargetDisplay13:SetPoint("LEFT", LastSecondTargetDisplay14, "RIGHT")
		LastSecondTargetDisplay12:SetPoint("LEFT", LastSecondTargetDisplay13, "RIGHT")
		LastSecondTargetDisplay11:SetPoint("LEFT", LastSecondTargetDisplay12, "RIGHT")
		LastSecondTargetDisplay10:SetPoint("LEFT", LastSecondTargetDisplay11, "RIGHT")
	else
		LastSecondTargetDisplay17:SetPoint("RIGHT", LastSecondTargetDisplayAnchor, "RIGHT")
		LastSecondTargetDisplay16:SetPoint("RIGHT", LastSecondTargetDisplay17, "LEFT")
		LastSecondTargetDisplay15:SetPoint("RIGHT", LastSecondTargetDisplay16, "LEFT")
		LastSecondTargetDisplay14:SetPoint("RIGHT", LastSecondTargetDisplay15, "LEFT")
		LastSecondTargetDisplay13:SetPoint("RIGHT", LastSecondTargetDisplay14, "LEFT")
		LastSecondTargetDisplay12:SetPoint("RIGHT", LastSecondTargetDisplay13, "LEFT")
		LastSecondTargetDisplay11:SetPoint("RIGHT", LastSecondTargetDisplay12, "LEFT")
		LastSecondTargetDisplay10:SetPoint("RIGHT", LastSecondTargetDisplay11, "LEFT")
	end
end

function LastSecondCheckboxHandler()
		if ControlledRootCheckbox:GetChecked() then cconoffstatus[1]=1 else cconoffstatus[1]=0 end
		if ControlledStunCheckbox:GetChecked() then cconoffstatus[2]=1 else cconoffstatus[2]=0 end
		if DisarmCheckbox:GetChecked() then cconoffstatus[3]=1 else cconoffstatus[3]=0 end
		if DisorientCheckbox:GetChecked() then cconoffstatus[4]=1 else cconoffstatus[4]=0 end
		if FearCheckbox:GetChecked() then cconoffstatus[5]=1 else cconoffstatus[5]=0 end
		if HorrorCheckbox:GetChecked() then cconoffstatus[6]=1 else cconoffstatus[6]=0 end
		if OpenerStunCheckbox:GetChecked() then cconoffstatus[7]=1 else cconoffstatus[7]=0 end
		if RandomRootCheckbox:GetChecked() then cconoffstatus[8]=1 else cconoffstatus[8]=0 end
		if RandomStunCheckbox:GetChecked() then cconoffstatus[9]=1 else cconoffstatus[9]=0 end
		if SilenceCheckbox:GetChecked() then cconoffstatus[10]=1 else cconoffstatus[10]=0 end
		if BanishCheckbox:GetChecked() then cconoffstatus[11]=1 else cconoffstatus[11]=0 end
		if ChargeCheckbox:GetChecked() then cconoffstatus[12]=1 else cconoffstatus[12]=0 end
		if CycloneCheckbox:GetChecked() then cconoffstatus[13]=1 else cconoffstatus[13]=0 end
		if HibernateCheckbox:GetChecked() then cconoffstatus[14]=1 else cconoffstatus[14]=0 end
		if EntrapmentCheckbox:GetChecked() then cconoffstatus[15]=1 else cconoffstatus[15]=0 end
		if ScattershotCheckbox:GetChecked() then cconoffstatus[16]=1 else cconoffstatus[16]=0 end
		if MindControlCheckbox:GetChecked() then cconoffstatus[17]=1 else cconoffstatus[17]=0 end
		if ReEnableLoginScreenCheckbox:GetChecked() then showlogin=1 else showlogin=0 end
		if SelfEnableArenaCheckbox:GetChecked() then selfarenashow=1 else selfarenashow=0 end
		if PartyEnableArenaCheckbox:GetChecked() then partyarenashow=1 else partyarenashow=0 end
		if OpponentEnableArenaCheckbox:GetChecked() then opponentarenashow=1 else opponentarenashow=0 end
		if TargetEnableArenaCheckbox:GetChecked() then targetarenashow=1 else targetarenashow=0 end
		if FocusEnableArenaCheckbox:GetChecked() then focusarenashow=1 else focusarenashow=0 end
		if SelfEnableOtherCheckbox:GetChecked() then selfothershow=1 else selfothershow=0 end
		if PartyEnableOtherCheckbox:GetChecked() then partyothershow=1 else partyothershow=0 end
		if TargetEnableOtherCheckbox:GetChecked() then targetothershow=1 else targetothershow=0 end
		if FocusEnableOtherCheckbox:GetChecked() then focusothershow=1 else focusothershow=0 end
		cc1=cconoffstatus[1]; cc2=cconoffstatus[2]; cc3=cconoffstatus[3]; cc4=cconoffstatus[4]; cc5=cconoffstatus[5]; cc6=cconoffstatus[6]; cc7=cconoffstatus[7];
		cc8=cconoffstatus[8]; cc9=cconoffstatus[9]; cc10=cconoffstatus[10]; cc11=cconoffstatus[11]; cc12=cconoffstatus[12]; cc13=cconoffstatus[13]; cc14=cconoffstatus[14];
		cc15=cconoffstatus[15]; cc16=cconoffstatus[16]; cc17=cconoffstatus[17];
		if LastSecondExampleButton:GetChecked() then example=1 else example=0 end
		anchorbutton()
		buildframechain()
end

function anchorbutton()
	if LastSecondAnchorButton:GetChecked() then
		LastSecondDisplayAnchorText:SetText("Self Anchor")
		LastSecondDisplayAnchor:SetBackdrop({bgFile="Interface/DialogFrame/UI-DialogBox-Background"})
		LastSecondFocusDisplayAnchorText:SetText("Focus Anchor")
		LastSecondFocusDisplayAnchor:SetBackdrop({bgFile="Interface/DialogFrame/UI-DialogBox-Background"})
		LastSecondTargetDisplayAnchorText:SetText("Target Anchor")
		LastSecondTargetDisplayAnchor:SetBackdrop({bgFile="Interface/DialogFrame/UI-DialogBox-Background"})
		LastSecondParty1DisplayAnchorText:SetText("Party 1 Anchor")
		LastSecondParty1DisplayAnchor:SetBackdrop({bgFile="Interface/DialogFrame/UI-DialogBox-Background"})
		LastSecondParty2DisplayAnchorText:SetText("Party 2 Anchor")
		LastSecondParty2DisplayAnchor:SetBackdrop({bgFile="Interface/DialogFrame/UI-DialogBox-Background"})
		LastSecondParty3DisplayAnchorText:SetText("Party 3 Anchor")
		LastSecondParty3DisplayAnchor:SetBackdrop({bgFile="Interface/DialogFrame/UI-DialogBox-Background"})
		LastSecondParty4DisplayAnchorText:SetText("Party 4 Anchor")
		LastSecondParty4DisplayAnchor:SetBackdrop({bgFile="Interface/DialogFrame/UI-DialogBox-Background"})
		LastSecondArena1DisplayAnchorText:SetText("Arena 1 Anchor")
		LastSecondArena1DisplayAnchor:SetBackdrop({bgFile="Interface/DialogFrame/UI-DialogBox-Background"})
		LastSecondArena2DisplayAnchorText:SetText("Arena 2 Anchor")
		LastSecondArena2DisplayAnchor:SetBackdrop({bgFile="Interface/DialogFrame/UI-DialogBox-Background"})
		LastSecondArena3DisplayAnchorText:SetText("Arena 3 Anchor")
		LastSecondArena3DisplayAnchor:SetBackdrop({bgFile="Interface/DialogFrame/UI-DialogBox-Background"})
		LastSecondArena4DisplayAnchorText:SetText("Arena 4 Anchor")
		LastSecondArena4DisplayAnchor:SetBackdrop({bgFile="Interface/DialogFrame/UI-DialogBox-Background"})
		LastSecondArena5DisplayAnchorText:SetText("Arena 5 Anchor")
		LastSecondArena5DisplayAnchor:SetBackdrop({bgFile="Interface/DialogFrame/UI-DialogBox-Background"})

		LastSecondDisplayAnchor:SetHitRectInsets(-lastsecondwindowsize, -lastsecondwindowsize, -.5*lastsecondwindowsize, -.5*lastsecondwindowsize)
		LastSecondFocusDisplayAnchor:SetHitRectInsets(-lastsecondwindowsize, -lastsecondwindowsize, -.5*lastsecondwindowsize, -.5*lastsecondwindowsize)
		LastSecondTargetDisplayAnchor:SetHitRectInsets(-lastsecondwindowsize, -lastsecondwindowsize, -.5*lastsecondwindowsize, -.5*lastsecondwindowsize)
		LastSecondParty1DisplayAnchor:SetHitRectInsets(-lastsecondwindowsize, -lastsecondwindowsize, -.5*lastsecondwindowsize, -.5*lastsecondwindowsize)
		LastSecondParty2DisplayAnchor:SetHitRectInsets(-lastsecondwindowsize, -lastsecondwindowsize, -.5*lastsecondwindowsize, -.5*lastsecondwindowsize)
		LastSecondParty3DisplayAnchor:SetHitRectInsets(-lastsecondwindowsize, -lastsecondwindowsize, -.5*lastsecondwindowsize, -.5*lastsecondwindowsize)
		LastSecondParty4DisplayAnchor:SetHitRectInsets(-lastsecondwindowsize, -lastsecondwindowsize, -.5*lastsecondwindowsize, -.5*lastsecondwindowsize)
		LastSecondArena1DisplayAnchor:SetHitRectInsets(-lastsecondwindowsize, -lastsecondwindowsize, -.5*lastsecondwindowsize, -.5*lastsecondwindowsize)
		LastSecondArena2DisplayAnchor:SetHitRectInsets(-lastsecondwindowsize, -lastsecondwindowsize, -.5*lastsecondwindowsize, -.5*lastsecondwindowsize)
		LastSecondArena3DisplayAnchor:SetHitRectInsets(-lastsecondwindowsize, -lastsecondwindowsize, -.5*lastsecondwindowsize, -.5*lastsecondwindowsize)
		LastSecondArena4DisplayAnchor:SetHitRectInsets(-lastsecondwindowsize, -lastsecondwindowsize, -.5*lastsecondwindowsize, -.5*lastsecondwindowsize)
		LastSecondArena5DisplayAnchor:SetHitRectInsets(-lastsecondwindowsize, -lastsecondwindowsize, -.5*lastsecondwindowsize, -.5*lastsecondwindowsize)
		anchorstatus=1
	elseif LastSecondAnchorButton:GetChecked()==nil then
		LastSecondDisplayAnchorText:SetText("")
		LastSecondDisplayAnchor:SetBackdrop({})
		LastSecondFocusDisplayAnchorText:SetText("")
		LastSecondFocusDisplayAnchor:SetBackdrop({})
		LastSecondTargetDisplayAnchorText:SetText("")
		LastSecondTargetDisplayAnchor:SetBackdrop({})
		LastSecondParty1DisplayAnchorText:SetText("")
		LastSecondParty1DisplayAnchor:SetBackdrop({})
		LastSecondParty2DisplayAnchorText:SetText("")
		LastSecondParty2DisplayAnchor:SetBackdrop({})
		LastSecondParty3DisplayAnchorText:SetText("")
		LastSecondParty3DisplayAnchor:SetBackdrop({})
		LastSecondParty4DisplayAnchorText:SetText("")
		LastSecondParty4DisplayAnchor:SetBackdrop({})
		LastSecondArena1DisplayAnchorText:SetText("")
		LastSecondArena1DisplayAnchor:SetBackdrop({})
		LastSecondArena2DisplayAnchorText:SetText("")
		LastSecondArena2DisplayAnchor:SetBackdrop({})
		LastSecondArena3DisplayAnchorText:SetText("")
		LastSecondArena3DisplayAnchor:SetBackdrop({})
		LastSecondArena4DisplayAnchorText:SetText("")
		LastSecondArena4DisplayAnchor:SetBackdrop({})
		LastSecondArena5DisplayAnchorText:SetText("")
		LastSecondArena5DisplayAnchor:SetBackdrop({})
		LastSecondDisplayAnchor:SetHitRectInsets(lastsecondwindowsize, lastsecondwindowsize, .5*lastsecondwindowsize, .5*lastsecondwindowsize)
		LastSecondFocusDisplayAnchor:SetHitRectInsets(lastsecondwindowsize, lastsecondwindowsize, .5*lastsecondwindowsize, .5*lastsecondwindowsize)
		LastSecondTargetDisplayAnchor:SetHitRectInsets(lastsecondwindowsize, lastsecondwindowsize, .5*lastsecondwindowsize, .5*lastsecondwindowsize)
		LastSecondParty1DisplayAnchor:SetHitRectInsets(lastsecondwindowsize, lastsecondwindowsize, .5*lastsecondwindowsize, .5*lastsecondwindowsize)
		LastSecondParty2DisplayAnchor:SetHitRectInsets(lastsecondwindowsize, lastsecondwindowsize, .5*lastsecondwindowsize, .5*lastsecondwindowsize)
		LastSecondParty3DisplayAnchor:SetHitRectInsets(lastsecondwindowsize, lastsecondwindowsize, .5*lastsecondwindowsize, .5*lastsecondwindowsize)
		LastSecondParty4DisplayAnchor:SetHitRectInsets(lastsecondwindowsize, lastsecondwindowsize, .5*lastsecondwindowsize, .5*lastsecondwindowsize)
		LastSecondArena1DisplayAnchor:SetHitRectInsets(lastsecondwindowsize, lastsecondwindowsize, .5*lastsecondwindowsize, .5*lastsecondwindowsize)
		LastSecondArena2DisplayAnchor:SetHitRectInsets(lastsecondwindowsize, lastsecondwindowsize, .5*lastsecondwindowsize, .5*lastsecondwindowsize)
		LastSecondArena3DisplayAnchor:SetHitRectInsets(lastsecondwindowsize, lastsecondwindowsize, .5*lastsecondwindowsize, .5*lastsecondwindowsize)
		LastSecondArena4DisplayAnchor:SetHitRectInsets(lastsecondwindowsize, lastsecondwindowsize, .5*lastsecondwindowsize, .5*lastsecondwindowsize)
		LastSecondArena5DisplayAnchor:SetHitRectInsets(lastsecondwindowsize, lastsecondwindowsize, .5*lastsecondwindowsize, .5*lastsecondwindowsize)
		anchorstatus=0
	end
end
--parallel tables are used to find out what dr type the cc falls into
------------------controlledroot
crowdcontrolnames={"Freeze","Pin","Frost Nova","Entangling Roots","Earthgrab",
------------------controlledstun
					"Bash", "Concussion Blow", "Deep Freeze", "Demon Charge", "Gnaw", "Holy Wrath", "Inferno Effect", "Hammer of Justice", "Intercept",
					"Intimidation", "Kidney Shot", "Maim", "Ravage", "Shadowfury", "Shockwave", "Sonic Blast", "War Stomp",
------------------disarm
					"Chimera Shot", "Disarm", "Dismantle", "Psychic Horror", "Snatch",
------------------disorient
					"Dragon's Breath", "Freezing Arrow", "Freezing Trap Effect", "Gouge", "Hex", "Hungering Cold", "Polymorph", "Repentance", "Sap", "Shackle", "Wyvern Sting",
------------------fear
					"Blind", "Fear", "Howl of Terror", "Intimidating Shout", "Psychic Scream", "Scare Beast", "Seduction", "Turn Evil",
------------------horror
					"Death Coil", "Psychic Horror",
------------------openerstun
					"Cheap Shot", "Pounce",
------------------randomroot
					"Frostbite", "Improved Hamstring", "Shattered Barrier",
------------------randomstun
					"Impact", "Improved Fire Nova Totem", "Revenge Stun", "Stun", "Stoneclaw Stun",
------------------silence
					"Arcane Torrent", "Gag Order", "Garrote", "Improved Counterspell", "Nether Shock", "Silencing Shot", "Improved Kick", "Shield of the Templar", "Silence",
					"Spell Lock", "Strangulate",
------------------banish
					"Banish",
------------------charge
					"Charge",
------------------cyclone
					"Cyclone",
------------------hibernate
					"Hibernate",
------------------entrapment
					"Entrapment",
------------------scattershot
					"Scatter Shot",
------------------mindcontrol
					"Mind Control"}



crowdcontroltypes={1,1,1,1,1,
			2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,
			3,3,3,3,3,
			4,4,4,4,4,4,4,4,4,4,4,
			5,5,5,5,5,5,5,5,
			6,6,
			7,7,
			8,8,8,
			9,9,9,9,9,
			10,10,10,10,10,10,10,10,10,10,10,
			11,
			12,
			13,
			14,
			15,
			16,
			17}





local ccstatustable={ccstatus, party1ccstatus, party2ccstatus, party3ccstatus, party4ccstatus, arena1ccstatus, arena2ccstatus, arena3ccstatus, arena4ccstatus, arena5ccstatus,
					save1ccstatus, save2ccstatus, save3ccstatus, save4ccstatus, save5ccstatus, save6ccstatus, save7ccstatus, save8ccstatus, save9ccstatus, save10ccstatus,
					save11ccstatus, save12ccstatus, save13ccstatus, save14ccstatus, save15ccstatus, save16ccstatus, save17ccstatus, save18ccstatus, save19ccstatus, save20ccstatus}
local ccapplytimetable={ccapplytime, party1ccapplytime, party2ccapplytime, party3ccapplytime, party4ccapplytime, arena1ccapplytime, arena2ccapplytime, arena3ccapplytime,
					arena4ccapplytime, arena5ccapplytime, save1ccapplytime, save2ccapplytime, save3ccapplytime, save4ccapplytime, save5ccapplytime, save6ccapplytime,
					save7ccapplytime, save8ccapplytime, save9ccapplytime, save10ccapplytime, save11ccapplytime, save12ccapplytime, save13ccapplytime, save14ccapplytime, save15ccapplytime,
					save16ccapplytime, save17ccapplytime, save18ccapplytime, save19ccapplytime, save20ccapplytime}
local drleveltable={drlevel, party1drlevel, party2drlevel, party3drlevel, party4drlevel, arena1drlevel, arena2drlevel, arena3drlevel, arena4drlevel, arena5drlevel, save1drlevel,
					save2drlevel, save3drlevel, save4drlevel, save5drlevel, save6drlevel, save7drlevel, save8drlevel, save9drlevel, save10drlevel, save11drlevel, save12drlevel, save13drlevel,
					save14drlevel, save15drlevel, save16drlevel, save17drlevel, save18drlevel, save19drlevel, save20drlevel}



function UpdateDR(i, Event, param1, destGUID)
--param1 is the spellid
	index=crowdcontroltypes[i]
	if cconoffstatus[index]==1 then
--		print("saw a cc begin or end")
		ininstance, instancetype=IsInInstance()
		if destGUID==UnitGUID("player") and ((selfarenashow==1 and instancetype=="arena") or (selfothershow==1 and instancetype~="arena")) then
			if Event=="SPELL_AURA_REMOVED" then
				ccstatus[index]=0
				cctime[index]=GetTime()
			elseif Event=="SPELL_AURA_APPLIED" then
				ccstatus[index]=1
				drtime[index]=lengthofdr
				drlevel[index]=drlevel[index]-1
				ccapplytime[index]=GetTime()
			end
			lastcc[index]=param1
		elseif destGUID==UnitGUID("party1") and ((partyarenashow==1 and instancetype=="arena") or (partyothershow==1 and instancetype~="arena")) then
			if Event=="SPELL_AURA_REMOVED" then
				party1ccstatus[index]=0
				party1cctime[index]=GetTime()
			elseif Event=="SPELL_AURA_APPLIED" then
				party1ccstatus[index]=1
				party1drtime[index]=lengthofdr
				party1drlevel[index]=party1drlevel[index]-1
				party1ccapplytime[index]=GetTime()
			end
			party1lastcc[index]=param1
		elseif destGUID==UnitGUID("party2") and ((partyarenashow==1 and instancetype=="arena") or (partyothershow==1 and instancetype~="arena")) then
			if Event=="SPELL_AURA_REMOVED" then
				party2ccstatus[index]=0
				party2cctime[index]=GetTime()
				elseif Event=="SPELL_AURA_APPLIED" then
				party2ccstatus[index]=1
				party2drtime[index]=lengthofdr
				party2drlevel[index]=party2drlevel[index]-1
				party2ccapplytime[index]=GetTime()
			end
			party2lastcc[index]=param1
		elseif destGUID==UnitGUID("party3") and ((partyarenashow==1 and instancetype=="arena") or (partyothershow==1 and instancetype~="arena")) then
			if Event=="SPELL_AURA_REMOVED" then
				party3ccstatus[index]=0
				party3cctime[index]=GetTime()
				elseif Event=="SPELL_AURA_APPLIED" then
				party3ccstatus[index]=1
				party3drtime[index]=lengthofdr
				party3drlevel[index]=party3drlevel[index]-1
				party3ccapplytime[index]=GetTime()
			end
			party3lastcc[index]=param1
		elseif destGUID==UnitGUID("party4") and ((partyarenashow==1 and instancetype=="arena") or (partyothershow==1 and instancetype~="arena")) then
			if Event=="SPELL_AURA_REMOVED" then
				party4ccstatus[index]=0
				party4cctime[index]=GetTime()
				elseif Event=="SPELL_AURA_APPLIED" then
				party4ccstatus[index]=1
				party4drtime[index]=lengthofdr
				party4drlevel[index]=party4drlevel[index]-1
				party4ccapplytime[index]=GetTime()
			end
			party4lastcc[index]=param1
		elseif destGUID==UnitGUID("arena1") and opponentarenashow==1 then
			if Event=="SPELL_AURA_REMOVED" then
				arena1ccstatus[index]=0
				arena1cctime[index]=GetTime()
			elseif Event=="SPELL_AURA_APPLIED" then
				arena1ccstatus[index]=1
				arena1drtime[index]=lengthofdr
				arena1drlevel[index]=arena1drlevel[index]-1
				arena1ccapplytime[index]=GetTime()
			end
			arena1lastcc[index]=param1
		elseif destGUID==UnitGUID("arena2") and opponentarenashow==1 then
			if Event=="SPELL_AURA_REMOVED" then
				arena2ccstatus[index]=0
				arena2cctime[index]=GetTime()
			elseif Event=="SPELL_AURA_APPLIED" then
				arena2ccstatus[index]=1
				arena2drtime[index]=lengthofdr
				arena2drlevel[index]=arena2drlevel[index]-1
				arena2ccapplytime[index]=GetTime()
			end
			arena2lastcc[index]=param1
		elseif destGUID==UnitGUID("arena3") and opponentarenashow==1 then
			if Event=="SPELL_AURA_REMOVED" then
				arena3ccstatus[index]=0
				arena3cctime[index]=GetTime()
			elseif Event=="SPELL_AURA_APPLIED" then
				arena3ccstatus[index]=1
				arena3drtime[index]=lengthofdr
				arena3drlevel[index]=arena3drlevel[index]-1
				arena3ccapplytime[index]=GetTime()
			end
			arena3lastcc[index]=param1
		elseif destGUID==UnitGUID("arena4") and opponentarenashow==1 then
			if Event=="SPELL_AURA_REMOVED" then
				arena4ccstatus[index]=0
				arena4cctime[index]=GetTime()
			elseif Event=="SPELL_AURA_APPLIED" then
				arena4ccstatus[index]=1
				arena4drtime[index]=lengthofdr
				arena4drlevel[index]=arena4drlevel[index]-1
				arena4ccapplytime[index]=GetTime()
			end
			arena4lastcc[index]=param1
		elseif destGUID==UnitGUID("arena5") and opponentarenashow==1 then
			if Event=="SPELL_AURA_REMOVED" then
				arena5ccstatus[index]=0
				arena5cctime[index]=GetTime()
			elseif Event=="SPELL_AURA_APPLIED" then
				arena5ccstatus[index]=1
				arena5drtime[index]=lengthofdr
				arena5drlevel[index]=arena5drlevel[index]-1
				arena5ccapplytime[index]=GetTime()
			end
			arena5lastcc[index]=param1
		end
		SetGUIDs(destGUID)
		if ((targetarenashow==1 and instancetype=="arena") or (targetothershow==1 and instancetype~="arena")) then
			if destGUID==saveGUIDs[1] then
				if Event=="SPELL_AURA_REMOVED" then
					save1ccstatus[index]=0
					save1cctime[index]=GetTime()
				elseif Event=="SPELL_AURA_APPLIED" then
					save1ccstatus[index]=1
					save1drtime[index]=lengthofdr
					save1drlevel[index]=save1drlevel[index]-1
					save1ccapplytime[index]=GetTime()
				end
				save1lastcc[index]=param1
				saveupdatetime[1]=GetTime()
			elseif destGUID==saveGUIDs[2] then
				if Event=="SPELL_AURA_REMOVED" then
					save2ccstatus[index]=0
					save2cctime[index]=GetTime()
				elseif Event=="SPELL_AURA_APPLIED" then
					save2ccstatus[index]=1
					save2drtime[index]=lengthofdr
					save2drlevel[index]=save1drlevel[index]-1
					save2ccapplytime[index]=GetTime()
				end
				save2lastcc[index]=param1
				saveupdatetime[2]=GetTime()
			elseif destGUID==saveGUIDs[3] then
				if Event=="SPELL_AURA_REMOVED" then
					save3ccstatus[index]=0
					save3cctime[index]=GetTime()
				elseif Event=="SPELL_AURA_APPLIED" then
					save3ccstatus[index]=1
					save3drtime[index]=lengthofdr
					save3drlevel[index]=save3drlevel[index]-1
					save3ccapplytime[index]=GetTime()
				end
				save3lastcc[index]=param1
				saveupdatetime[3]=GetTime()
			elseif destGUID==saveGUIDs[4] then
				if Event=="SPELL_AURA_REMOVED" then
					save4ccstatus[index]=0
					save4cctime[index]=GetTime()
				elseif Event=="SPELL_AURA_APPLIED" then
					save4ccstatus[index]=1
					save4drtime[index]=lengthofdr
					save4drlevel[index]=save4drlevel[index]-1
					save4ccapplytime[index]=GetTime()
				end
				save4lastcc[index]=param1
				saveupdatetime[4]=GetTime()
			elseif destGUID==saveGUIDs[5] then
				if Event=="SPELL_AURA_REMOVED" then
					save5ccstatus[index]=0
					save5cctime[index]=GetTime()
				elseif Event=="SPELL_AURA_APPLIED" then
					save5ccstatus[index]=1
					save5drtime[index]=lengthofdr
					save5drlevel[index]=save5drlevel[index]-1
					save5ccapplytime[index]=GetTime()
				end
				save5lastcc[index]=param1
				saveupdatetime[5]=GetTime()
			elseif destGUID==saveGUIDs[6] then
				if Event=="SPELL_AURA_REMOVED" then
					save6ccstatus[index]=0
					save6cctime[index]=GetTime()
				elseif Event=="SPELL_AURA_APPLIED" then
					save6ccstatus[index]=1
					save6drtime[index]=lengthofdr
					save6drlevel[index]=save6drlevel[index]-1
					save6ccapplytime[index]=GetTime()
				end
				save6lastcc[index]=param1
				saveupdatetime[6]=GetTime()
			elseif destGUID==saveGUIDs[7] then
				if Event=="SPELL_AURA_REMOVED" then
					save7ccstatus[index]=0
					save7cctime[index]=GetTime()
				elseif Event=="SPELL_AURA_APPLIED" then
					save7ccstatus[index]=1
					save7drtime[index]=lengthofdr
					save7drlevel[index]=save7drlevel[index]-1
					save7ccapplytime[index]=GetTime()
				end
				save7lastcc[index]=param1
				saveupdatetime[7]=GetTime()
			elseif destGUID==saveGUIDs[8] then
				if Event=="SPELL_AURA_REMOVED" then
					save8ccstatus[index]=0
					save8cctime[index]=GetTime()
				elseif Event=="SPELL_AURA_APPLIED" then
					save8ccstatus[index]=1
					save8drtime[index]=lengthofdr
					save8drlevel[index]=save8drlevel[index]-1
					save8ccapplytime[index]=GetTime()
				end
				save8lastcc[index]=param1
				saveupdatetime[8]=GetTime()
			elseif destGUID==saveGUIDs[9] then
				if Event=="SPELL_AURA_REMOVED" then
					save9ccstatus[index]=0
					save9cctime[index]=GetTime()
				elseif Event=="SPELL_AURA_APPLIED" then
					save9ccstatus[index]=1
					save9drtime[index]=lengthofdr
					save9drlevel[index]=save9drlevel[index]-1
					save9ccapplytime[index]=GetTime()
				end
				save9lastcc[index]=param1
				saveupdatetime[9]=GetTime()
			elseif destGUID==saveGUIDs[10] then
				if Event=="SPELL_AURA_REMOVED" then
					save10ccstatus[index]=0
					save10cctime[index]=GetTime()
				elseif Event=="SPELL_AURA_APPLIED" then
					save10ccstatus[index]=1
					save10drtime[index]=lengthofdr
					save10drlevel[index]=save10drlevel[index]-1
					save10ccapplytime[index]=GetTime()
				end
				save10lastcc[index]=param1
				saveupdatetime[10]=GetTime()
			elseif destGUID==saveGUIDs[11] then
				if Event=="SPELL_AURA_REMOVED" then
					save11ccstatus[index]=0
					save11cctime[index]=GetTime()
				elseif Event=="SPELL_AURA_APPLIED" then
					save11ccstatus[index]=1
					save11drtime[index]=lengthofdr
					save11drlevel[index]=save11drlevel[index]-1
					save11ccapplytime[index]=GetTime()
				end
				save11lastcc[index]=param1
				saveupdatetime[11]=GetTime()
			elseif destGUID==saveGUIDs[12] then
				if Event=="SPELL_AURA_REMOVED" then
					save12ccstatus[index]=0
					save12cctime[index]=GetTime()
				elseif Event=="SPELL_AURA_APPLIED" then
					save12ccstatus[index]=1
					save12drtime[index]=lengthofdr
					save12drlevel[index]=save12drlevel[index]-1
					save12ccapplytime[index]=GetTime()
				end
				save12lastcc[index]=param1
				saveupdatetime[12]=GetTime()
			elseif destGUID==saveGUIDs[13] then
				if Event=="SPELL_AURA_REMOVED" then
					save13ccstatus[index]=0
					save13cctime[index]=GetTime()
				elseif Event=="SPELL_AURA_APPLIED" then
					save13ccstatus[index]=1
					save13drtime[index]=lengthofdr
					save13drlevel[index]=save13drlevel[index]-1
					save13ccapplytime[index]=GetTime()
				end
				save13lastcc[index]=param1
				saveupdatetime[13]=GetTime()
			elseif destGUID==saveGUIDs[14] then
				if Event=="SPELL_AURA_REMOVED" then
					save14ccstatus[index]=0
					save14cctime[index]=GetTime()
				elseif Event=="SPELL_AURA_APPLIED" then
					save14ccstatus[index]=1
					save14drtime[index]=lengthofdr
					save14drlevel[index]=save14drlevel[index]-1
					save14ccapplytime[index]=GetTime()
				end
				save14lastcc[index]=param1
				saveupdatetime[14]=GetTime()
			elseif destGUID==saveGUIDs[15] then
				if Event=="SPELL_AURA_REMOVED" then
					save15ccstatus[index]=0
					save15cctime[index]=GetTime()
				elseif Event=="SPELL_AURA_APPLIED" then
					save15ccstatus[index]=1
					save15drtime[index]=lengthofdr
					save15drlevel[index]=save15drlevel[index]-1
					save15ccapplytime[index]=GetTime()
				end
				save15lastcc[index]=param1
				saveupdatetime[15]=GetTime()
			elseif destGUID==saveGUIDs[16] then
				if Event=="SPELL_AURA_REMOVED" then
					save16ccstatus[index]=0
					save16cctime[index]=GetTime()
				elseif Event=="SPELL_AURA_APPLIED" then
					save16ccstatus[index]=1
					save16drtime[index]=lengthofdr
					save16drlevel[index]=save16drlevel[index]-1
					save16ccapplytime[index]=GetTime()
				end
				save16lastcc[index]=param1
				saveupdatetime[16]=GetTime()
			elseif destGUID==saveGUIDs[17] then
				if Event=="SPELL_AURA_REMOVED" then
					save17ccstatus[index]=0
					save17cctime[index]=GetTime()
				elseif Event=="SPELL_AURA_APPLIED" then
					save17ccstatus[index]=1
					save17drtime[index]=lengthofdr
					save17drlevel[index]=save17drlevel[index]-1
					save17ccapplytime[index]=GetTime()
				end
				save17lastcc[index]=param1
				saveupdatetime[17]=GetTime()
			elseif destGUID==saveGUIDs[18] then
				if Event=="SPELL_AURA_REMOVED" then
					save18ccstatus[index]=0
					save18cctime[index]=GetTime()
				elseif Event=="SPELL_AURA_APPLIED" then
					save18ccstatus[index]=1
					save18drtime[index]=lengthofdr
					save18drlevel[index]=save18drlevel[index]-1
					save18ccapplytime[index]=GetTime()
				end
				save18lastcc[index]=param1
				saveupdatetime[18]=GetTime()
			elseif destGUID==saveGUIDs[19] then
				if Event=="SPELL_AURA_REMOVED" then
					save19ccstatus[index]=0
					save19cctime[index]=GetTime()
				elseif Event=="SPELL_AURA_APPLIED" then
					save19ccstatus[index]=1
					save19drtime[index]=lengthofdr
					save19drlevel[index]=save19drlevel[index]-1
					save19ccapplytime[index]=GetTime()
				end
				save19lastcc[index]=param1
				saveupdatetime[19]=GetTime()
			elseif destGUID==saveGUIDs[20] then
				if Event=="SPELL_AURA_REMOVED" then
					save20ccstatus[index]=0
					save20cctime[index]=GetTime()
				elseif Event=="SPELL_AURA_APPLIED" then
					save20ccstatus[index]=1
					save20drtime[index]=lengthofdr
					save20drlevel[index]=save20drlevel[index]-1
					save20ccapplytime[index]=GetTime()
				end
				save20lastcc[index]=param1
				saveupdatetime[20]=GetTime()
			end
		end
		SetTargetAndFocusReference()
		buildframechain()
	end
end

function buildframechain()
	local i
	local j
	local currenttime=GetTime()
	for i=1,17 do
		if targetccstatus[i]==1 and currenttime-targetccapplytime[i]>12 then
			targetdrlevel[i]=3
		end
	end
	local nextstart=1
	if example==0 then
		for i=1, 9 do
			for j=nextstart, 17 do
				if drlevel[j]~=3 then
					nextstart=j+1
					local display=string.format("%d", drtime[j])
					if i==1 then
						LastSecondDisplay17:SetBackdrop({bgFile = select(3, GetSpellInfo(lastcc[j])), tile = false})
						LastSecondDisplay17Text:SetText(display)
						LastSecondDisplay17Text:SetTextColor(-drlevel[j]+2, drlevel[j], colorconstant*ccstatus[j])
						LastSecondDisplay17:Show()
						LastSecondDisplay16:Hide()
					elseif i==2 then
						LastSecondDisplay16:SetBackdrop({bgFile = select(3, GetSpellInfo(lastcc[j])), tile = false})
						LastSecondDisplay16Text:SetText(display)
						LastSecondDisplay16Text:SetTextColor(-drlevel[j]+2, drlevel[j], colorconstant*ccstatus[j])
						LastSecondDisplay16:Show()
						LastSecondDisplay15:Hide()
					elseif i==3 then
						LastSecondDisplay15:SetBackdrop({bgFile = select(3, GetSpellInfo(lastcc[j])), tile = false})
						LastSecondDisplay15Text:SetText(display)
						LastSecondDisplay15Text:SetTextColor(-drlevel[j]+2, drlevel[j], colorconstant*ccstatus[j])
						LastSecondDisplay15:Show()
						LastSecondDisplay14:Hide()
					elseif i==4 then
						LastSecondDisplay14:SetBackdrop({bgFile = select(3, GetSpellInfo(lastcc[j])), tile = false})
						LastSecondDisplay14Text:SetText(display)
						LastSecondDisplay14Text:SetTextColor(-drlevel[j]+2, drlevel[j], colorconstant*ccstatus[j])
						LastSecondDisplay14:Show()
						LastSecondDisplay13:Hide()
					elseif i==5 then
						LastSecondDisplay13:SetBackdrop({bgFile = select(3, GetSpellInfo(lastcc[j])), tile = false})
						LastSecondDisplay13Text:SetText(display)
						LastSecondDisplay13Text:SetTextColor(-drlevel[j]+2, drlevel[j], colorconstant*ccstatus[j])
						LastSecondDisplay13:Show()
						LastSecondDisplay12:Hide()
					elseif i==6 then
						LastSecondDisplay12:SetBackdrop({bgFile = select(3, GetSpellInfo(lastcc[j])), tile = false})
						LastSecondDisplay12Text:SetText(display)
						LastSecondDisplay12Text:SetTextColor(-drlevel[j]+2, drlevel[j], colorconstant*ccstatus[j])
						LastSecondDisplay12:Show()
						LastSecondDisplay11:Hide()
					elseif i==7 then
						LastSecondDisplay11:SetBackdrop({bgFile = select(3, GetSpellInfo(lastcc[j])), tile = false})
						LastSecondDisplay11Text:SetText(display)
						LastSecondDisplay11Text:SetTextColor(-drlevel[j]+2, drlevel[j], colorconstant*ccstatus[j])
						LastSecondDisplay11:Show()
						LastSecondDisplay10:Hide()
					elseif i==8 then
						LastSecondDisplay10:SetBackdrop({bgFile = select(3, GetSpellInfo(lastcc[j])), tile = false})
						LastSecondDisplay10Text:SetText(display)
						LastSecondDisplay10Text:SetTextColor(-drlevel[j]+2, drlevel[j], colorconstant*ccstatus[j])
						LastSecondDisplay10:Show()
					elseif i==9 then
						--print("overload")
					end
					break
				end
				if j==17 and nextstart==1 then
					LastSecondDisplay17:Hide()
				end
			j=j+1
			end
			if j==17 then
				break
			end
		i=i+1
		end
		nextstart=1
		for i=1, 9 do
			for j=nextstart, 17 do
				if targetdrlevel[j]~=3 then-- 0,2,0  1,1,0  2,0,0
					nextstart=j+1
					local display=string.format("%d", targetdrtime[j])
					if i==1 then
						LastSecondTargetDisplay17:SetBackdrop({bgFile = select(3, GetSpellInfo(targetlastcc[j])), tile = false})
						LastSecondTargetDisplay17Text:SetText(display)
						LastSecondTargetDisplay17Text:SetTextColor(-targetdrlevel[j]+2, targetdrlevel[j], colorconstant*targetccstatus[j])
						LastSecondTargetDisplay17:Show()
						LastSecondTargetDisplay16:Hide()
					elseif i==2 then
						LastSecondTargetDisplay16:SetBackdrop({bgFile = select(3, GetSpellInfo(targetlastcc[j])), tile = false})
						LastSecondTargetDisplay16Text:SetText(display)
						LastSecondTargetDisplay16Text:SetTextColor(-targetdrlevel[j]+2, targetdrlevel[j], colorconstant*targetccstatus[j])
						LastSecondTargetDisplay16:Show()
						LastSecondTargetDisplay15:Hide()
					elseif i==3 then
						LastSecondTargetDisplay15:SetBackdrop({bgFile = select(3, GetSpellInfo(targetlastcc[j])), tile = false})
						LastSecondTargetDisplay15Text:SetText(display)
						LastSecondTargetDisplay15Text:SetTextColor(-targetdrlevel[j]+2, targetdrlevel[j], colorconstant*targetccstatus[j])
						LastSecondTargetDisplay15:Show()
						LastSecondTargetDisplay14:Hide()
					elseif i==4 then
						LastSecondTargetDisplay14:SetBackdrop({bgFile = select(3, GetSpellInfo(targetlastcc[j])), tile = false})
						LastSecondTargetDisplay14Text:SetText(display)
						LastSecondTargetDisplay14Text:SetTextColor(-targetdrlevel[j]+2, targetdrlevel[j], colorconstant*targetccstatus[j])
						LastSecondTargetDisplay14:Show()
						LastSecondTargetDisplay13:Hide()
					elseif i==5 then
						LastSecondTargetDisplay13:SetBackdrop({bgFile = select(3, GetSpellInfo(targetlastcc[j])), tile = false})
						LastSecondTargetDisplay13Text:SetText(display)
						LastSecondTargetDisplay13Text:SetTextColor(-targetdrlevel[j]+2, targetdrlevel[j], colorconstant*targetccstatus[j])
						LastSecondTargetDisplay13:Show()
						LastSecondTargetDisplay12:Hide()
					elseif i==6 then
						LastSecondTargetDisplay12:SetBackdrop({bgFile = select(3, GetSpellInfo(targetlastcc[j])), tile = false})
						LastSecondTargetDisplay12Text:SetText(display)
						LastSecondTargetDisplay12Text:SetTextColor(-targetdrlevel[j]+2, targetdrlevel[j], colorconstant*targetccstatus[j])
						LastSecondTargetDisplay12:Show()
						LastSecondTargetDisplay11:Hide()
					elseif i==7 then
						LastSecondTargetDisplay11:SetBackdrop({bgFile = select(3, GetSpellInfo(targetlastcc[j])), tile = false})
						LastSecondTargetDisplay11Text:SetText(display)
						LastSecondTargetDisplay11Text:SetTextColor(-targetdrlevel[j]+2, targetdrlevel[j], colorconstant*targetccstatus[j])
						LastSecondTargetDisplay11:Show()
						LastSecondTargetDisplay10:Hide()
					elseif i==8 then
						LastSecondTargetDisplay10:SetBackdrop({bgFile = select(3, GetSpellInfo(targetlastcc[j])), tile = false})
						LastSecondTargetDisplay10Text:SetText(display)
						LastSecondTargetDisplay10Text:SetTextColor(-targetdrlevel[j]+2, targetdrlevel[j], colorconstant*targetccstatus[j])
						LastSecondTargetDisplay10:Show()
					elseif i==9 then
						--print("overload")
					end
					break
				end
				if j==17 and nextstart==1 then
					LastSecondTargetDisplay17:Hide()
				end
			j=j+1
			end
			if j==17 then
				break
			end
		i=i+1
		end
		nextstart=1
		for i=1, 9 do
			for j=nextstart, 17 do
				if focusdrlevel[j]~=3 then-- 0,2,0  1,1,0  2,0,0
					nextstart=j+1
					local display=string.format("%d", focusdrtime[j])
					if i==1 then
						LastSecondFocusDisplay17:SetBackdrop({bgFile = select(3, GetSpellInfo(focuslastcc[j])), tile = false})
						LastSecondFocusDisplay17Text:SetText(display)
						LastSecondFocusDisplay17Text:SetTextColor(-focusdrlevel[j]+2, focusdrlevel[j], colorconstant*focusccstatus[j])
						LastSecondFocusDisplay17:Show()
						LastSecondFocusDisplay16:Hide()
					elseif i==2 then
						LastSecondFocusDisplay16:SetBackdrop({bgFile = select(3, GetSpellInfo(focuslastcc[j])), tile = false})
						LastSecondFocusDisplay16Text:SetText(display)
						LastSecondFocusDisplay16Text:SetTextColor(-focusdrlevel[j]+2, focusdrlevel[j], colorconstant*focusccstatus[j])
						LastSecondFocusDisplay16:Show()
						LastSecondFocusDisplay15:Hide()
					elseif i==3 then
						LastSecondFocusDisplay15:SetBackdrop({bgFile = select(3, GetSpellInfo(focuslastcc[j])), tile = false})
						LastSecondFocusDisplay15Text:SetText(display)
						LastSecondFocusDisplay15Text:SetTextColor(-focusdrlevel[j]+2, focusdrlevel[j], colorconstant*focusccstatus[j])
						LastSecondFocusDisplay15:Show()
						LastSecondFocusDisplay14:Hide()
					elseif i==4 then
						LastSecondFocusDisplay14:SetBackdrop({bgFile = select(3, GetSpellInfo(focuslastcc[j])), tile = false})
						LastSecondFocusDisplay14Text:SetText(display)
						LastSecondFocusDisplay14Text:SetTextColor(-focusdrlevel[j]+2, focusdrlevel[j], colorconstant*focusccstatus[j])
						LastSecondFocusDisplay14:Show()
						LastSecondFocusDisplay13:Hide()
					elseif i==5 then
						LastSecondFocusDisplay13:SetBackdrop({bgFile = select(3, GetSpellInfo(focuslastcc[j])), tile = false})
						LastSecondFocusDisplay13Text:SetText(display)
						LastSecondFocusDisplay13Text:SetTextColor(-focusdrlevel[j]+2, focusdrlevel[j], colorconstant*focusccstatus[j])
						LastSecondFocusDisplay13:Show()
						LastSecondFocusDisplay12:Hide()
					elseif i==6 then
						LastSecondFocusDisplay12:SetBackdrop({bgFile = select(3, GetSpellInfo(focuslastcc[j])), tile = false})
						LastSecondFocusDisplay12Text:SetText(display)
						LastSecondFocusDisplay12Text:SetTextColor(-focusdrlevel[j]+2, focusdrlevel[j], colorconstant*focusccstatus[j])
						LastSecondFocusDisplay12:Show()
						LastSecondFocusDisplay11:Hide()
					elseif i==7 then
						LastSecondFocusDisplay11:SetBackdrop({bgFile = select(3, GetSpellInfo(focuslastcc[j])), tile = false})
						LastSecondFocusDisplay11Text:SetText(display)
						LastSecondFocusDisplay11Text:SetTextColor(-focusdrlevel[j]+2, focusdrlevel[j], colorconstant*focusccstatus[j])
						LastSecondFocusDisplay11:Show()
						LastSecondFocusDisplay10:Hide()
					elseif i==8 then
						LastSecondFocusDisplay10:SetBackdrop({bgFile = select(3, GetSpellInfo(focuslastcc[j])), tile = false})
						LastSecondFocusDisplay10Text:SetText(display)
						LastSecondFocusDisplay10Text:SetTextColor(-focusdrlevel[j]+2, focusdrlevel[j], colorconstant*focusccstatus[j])
						LastSecondFocusDisplay10:Show()
					elseif i==9 then
						--print("overload")
					end
					break
				end
				if j==17 and nextstart==1 then
					LastSecondFocusDisplay17:Hide()
				end
			j=j+1
			end
			if j==17 then
				break
			end
		i=i+1
		end
		nextstart=1
		for i=1, 9 do
			for j=nextstart, 17 do
				if party1drlevel[j]~=3 then
					nextstart=j+1
					local display=string.format("%d", party1drtime[j])
					if i==1 then
						LastSecondParty1Display17:SetBackdrop({bgFile = select(3, GetSpellInfo(party1lastcc[j])), tile = false})
						LastSecondParty1Display17Text:SetText(display)
						LastSecondParty1Display17Text:SetTextColor(-party1drlevel[j]+2, party1drlevel[j], colorconstant*party1ccstatus[j])
						LastSecondParty1Display17:Show()
						LastSecondParty1Display16:Hide()
					elseif i==2 then
						LastSecondParty1Display16:SetBackdrop({bgFile = select(3, GetSpellInfo(party1lastcc[j])), tile = false})
						LastSecondParty1Display16Text:SetText(display)
						LastSecondParty1Display16Text:SetTextColor(-party1drlevel[j]+2, party1drlevel[j], colorconstant*party1ccstatus[j])
						LastSecondParty1Display16:Show()
						LastSecondParty1Display15:Hide()
					elseif i==3 then
						LastSecondParty1Display15:SetBackdrop({bgFile = select(3, GetSpellInfo(party1lastcc[j])), tile = false})
						LastSecondParty1Display15Text:SetText(display)
						LastSecondParty1Display15Text:SetTextColor(-party1drlevel[j]+2, party1drlevel[j], colorconstant*party1ccstatus[j])
						LastSecondParty1Display15:Show()
						LastSecondParty1Display14:Hide()
					elseif i==4 then
						LastSecondParty1Display14:SetBackdrop({bgFile = select(3, GetSpellInfo(party1lastcc[j])), tile = false})
						LastSecondParty1Display14Text:SetText(display)
						LastSecondParty1Display14Text:SetTextColor(-party1drlevel[j]+2, party1drlevel[j], colorconstant*party1ccstatus[j])
						LastSecondParty1Display14:Show()
						LastSecondParty1Display13:Hide()
					elseif i==5 then
						LastSecondParty1Display13:SetBackdrop({bgFile = select(3, GetSpellInfo(party1lastcc[j])), tile = false})
						LastSecondParty1Display13Text:SetText(display)
						LastSecondParty1Display13Text:SetTextColor(-party1drlevel[j]+2, party1drlevel[j], colorconstant*party1ccstatus[j])
						LastSecondParty1Display13:Show()
						LastSecondParty1Display12:Hide()
					elseif i==6 then
						LastSecondParty1Display12:SetBackdrop({bgFile = select(3, GetSpellInfo(party1lastcc[j])), tile = false})
						LastSecondParty1Display12Text:SetText(display)
						LastSecondParty1Display12Text:SetTextColor(-party1drlevel[j]+2, party1drlevel[j], colorconstant*party1ccstatus[j])
						LastSecondParty1Display12:Show()
						LastSecondParty1Display11:Hide()
					elseif i==7 then
						LastSecondParty1Display11:SetBackdrop({bgFile = select(3, GetSpellInfo(party1lastcc[j])), tile = false})
						LastSecondParty1Display11Text:SetText(display)
						LastSecondParty1Display11Text:SetTextColor(-party1drlevel[j]+2, party1drlevel[j], colorconstant*party1ccstatus[j])
						LastSecondParty1Display11:Show()
						LastSecondParty1Display10:Hide()
					elseif i==8 then
						LastSecondParty1Display10:SetBackdrop({bgFile = select(3, GetSpellInfo(party1lastcc[j])), tile = false})
						LastSecondParty1Display10Text:SetText(display)
						LastSecondParty1Display10Text:SetTextColor(-party1drlevel[j]+2, party1drlevel[j], colorconstant*party1ccstatus[j])
						LastSecondParty1Display10:Show()
					elseif i==9 then
						--print("overload")
					end
					break
				end
				if j==17 and nextstart==1 then
					LastSecondParty1Display17:Hide()
				end
			j=j+1
			end
			if j==17 then
				break
			end
		i=i+1
		end
		nextstart=1
		for i=1, 9 do
			for j=nextstart, 17 do
				if party2drlevel[j]~=3 then
					nextstart=j+1
					local display=string.format("%d", party2drtime[j])
					if i==1 then
						LastSecondParty2Display17:SetBackdrop({bgFile = select(3, GetSpellInfo(party2lastcc[j])), tile = false})
						LastSecondParty2Display17Text:SetText(display)
						LastSecondParty2Display17Text:SetTextColor(-party2drlevel[j]+2, party2drlevel[j], colorconstant*party2ccstatus[j])
						LastSecondParty2Display17:Show()
						LastSecondParty2Display16:Hide()
					elseif i==2 then
						LastSecondParty2Display16:SetBackdrop({bgFile = select(3, GetSpellInfo(party2lastcc[j])), tile = false})
						LastSecondParty2Display16Text:SetText(display)
						LastSecondParty2Display16Text:SetTextColor(-party2drlevel[j]+2, party2drlevel[j], colorconstant*party2ccstatus[j])
						LastSecondParty2Display16:Show()
						LastSecondParty2Display15:Hide()
					elseif i==3 then
						LastSecondParty2Display15:SetBackdrop({bgFile = select(3, GetSpellInfo(party2lastcc[j])), tile = false})
						LastSecondParty2Display15Text:SetText(display)
						LastSecondParty2Display15Text:SetTextColor(-party2drlevel[j]+2, party2drlevel[j], colorconstant*party2ccstatus[j])
						LastSecondParty2Display15:Show()
						LastSecondParty2Display14:Hide()
					elseif i==4 then
						LastSecondParty2Display14:SetBackdrop({bgFile = select(3, GetSpellInfo(party2lastcc[j])), tile = false})
						LastSecondParty2Display14Text:SetText(display)
						LastSecondParty2Display14Text:SetTextColor(-party2drlevel[j]+2, party2drlevel[j], colorconstant*party2ccstatus[j])
						LastSecondParty2Display14:Show()
						LastSecondParty2Display13:Hide()
					elseif i==5 then
						LastSecondParty2Display13:SetBackdrop({bgFile = select(3, GetSpellInfo(party2lastcc[j])), tile = false})
						LastSecondParty2Display13Text:SetText(display)
						LastSecondParty2Display13Text:SetTextColor(-party2drlevel[j]+2, party2drlevel[j], colorconstant*party2ccstatus[j])
						LastSecondParty2Display13:Show()
						LastSecondParty2Display12:Hide()
					elseif i==6 then
						LastSecondParty2Display12:SetBackdrop({bgFile = select(3, GetSpellInfo(party2lastcc[j])), tile = false})
						LastSecondParty2Display12Text:SetText(display)
						LastSecondParty2Display12Text:SetTextColor(-party2drlevel[j]+2, party2drlevel[j], colorconstant*party2ccstatus[j])
						LastSecondParty2Display12:Show()
						LastSecondParty2Display11:Hide()
					elseif i==7 then
						LastSecondParty2Display11:SetBackdrop({bgFile = select(3, GetSpellInfo(party2lastcc[j])), tile = false})
						LastSecondParty2Display11Text:SetText(display)
						LastSecondParty2Display11Text:SetTextColor(-party2drlevel[j]+2, party2drlevel[j], colorconstant*party2ccstatus[j])
						LastSecondParty2Display11:Show()
						LastSecondParty2Display10:Hide()
					elseif i==8 then
						LastSecondParty2Display10:SetBackdrop({bgFile = select(3, GetSpellInfo(party2lastcc[j])), tile = false})
						LastSecondParty2Display10Text:SetText(display)
						LastSecondParty2Display10Text:SetTextColor(-party2drlevel[j]+2, party2drlevel[j], colorconstant*party2ccstatus[j])
						LastSecondParty2Display10:Show()
					elseif i==9 then
						--print("overload")
					end
					break
				end
				if j==17 and nextstart==1 then
					LastSecondParty2Display17:Hide()
				end
			j=j+1
			end
			if j==17 then
				break
			end
		i=i+1
		end
		nextstart=1
		for i=1, 9 do
			for j=nextstart, 17 do
				if party3drlevel[j]~=3 then
					nextstart=j+1
					local display=string.format("%d", party3drtime[j])
					if i==1 then
						LastSecondParty3Display17:SetBackdrop({bgFile = select(3, GetSpellInfo(party3lastcc[j])), tile = false})
						LastSecondParty3Display17Text:SetText(display)
						LastSecondParty3Display17Text:SetTextColor(-party3drlevel[j]+2, party3drlevel[j], colorconstant*party3ccstatus[j])
						LastSecondParty3Display17:Show()
						LastSecondParty3Display16:Hide()
					elseif i==2 then
						LastSecondParty3Display16:SetBackdrop({bgFile = select(3, GetSpellInfo(party3lastcc[j])), tile = false})
						LastSecondParty3Display16Text:SetText(display)
						LastSecondParty3Display16Text:SetTextColor(-party3drlevel[j]+2, party3drlevel[j], colorconstant*party3ccstatus[j])
						LastSecondParty3Display16:Show()
						LastSecondParty3Display15:Hide()
					elseif i==3 then
						LastSecondParty3Display15:SetBackdrop({bgFile = select(3, GetSpellInfo(party3lastcc[j])), tile = false})
						LastSecondParty3Display15Text:SetText(display)
						LastSecondParty3Display15Text:SetTextColor(-party3drlevel[j]+2, party3drlevel[j], colorconstant*party3ccstatus[j])
						LastSecondParty3Display15:Show()
						LastSecondParty3Display14:Hide()
					elseif i==4 then
						LastSecondParty3Display14:SetBackdrop({bgFile = select(3, GetSpellInfo(party3lastcc[j])), tile = false})
						LastSecondParty3Display14Text:SetText(display)
						LastSecondParty3Display14Text:SetTextColor(-party3drlevel[j]+2, party3drlevel[j], colorconstant*party3ccstatus[j])
						LastSecondParty3Display14:Show()
						LastSecondParty3Display13:Hide()
					elseif i==5 then
						LastSecondParty3Display13:SetBackdrop({bgFile = select(3, GetSpellInfo(party3lastcc[j])), tile = false})
						LastSecondParty3Display13Text:SetText(display)
						LastSecondParty3Display13Text:SetTextColor(-party3drlevel[j]+2, party3drlevel[j], colorconstant*party3ccstatus[j])
						LastSecondParty3Display13:Show()
						LastSecondParty3Display12:Hide()
					elseif i==6 then
						LastSecondParty3Display12:SetBackdrop({bgFile = select(3, GetSpellInfo(party3lastcc[j])), tile = false})
						LastSecondParty3Display12Text:SetText(display)
						LastSecondParty3Display12Text:SetTextColor(-party3drlevel[j]+2, party3drlevel[j], colorconstant*party3ccstatus[j])
						LastSecondParty3Display12:Show()
						LastSecondParty3Display11:Hide()
					elseif i==7 then
						LastSecondParty3Display11:SetBackdrop({bgFile = select(3, GetSpellInfo(party3lastcc[j])), tile = false})
						LastSecondParty3Display11Text:SetText(display)
						LastSecondParty3Display11Text:SetTextColor(-party3drlevel[j]+2, party3drlevel[j], colorconstant*party3ccstatus[j])
						LastSecondParty3Display11:Show()
						LastSecondParty3Display10:Hide()
					elseif i==8 then
						LastSecondParty3Display10:SetBackdrop({bgFile = select(3, GetSpellInfo(party3lastcc[j])), tile = false})
						LastSecondParty3Display10Text:SetText(display)
						LastSecondParty3Display10Text:SetTextColor(-party3drlevel[j]+2, party3drlevel[j], colorconstant*party3ccstatus[j])
						LastSecondParty3Display10:Show()
					elseif i==9 then
						--print("overload")
					end
					break
				end
				if j==17 and nextstart==1 then
					LastSecondParty3Display17:Hide()
				end
			j=j+1
			end
			if j==17 then
				break
			end
		i=i+1
		end
		nextstart=1
		for i=1, 9 do
			for j=nextstart, 17 do
				if party4drlevel[j]~=3 then
					nextstart=j+1
					local display=string.format("%d", party4drtime[j])
					if i==1 then
						LastSecondParty4Display17:SetBackdrop({bgFile = select(3, GetSpellInfo(party4lastcc[j])), tile = false})
						LastSecondParty4Display17Text:SetText(display)
						LastSecondParty4Display17Text:SetTextColor(-party4drlevel[j]+2, party4drlevel[j], colorconstant*party4ccstatus[j])
						LastSecondParty4Display17:Show()
						LastSecondParty4Display16:Hide()
					elseif i==2 then
						LastSecondParty4Display16:SetBackdrop({bgFile = select(3, GetSpellInfo(party4lastcc[j])), tile = false})
						LastSecondParty4Display16Text:SetText(display)
						LastSecondParty4Display16Text:SetTextColor(-party4drlevel[j]+2, party4drlevel[j], colorconstant*party4ccstatus[j])
						LastSecondParty4Display16:Show()
						LastSecondParty4Display15:Hide()
					elseif i==3 then
						LastSecondParty4Display15:SetBackdrop({bgFile = select(3, GetSpellInfo(party4lastcc[j])), tile = false})
						LastSecondParty4Display15Text:SetText(display)
						LastSecondParty4Display15Text:SetTextColor(-party4drlevel[j]+2, party4drlevel[j], colorconstant*party4ccstatus[j])
						LastSecondParty4Display15:Show()
						LastSecondParty4Display14:Hide()
					elseif i==4 then
						LastSecondParty4Display14:SetBackdrop({bgFile = select(3, GetSpellInfo(party4lastcc[j])), tile = false})
						LastSecondParty4Display14Text:SetText(display)
						LastSecondParty4Display14Text:SetTextColor(-party4drlevel[j]+2, party4drlevel[j], colorconstant*party4ccstatus[j])
						LastSecondParty4Display14:Show()
						LastSecondParty4Display13:Hide()
					elseif i==5 then
						LastSecondParty4Display13:SetBackdrop({bgFile = select(3, GetSpellInfo(party4lastcc[j])), tile = false})
						LastSecondParty4Display13Text:SetText(display)
						LastSecondParty4Display13Text:SetTextColor(-party4drlevel[j]+2, party4drlevel[j], colorconstant*party4ccstatus[j])
						LastSecondParty4Display13:Show()
						LastSecondParty4Display12:Hide()
					elseif i==6 then
						LastSecondParty4Display12:SetBackdrop({bgFile = select(3, GetSpellInfo(party4lastcc[j])), tile = false})
						LastSecondParty4Display12Text:SetText(display)
						LastSecondParty4Display12Text:SetTextColor(-party4drlevel[j]+2, party4drlevel[j], colorconstant*party4ccstatus[j])
						LastSecondParty4Display12:Show()
						LastSecondParty4Display11:Hide()
					elseif i==7 then
						LastSecondParty4Display11:SetBackdrop({bgFile = select(3, GetSpellInfo(party4lastcc[j])), tile = false})
						LastSecondParty4Display11Text:SetText(display)
						LastSecondParty4Display11Text:SetTextColor(-party4drlevel[j]+2, party4drlevel[j], colorconstant*party4ccstatus[j])
						LastSecondParty4Display11:Show()
						LastSecondParty4Display10:Hide()
					elseif i==8 then
						LastSecondParty4Display10:SetBackdrop({bgFile = select(3, GetSpellInfo(party4lastcc[j])), tile = false})
						LastSecondParty4Display10Text:SetText(display)
						LastSecondParty4Display10Text:SetTextColor(-party4drlevel[j]+2, party4drlevel[j], colorconstant*party4ccstatus[j])
						LastSecondParty4Display10:Show()
					elseif i==9 then
						--print("overload")
					end
					break
				end
				if j==17 and nextstart==1 then
					LastSecondParty4Display17:Hide()
				end
			j=j+1
			end
			if j==17 then
				break
			end
		i=i+1
		end
		nextstart=1
		for i=1, 9 do
			for j=nextstart, 17 do
				if arena1drlevel[j]~=3 then
					nextstart=j+1
					local display=string.format("%d", arena1drtime[j])
					if i==1 then
						LastSecondArena1Display17:SetBackdrop({bgFile = select(3, GetSpellInfo(arena1lastcc[j])), tile = false})
						LastSecondArena1Display17Text:SetText(display)
						LastSecondArena1Display17Text:SetTextColor(-arena1drlevel[j]+2, arena1drlevel[j], colorconstant*arena1ccstatus[j])
						LastSecondArena1Display17:Show()
						LastSecondArena1Display16:Hide()
					elseif i==2 then
						LastSecondArena1Display16:SetBackdrop({bgFile = select(3, GetSpellInfo(arena1lastcc[j])), tile = false})
						LastSecondArena1Display16Text:SetText(display)
						LastSecondArena1Display16Text:SetTextColor(-arena1drlevel[j]+2, arena1drlevel[j], colorconstant*arena1ccstatus[j])
						LastSecondArena1Display16:Show()
						LastSecondArena1Display15:Hide()
					elseif i==3 then
						LastSecondArena1Display15:SetBackdrop({bgFile = select(3, GetSpellInfo(arena1lastcc[j])), tile = false})
						LastSecondArena1Display15Text:SetText(display)
						LastSecondArena1Display15Text:SetTextColor(-arena1drlevel[j]+2, arena1drlevel[j], colorconstant*arena1ccstatus[j])
						LastSecondArena1Display15:Show()
						LastSecondArena1Display14:Hide()
					elseif i==4 then
						LastSecondArena1Display14:SetBackdrop({bgFile = select(3, GetSpellInfo(arena1lastcc[j])), tile = false})
						LastSecondArena1Display14Text:SetText(display)
						LastSecondArena1Display14Text:SetTextColor(-arena1drlevel[j]+2, arena1drlevel[j], colorconstant*arena1ccstatus[j])
						LastSecondArena1Display14:Show()
						LastSecondArena1Display13:Hide()
					elseif i==5 then
						LastSecondArena1Display13:SetBackdrop({bgFile = select(3, GetSpellInfo(arena1lastcc[j])), tile = false})
						LastSecondArena1Display13Text:SetText(display)
						LastSecondArena1Display13Text:SetTextColor(-arena1drlevel[j]+2, arena1drlevel[j], colorconstant*arena1ccstatus[j])
						LastSecondArena1Display13:Show()
						LastSecondArena1Display12:Hide()
					elseif i==6 then
						LastSecondArena1Display12:SetBackdrop({bgFile = select(3, GetSpellInfo(arena1lastcc[j])), tile = false})
						LastSecondArena1Display12Text:SetText(display)
						LastSecondArena1Display12Text:SetTextColor(-arena1drlevel[j]+2, arena1drlevel[j], colorconstant*arena1ccstatus[j])
						LastSecondArena1Display12:Show()
						LastSecondArena1Display11:Hide()
					elseif i==7 then
						LastSecondArena1Display11:SetBackdrop({bgFile = select(3, GetSpellInfo(arena1lastcc[j])), tile = false})
						LastSecondArena1Display11Text:SetText(display)
						LastSecondArena1Display11Text:SetTextColor(-arena1drlevel[j]+2, arena1drlevel[j], colorconstant*arena1ccstatus[j])
						LastSecondArena1Display11:Show()
						LastSecondArena1Display10:Hide()
					elseif i==8 then
						LastSecondArena1Display10:SetBackdrop({bgFile = select(3, GetSpellInfo(arena1lastcc[j])), tile = false})
						LastSecondArena1Display10Text:SetText(display)
						LastSecondArena1Display10Text:SetTextColor(-arena1drlevel[j]+2, arena1drlevel[j], colorconstant*arena1ccstatus[j])
						LastSecondArena1Display10:Show()
					elseif i==9 then
						--print("overload")
					end
					break
				end
				if j==17 and nextstart==1 then
					LastSecondArena1Display17:Hide()
				end
			j=j+1
			end
			if j==17 then
				break
			end
		i=i+1
		end
		nextstart=1
		for i=1, 9 do
			for j=nextstart, 17 do
				if arena2drlevel[j]~=3 then
					nextstart=j+1
					local display=string.format("%d", arena2drtime[j])
					if i==1 then
						LastSecondArena2Display17:SetBackdrop({bgFile = select(3, GetSpellInfo(arena2lastcc[j])), tile = false})
						LastSecondArena2Display17Text:SetText(display)
						LastSecondArena2Display17Text:SetTextColor(-arena2drlevel[j]+2, arena2drlevel[j], colorconstant*arena2ccstatus[j])
						LastSecondArena2Display17:Show()
						LastSecondArena2Display16:Hide()
					elseif i==2 then
						LastSecondArena2Display16:SetBackdrop({bgFile = select(3, GetSpellInfo(arena2lastcc[j])), tile = false})
						LastSecondArena2Display16Text:SetText(display)
						LastSecondArena2Display16Text:SetTextColor(-arena2drlevel[j]+2, arena2drlevel[j], colorconstant*arena2ccstatus[j])
						LastSecondArena2Display16:Show()
						LastSecondArena2Display15:Hide()
					elseif i==3 then
						LastSecondArena2Display15:SetBackdrop({bgFile = select(3, GetSpellInfo(arena2lastcc[j])), tile = false})
						LastSecondArena2Display15Text:SetText(display)
						LastSecondArena2Display15Text:SetTextColor(-arena2drlevel[j]+2, arena2drlevel[j], colorconstant*arena2ccstatus[j])
						LastSecondArena2Display15:Show()
						LastSecondArena2Display14:Hide()
					elseif i==4 then
						LastSecondArena2Display14:SetBackdrop({bgFile = select(3, GetSpellInfo(arena2lastcc[j])), tile = false})
						LastSecondArena2Display14Text:SetText(display)
						LastSecondArena2Display14Text:SetTextColor(-arena2drlevel[j]+2, arena2drlevel[j], colorconstant*arena2ccstatus[j])
						LastSecondArena2Display14:Show()
						LastSecondArena2Display13:Hide()
					elseif i==5 then
						LastSecondArena2Display13:SetBackdrop({bgFile = select(3, GetSpellInfo(arena2lastcc[j])), tile = false})
						LastSecondArena2Display13Text:SetText(display)
						LastSecondArena2Display13Text:SetTextColor(-arena2drlevel[j]+2, arena2drlevel[j], colorconstant*arena2ccstatus[j])
						LastSecondArena2Display13:Show()
						LastSecondArena2Display12:Hide()
					elseif i==6 then
						LastSecondArena2Display12:SetBackdrop({bgFile = select(3, GetSpellInfo(arena2lastcc[j])), tile = false})
						LastSecondArena2Display12Text:SetText(display)
						LastSecondArena2Display12Text:SetTextColor(-arena2drlevel[j]+2, arena2drlevel[j], colorconstant*arena2ccstatus[j])
						LastSecondArena2Display12:Show()
						LastSecondArena2Display11:Hide()
					elseif i==7 then
						LastSecondArena2Display11:SetBackdrop({bgFile = select(3, GetSpellInfo(arena2lastcc[j])), tile = false})
						LastSecondArena2Display11Text:SetText(display)
						LastSecondArena2Display11Text:SetTextColor(-arena2drlevel[j]+2, arena2drlevel[j], colorconstant*arena2ccstatus[j])
						LastSecondArena2Display11:Show()
						LastSecondArena2Display10:Hide()
					elseif i==8 then
						LastSecondArena2Display10:SetBackdrop({bgFile = select(3, GetSpellInfo(arena2lastcc[j])), tile = false})
						LastSecondArena2Display10Text:SetText(display)
						LastSecondArena2Display10Text:SetTextColor(-arena2drlevel[j]+2, arena2drlevel[j], colorconstant*arena2ccstatus[j])
						LastSecondArena2Display10:Show()
					elseif i==9 then
						--print("overload")
					end
					break
				end
				if j==17 and nextstart==1 then
					LastSecondArena2Display17:Hide()
				end
			j=j+1
			end
			if j==17 then
				break
			end
		i=i+1
		end
		nextstart=1
		for i=1, 9 do
			for j=nextstart, 17 do
				if arena3drlevel[j]~=3 then
					nextstart=j+1
					local display=string.format("%d", arena3drtime[j])
					if i==1 then
						LastSecondArena3Display17:SetBackdrop({bgFile = select(3, GetSpellInfo(arena3lastcc[j])), tile = false})
						LastSecondArena3Display17Text:SetText(display)
						LastSecondArena3Display17Text:SetTextColor(-arena3drlevel[j]+2, arena3drlevel[j], colorconstant*arena3ccstatus[j])
						LastSecondArena3Display17:Show()
						LastSecondArena3Display16:Hide()
					elseif i==2 then
						LastSecondArena3Display16:SetBackdrop({bgFile = select(3, GetSpellInfo(arena3lastcc[j])), tile = false})
						LastSecondArena3Display16Text:SetText(display)
						LastSecondArena3Display16Text:SetTextColor(-arena3drlevel[j]+2, arena3drlevel[j], colorconstant*arena3ccstatus[j])
						LastSecondArena3Display16:Show()
						LastSecondArena3Display15:Hide()
					elseif i==3 then
						LastSecondArena3Display15:SetBackdrop({bgFile = select(3, GetSpellInfo(arena3lastcc[j])), tile = false})
						LastSecondArena3Display15Text:SetText(display)
						LastSecondArena3Display15Text:SetTextColor(-arena3drlevel[j]+2, arena3drlevel[j], colorconstant*arena3ccstatus[j])
						LastSecondArena3Display15:Show()
						LastSecondArena3Display14:Hide()
					elseif i==4 then
						LastSecondArena3Display14:SetBackdrop({bgFile = select(3, GetSpellInfo(arena3lastcc[j])), tile = false})
						LastSecondArena3Display14Text:SetText(display)
						LastSecondArena3Display14Text:SetTextColor(-arena3drlevel[j]+2, arena3drlevel[j], colorconstant*arena3ccstatus[j])
						LastSecondArena3Display14:Show()
						LastSecondArena3Display13:Hide()
					elseif i==5 then
						LastSecondArena3Display13:SetBackdrop({bgFile = select(3, GetSpellInfo(arena3lastcc[j])), tile = false})
						LastSecondArena3Display13Text:SetText(display)
						LastSecondArena3Display13Text:SetTextColor(-arena3drlevel[j]+2, arena3drlevel[j], colorconstant*arena3ccstatus[j])
						LastSecondArena3Display13:Show()
						LastSecondArena3Display12:Hide()
					elseif i==6 then
						LastSecondArena3Display12:SetBackdrop({bgFile = select(3, GetSpellInfo(arena3lastcc[j])), tile = false})
						LastSecondArena3Display12Text:SetText(display)
						LastSecondArena3Display12Text:SetTextColor(-arena3drlevel[j]+2, arena3drlevel[j], colorconstant*arena3ccstatus[j])
						LastSecondArena3Display12:Show()
						LastSecondArena3Display11:Hide()
					elseif i==7 then
						LastSecondArena3Display11:SetBackdrop({bgFile = select(3, GetSpellInfo(arena3lastcc[j])), tile = false})
						LastSecondArena3Display11Text:SetText(display)
						LastSecondArena3Display11Text:SetTextColor(-arena3drlevel[j]+2, arena3drlevel[j], colorconstant*arena3ccstatus[j])
						LastSecondArena3Display11:Show()
						LastSecondArena3Display10:Hide()
					elseif i==8 then
						LastSecondArena3Display10:SetBackdrop({bgFile = select(3, GetSpellInfo(arena3lastcc[j])), tile = false})
						LastSecondArena3Display10Text:SetText(display)
						LastSecondArena3Display10Text:SetTextColor(-arena3drlevel[j]+2, arena3drlevel[j], colorconstant*arena3ccstatus[j])
						LastSecondArena3Display10:Show()
					elseif i==9 then
						--print("overload")
					end
					break
				end
				if j==17 and nextstart==1 then
					LastSecondArena3Display17:Hide()
				end
			j=j+1
			end
			if j==17 then
				break
			end
		i=i+1
		end
		nextstart=1
		for i=1, 9 do
			for j=nextstart, 17 do
				if arena4drlevel[j]~=3 then
					nextstart=j+1
					local display=string.format("%d", arena4drtime[j])
					if i==1 then
						LastSecondArena4Display17:SetBackdrop({bgFile = select(3, GetSpellInfo(arena4lastcc[j])), tile = false})
						LastSecondArena4Display17Text:SetText(display)
						LastSecondArena4Display17Text:SetTextColor(-arena4drlevel[j]+2, arena4drlevel[j], colorconstant*arena4ccstatus[j])
						LastSecondArena4Display17:Show()
						LastSecondArena4Display16:Hide()
					elseif i==2 then
						LastSecondArena4Display16:SetBackdrop({bgFile = select(3, GetSpellInfo(arena4lastcc[j])), tile = false})
						LastSecondArena4Display16Text:SetText(display)
						LastSecondArena4Display16Text:SetTextColor(-arena4drlevel[j]+2, arena4drlevel[j], colorconstant*arena4ccstatus[j])
						LastSecondArena4Display16:Show()
						LastSecondArena4Display15:Hide()
					elseif i==3 then
						LastSecondArena4Display15:SetBackdrop({bgFile = select(3, GetSpellInfo(arena4lastcc[j])), tile = false})
						LastSecondArena4Display15Text:SetText(display)
						LastSecondArena4Display15Text:SetTextColor(-arena4drlevel[j]+2, arena4drlevel[j], colorconstant*arena4ccstatus[j])
						LastSecondArena4Display15:Show()
						LastSecondArena4Display14:Hide()
					elseif i==4 then
						LastSecondArena4Display14:SetBackdrop({bgFile = select(3, GetSpellInfo(arena4lastcc[j])), tile = false})
						LastSecondArena4Display14Text:SetText(display)
						LastSecondArena4Display14Text:SetTextColor(-arena4drlevel[j]+2, arena4drlevel[j], colorconstant*arena4ccstatus[j])
						LastSecondArena4Display14:Show()
						LastSecondArena4Display13:Hide()
					elseif i==5 then
						LastSecondArena4Display13:SetBackdrop({bgFile = select(3, GetSpellInfo(arena4lastcc[j])), tile = false})
						LastSecondArena4Display13Text:SetText(display)
						LastSecondArena4Display13Text:SetTextColor(-arena4drlevel[j]+2, arena4drlevel[j], colorconstant*arena4ccstatus[j])
						LastSecondArena4Display13:Show()
						LastSecondArena4Display12:Hide()
					elseif i==6 then
						LastSecondArena4Display12:SetBackdrop({bgFile = select(3, GetSpellInfo(arena4lastcc[j])), tile = false})
						LastSecondArena4Display12Text:SetText(display)
						LastSecondArena4Display12Text:SetTextColor(-arena4drlevel[j]+2, arena4drlevel[j], colorconstant*arena4ccstatus[j])
						LastSecondArena4Display12:Show()
						LastSecondArena4Display11:Hide()
					elseif i==7 then
						LastSecondArena4Display11:SetBackdrop({bgFile = select(3, GetSpellInfo(arena4lastcc[j])), tile = false})
						LastSecondArena4Display11Text:SetText(display)
						LastSecondArena4Display11Text:SetTextColor(-arena4drlevel[j]+2, arena4drlevel[j], colorconstant*arena4ccstatus[j])
						LastSecondArena4Display11:Show()
						LastSecondArena4Display10:Hide()
					elseif i==8 then
						LastSecondArena4Display10:SetBackdrop({bgFile = select(3, GetSpellInfo(arena4lastcc[j])), tile = false})
						LastSecondArena4Display10Text:SetText(display)
						LastSecondArena4Display10Text:SetTextColor(-arena4drlevel[j]+2, arena4drlevel[j], colorconstant*arena4ccstatus[j])
						LastSecondArena4Display10:Show()
					elseif i==9 then
						--print("overload")
					end
					break
				end
				if j==17 and nextstart==1 then
					LastSecondArena4Display17:Hide()
				end
			j=j+1
			end
			if j==17 then
				break
			end
		i=i+1
		end
		nextstart=1
		for i=1, 9 do
			for j=nextstart, 17 do
				if arena5drlevel[j]~=3 then
					nextstart=j+1
					local display=string.format("%d", arena5drtime[j])
					if i==1 then
						LastSecondArena5Display17:SetBackdrop({bgFile = select(3, GetSpellInfo(arena5lastcc[j])), tile = false})
						LastSecondArena5Display17Text:SetText(display)
						LastSecondArena5Display17Text:SetTextColor(-arena5drlevel[j]+2, arena5drlevel[j], colorconstant*arena5ccstatus[j])
						LastSecondArena5Display17:Show()
						LastSecondArena5Display16:Hide()
					elseif i==2 then
						LastSecondArena5Display16:SetBackdrop({bgFile = select(3, GetSpellInfo(arena5lastcc[j])), tile = false})
						LastSecondArena5Display16Text:SetText(display)
						LastSecondArena5Display16Text:SetTextColor(-arena5drlevel[j]+2, arena5drlevel[j], colorconstant*arena5ccstatus[j])
						LastSecondArena5Display16:Show()
						LastSecondArena5Display15:Hide()
					elseif i==3 then
						LastSecondArena5Display15:SetBackdrop({bgFile = select(3, GetSpellInfo(arena5lastcc[j])), tile = false})
						LastSecondArena5Display15Text:SetText(display)
						LastSecondArena5Display15Text:SetTextColor(-arena5drlevel[j]+2, arena5drlevel[j], colorconstant*arena5ccstatus[j])
						LastSecondArena5Display15:Show()
						LastSecondArena5Display14:Hide()
					elseif i==4 then
						LastSecondArena5Display14:SetBackdrop({bgFile = select(3, GetSpellInfo(arena5lastcc[j])), tile = false})
						LastSecondArena5Display14Text:SetText(display)
						LastSecondArena5Display14Text:SetTextColor(-arena5drlevel[j]+2, arena5drlevel[j], colorconstant*arena5ccstatus[j])
						LastSecondArena5Display14:Show()
						LastSecondArena5Display13:Hide()
					elseif i==5 then
						LastSecondArena5Display13:SetBackdrop({bgFile = select(3, GetSpellInfo(arena5lastcc[j])), tile = false})
						LastSecondArena5Display13Text:SetText(display)
						LastSecondArena5Display13Text:SetTextColor(-arena5drlevel[j]+2, arena5drlevel[j], colorconstant*arena5ccstatus[j])
						LastSecondArena5Display13:Show()
						LastSecondArena5Display12:Hide()
					elseif i==6 then
						LastSecondArena5Display12:SetBackdrop({bgFile = select(3, GetSpellInfo(arena5lastcc[j])), tile = false})
						LastSecondArena5Display12Text:SetText(display)
						LastSecondArena5Display12Text:SetTextColor(-arena5drlevel[j]+2, arena5drlevel[j], colorconstant*arena5ccstatus[j])
						LastSecondArena5Display12:Show()
						LastSecondArena5Display11:Hide()
					elseif i==7 then
						LastSecondArena5Display11:SetBackdrop({bgFile = select(3, GetSpellInfo(arena5lastcc[j])), tile = false})
						LastSecondArena5Display11Text:SetText(display)
						LastSecondArena5Display11Text:SetTextColor(-arena5drlevel[j]+2, arena5drlevel[j], colorconstant*arena5ccstatus[j])
						LastSecondArena5Display11:Show()
						LastSecondArena5Display10:Hide()
					elseif i==8 then
						LastSecondArena5Display10:SetBackdrop({bgFile = select(3, GetSpellInfo(arena5lastcc[j])), tile = false})
						LastSecondArena5Display10Text:SetText(display)
						LastSecondArena5Display10Text:SetTextColor(-arena5drlevel[j]+2, arena5drlevel[j], colorconstant*arena5ccstatus[j])
						LastSecondArena5Display10:Show()
					elseif i==9 then
						--print("overload")
					end
					break
				end
				if j==17 and nextstart==1 then
					LastSecondArena5Display17:Hide()
				end
			j=j+1
			end
			if j==17 then
				break
			end
		i=i+1
		end
	elseif example==1 then
		LastSecondDisplay17:SetBackdrop({bgFile = select(3, GetSpellInfo(10308)), tile = false})
		LastSecondDisplay17Text:SetText(18)
		LastSecondDisplay17Text:SetTextColor(-2+2, 2, colorconstant*1)
		LastSecondDisplay17:Show()
		LastSecondDisplay16:SetBackdrop({bgFile = select(3, GetSpellInfo(33786)), tile = false})
		LastSecondDisplay16Text:SetText(10)
		LastSecondDisplay16Text:SetTextColor(-1+2, 1, colorconstant*0)
		LastSecondDisplay16:Show()
		LastSecondDisplay15:SetBackdrop({bgFile = select(3, GetSpellInfo(34490)), tile = false})
		LastSecondDisplay15Text:SetText(16)
		LastSecondDisplay15Text:SetTextColor(-0+2, 0, colorconstant*0)
		LastSecondDisplay15:Show()
		LastSecondDisplay14:SetBackdrop({bgFile = select(3, GetSpellInfo(20066)), tile = false})
		LastSecondDisplay14Text:SetText(3)
		LastSecondDisplay14Text:SetTextColor(-2+2, 2, colorconstant*0)
		LastSecondDisplay14:Show()
		LastSecondDisplay13:Hide()
		LastSecondDisplay12:Hide()
		LastSecondDisplay11:Hide()
		LastSecondDisplay10:Hide()
		
		LastSecondFocusDisplay17:SetBackdrop({bgFile = select(3, GetSpellInfo(10308)), tile = false})
		LastSecondFocusDisplay17Text:SetText(18)
		LastSecondFocusDisplay17Text:SetTextColor(-2+2, 2, colorconstant*1)
		LastSecondFocusDisplay17:Show()
		LastSecondFocusDisplay16:SetBackdrop({bgFile = select(3, GetSpellInfo(33786)), tile = false})
		LastSecondFocusDisplay16Text:SetText(10)
		LastSecondFocusDisplay16Text:SetTextColor(-1+2, 1, colorconstant*0)
		LastSecondFocusDisplay16:Show()
		LastSecondFocusDisplay15:SetBackdrop({bgFile = select(3, GetSpellInfo(34490)), tile = false})
		LastSecondFocusDisplay15Text:SetText(16)
		LastSecondFocusDisplay15Text:SetTextColor(-0+2, 0, colorconstant*0)
		LastSecondFocusDisplay15:Show()
		LastSecondFocusDisplay14:SetBackdrop({bgFile = select(3, GetSpellInfo(20066)), tile = false})
		LastSecondFocusDisplay14Text:SetText(3)
		LastSecondFocusDisplay14Text:SetTextColor(-2+2, 2, colorconstant*0)
		LastSecondFocusDisplay14:Show()
		LastSecondFocusDisplay13:Hide()
		LastSecondFocusDisplay12:Hide()
		LastSecondFocusDisplay11:Hide()
		LastSecondFocusDisplay10:Hide()

		LastSecondTargetDisplay17:SetBackdrop({bgFile = select(3, GetSpellInfo(10308)), tile = false})
		LastSecondTargetDisplay17Text:SetText(18)
		LastSecondTargetDisplay17Text:SetTextColor(-2+2, 2, colorconstant*1)
		LastSecondTargetDisplay17:Show()
		LastSecondTargetDisplay16:SetBackdrop({bgFile = select(3, GetSpellInfo(33786)), tile = false})
		LastSecondTargetDisplay16Text:SetText(10)
		LastSecondTargetDisplay16Text:SetTextColor(-1+2, 1, colorconstant*0)
		LastSecondTargetDisplay16:Show()
		LastSecondTargetDisplay15:SetBackdrop({bgFile = select(3, GetSpellInfo(34490)), tile = false})
		LastSecondTargetDisplay15Text:SetText(16)
		LastSecondTargetDisplay15Text:SetTextColor(-0+2, 0, colorconstant*0)
		LastSecondTargetDisplay15:Show()
		LastSecondTargetDisplay14:SetBackdrop({bgFile = select(3, GetSpellInfo(20066)), tile = false})
		LastSecondTargetDisplay14Text:SetText(3)
		LastSecondTargetDisplay14Text:SetTextColor(-2+2, 2, colorconstant*0)
		LastSecondTargetDisplay14:Show()
		LastSecondTargetDisplay13:Hide()
		LastSecondTargetDisplay12:Hide()
		LastSecondTargetDisplay11:Hide()
		LastSecondTargetDisplay10:Hide()

		LastSecondParty1Display17:SetBackdrop({bgFile = select(3, GetSpellInfo(10308)), tile = false})
		LastSecondParty1Display17Text:SetText(18)
		LastSecondParty1Display17Text:SetTextColor(-2+2, 2, colorconstant*1)
		LastSecondParty1Display17:Show()
		LastSecondParty1Display16:SetBackdrop({bgFile = select(3, GetSpellInfo(33786)), tile = false})
		LastSecondParty1Display16Text:SetText(10)
		LastSecondParty1Display16Text:SetTextColor(-1+2, 1, colorconstant*0)
		LastSecondParty1Display16:Show()
		LastSecondParty1Display15:SetBackdrop({bgFile = select(3, GetSpellInfo(34490)), tile = false})
		LastSecondParty1Display15Text:SetText(16)
		LastSecondParty1Display15Text:SetTextColor(-0+2, 0, colorconstant*0)
		LastSecondParty1Display15:Show()
		LastSecondParty1Display14:SetBackdrop({bgFile = select(3, GetSpellInfo(20066)), tile = false})
		LastSecondParty1Display14Text:SetText(3)
		LastSecondParty1Display14Text:SetTextColor(-2+2, 2, colorconstant*0)
		LastSecondParty1Display14:Show()
		LastSecondParty1Display13:Hide()
		LastSecondParty1Display12:Hide()
		LastSecondParty1Display11:Hide()
		LastSecondParty1Display10:Hide()

		LastSecondParty2Display17:SetBackdrop({bgFile = select(3, GetSpellInfo(10308)), tile = false})
		LastSecondParty2Display17Text:SetText(18)
		LastSecondParty2Display17Text:SetTextColor(-2+2, 2, colorconstant*1)
		LastSecondParty2Display17:Show()
		LastSecondParty2Display16:SetBackdrop({bgFile = select(3, GetSpellInfo(33786)), tile = false})
		LastSecondParty2Display16Text:SetText(10)
		LastSecondParty2Display16Text:SetTextColor(-1+2, 1, colorconstant*0)
		LastSecondParty2Display16:Show()
		LastSecondParty2Display15:SetBackdrop({bgFile = select(3, GetSpellInfo(34490)), tile = false})
		LastSecondParty2Display15Text:SetText(16)
		LastSecondParty2Display15Text:SetTextColor(-0+2, 0, colorconstant*0)
		LastSecondParty2Display15:Show()
		LastSecondParty2Display14:SetBackdrop({bgFile = select(3, GetSpellInfo(20066)), tile = false})
		LastSecondParty2Display14Text:SetText(3)
		LastSecondParty2Display14Text:SetTextColor(-2+2, 2, colorconstant*0)
		LastSecondParty2Display14:Show()
		LastSecondParty2Display13:Hide()
		LastSecondParty2Display12:Hide()
		LastSecondParty2Display11:Hide()
		LastSecondParty2Display10:Hide()

		LastSecondParty3Display17:SetBackdrop({bgFile = select(3, GetSpellInfo(10308)), tile = false})
		LastSecondParty3Display17Text:SetText(18)
		LastSecondParty3Display17Text:SetTextColor(-2+2, 2, colorconstant*1)
		LastSecondParty3Display17:Show()
		LastSecondParty3Display16:SetBackdrop({bgFile = select(3, GetSpellInfo(33786)), tile = false})
		LastSecondParty3Display16Text:SetText(10)
		LastSecondParty3Display16Text:SetTextColor(-1+2, 1, colorconstant*0)
		LastSecondParty3Display16:Show()
		LastSecondParty3Display15:SetBackdrop({bgFile = select(3, GetSpellInfo(34490)), tile = false})
		LastSecondParty3Display15Text:SetText(16)
		LastSecondParty3Display15Text:SetTextColor(-0+2, 0, colorconstant*0)
		LastSecondParty3Display15:Show()
		LastSecondParty3Display14:SetBackdrop({bgFile = select(3, GetSpellInfo(20066)), tile = false})
		LastSecondParty3Display14Text:SetText(3)
		LastSecondParty3Display14Text:SetTextColor(-2+2, 2, colorconstant*0)
		LastSecondParty3Display14:Show()
		LastSecondParty3Display13:Hide()
		LastSecondParty3Display12:Hide()
		LastSecondParty3Display11:Hide()
		LastSecondParty3Display10:Hide()

		LastSecondParty4Display17:SetBackdrop({bgFile = select(3, GetSpellInfo(10308)), tile = false})
		LastSecondParty4Display17Text:SetText(18)
		LastSecondParty4Display17Text:SetTextColor(-2+2, 2, colorconstant*1)
		LastSecondParty4Display17:Show()
		LastSecondParty4Display16:SetBackdrop({bgFile = select(3, GetSpellInfo(33786)), tile = false})
		LastSecondParty4Display16Text:SetText(10)
		LastSecondParty4Display16Text:SetTextColor(-1+2, 1, colorconstant*0)
		LastSecondParty4Display16:Show()
		LastSecondParty4Display15:SetBackdrop({bgFile = select(3, GetSpellInfo(34490)), tile = false})
		LastSecondParty4Display15Text:SetText(16)
		LastSecondParty4Display15Text:SetTextColor(-0+2, 0, colorconstant*0)
		LastSecondParty4Display15:Show()
		LastSecondParty4Display14:SetBackdrop({bgFile = select(3, GetSpellInfo(20066)), tile = false})
		LastSecondParty4Display14Text:SetText(3)
		LastSecondParty4Display14Text:SetTextColor(-2+2, 2, colorconstant*0)
		LastSecondParty4Display14:Show()
		LastSecondParty4Display13:Hide()
		LastSecondParty4Display12:Hide()
		LastSecondParty4Display11:Hide()
		LastSecondParty4Display10:Hide()

		LastSecondArena1Display17:SetBackdrop({bgFile = select(3, GetSpellInfo(10308)), tile = false})
		LastSecondArena1Display17Text:SetText(18)
		LastSecondArena1Display17Text:SetTextColor(-2+2, 2, colorconstant*1)
		LastSecondArena1Display17:Show()
		LastSecondArena1Display16:SetBackdrop({bgFile = select(3, GetSpellInfo(33786)), tile = false})
		LastSecondArena1Display16Text:SetText(10)
		LastSecondArena1Display16Text:SetTextColor(-1+2, 1, colorconstant*0)
		LastSecondArena1Display16:Show()
		LastSecondArena1Display15:SetBackdrop({bgFile = select(3, GetSpellInfo(34490)), tile = false})
		LastSecondArena1Display15Text:SetText(16)
		LastSecondArena1Display15Text:SetTextColor(-0+2, 0, colorconstant*0)
		LastSecondArena1Display15:Show()
		LastSecondArena1Display14:SetBackdrop({bgFile = select(3, GetSpellInfo(20066)), tile = false})
		LastSecondArena1Display14Text:SetText(3)
		LastSecondArena1Display14Text:SetTextColor(-2+2, 2, colorconstant*0)
		LastSecondArena1Display14:Show()
		LastSecondArena1Display13:Hide()
		LastSecondArena1Display12:Hide()
		LastSecondArena1Display11:Hide()
		LastSecondArena1Display10:Hide()

		LastSecondArena2Display17:SetBackdrop({bgFile = select(3, GetSpellInfo(10308)), tile = false})
		LastSecondArena2Display17Text:SetText(18)
		LastSecondArena2Display17Text:SetTextColor(-2+2, 2, colorconstant*1)
		LastSecondArena2Display17:Show()
		LastSecondArena2Display16:SetBackdrop({bgFile = select(3, GetSpellInfo(33786)), tile = false})
		LastSecondArena2Display16Text:SetText(10)
		LastSecondArena2Display16Text:SetTextColor(-1+2, 1, colorconstant*0)
		LastSecondArena2Display16:Show()
		LastSecondArena2Display15:SetBackdrop({bgFile = select(3, GetSpellInfo(34490)), tile = false})
		LastSecondArena2Display15Text:SetText(16)
		LastSecondArena2Display15Text:SetTextColor(-0+2, 0, colorconstant*0)
		LastSecondArena2Display15:Show()
		LastSecondArena2Display14:SetBackdrop({bgFile = select(3, GetSpellInfo(20066)), tile = false})
		LastSecondArena2Display14Text:SetText(3)
		LastSecondArena2Display14Text:SetTextColor(-2+2, 2, colorconstant*0)
		LastSecondArena2Display14:Show()
		LastSecondArena2Display13:Hide()
		LastSecondArena2Display12:Hide()
		LastSecondArena2Display11:Hide()
		LastSecondArena2Display10:Hide()

		LastSecondArena3Display17:SetBackdrop({bgFile = select(3, GetSpellInfo(10308)), tile = false})
		LastSecondArena3Display17Text:SetText(18)
		LastSecondArena3Display17Text:SetTextColor(-2+2, 2, colorconstant*1)
		LastSecondArena3Display17:Show()
		LastSecondArena3Display16:SetBackdrop({bgFile = select(3, GetSpellInfo(33786)), tile = false})
		LastSecondArena3Display16Text:SetText(10)
		LastSecondArena3Display16Text:SetTextColor(-1+2, 1, colorconstant*0)
		LastSecondArena3Display16:Show()
		LastSecondArena3Display15:SetBackdrop({bgFile = select(3, GetSpellInfo(34490)), tile = false})
		LastSecondArena3Display15Text:SetText(16)
		LastSecondArena3Display15Text:SetTextColor(-0+2, 0, colorconstant*0)
		LastSecondArena3Display15:Show()
		LastSecondArena3Display14:SetBackdrop({bgFile = select(3, GetSpellInfo(20066)), tile = false})
		LastSecondArena3Display14Text:SetText(3)
		LastSecondArena3Display14Text:SetTextColor(-2+2, 2, colorconstant*0)
		LastSecondArena3Display14:Show()
		LastSecondArena3Display13:Hide()
		LastSecondArena3Display12:Hide()
		LastSecondArena3Display11:Hide()
		LastSecondArena3Display10:Hide()

		LastSecondArena4Display17:SetBackdrop({bgFile = select(3, GetSpellInfo(10308)), tile = false})
		LastSecondArena4Display17Text:SetText(18)
		LastSecondArena4Display17Text:SetTextColor(-2+2, 2, colorconstant*1)
		LastSecondArena4Display17:Show()
		LastSecondArena4Display16:SetBackdrop({bgFile = select(3, GetSpellInfo(33786)), tile = false})
		LastSecondArena4Display16Text:SetText(10)
		LastSecondArena4Display16Text:SetTextColor(-1+2, 1, colorconstant*0)
		LastSecondArena4Display16:Show()
		LastSecondArena4Display15:SetBackdrop({bgFile = select(3, GetSpellInfo(34490)), tile = false})
		LastSecondArena4Display15Text:SetText(16)
		LastSecondArena4Display15Text:SetTextColor(-0+2, 0, colorconstant*0)
		LastSecondArena4Display15:Show()
		LastSecondArena4Display14:SetBackdrop({bgFile = select(3, GetSpellInfo(20066)), tile = false})
		LastSecondArena4Display14Text:SetText(3)
		LastSecondArena4Display14Text:SetTextColor(-2+2, 2, colorconstant*0)
		LastSecondArena4Display14:Show()
		LastSecondArena4Display13:Hide()
		LastSecondArena4Display12:Hide()
		LastSecondArena4Display11:Hide()
		LastSecondArena4Display10:Hide()

		LastSecondArena5Display17:SetBackdrop({bgFile = select(3, GetSpellInfo(10308)), tile = false})
		LastSecondArena5Display17Text:SetText(18)
		LastSecondArena5Display17Text:SetTextColor(-2+2, 2, colorconstant*1)
		LastSecondArena5Display17:Show()
		LastSecondArena5Display16:SetBackdrop({bgFile = select(3, GetSpellInfo(33786)), tile = false})
		LastSecondArena5Display16Text:SetText(10)
		LastSecondArena5Display16Text:SetTextColor(-1+2, 1, colorconstant*0)
		LastSecondArena5Display16:Show()
		LastSecondArena5Display15:SetBackdrop({bgFile = select(3, GetSpellInfo(34490)), tile = false})
		LastSecondArena5Display15Text:SetText(16)
		LastSecondArena5Display15Text:SetTextColor(-0+2, 0, colorconstant*0)
		LastSecondArena5Display15:Show()
		LastSecondArena5Display14:SetBackdrop({bgFile = select(3, GetSpellInfo(20066)), tile = false})
		LastSecondArena5Display14Text:SetText(3)
		LastSecondArena5Display14Text:SetTextColor(-2+2, 2, colorconstant*0)
		LastSecondArena5Display14:Show()
		LastSecondArena5Display13:Hide()
		LastSecondArena5Display12:Hide()
		LastSecondArena5Display11:Hide()
		LastSecondArena5Display10:Hide()
	end
end





local psychichorrorfirstend=1
local wyvernstingfirstend=1
local wyvernstingfirstapply=1
function LastSecondOnEvent(self, event, ...)
	local timestamp, Event, sourceGUID, sourceName, sourceFlags, destGUID, destName, destFlags, param1, param2, param3, param4, param5,
		param6, param7, param8, param9, param10, param11, param12=...
	if onoffcombatlog==1 and sourceGUID==UnitGUID("target") then
		print("self", self, "event", event, "timestamp", timestamp, "Event", Event, "sourceGUID", sourceGUID, "sourceName", sourceName, "sourceFlags", sourceFlags, "destGUID", destGUID,
		"destName", destName, "destFlags", destFlags,
		"param1-9", param1, param2, param3, param4, param5, param6, param7, param8, param9, param10, param11, param12)
	end

	if event=="COMBAT_LOG_EVENT_UNFILTERED" then
		if (Event=="SPELL_AURA_REMOVED" or Event=="SPELL_AURA_APPLIED") then--and (destGUID==UnitGUID("player") or destGUID==UnitGUID("party1") or destGUID==UnitGUID("party2")
--			or destGUID==UnitGUID("party3") or destGUID==UnitGUID("party4") or destGUID==UnitGUID("arena1") or destGUID==UnitGUID("arena2") or destGUID==UnitGUID("arena3")
--			or destGUID==UnitGUID("arena4") or destGUID==UnitGUID("arena5")) then
			local i
			for i=1,76 do
				if param2==crowdcontrolnames[i] then
					--psychic horror and wyvern sting needed a special case because it appears twice in the table of ccs, and caused problems
					--64044 means fear
					--remove a 64058 apon disarm
	--				print(param1)
					if crowdcontrolnames[i]=="Psychic Horror" then
						if Event=="SPELL_AURA_APPLIED" then
							if psychichorrorfirstapply==1 then
								UpdateDR(24, Event, 64058, destGUID)
								UpdateDR(47 , Event, 64044, destGUID)
								psychichorrorfirstapply=0
							else
								psychichorrorfirstapply=1
							end
						elseif psychichorrorfirstend==1 then
							UpdateDR(24, Event, 64058, destGUID)
							psychichorrorfirstend=0
						else
							UpdateDR(47 , Event, 64044, destGUID)
							psychichorrorfirstend=1
						end
					elseif crowdcontrolnames[i]=="Wyvern Sting" then
						if Event=="SPELL_AURA_APPLIED" then
							if wyvernstingfirstapply==1 then
								UpdateDR(38, Event, 49012, destGUID)
								wyvernstingfirstapply=0
							else
								wyvernstingfirstapply=1
							end
						elseif wyvernstingfirstend==1 then
							UpdateDR(38 , Event, 49012, destGUID)
							wyvernstingfirstend=0
						else
							wyvernstingfirstend=1
						end
					else
						UpdateDR(i, Event, param1, destGUID)
					end
					break
				end
				i=i+1
			end
		end
	elseif event=="PLAYER_TARGET_CHANGED" or event=="PLAYER_FOCUS_CHANGED" then
		SetTargetAndFocusReference()
		buildframechain()
	elseif event=="ADDON_LOADED" and timestamp=="LastSecond" then
--		print(cc1,cc2,cc3,cc4,cc5,cc6,cc7,cc8,cc9,cc10,cc11,cc12,cc13,cc14,cc15,cc16,cc17)
		if lastsecondwindowsize==nil then lastsecondwindowsize=35 end
		if test==nil then test=1 end
		if showlogin==nil then showlogin=1 end
		if cc1==nil then
			cconoffstatus={1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1}
		else
			cconoffstatus={cc1, cc2, cc3, cc4, cc5, cc6, cc7, cc8, cc9, cc10, cc11, cc12, cc13, cc14, cc15, cc16, cc17}
		end
		if selfarenashow==nil then
			selfarenashow=1
			partyarenashow=1
			opponentarenashow=1
			targetarenashow=1
			focusarenashow=1
			selfothershow=1
			partyothershow=1
			targetothershow=1
			focusothershow=1
		end
		if selfalignment==nil then selfalignment=0 end
		if targetalignment==nil then targetalignment=0 end
		if partyalignment==nil then partyalignment=0 end
		if arenaalignment==nil then arenaalignment=1 end
		if focusalignment==nil then focusalignment=0 end
		aligndisplay()
		changesize(lastsecondwindowsize)
		anchorbutton()
--		print("test is", test)
		if showlogin==0 then
			LastSecondLoginButton:Hide()
			LastSecondLoginBackground:Hide()
			LastSecondLoginText:Hide()
			LastSecondLoginCheckbox:Hide()
		end
		addonloaded=1
		LastSecondTest:Hide()
	end
end

local lastruntime1=GetTime()
local lastruntime=GetTime()
--screen refresh updates all the frames
function LastSecondOnUpdate()
	if GetTime()-lastruntime>.2 and addonloaded==1 then
--		if (GetTime()-addonstarttime)>.5 and sizeonce==1 then
--			sizeonce=0
--			cconoffstatus={1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1}
--			cconoffstatus={cc1, cc2, cc3, cc4, cc5, cc6, cc7, cc8, cc9, cc10, cc11, cc12, cc13, cc14, cc15, cc16, cc17}
--		end
		if GetTime()-lastruntime1>5 then
			lastruntime1=GetTime()
			CheckForStuckIcons()
		end
		local i
		for i=1, 17 do
			if ccstatus[i]==0 then
				if drtime[i]>0 then
					drtime[i]=lengthofdr-(GetTime()-cctime[i])
				else
					drtime[i]=0
					drlevel[i]=3
				end
			end
			if party1ccstatus[i]==0 then
				if party1drtime[i]>0 then
					party1drtime[i]=lengthofdr-(GetTime()-party1cctime[i])
				else
					party1drtime[i]=0
					party1drlevel[i]=3
				end
			end
			if party2ccstatus[i]==0 then
				if party2drtime[i]>0 then
					party2drtime[i]=lengthofdr-(GetTime()-party2cctime[i])
				else
					party2drtime[i]=0
					party2drlevel[i]=3
				end
			end
			if party3ccstatus[i]==0 then
				if party3drtime[i]>0 then
					party3drtime[i]=lengthofdr-(GetTime()-party3cctime[i])
				else
					party3drtime[i]=0
					party3drlevel[i]=3
				end
			end
			if party4ccstatus[i]==0 then
				if party4drtime[i]>0 then
					party4drtime[i]=lengthofdr-(GetTime()-party4cctime[i])
				else
					party4drtime[i]=0
					party4drlevel[i]=3
				end
			end
			if arena1ccstatus[i]==0 then
				if arena1drtime[i]>0 then
					arena1drtime[i]=lengthofdr-(GetTime()-arena1cctime[i])
				else
					arena1drtime[i]=0
					arena1drlevel[i]=3
				end
			end
			if arena2ccstatus[i]==0 then
				if arena2drtime[i]>0 then
					arena2drtime[i]=lengthofdr-(GetTime()-arena2cctime[i])
				else
					arena2drtime[i]=0
					arena2drlevel[i]=3
				end
			end
			if arena3ccstatus[i]==0 then
				if arena3drtime[i]>0 then
					arena3drtime[i]=lengthofdr-(GetTime()-arena3cctime[i])
				else
					arena3drtime[i]=0
					arena3drlevel[i]=3
				end
			end
			if arena4ccstatus[i]==0 then
				if arena4drtime[i]>0 then
					arena4drtime[i]=lengthofdr-(GetTime()-arena4cctime[i])
				else
					arena4drtime[i]=0
					arena4drlevel[i]=3
				end
			end
			if arena5ccstatus[i]==0 then
				if arena5drtime[i]>0 then
					arena5drtime[i]=lengthofdr-(GetTime()-arena5cctime[i])
				else
					arena5drtime[i]=0
					arena5drlevel[i]=3
				end
			end
			if save1ccstatus[i]==0 then
				if save1drtime[i]>0 then
					save1drtime[i]=lengthofdr-(GetTime()-save1cctime[i])
				else
					save1drtime[i]=0
					save1drlevel[i]=3
				end
			end
			if save2ccstatus[i]==0 then
				if save2drtime[i]>0 then
					save2drtime[i]=lengthofdr-(GetTime()-save2cctime[i])
				else
					save2drtime[i]=0
					save2drlevel[i]=3
				end
			end
			if save3ccstatus[i]==0 then
				if save3drtime[i]>0 then
					save3drtime[i]=lengthofdr-(GetTime()-save3cctime[i])
				else
					save3drtime[i]=0
					save3drlevel[i]=3
				end
			end
			if save4ccstatus[i]==0 then
				if save4drtime[i]>0 then
					save4drtime[i]=lengthofdr-(GetTime()-save4cctime[i])
				else
					save4drtime[i]=0
					save4drlevel[i]=3
				end
			end
			if save5ccstatus[i]==0 then
				if save5drtime[i]>0 then
					save5drtime[i]=lengthofdr-(GetTime()-save5cctime[i])
				else
					save5drtime[i]=0
					save5drlevel[i]=3
				end
			end
			if save6ccstatus[i]==0 then
				if save6drtime[i]>0 then
					save6drtime[i]=lengthofdr-(GetTime()-save6cctime[i])
				else
					save6drtime[i]=0
					save6drlevel[i]=3
				end
			end
			if save7ccstatus[i]==0 then
				if save7drtime[i]>0 then
					save7drtime[i]=lengthofdr-(GetTime()-save7cctime[i])
				else
					save7drtime[i]=0
					save7drlevel[i]=3
				end
			end
			if save8ccstatus[i]==0 then
				if save8drtime[i]>0 then
					save8drtime[i]=lengthofdr-(GetTime()-save8cctime[i])
				else
					save8drtime[i]=0
					save8drlevel[i]=3
				end
			end
			if save9ccstatus[i]==0 then
				if save9drtime[i]>0 then
					save9drtime[i]=lengthofdr-(GetTime()-save9cctime[i])
				else
					save9drtime[i]=0
					save9drlevel[i]=3
				end
			end
			if save10ccstatus[i]==0 then
				if save10drtime[i]>0 then
					save10drtime[i]=lengthofdr-(GetTime()-save10cctime[i])
				else
					save10drtime[i]=0
					save10drlevel[i]=3
				end
			end
			if save11ccstatus[i]==0 then
				if save11drtime[i]>0 then
					save11drtime[i]=lengthofdr-(GetTime()-save11cctime[i])
				else
					save11drtime[i]=0
					save11drlevel[i]=3
				end
			end
			if save12ccstatus[i]==0 then
				if save12drtime[i]>0 then
					save12drtime[i]=lengthofdr-(GetTime()-save12cctime[i])
				else
					save12drtime[i]=0
					save12drlevel[i]=3
				end
			end
			if save13ccstatus[i]==0 then
				if save13drtime[i]>0 then
					save13drtime[i]=lengthofdr-(GetTime()-save13cctime[i])
				else
					save13drtime[i]=0
					save13drlevel[i]=3
				end
			end
			if save14ccstatus[i]==0 then
				if save14drtime[i]>0 then
					save14drtime[i]=lengthofdr-(GetTime()-save14cctime[i])
				else
					save14drtime[i]=0
					save14drlevel[i]=3
				end
			end
			if save15ccstatus[i]==0 then
				if save15drtime[i]>0 then
					save15drtime[i]=lengthofdr-(GetTime()-save15cctime[i])
				else
					save15drtime[i]=0
					save15drlevel[i]=3
				end
			end
			if save16ccstatus[i]==0 then
				if save16drtime[i]>0 then
					save16drtime[i]=lengthofdr-(GetTime()-save16cctime[i])
				else
					save16drtime[i]=0
					save16drlevel[i]=3
				end
			end
			if save17ccstatus[i]==0 then
				if save17drtime[i]>0 then
					save17drtime[i]=lengthofdr-(GetTime()-save17cctime[i])
				else
					save17drtime[i]=0
					save17drlevel[i]=3
				end
			end
			if save18ccstatus[i]==0 then
				if save18drtime[i]>0 then
					save18drtime[i]=lengthofdr-(GetTime()-save18cctime[i])
				else
					save18drtime[i]=0
					save18drlevel[i]=3
				end
			end
			if save19ccstatus[i]==0 then
				if save19drtime[i]>0 then
					save19drtime[i]=lengthofdr-(GetTime()-save19cctime[i])
				else
					save19drtime[i]=0
					save19drlevel[i]=3
				end
			end
			if save20ccstatus[i]==0 then
				if save20drtime[i]>0 then
					save20drtime[i]=lengthofdr-(GetTime()-save20cctime[i])
				else
					save20drtime[i]=0
					save20drlevel[i]=3
				end
			end
			i=i+1
		end
		lastruntime=GetTime()
		buildframechain()
	end
end




function CheckForStuckIcons()
	local i
	local j
	local thetime=GetTime()
	for j=1,30 do
		local currentccstatustable=ccstatustable[j]
		local currentccapplytimetable=ccapplytimetable[j]
		local currentdrleveltable=drleveltable[j]
		for i=1,17 do
			--if the time the cc was applied is more than ten seconds ago and the ccstatus is still a 1, that means the icon is stuck and needs to be reset.
			if thetime-currentccapplytimetable[i]>12 and currentccstatustable[i]==1 then --we have found a stuck icon
				currentdrleveltable[i]=3
			end
			i=i+1
		end
	j=j+1
	end
--	print("checked for stuck icons")
end


--drlevel={3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3}
--drtime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
--ccstatus={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
--cctime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
--lastcc={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
--ccapplytime={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}


function buttontest(msg, editbox)
--	LastSecondTest:Hide()

--print (cconoffstatus[1], cconoffstatus[2], cconoffstatus[3], cconoffstatus[4], cconoffstatus[5], cconoffstatus[6], cconoffstatus[7], cconoffstatus[8], cconoffstatus[9],
--cconoffstatus[10], cconoffstatus[11], cconoffstatus[12], cconoffstatus[13], cconoffstatus[14], cconoffstatus[15], cconoffstatus[16], cconoffstatus[17])
--print(cc1,cc2,cc3,cc4,cc5,cc6,cc7,cc8,cc9,cc10,cc11,cc12,cc13,cc14,cc15,cc16,cc17)
--	local arena1ccstatuses=string.format("%d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d", arena1ccstatus[1], arena1ccstatus[2], arena1ccstatus[3], arena1ccstatus[4], arena1ccstatus[5], arena1ccstatus[6],
--								arena1ccstatus[7], arena1ccstatus[8], arena1ccstatus[9], arena1ccstatus[10], arena1ccstatus[11], arena1ccstatus[12], arena1ccstatus[13], arena1ccstatus[14], arena1ccstatus[15], arena1ccstatus[16], arena1ccstatus[17])
--	local arena1drlevels=string.format("%d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d", arena1drlevel[1], arena1drlevel[2], arena1drlevel[3], arena1drlevel[4], arena1drlevel[5], arena1drlevel[6], arena1drlevel[7],
--								arena1drlevel[8], arena1drlevel[9], arena1drlevel[10], arena1drlevel[11], arena1drlevel[12], arena1drlevel[13], arena1drlevel[14], arena1drlevel[15], arena1drlevel[16], arena1drlevel[17])
--	local arena1drtimes=string.format("%d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d", arena1drtime[1], arena1drtime[2], arena1drtime[3], arena1drtime[4], arena1drtime[5], arena1drtime[6], arena1drtime[7], arena1drtime[8],
--								arena1drtime[9], arena1drtime[10], arena1drtime[11], arena1drtime[12], arena1drtime[13], arena1drtime[14], arena1drtime[15], arena1drtime[16], arena1drtime[17])

--	print(arena1ccstatuses)
--	print(arena1drlevels)
--	print(arena1drtimes)
--print("test was", test)
--if test==1 then test=0 else test=1 end
--print("test is now", test)
--local spellaura="SPELL_AURA_APPLIED"

--local fakespell=crowdcontrolnames[70]


--if onoffcombatlog==0 then onoffcombatlog=1 else onoffcombatlog=0 end
--print("combat log", onoffcombatlog)

--print(selfarenashow, partyarenashow, opponentarenashow, targetarenashow, selfothershow, partyothershow, targetothershow)

--LastSecondOnEvent(nil, "COMBAT_LOG_EVENT_UNFILTERED", nil, spellaura, nil, nil, nil, UnitGUID("target"), nil, nil, 48443, fakespell)
--LastSecondOnEvent(nil, "COMBAT_LOG_EVENT_UNFILTERED", nil, spellaura, nil, nil, nil, UnitGUID("party1"), nil, nil, 48443, fakespell)
--LastSecondOnEvent(nil, "COMBAT_LOG_EVENT_UNFILTERED", nil, spellaura, nil, nil, nil, UnitGUID("party2"), nil, nil, 48443, fakespell)
--LastSecondOnEvent(nil, "COMBAT_LOG_EVENT_UNFILTERED", nil, spellaura, nil, nil, nil, UnitGUID("party3"), nil, nil, 48443, fakespell)
--LastSecondOnEvent(nil, "COMBAT_LOG_EVENT_UNFILTERED", nil, spellaura, nil, nil, nil, UnitGUID("party4"), nil, nil, 48443, fakespell)
--LastSecondOnEvent(nil, "COMBAT_LOG_EVENT_UNFILTERED", nil, spellaura, nil, nil, nil, UnitGUID("arena1"), nil, nil, 48443, fakespell)
--LastSecondOnEvent(nil, "COMBAT_LOG_EVENT_UNFILTERED", nil, spellaura, nil, nil, nil, UnitGUID("arena2"), nil, nil, 48443, fakespell)
--LastSecondOnEvent(nil, "COMBAT_LOG_EVENT_UNFILTERED", nil, spellaura, nil, nil, nil, UnitGUID("arena3"), nil, nil, 48443, fakespell)
--LastSecondOnEvent(nil, "COMBAT_LOG_EVENT_UNFILTERED", nil, spellaura, nil, nil, nil, UnitGUID("arena4"), nil, nil, 48443, fakespell)
--LastSecondOnEvent(nil, "COMBAT_LOG_EVENT_UNFILTERED", nil, spellaura, nil, nil, nil, UnitGUID("arena5"), nil, nil, 48443, fakespell)
--fakecombatindex=fakecombatindex+1
--if fakecombatindex==77 then fakecombatindex=1 end

--	local ccstatuses=string.format("%d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d", ccstatus[1], ccstatus[2], ccstatus[3], ccstatus[4], ccstatus[5], ccstatus[6],
--								ccstatus[7], ccstatus[8], ccstatus[9], ccstatus[10], ccstatus[11], ccstatus[12], ccstatus[13], ccstatus[14], ccstatus[15], ccstatus[16], ccstatus[17])
--	local drlevels=string.format("%d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d", drlevel[1], drlevel[2], drlevel[3], drlevel[4], drlevel[5], drlevel[6], drlevel[7],
--								drlevel[8], drlevel[9], drlevel[10], drlevel[11], drlevel[12], drlevel[13], drlevel[14], drlevel[15], drlevel[16], drlevel[17])
--	local drtimes=string.format("%d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d", drtime[1], drtime[2], drtime[3], drtime[4], drtime[5], drtime[6], drtime[7], drtime[8],
--								drtime[9], drtime[10], drtime[11], drtime[12], drtime[13], drtime[14], drtime[15], drtime[16], drtime[17])
--	local save1ccstatuses=string.format("%d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d", save1ccstatus[1], save1ccstatus[2], save1ccstatus[3], save1ccstatus[4], save1ccstatus[5], save1ccstatus[6],
--						save1ccstatus[7], save1ccstatus[8], save1ccstatus[9], save1ccstatus[10], save1ccstatus[11], save1ccstatus[12], save1ccstatus[13], save1ccstatus[14], save1ccstatus[15], save1ccstatus[16], save1ccstatus[17])
--	local save2ccstatuses=string.format("%d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d", save2ccstatus[1], save2ccstatus[2], save2ccstatus[3], save2ccstatus[4], save2ccstatus[5], save2ccstatus[6],
--						save2ccstatus[7], save2ccstatus[8], save2ccstatus[9], save2ccstatus[10], save2ccstatus[11], save2ccstatus[12], save2ccstatus[13], save2ccstatus[14], save2ccstatus[15], save2ccstatus[16], save2ccstatus[17])
--	print(save1ccstatuses)
--	print(save2ccstatuses)
--	print(saveGUIDs[1], saveGUIDs[2])
--	print(save1ccstatus[13], save1drlevel[13], save1drtime[13])
--	print(save2ccstatus[13], save2drlevel[13], save2drtime[13])
--	print(targetccstatus[13], targetdrlevel[13], targetdrtime[13])
--print(saveupdatetime[1],saveupdatetime[2],saveupdatetime[3],saveupdatetime[4],saveupdatetime[5],saveupdatetime[6],saveupdatetime[7],saveupdatetime[8],saveupdatetime[9],saveupdatetime[10])
--	local party1ccstatuses=string.format("%d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d", party1ccstatus[1], party1ccstatus[2], party1ccstatus[3], party1ccstatus[4], party1ccstatus[5], party1ccstatus[6],
--								party1ccstatus[7], party1ccstatus[8], party1ccstatus[9], party1ccstatus[10], party1ccstatus[11], party1ccstatus[12], party1ccstatus[13], party1ccstatus[14], party1ccstatus[15], party1ccstatus[16], party1ccstatus[17])
--	local party1drlevels=string.format("%d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d", party1drlevel[1], party1drlevel[2], party1drlevel[3], party1drlevel[4], party1drlevel[5], party1drlevel[6], party1drlevel[7],
--								party1drlevel[8], party1drlevel[9], party1drlevel[10], party1drlevel[11], party1drlevel[12], party1drlevel[13], party1drlevel[14], party1drlevel[15], party1drlevel[16], party1drlevel[17])
--	local party1drtimes=string.format("%d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d", party1drtime[1], party1drtime[2], party1drtime[3], party1drtime[4], party1drtime[5], party1drtime[6], party1drtime[7], party1drtime[8],
--								party1drtime[9], party1drtime[10], party1drtime[11], party1drtime[12], party1drtime[13], party1drtime[14], party1drtime[15], party1drtime[16], party1drtime[17])
--	print(party1ccstatuses)
--	print(party1drlevels)
--	print(party1drtimes)
end






--to call a fake combat log event for testing:
--event is COMBAT_LOG_EVENT_UNFILTERED
--Event is SPELL_AURA_APPLIED or SPELL_AURA_REMOVED
--param2 is the actual name of the spell, ex "Cheap Shot"
--param1 is the spellID
--destGUID used
--rest do not matter, (nil, "COMBAT_LOG_EVENT_UNFILTERED", nil, "SPELL_AURA_APPLIED", nil, nil, nil, UnitGUID("player"), nil, nil, 48443, "Cheap Shot", ...)










--things to add:
--text on the window screen describing what checkmark does
--a prompt possibly apon first load of addon that shows clearly that you need to go to /lastsecond
--frames for every opponent on an arena team
--more than 4 frames? write something to chek
--game tooltips













