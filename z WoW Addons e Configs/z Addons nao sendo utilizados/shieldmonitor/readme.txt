Shieldmonitor by Frenchie
German localisation by Spiritmoon
Russian localisation by Glaurung
French localisation by Iktose
Korean localisation by Metalchoir
Chinese localisations by xiezi and juha
Spanish localisation by miros


Current version: 1.11.0, 2nd December 2011 - Available from http://www.wowinterface.com/

IMPORTANT: unfortunately I no longer play as main any characters that use shields (my mage I used to test the last update is still level 70!). So I'm not it a position to make updates or test for most gameplay changes. If someone else wants to pick up development on this addon, I'm happy to help out with any explanation of the code as needed.

Note: Due to time constraints development on this mod by me is now in maintenance mode, if anyone else wishes to pick it up to update it or add new features, please feel free.

Changelog
=========
1.11.0 - Updated for Wow 4.3 combatlog API
			 - removed right-click menu since is causes taint - use /sm options to change any options now
1.10.0 - Updated for Wow 4.2 combatlog API - no other changes 
1.9.0 - Updated for Wow 4.1 API - no other changes 
1.8.2 - Where shield strength is read from the tooltip this is now used as the final value as this should now already include spell/glyph bonuses. As a result we now check the tooltip every time a shield is cast rather than caching the value, since spellpower could have changed.
1.8.1 - Fix to shields where Blizz now sends the strength going back to 100% after damage - since they also now send a SPELL_AURA_REFRESH with a new strength each time such a shield takes damage.
			- added French translation for Mage Ward (Thanks Mizaru)
			- added Paladin's Guarded by the Light shield (Thanks Tatltael). Note I don't have a Paladin to test this on, so it's up to you guys :)
1.8.0 - Since Blizz have been kind enough to include the shield strength in the combat log for Priest shields, this version now reads that value
      - other classes shield strength is still determined using tooltips so a fix is also included in case the user has beginner tooltips switched on
      - support for Mage Shield in the Russian client added (thanks Khom), other translations still needed.
1.7.3 - more fixes to talent detection that were causing error messages
1.7.2 - added Mage Shield (thanks to grimmier)
      - fix for PW:S bug as a result of talent tree changes
1.7.1 - fix for mouse button click handler
1.7.0 - Compatibility fix for WoW 4.0.1 - IMPORTANT NOTE - this is a fix for small changes in the WoW API ONLY - It does not address any changes in shield mechanics or any problems that may have been caused by tooltip changes.
1.6.1 - Small fix to Russian locale for Power word: shield
1.6.0 - ToC updated for WoW 3.3, cap of 10k added on Divine Aegis shield
1.5.0 - Updated for WoW 3.2 - localisation patches incorporated
1.4.6 - Paladin sacred shield added into Korean locale, fix to different duration on sacred shield depending on talents (Thanks Metalchoir).
1.4.5 - Fix to pattern matching for voidwalker shield
1.4.4 - Changed the way talents / glyphs are checked since the Blizz functions do not return the right info immediately after zoning into an instance/bg. Checks are now done the first time you cast any shield spell in any particular instance.
1.4.3 - Urgent fix to problem that could cause Shieldmonitor to hang the UI under certain conditions
1.4.2 - Spanish localisation added
      - attempts to clear existing buffs on entering arena
      - fixed bug where tooltips are different during the preparation phase of arena/bg (mana line is not shown) therefore were not being read correctly.
1.4.1 - A few small fixes to Ice Barrier. Now checking for correct glyph id, glyph bonus calculation changed, French tooltip pattern updated. 
1.4.0 - Added paladin Sacred Shield spell. I've been able to localise the spell name for the German, French and Russian clients thanks to Wowhead but other localisations still need transalation. The priority of this shield with regard to other shields still needs checking.
      - Added code to (hopefully) handle stacking of Divine Aegis shields.
      - Fixed Divine Aegis spelling for German client.
1.3.0 - Updated for WoW version 3.1
      - version numbering changed to format <major>.<minor>.<release>, changes to the <release> number will mean that there are only bug fixes/localisation updates. Feature changes will be reflected in a change to the <major> or <minor> number
      - priest talent checks updated to reflect the revised trees
      - check for Mage Glyph of Ice Barrier added.
      - also includes a small non-shield related function for hunters to announce their misdirect. Why? I have a hunter and wanted this and as it only took a few lines I couldn't be bothered to write a complete new addon. By default the feature is switched off. Activate it with the command
      /sm mdchannel <channel>  where <channel> is any valid chat channel such as SAY, PARTY, RAID, etc then you will get an announcement in that channel whenever you successfully cast a misdirect. use OFF to turn off the feature again.
       


1.20 - small fix to zhTW locale.
1.19 - Chinese (zhCN and zhTW) locales added
1.18 - Korean locale added
     - warlock Shadow Ward spell now monitored (thanks to Metalchoir for pointing out that spell)
1.17 - French locale added
1.16 - Russian locale added (note the lua file is now in UTF-8 format to accomodate the Russian character set).
1.15 - German locale added
1.14 - Small fix to trap bad arguments to the slash commands
1.13 - Added options to warn you when the shield goes below a specified time or percent left (initial warning defaults are 3sec and 20%). The corresponding text element will flash as will (optionally) the frame border. These new options and the existing options can be configured through the Blizzard Interface options screen, where Shieldmonitor now has its own panel. You can directly access this panel via /shieldmonitor options, or the right-click menu new item 'Options'.
     - added /sm as a shortcut for /shieldmonitor
1.12 - Divine Aegis is now monitored.
     - Talents affecting the maximum value of PW:S are now taken into account. However note that with both Divine Aegis and PW:S the maximum value is unlikely to be accurate if cast on you by another player. This is because my addon doesn't have access to the other player's talents and spellpower through the API.
     - A few slash commands have been implemented
          /shieldmonitor scale <num> (where <num is between 0.3 and 3) scales the shieldmonitor window. This setting is saved per character. Using a value of 1 will reset the window to the design size.
          /shieldmonitor disable - disables shieldmonitor for the remainder of the current session, or until re-enabled or a reloadui is performed. The disable function is also available via the right-click menu.
          /shieldmonitor enable - re-enables shieldmonitor if disabled.
        
1.10 - Now handles multiple shields up at once. The status bar always shows the 'outermost' shield (i.e. the one first in line to take damage). If this shield is removed and another one is still active the bar will change to show that. Similarly if a shield with a higher priority is cast the bar again changes to show the new shield. This means that the status bar is almost always showing the shield that is taking damage. The only exception to this is if a mage has both an elemental (fire/frost ward) up and mana shield, and takes damage that cannot be absorbed by the elemental shield. In this case the mana shield will take the damage, but the status bar will continue to show the elemental shield. Internally the addon will keep track of the level of the mana shield and it will be displayed at the correct level if the elemental shield is lost. This version also introduces a small icon on the left of the status window to indicate which shield is being displayed, as well as using different coloured status bars for the different shields.

1.05 - Now correctly detects environmental damage absorbed by a shield. Also most shields get a benefit from the player's current spell bonus. This isn't shown in the tooltip and therefore the addon was previously showing a too low value for these shields. As far as I can tell the extra to these shields is 80.5% of the appropriate spell bonus (holy,fire, frost etc). 80.5% seems a bit of a strange number and may not be quite accurate, but it's the best I could come up with testing on my poorly geared mage and priest.

1.04 - Initial public release

Description
===========
Since Patch 3.0, the combat log has shown exact figures for damage absorbed by shields such as 'Power Word: Shield'. Shieldmonitor is a lightweight addon that takes advantage of that fact to provide feedback on precisely how much more damage a shield can sustain before it fails. It does this by means of a small window that shows a bar with the percentage and damage absorption of the shield remaining as well as the time the shield buff has left.

Usage
=====
This addon is pretty much install and go. There will be nothing to see until a shield is cast on you (by yourself or someone else). At that point the status window appears, initially in the centre of the screen. Left-click and drag the window to where you'd like it to be. Right click on the window to pop-up a menu with options 'Lock Window' and 'disable' and 'Options'. If you disable Shieldmonitor via the menu, then you either have to use the slash command /shieldmonitor enable or the options screen to re-enable it. Note that Shieldmonitor's window disappears as soon as the shield is exhausted, dispelled or the shield buff times out.

Shields currently monitored are:

Priest - Power Word: Shield, Divine Aegis
Mage - Ice Barrier, Mana Shield, Fire Ward, Frost Ward
Paladin - Sacred Shield, Guarded by the Light
Warlock - Voidwalker Sacrifice, Shadow Ward
Herbalists -  Fel Blossom (note this provides a shield that has a min and max damage absorption. For the purposes of monitoring, the most optimistic value is taken, however Shieldmonitor will close its window as soon as the shield fails.)

Limitations
===========
The maximum value of a Power Word: Shield or Divine Aegis cast on you by another player will probably be inaccurate, since the shield will benefit from the casting player's spell bonus and talents and this is not available via the API, only your own spell bonus/talents. (that is unless someone can point me to a way to find it out - GetSpellBonusDamage is self only).

There are no configuration options for the style of the window other than the scaling. If you don't like it, feel free to play around with the xml file, everything that controls its appearance is in there.

Localisation
============
The addon will work for the English, German, French, Spanish, Korean, Chinese (zhCN and zhTW) and Russian clients at present, if any player from a non-supported locale wants to help, then you can see what needs to be done by looking at the already added German (deDE) locale block in the lua file. Only the spellnames and the TIPREAD entries are essential for making the addon work, other texts are just for completeness.

Bugs
====
Due to the complexity of testing various shield combinations at the same time, the priority of the shields with respect to each other might not yet be correct. Any testing info always welcome!