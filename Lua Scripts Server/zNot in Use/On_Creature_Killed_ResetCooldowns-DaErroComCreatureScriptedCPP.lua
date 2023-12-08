-- nao usar, atualmente ta removendo o script de raids (marrowgar nao usa nenhuma skill, etc)
-- tentar criar um module disso?

--[[
local creatures_entry = {31144} -- training dummy

-- wotlk raids
local bosses_rubysanctum = {39747, 39751, 39746, 39863, 40142} -- saviana ragefire, baltharus, general zarithrian, halion, halion (dentro e fora?)
local bosses_icc = {36612, 36855, 37813, 36626, 36627, 36678, 37970, 37972, 37973, 37955, 36853, 36597} -- marrow, lady, [falta 2 gunships], saurfang, fester, rotface, professor p, 3 prince, blood-queen, [valkyr?], sindragosa, the lich king. - val = cpp
local bosses_toc = {34797, 34780, 34497, 34496, 34564} -- icehowl, jaraxxus, fjola lightbane, eydis darkbane, anub'arak.   - Faction Champion's = cpp
local bosses_onyxia = {10184} -- onyxia
--local bosses_ulduar = { } -- flame leviathan, ignis, razorscale, xt-002, iron council, kologarn, algalon, auriaya, hodir, thorim, freya, mimiron, general vezaxz, yogg-saron
--local bosses_naxxramas = { } -- patchwerk, grobbulus, gluth, thaddius, anub'rekhan, grand widow faerl, maexxna, instructor razuvious, gothik, the four horsemen, noth the plaguebringuer, heigan the unclean, loatheb, sapphiron, kelthuzad
local bosses_eyeofeternity = {28859} -- malygos
local bosses_obsidiansanctum = {28860} -- sartharion
local bosses_vaultofarchavon = {31125, 33993, 35013, 38433} -- archavon, emalon, koralon, toravon

--[[
-- tbc:
local bosses_sunwell = { } -- kalecgos, brutallus, felmyst, eredar twins, m'uru, kil jaeden
local bosses_blacktemple = { } -- high warlord naj', supremus, shade of akama, teron gorefiend, gurtogg, essence of souls, mother shahraz, illidary council, illidan stomrage
local bosses_hyjal = { } -- rage winter, anetheron, kaz'rogal, azgalor, archimonde
local bosses_zulaman = { } -- nalorakk, akil'zon, jan'alai, halazzi, hex lord malacrass, zul'jin
local bosses_theeye = { } -- al'ar, void reaver, high astromancer, kael'thas
local bosses_serpentshrinecavern = { } -- hydross, the lurker below, leotheras, fathom-lord, morogrim, lady vashj
local bosses_karazhan = { } -- attumen, moroes, maiden of virt, opera event, curator, terestian illhoof, shade of aran, netherspite, nightbane, prince malchezar, chess event
local bosses_gruullair = { } -- high king maulgar, gruul the drag
local bosses_magtheridonlair = { } -- magtheridom

-- vanilla:
local bosses_blackwinglair = { } -- razorgore, vaelastrasz, broodlord lash, firemaw, ebonroc, flamegor, chromaggus, nefarian
local bosses_zulgurub = { } -- high priestress jeklik, high priest venoxis, high priestess mar'li, broodlord mandokir, gahz'ranka, high priest thekal, high priestess arlokk, jin'do the hexxer, hakkar
local bosses_ahnqiraj = { } -- the prophet skeram, the bug family, battleguard sartura, fankriss, viscidus, princess huhuran, twin emperors, ouro, c'thun
local bosses_moltencore = { } -- lucifron, magmadar, gehennas, garr, shazzrah, baron gedd, golemagg, sulfuron, majordomo, ragnaros
--

for _, entry in ipairs(bosses_rubysanctum) do
    table.insert(creatures_entry, entry)
end

for _, entry in ipairs(bosses_icc) do
    table.insert(creatures_entry, entry)
end

for _, entry in ipairs(bosses_toc) do
    table.insert(creatures_entry, entry)
end

for _, entry in ipairs(bosses_onyxia) do
    table.insert(creatures_entry, entry)
end

for _, entry in ipairs(bosses_eyeofeternity) do
    table.insert(creatures_entry, entry)
end

for _, entry in ipairs(bosses_obsidiansanctum) do
    table.insert(creatures_entry, entry)
end

for _, entry in ipairs(bosses_vaultofarchavon) do
    table.insert(creatures_entry, entry)
end

local function ResetPlayerCooldowns(player)
    player:ResetAllCooldowns() -- pra resetar do pet tambem precisa mudar no eluna PlayerMethods.h "RemoveAllSpellCooldown" para "ResetPlayerCDonDeath" - é um void custom
    player:RemoveAura(57724) -- Sated
    player:RemoveAura(57723) -- Exhaustion
    player:RemoveAura(41425) -- Hipothermia
	player:RemoveAura(66233) -- Ardent Defender
    player:RemoveAura(25771) -- Forbearance
	player:RemoveAura(61987) -- Avenging Wrath Marker
	player:RemoveAura(79503) -- Custom - Reincarnation
	player:RemoveAura(79500) -- Custom - Cheated Death
	player:RemoveAura(79502) -- Custom - Nature's Guardian
	player:RemoveAura(79501) -- Custom - Forbearance
	
    local petguid = player:GetPetGUID()
    if (petguid) then
        local pet = player:GetMap():GetWorldObject(petguid)
        if (pet) then
            pet:RemoveAura(57723)
			pet:RemoveAura(57724)
        end
    end
	
end

local function ResetNearbyPlayersCooldowns(player)
    local playersInRange = player:GetPlayersInRange(250) -- Pega todos os jogadores em um raio de 250 jardas
    for _, nearbyPlayer in pairs(playersInRange) do
        ResetPlayerCooldowns(nearbyPlayer)
    end
end

local function CreatureOnDeath(event, creature, killer)
    if killer:IsPlayer() then
        --print("CreatureOnDeath called")
        ResetPlayerCooldowns(killer)
        ResetNearbyPlayersCooldowns(killer)
	-- Pet has killed the creature
    else
        --print("CreatureOnDeath Fail called")
        ResetNearbyPlayersCooldowns(killer)
    end
end


for _, entry in pairs(creatures_entry) do
    RegisterCreatureEvent(entry, 4, CreatureOnDeath)
end

--]]