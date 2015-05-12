-------------------------------------------------------------------------------------------------------------------
-- alt+F8 cycles through fighting mode (pet only or duo)
--
-- General Gearswap Commands:
-- F12 will list your current options.
-------------------------------------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------------------------------------
-- Initialization function that defines sets and variables to be used.
-------------------------------------------------------------------------------------------------------------------

-- IMPORTANT: Make sure to also get the Mote-Include.lua file (and its supplementary files) to go with this.

-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2

	-- Load and initialize the include file.
	include('Mote-Include.lua')
end

function job_setup()
	state.Buff['Killer Instinct'] = buffactive['Killer Instinct'] or false
	state.Buff.Doomed = buffactive.doomed or false

	get_combat_form()
end

function user_setup()
        -- 'Out of Range' distance; WS will auto-cancel
        target_distance = 6

        state.FightingMode = M{['description']='Pet Only', 'Duo'}
        send_command('bind !f8 gs c cycle FightingMode')

	--Binds F10 to update player gear.
	send_command('bind f10 gs c update')

-- Complete list of Ready moves to use with Sic & Ready Recast -5 Desultor Tassets.
ready_moves_to_check = S{'Sic','Whirl Claws','Dust Cloud','Foot Kick','Sheep Song','Sheep Charge','Lamb Chop',
	'Rage','Head Butt','Scream','Dream Flower','Wild Oats','Leaf Dagger','Claw Cyclone','Razor Fang',
	'Roar','Gloeosuccus','Palsy Pollen','Soporific','Cursed Sphere','Venom','Geist Wall','Toxic Spit',
	'Numbing Noise','Nimble Snap','Cyclotail','Spoil','Rhino Guard','Rhino Attack','Power Attack',
	'Hi-Freq Field','Sandpit','Sandblast','Venom Spray','Mandibular Bite','Metallic Body','Bubble Shower',
	'Bubble Curtain','Scissor Guard','Big Scissors','Grapple','Spinning Top','Double Claw','Filamented Hold',
	'Frog Kick','Queasyshroom','Silence Gas','Numbshroom','Spore','Dark Spore','Shakeshroom','Blockhead',
	'Secretion','Fireball','Tail Blow','Plague Breath','Brain Crush','Infrasonics','??? Needles',
	'Needleshot','Chaotic Eye','Blaster','Scythe Tail','Ripper Fang','Chomp Rush','Intimidate','Recoil Dive',
	'Water Wall','Snow Cloud','Wild Carrot','Sudden Lunge','Spiral Spin','Noisome Powder','Wing Slap',
	'Beak Lunge','Suction','Drainkiss','Acid Mist','TP Drainkiss','Back Heel','Jettatura','Choke Breath',
	'Fantod','Charged Whisker','Purulent Ooze','Corrosive Ooze','Tortoise Stomp','Harden Shell','Aqua Breath',
	'Sensilla Blades','Tegmina Buffet','Molting Plumage','Swooping Frenzy','Pentapeck','Sweeping Gouge',
	'Zealous Snort','Somersault ','Tickling Tendrils','Stink Bomb','Nectarous Deluge','Nepenthic Plunge',
        'Pecking Flurry','Pestilent Plume','Foul Waters','Spider Web','Sickle Slash'}

-- List of Magic-based Ready moves to use with Pet MAB or Pet M.Acc gearset.
magic_ready_moves = S{'Dust Cloud','Sheep Song','Scream','Dream Flower','Roar','Gloeosuccus','Palsy Pollen',
        'Soporific','Cursed Sphere','Venom','Geist Wall','Toxic Spit','Numbing Noise','Spoil','Hi-Freq Field',
        'Sandpit','Sandblast','Venom Spray','Bubble Shower','Filamented Hold','Queasyshroom','Silence Gas',
        'Numbshroom','Spore','Dark Spore','Shakeshroom','Fireball','Plague Breath','Infrasonics','Chaotic Eye',
        'Blaster','Intimidate','Snow Cloud','Noisome Powder','TP Drainkiss','Jettatura','Charged Whisker',
        'Purulent Ooze','Corrosive Ooze','Aqua Breath','Molting Plumage','Stink Bomb','Nectarous Deluge',
        'Nepenthic Plunge','Pestilent Plume','Foul Waters','Spider Web'}

-- List of abilities to reference for applying Treasure Hunter +1 via Chaac Belt.
abilities_to_check = S{'Feral Howl','Quickstep','Box Step','Stutter Step','Desperate Flourish','Violent Flourish',
	'Animated Flourish','Provoke','Dia','Dia II','Flash','Bio','Bio II','Sleep','Sleep II',
	'Drain','Aspir','Dispel','Steal','Mug'}
end

function file_unload()
	if binds_on_unload then
		binds_on_unload()
	end

	-- Unbinds the Jug Pet, Reward, Correlation, Treasure, PetMode, MDEF Mode hotkeys.
	send_command('unbind !f8')
	send_command('unbind f10')  
end

-- BST gearsets
function init_gear_sets()
	-- PRECAST SETS
        sets.precast.JA['Killer Instinct'] = {head="Ankusa Helm +1"}
	sets.precast.JA['Bestial Loyalty'] = {hands="Mst. Gloves +2"}
	sets.precast.JA['Call Beast'] = sets.precast.JA['Bestial Loyalty']
        sets.precast.JA.Familiar = {legs="Ankusa Trousers +1"}
	sets.precast.JA.Tame = {head="Totemic Helm +1",ear1="Tamer's Earring",legs="Stout Kecks"}
	sets.precast.JA.Spur = {feet="Ferine Ocreae +2"}

        sets.precast.JA['Feral Howl'] = {ammo="Plumose Sachet",
		head="Seiokona Beret",neck="Voltsurge Torque",ear1="Gwati Earring",ear2="Enchanter Earring +1",
		body="Ankusa Jackcoat +1",hands="Sombra Mittens +1",ring1="Perception Ring",ring2="Sangoma Ring",
		back="Aput Mantle +1",waist="Salire Belt",legs="Iuitl Tights +1",feet="Scamp's Sollerets"}

	sets.precast.JA.Reward = {main="Zoraal Ja's Axe", sub="Zoraal Ja's Axe",
                head="Stout Bonnet",neck="Aife's Medal",ear1="Ferine Earring",ear2="Lifestorm Earring",
		body="Totemic Jackcoat +1",hands="Ogre Gloves +1",ring1="Leviathan's Ring +1",ring2="Leviathan's Ring +1",
		back="Pastoralist's Mantle",waist="Salire Belt",legs="Ankusa Trousers +1",feet="Mst. Gaiters +2"}

	sets.precast.JA.Charm = {ammo="Tsar's Egg",
		head="Totemic Helm +1",neck="Unmoving Collar +1",ear1="Enchanter's Earring",ear2="Enchanter Earring +1",
		body="Ankusa Jackcoat +1",hands="Ankusa Gloves +1",ring1="Carbuncle's Ring +1",ring2="Carbuncle's Ring +1",
		back="Aisance Mantle +1",waist="Aristo Belt",legs="Ankusa Trousers +1",feet="Ankusa Gaiters +1"}

        -- CURING WALTZ
        sets.precast.Waltz = {ammo="Sonia's Plectrum",
		head="Ighwa Cap",neck="Unmoving Collar +1",ear1="Handler's Earring",ear2="Handler's Earring +1",
		body="Gorney Haubert +1",hands="Umuthi Gloves",ring1="Valseur's Ring",ring2="Asklepian Ring",
		back="Iximulew Cape",waist="Aristo Belt",legs="Osmium Cuisses",feet="Scamp's Sollerets"}
                
        -- HEALING WALTZ
        sets.precast.Waltz['Healing Waltz'] = {}

	-- STEPS
	sets.precast.Step = {ammo="Hasty Pinion +1",
		head="Gavialis Helm",neck="Ej Necklace +1",ear1="Zennaroi Earring",ear2="Heartseeker Earring",
		body="Mes'yohi Haubergeon",hands="Buremte Gloves",ring1="Ramuh's Ring +1",ring2="Ramuh's Ring +1",
		back="Grounded Mantle +1",waist="Olseni Belt",legs="Sombra Tights +1",feet="Ostro Greaves"}

	-- VIOLENT FLOURISH
	sets.precast.Flourish1 = {}
	sets.precast.Flourish1['Violent Flourish'] = {ammo="Plumose Sachet",
		head="Seiokona Beret",neck="Voltsurge Torque",ear1="Gwati Earring",ear2="Enchanter Earring +1",
		body="Ankusa Jackcoat +1",hands="Sombra Mittens +1",ring1="Perception Ring",ring2="Sangoma Ring",
		back="Aput Mantle +1",waist="Salire Belt",legs="Iuitl Tights +1",feet="Scamp's Sollerets"}

        sets.precast.FC = {ammo="Impatiens",neck="Orunmila's Torque",ear1="Loquacious Earring",
                ear2="Enchanter Earring +1",hands="Sombra Mittens +1",ring1="Prolix Ring"}
        sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads"})

        -- MIDCAST SETS
        sets.midcast.FastRecast = {
                head="Iuitl Headgear +1",neck="Orunmila's Torque",ear1="Loquacious Earring",ear2="Enchanter Earring +1",
                body="Ankusa Jackcoat +1",hands="Sombra Mittens +1",ring1="Prolix Ring",ring2="Defending Ring",
                back="Mollusca Mantle",waist="Hurch'lan Sash",legs="Iuitl Tights +1",feet="Iuitl Gaiters +1"}
 
        sets.midcast.Utsusemi = sets.midcast.FastRecast

	sets.midcast.Cure = {ammo="Quartz Tathlum +1",
		head="Ighwa Cap",neck="Phalaina Locket",ear1="Lifestorm Earring",ear2="Neptune's Pearl",
		body="Savas Jawshan",hands="Buremte Gloves",ring1="Leviathan's Ring +1",ring2="Asklepian Ring",
		back="Pastoralist's Mantle",waist="Chuq'aba Belt",legs="Osmium Cuisses",feet="Whirlpool Greaves"}

	sets.midcast.Curaga = sets.midcast.Cure

	sets.midcast.Stoneskin = {ammo="Quartz Tathlum +1",
		head="Totemic Helm +1",neck="Stone Gorget",ear1="Earthcry Earring",ear2="Lifestorm Earring",
		body="Totemic Jackcoat +1",hands="Stone Mufflers",ring1="Leviathan's Ring +1",ring2="Leviathan's Ring +1",
		back="Pastoralist's Mantle",waist="Salire Belt",legs="Haven Hose",feet="Whirlpool Greaves"}

	sets.midcast.Cursna = set_combine(sets.midcast.FastRecast, {neck="Debilis Medallion",
		ring1="Eshmun's Ring",ring2="Haoma's Ring"})

	sets.midcast.Protect = {ring2="Sheltered Ring"}
	sets.midcast.Protectra = sets.midcast.Protect

	sets.midcast.Shell = {ring2="Sheltered Ring"}
	sets.midcast.Shellra = sets.midcast.Shell

	sets.midcast['Enfeebling Magic'] = {ammo="Plumose Sachet",
		head="Seiokona Beret",neck="Voltsurge Torque",ear1="Gwati Earring",ear2="Enchanter Earring +1",
		body="Ankusa Jackcoat +1",hands="Sombra Mittens +1",ring1="Perception Ring",ring2="Sangoma Ring",
		back="Aput Mantle +1",waist="Salire Belt",legs="Iuitl Tights +1",feet="Scamp's Sollerets"}

	sets.midcast['Elemental Magic'] = sets.midcast['Enfeebling Magic']

        -- WEAPONSKILLS
        -- Default weaponskill sets.
	sets.precast.WS = {ammo="Cheruski Needle",
		head="Otomi Helm",neck="Asperity Necklace",ear1="Kokou's Earring",ear2="Brutal Earring",
		body="Sombra Harness +1",hands="Boor Bracelets",ring1="Ifrit's Ring +1",ring2="Epona's Ring",
		back="Buquwik Cape",waist="Windbuffet Belt +1",legs="Zoar Subligar +1",feet="Gigantes Boots +1"}

	sets.precast.WS.WSMedAcc = {ammo="Ginsen",
		head="Yaoyotl Helm",neck="Ej Necklace +1",ear1="Steelflash Earring",ear2="Bladeborn Earring",
		body="Mes'yohi Haubergeon",hands="Buremte Gloves",ring1="Ifrit's Ring +1",ring2="Ramuh's Ring +1",
		back="Letalis Mantle",waist="Anguinus Belt",legs="Zoar Subligar +1",feet="Ejekamal Boots"}

	sets.precast.WS.WSHighAcc = {ammo="Ginsen",
		head="Yaoyotl Helm",neck="Ej Necklace +1",ear1="Steelflash Earring",ear2="Bladeborn Earring",
		body="Mes'yohi Haubergeon",hands="Buremte Gloves",ring1="Mars's Ring",ring2="Ramuh's Ring +1",
		back="Letalis Mantle",waist="Olseni Belt",legs="Mikinaak Cuisses",feet="Ejekamal Boots"}

        -- Specific weaponskill sets.
        sets.precast.WS['Ruinator'] = set_combine(sets.precast.WS, {neck="Breeze Gorget",waist="Breeze Belt"})
	sets.precast.WS['Ruinator'].Mekira = set_combine(sets.precast.WS['Ruinator'], {head="Gavialis Helm"})
        sets.precast.WS['Ruinator'].WSMedAcc = set_combine(sets.precast.WS.WSMedAcc, {neck="Breeze Gorget",waist="Breeze Belt"})
        sets.precast.WS['Ruinator'].WSHighAcc = set_combine(sets.precast.WS.WSHighAcc, {neck="Breeze Gorget",waist="Breeze Belt"})

        sets.precast.WS['Onslaught'] = set_combine(sets.precast.WS, {ammo="Floestone",
                neck="Justiciar's Torque",ear1="Tati Earring +1",ear2="Brutal Earring",
		body="Mes'yohi Haubergeon",hands="Nomkahpa Mittens +1",ring1="Ramuh Ring +1",
                back="Vespid Mantle",legs="Mikinaak Cuisses",feet="Vanir Boots"})
        sets.precast.WS['Onslaught'].WSMedAcc = set_combine(sets.precast.WSMedAcc, {hands="Buremte Gloves",ring1="Ramuh Ring +1"})
        sets.precast.WS['Onslaught'].WSHighAcc = set_combine(sets.precast.WSHighAcc, {hands="Buremte Gloves"})

	sets.precast.WS['Primal Rend'] = {ammo="Erlene's Notebook",
		head="Highwing Helm",neck="Stoicheion Medal",ear1="Crematio Earring",ear2="Friomisi Earring",
		body="Sombra Harness +1",hands="Nilas Gloves",ring1="Acumen Ring",ring2="Fenrir Ring +1",
		back="Argochampsa Mantle",waist="Salire Belt",legs="Augury Cuisses +1",feet="Sombra Leggings +1"}

	sets.precast.WS['Cloudsplitter'] = set_combine(sets.precast.WS['Primal Rend'], {waist="Thunder Belt"})

	-- PET SIC & READY MOVES
	sets.midcast.Pet.WS = {main="Kumbhakarna", sub="Izizoeksi", ammo="Demonry Core",
	        head="Acro Helm",
		neck="Ferine Necklace",ear1="Sabong Earring",ear2="Domesticator's Earring",
		body="Mirke Wardecors",hands="Regimen Mittens",ring1="Angel's Ring",ring2="Angel's Ring",
		back="Pastoralist's Mantle",waist="Hurch'lan Sash",legs="Desultor Tassets",feet="Totemic Gaiters +1"}

        sets.midcast.Pet.MagicReady = set_combine(sets.midcast.Pet.WS, {
                ear1="Diamond Earring",ear2="Diamond Earring",
                hands="Regimen Mittens",
                back="Argochampsa Mantle"})

	sets.midcast.Pet.Neutral = {head="Totemic Helm +1"}
	sets.midcast.Pet.Favorable = {head="Ferine Cabasset +2"}
	sets.midcast.Pet.TPBonus = {hands="Ferine Manoplas +2"}
	sets.midcast.Pet.ReadyRecast = {main="Kumbhakarna", sub="Charmer's Merlin",legs="Desultor Tassets"}

        -- RESTING
        sets.resting = {}
        
        -- IDLE SETS
	sets.ExtraRegen = {waist="Muscle Belt +1"}
	sets.WaterRegen = {ear2="Hibernation Earring"}

        sets.idle = {main="Kumbhakarna", sub="Izizoeksi", ammo="Demonry Core",
		head="Anwig Salade",neck="Ferine Necklace",ear1="Sabong Earring",ear2="Ferine Earring",
		body="Acro Surcoat",hands="Acro Gauntlets",ring1="Dark Ring",ring2="Patricius Ring",
		back="Pastoralist's Mantle",waist="Hurch'lan Sash",legs="Ferine Quijotes +2",feet="Acro Leggings"}

        sets.idle.Refresh = set_combine(sets.idle, {head="Wivre Hairpin",body="Twilight Mail",hands="Ogier's Gauntlets",
                legs="Stearc Subligar",feet="Ogier's Leggings"})
	sets.idle.Reraise = set_combine(sets.idle, {head="Twilight Helm",body="Twilight Mail"})

	sets.idle.Pet = set_combine(sets.idle, {ammo="Demonry Core",
		head="Anwig Salade",neck="Ferine Necklace",ear1="Sabong Earring",ear2="Ferine Earring",
		body="Acro Surcoat",hands="Acro Gauntlets",ring1="Dark Ring",ring2="Patricius Ring",
		back="Pastoralist's Mantle",waist="Hurch'lan Sash",legs="Ferine Quijotes +2",feet="Acro Leggings"})

	sets.idle.Pet.Engaged = {ammo="Demonry Core",
		head="Anwig Salade",neck="Ferine Necklace",ear1="Sabong Earring",ear2="Ferine Earring",
		body="Acro Surcoat",hands="Acro Gauntlets",ring1="Dark Ring",ring2="Patricius Ring",
		back="Pastoralist's Mantle",waist="Hurch'lan Sash",legs="Ferine Quijotes +2",feet="Acro Leggings"}
        
        -- DEFENSE SETS
	sets.defense.PDT = {head="Ighwa Cap",neck="Twilight Torque",
		body="Emet Harness +1",hands="Iuitl Wristbands +1",ring1="Dark Ring",ring2="Defending Ring",
		back="Repulse Mantle",waist="Flume Belt +1",legs="Iuitl Tights +1",feet="Iuitl Gaiters +1"}

        sets.defense.PetPDT = {ammo="Demonry Core",
		head="Anwig Salade",neck="Shepherd's Chain",ear1="Handler's Earring",ear2="Handler's Earring +1",
		body="Ankusa Jackcoat +1",hands="Ankusa Gloves +1",ring1="Dark Ring",ring2="Defending Ring",
		back="Oneiros Cappa",waist="Isa Belt",legs="Ferine Quijotes +2",feet="Ankusa Gaiters +1"}

	sets.defense.Killer = set_combine(sets.defense.PDT, {body="Ferine Gausape +2"})
	sets.defense.Reraise = set_combine(sets.defense.PDT, {head="Twilight Helm",body="Twilight Mail"})

	sets.defense.MDT = set_combine(sets.defense.PDT, {ammo="Vanir Battery",
		head="Iuitl Headgear +1",ear1="Merman's Earring",ear2="Sanare Earring",
		body="Savas Jawshan",
		back="Engulfer's Cape +1",waist="Nierenschutz"})

	sets.defense.MDTShell = set_combine(sets.defense.MDT, {neck="Inquisitor Bead Necklace",ear1="Flashward Earring",
		body="Iuitl Vest +1",ring1="Shadow Ring",
		back="Engulfer Cape +1",waist="Resolute Belt",legs="Sombra Tights +1",feet="Durgai Leggings"})

	sets.defense.MKiller = set_combine(sets.defense.MDT, {body="Ferine Gausape +2"})

	sets.Kiting = {feet="Skadi's Jambeaux +1"}

        -- MELEE (SINGLE-WIELD) SETS
        sets.engaged = {ammo="Ginsen",
		head="Otomi Helm",neck="Asperity Necklace",ear1="Steelflash Earring",ear2="Bladeborn Earring",
		body="Sombra Harness +1",hands="Xaddi Gauntlets",ring1="Rajas Ring",ring2="Epona's Ring",
		back="Atheling Mantle",waist="Windbuffet Belt +1",legs="Xaddi Cuisses",feet="Ejekamal Boots"}
        sets.engaged.LowAccHaste = {ammo="Ginsen",
		head="Otomi Helm",neck="Asperity Necklace",ear1="Steelflash Earring",ear2="Bladeborn Earring",
		body="Sombra Harness +1",hands="Xaddi Gauntlets",ring1="Rajas Ring",ring2="Epona's Ring",
		back="Atheling Mantle",waist="Windbuffet Belt +1",legs="Xaddi Cuisses",feet="Ejekamal Boots"}
        sets.engaged.MedAcc = {ammo="Paeapua",
		head="Yaoyotl Helm",neck="Ej Necklace +1",ear1="Steelflash Earring",ear2="Bladeborn Earring",
		body="Sombra Harness +1",hands="Buremte Gloves",ring1="Rajas Ring",ring2="Epona's Ring",
		back="Letalis Mantle",waist="Hurch'lan Sash",legs="Xaddi Cuisses",feet="Ejekamal Boots"}
        sets.engaged.MedAccHaste = {ammo="Paeapua",
		head="Yaoyotl Helm",neck="Ej Necklace +1",ear1="Steelflash Earring",ear2="Bladeborn Earring",
		body="Sombra Harness +1",hands="Buremte Gloves",ring1="Rajas Ring",ring2="Epona's Ring",
		back="Letalis Mantle",waist="Hurch'lan Sash",legs="Xaddi Cuisses",feet="Ejekamal Boots"}
	sets.engaged.HighAcc = {ammo="Jukukik Feather",
		head="Yaoyotl Helm",neck="Ej Necklace +1",ear1="Steelflash Earring",ear2="Bladeborn Earring",
		body="Mes'yohi Haubergeon",hands="Buremte Gloves",ring1="Mars's Ring",ring2="Ramuh's Ring +1",
		back="Grounded Mantle +1",waist="Olseni Belt",legs="Xaddi Cuisses",feet="Ejekamal Boots"}
	sets.engaged.HighAccHaste = {ammo="Jukukik Feather",
		head="Yaoyotl Helm",neck="Ej Necklace +1",ear1="Steelflash Earring",ear2="Bladeborn Earring",
		body="Mes'yohi Haubergeon",hands="Buremte Gloves",ring1="Mars's Ring",ring2="Ramuh's Ring +1",
		back="Grounded Mantle +1",waist="Olseni Belt",legs="Xaddi Cuisses",feet="Ejekamal Boots"}
	-- MELEE (SINGLE-WIELD) HYBRID SETS
        sets.engaged.Hybrid = set_combine(sets.engaged, {head="Iuitl Headgear +1",body="Iuitl Vest +1",
		back="Mollusca Mantle",hands="Iuitl Wristbands +1",legs="Iuitl Tights +1",feet="Iuitl Gaiters +1"})
        sets.engaged.LowAccHaste.Hybrid = set_combine(sets.engaged.LowAccHaste, {head="Iuitl Headgear +1",body="Iuitl Vest +1",
		back="Mollusca Mantle",hands="Iuitl Wristbands +1",legs="Iuitl Tights +1",feet="Iuitl Gaiters +1"})
        sets.engaged.MedAcc.Hybrid = set_combine(sets.engaged.MedAcc, {head="Iuitl Headgear +1",
		body="Iuitl Vest +1",legs="Iuitl Tights +1",feet="Iuitl Gaiters +1"})
        sets.engaged.MedAccHaste.Hybrid = set_combine(sets.engaged.MedAccHaste, {head="Iuitl Headgear +1",
		body="Iuitl Vest +1",legs="Iuitl Tights +1",feet="Iuitl Gaiters +1"})
	sets.engaged.HighAcc.Hybrid = set_combine(sets.engaged.HighAcc, {legs="Iuitl Tights +1",feet="Iuitl Gaiters +1"})
	sets.engaged.HighAccHaste.Hybrid = set_combine(sets.engaged.HighAccHaste, {legs="Iuitl Tights +1",feet="Iuitl Gaiters +1"})

        -- MELEE (DUAL-WIELD) SETS FOR DNC AND NIN SUBJOB
        sets.engaged.DW = {ammo="Ginsen",
		head="Otomi Helm",neck="Asperity Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
		body="Skadi's Cuirie +1",hands="Nomkahpa Mittens +1",ring1="Rajas Ring",ring2="Epona's Ring",
		back="Vellaunus' Mantle +1",waist="Patentia Sash",legs="Sombra Tights +1",feet="Ejekamal Boots"}
        sets.engaged.DW.LowAccHaste = {ammo="Ginsen",
		head="Otomi Helm",neck="Asperity Necklace",ear1="Suppanomimi",ear2="Brutal Earring",
		body="Skadi's Cuirie +1",hands="Nomkahpa Mittens +1",ring1="Rajas Ring",ring2="Epona's Ring",
		back="Bleating Mantle",waist="Windbuffet Belt +1",legs="Xaddi Cuisses",feet="Xaddi Boots"}
        sets.engaged.DW.MedAcc = {ammo="Ginsen",
		head="Yaoyotl Helm",neck="Ej Necklace +1",ear1="Heartseeker Earring",ear2="Dudgeon Earring",
		body="Mes'yohi Haubergeon",hands="Buremte Gloves",ring1="Mars's Ring",ring2="Epona's Ring",
		back="Letalis Mantle",waist="Hurch'lan Sash",legs="Sombra Tights +1",feet="Ejekamal Boots"}
        sets.engaged.DW.MedAccHaste = {ammo="Ginsen",
		head="Yaoyotl Helm",neck="Ej Necklace +1",ear1="Suppanomimi",ear2="Brutal Earring",
		body="Mes'yohi Haubergeon",hands="Buremte Gloves",ring1="Mars's Ring",ring2="Epona's Ring",
		back="Letalis Mantle",waist="Hurch'lan Sash",legs="Xaddi Cuisses",feet="Xaddi Boots"}
	sets.engaged.DW.HighAcc = {ammo="Ginsen",
		head="Yaoyotl Helm",neck="Ej Necklace +1",ear1="Heartseeker Earring",ear2="Dudgeon Earring",
		body="Mes'yohi Haubergeon",hands="Buremte Gloves",ring1="Mars's Ring",ring2="Ramuh's Ring +1",
		back="Grounded Mantle +1",waist="Olseni Belt",legs="Sombra Tights +1",feet="Ejekamal Boots"}
	sets.engaged.DW.HighAccHaste = {ammo="Ginsen",
		head="Yaoyotl Helm",neck="Ej Necklace +1",ear1="Heartseeker Earring",ear2="Dudgeon Earring",
		body="Mes'yohi Haubergeon",hands="Buremte Gloves",ring1="Mars's Ring",ring2="Ramuh's Ring +1",
		back="Grounded Mantle +1",waist="Olseni Belt",legs="Sombra Tights +1",feet="Ejekamal Boots"}
	-- MELEE (DUAL-WIELD) HYBRID SETS
        sets.engaged.DW.Hybrid = set_combine(sets.engaged.DW, {head="Iuitl Headgear +1",body="Iuitl Vest +1",
		back="Mollusca Mantle",hands="Iuitl Wristbands +1",legs="Iuitl Tights +1",feet="Iuitl Gaiters +1"})
        sets.engaged.DW.LowAccHaste.Hybrid = set_combine(sets.engaged.DW.LowAccHaste, {head="Iuitl Headgear +1",body="Iuitl Vest +1",
		back="Mollusca Mantle",hands="Iuitl Wristbands +1",legs="Iuitl Tights +1",feet="Iuitl Gaiters +1"})
        sets.engaged.DW.MedAcc.Hybrid = set_combine(sets.engaged.DW.MedAcc, {head="Iuitl Headgear +1",
		body="Iuitl Vest +1",legs="Iuitl Tights +1",feet="Iuitl Gaiters +1"})
        sets.engaged.DW.MedAccHaste.Hybrid = set_combine(sets.engaged.DW.MedAccHaste, {head="Iuitl Headgear +1",
		body="Iuitl Vest +1",legs="Iuitl Tights +1",feet="Iuitl Gaiters +1"})
	sets.engaged.DW.HighAcc.Hybrid = set_combine(sets.engaged.DW.HighAcc, {legs="Iuitl Tights +1",feet="Iuitl Gaiters +1"})
	sets.engaged.DW.HighAccHaste.Hybrid = set_combine(sets.engaged.DW.HighAccHaste, {legs="Iuitl Tights +1",feet="Iuitl Gaiters +1"})

	-- GEARSETS FOR MASTER ENGAGED (SINGLE-WIELD) & PET ENGAGED
        sets.engaged.PetStance = set_combine(sets.engaged,
		{head="Anwig Salade",
		body="Ankusa Jackcoat +1",hands="Regimen Mittens",
		waist="Hurch'lan Sash",legs="Wisent Kecks",feet="Armada Sollerets"})
        sets.engaged.PetStance.LowAccHaste = set_combine(sets.engaged.LowAccHaste,
		{head="Anwig Salade",
		body="Ankusa Jackcoat +1",hands="Regimen Mittens",
		waist="Hurch'lan Sash",legs="Wisent Kecks",feet="Armada Sollerets"})
        sets.engaged.PetStance.MedAcc = set_combine(sets.engaged.MedAcc,
		{head="Ankusa Helm +1",
		hands="Regimen Mittens",
		waist="Hurch'lan Sash"})
        sets.engaged.PetStance.MedAccHaste = set_combine(sets.engaged.MedAccHaste,
		{head="Ankusa Helm +1",
		hands="Regimen Mittens",
		waist="Hurch'lan Sash"})
        sets.engaged.PetStance.HighAcc = set_combine(sets.engaged.HighAcc,
		{hands="Regimen Mittens",
		waist="Hurch'lan Sash"})
        sets.engaged.PetStance.HighAccHaste = set_combine(sets.engaged.HighAccHaste,
		{hands="Regimen Mittens",
		waist="Hurch'lan Sash"})

	-- GEARSETS FOR MASTER ENGAGED (SINGLE-WIELD) & PET TANKING
        sets.engaged.PetTank = set_combine(sets.engaged,
		{head="Anwig Salade",neck="Shepherd's Chain",ear1="Handler's Earring",ear2="Handler's Earring +1",
		body="Ankusa Jackcoat +1",hands="Ankusa Gloves +1",
		back="Oneiros Cappa",waist="Isa Belt",legs="Ferine Quijotes +2",feet="Ankusa Gaiters +1"})
        sets.engaged.PetTank.LowAccHaste = set_combine(sets.engaged.LowAccHaste,
		{head="Anwig Salade",neck="Shepherd's Chain",ear1="Handler's Earring",ear2="Handler's Earring +1",
		body="Ankusa Jackcoat +1",hands="Ankusa Gloves +1",
		back="Oneiros Cappa",waist="Isa Belt",legs="Ferine Quijotes +2",feet="Ankusa Gaiters +1"})
        sets.engaged.PetTank.MedAcc = set_combine(sets.engaged.MedAcc,
		{head="Anwig Salade",
		hands="Ankusa Gloves +1",
		back="Oneiros Cappa",legs="Ferine Quijotes +2"})
        sets.engaged.PetTank.MedAccHaste = set_combine(sets.engaged.MedAccHaste,
		{head="Anwig Salade",
		hands="Ankusa Gloves +1",
		back="Oneiros Cappa",legs="Ferine Quijotes +2"})
        sets.engaged.PetTank.HighAcc = set_combine(sets.engaged.HighAcc,
		{head="Anwig Salade",
		hands="Regimen Mittens"})
        sets.engaged.PetTank.HighAccHaste = set_combine(sets.engaged.HighAccHaste,
		{head="Anwig Salade",
		hands="Regimen Mittens"})

	-- GEARSETS FOR MASTER ENGAGED (DUAL-WIELD) & PET ENGAGED
        sets.engaged.DW.PetStance = set_combine(sets.engaged.DW,
		{head="Anwig Salade",
		body="Ankusa Jackcoat +1",hands="Regimen Mittens",
		waist="Hurch'lan Sash",legs="Wisent Kecks",feet="Armada Sollerets"})
        sets.engaged.DW.PetStance.LowAccHaste = set_combine(sets.engaged.DW.LowAccHaste,
		{head="Anwig Salade",
		body="Ankusa Jackcoat +1",hands="Regimen Mittens",
		waist="Hurch'lan Sash",legs="Wisent Kecks",feet="Armada Sollerets"})
        sets.engaged.DW.PetStance.MedAcc = set_combine(sets.engaged.DW.MedAcc,
		{head="Ankusa Helm +1",
		hands="Regimen Mittens",
		waist="Hurch'lan Sash"})
        sets.engaged.DW.PetStance.MedAccHaste = set_combine(sets.engaged.DW.MedAccHaste,
		{head="Ankusa Helm +1",
		hands="Regimen Mittens",
		waist="Hurch'lan Sash"})
        sets.engaged.DW.PetStance.HighAcc = set_combine(sets.engaged.DW.HighAcc,
		{hands="Regimen Mittens",
		waist="Hurch'lan Sash"})
        sets.engaged.DW.PetStance.HighAccHaste = set_combine(sets.engaged.DW.HighAccHaste,
		{hands="Regimen Mittens",
		waist="Hurch'lan Sash"})

	-- GEARSETS FOR MASTER ENGAGED (DUAL-WIELD) & PET TANKING
        sets.engaged.DW.PetTank = set_combine(sets.engaged.DW,
		{head="Anwig Salade",neck="Shepherd's Chain",ear1="Handler's Earring",ear2="Handler's Earring +1",
		body="Ankusa Jackcoat +1",hands="Ankusa Gloves +1",
		back="Oneiros Cappa",waist="Isa Belt",legs="Ferine Quijotes +2",feet="Ankusa Gaiters +1"})
        sets.engaged.DW.PetTank.LowAccHaste = set_combine(sets.engaged.DW.LowAccHaste,
		{head="Anwig Salade",neck="Shepherd's Chain",ear1="Handler's Earring",ear2="Handler's Earring +1",
		body="Ankusa Jackcoat +1",hands="Ankusa Gloves +1",
		back="Oneiros Cappa",waist="Isa Belt",legs="Ferine Quijotes +2",feet="Ankusa Gaiters +1"})
        sets.engaged.DW.PetTank.MedAcc = set_combine(sets.engaged.DW.MedAcc,
		{head="Anwig Salade",
		hands="Ankusa Gloves +1",
		back="Oneiros Cappa",legs="Ferine Quijotes +2"})
        sets.engaged.DW.PetTank.MedAccHaste = set_combine(sets.engaged.DW.MedAccHaste,
		{head="Anwig Salade",
		hands="Ankusa Gloves +1",
		back="Oneiros Cappa",legs="Ferine Quijotes +2"})
        sets.engaged.DW.PetTank.HighAcc = set_combine(sets.engaged.DW.HighAcc,
		{head="Anwig Salade",
		hands="Regimen Mittens"})
        sets.engaged.DW.PetTank.HighAccHaste = set_combine(sets.engaged.DW.HighAccHaste,
		{head="Anwig Salade",
		hands="Regimen Mittens"})

	sets.buff['Killer Instinct'] = {body="Ferine Gausape +2"}
	sets.buff.Doomed = {ring1="Eshmun's Ring"}
	sets.THBelt = {waist="Chaac Belt"}

-------------------------------------------------------------------------------------------------------------------
-- Complete Lvl 76-99 Jug Pet Precast List +Funguar +Courier +Amigo
-------------------------------------------------------------------------------------------------------------------

	sets.precast.JA['Bestial Loyalty'].FunguarFamiliar = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Seedbed Soil"})
	sets.precast.JA['Bestial Loyalty'].CourierCarrie = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Fish Oil Broth"})
	sets.precast.JA['Bestial Loyalty'].AmigoSabotender = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Sun Water"})
	sets.precast.JA['Bestial Loyalty'].NurseryNazuna = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="D. Herbal Broth"})
	sets.precast.JA['Bestial Loyalty'].CraftyClyvonne = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Cng. Brain Broth"})
	sets.precast.JA['Bestial Loyalty'].PrestoJulio = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="C. Grass. Broth"})
	sets.precast.JA['Bestial Loyalty'].SwiftSieghard = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Mlw. Bird Broth"})
	sets.precast.JA['Bestial Loyalty'].MailbusterCetas = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Gob. Bug Broth"})
	sets.precast.JA['Bestial Loyalty'].AudaciousAnna = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="B. Carrion Broth"})
	sets.precast.JA['Bestial Loyalty'].TurbidToloi = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Auroral Broth"})
	sets.precast.JA['Bestial Loyalty'].LuckyLulush = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="L. Carrot Broth"})
	sets.precast.JA['Bestial Loyalty'].DipperYuly = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Wool Grease"})
	sets.precast.JA['Bestial Loyalty'].FlowerpotMerle = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Vermihumus"})
	sets.precast.JA['Bestial Loyalty'].DapperMac = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Briny Broth"})
	sets.precast.JA['Bestial Loyalty'].DiscreetLouise = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Deepbed Soil"})
	sets.precast.JA['Bestial Loyalty'].FatsoFargann = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="C. Plasma Broth"})
	sets.precast.JA['Bestial Loyalty'].FaithfulFalcorr = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Lucky Broth"})
	sets.precast.JA['Bestial Loyalty'].BugeyedBroncha = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Svg. Mole Broth"})
	sets.precast.JA['Bestial Loyalty'].BloodclawShasra = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Rzr. Brain Broth"})
	sets.precast.JA['Bestial Loyalty'].GorefangHobs = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="B. Carrion Broth"})
	sets.precast.JA['Bestial Loyalty'].GooeyGerard = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Cl. Wheat Broth"})
	sets.precast.JA['Bestial Loyalty'].CrudeRaphie = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Shadowy Broth"})

-------------------------------------------------------------------------------------------------------------------
-- Complete iLvl Jug Pet Precast List
-------------------------------------------------------------------------------------------------------------------

	sets.precast.JA['Bestial Loyalty'].DroopyDortwin = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Swirling Broth"})
	sets.precast.JA['Bestial Loyalty'].PonderingPeter = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Vis. Broth"})
	sets.precast.JA['Bestial Loyalty'].SunburstMalfik = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Shimmering Broth"})
	sets.precast.JA['Bestial Loyalty'].AgedAngus = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Ferm. Broth"})
	sets.precast.JA['Bestial Loyalty'].WarlikePatrick = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Livid Broth"})
	sets.precast.JA['Bestial Loyalty'].ScissorlegXerin = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Spicy Broth"})
	sets.precast.JA['Bestial Loyalty'].BouncingBertha = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Bubbly Broth"})
	sets.precast.JA['Bestial Loyalty'].RhymingShizuna = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Lyrical Broth"})
	sets.precast.JA['Bestial Loyalty'].AttentiveIbuki = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Salubrious Broth"})
	sets.precast.JA['Bestial Loyalty'].SwoopingZhivago = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Windy Greens"})
	sets.precast.JA['Bestial Loyalty'].AmiableRoche = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Airy Broth"})
	sets.precast.JA['Bestial Loyalty'].HeraldHenry = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Trans. Broth"})
	sets.precast.JA['Bestial Loyalty'].BrainyWaluis = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Crumbly Soil"})
	sets.precast.JA['Bestial Loyalty'].HeadbreakerKen = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Blackwater Broth"})
	sets.precast.JA['Bestial Loyalty'].RedolentCandi = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Electrified Broth"})
	sets.precast.JA['Bestial Loyalty'].AlluringHoney = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Bug-Ridden Broth"})
	sets.precast.JA['Bestial Loyalty'].CaringKiyomaro = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Fizzy Broth"})
	sets.precast.JA['Bestial Loyalty'].VivaciousVickie = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Tant. Broth"})
	sets.precast.JA['Bestial Loyalty'].HurlerPercival = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Pale Sap"})
	sets.precast.JA['Bestial Loyalty'].BlackbeardRandy = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Meaty Broth"})
	sets.precast.JA['Bestial Loyalty'].GenerousArthur = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Dire Broth"})
	sets.precast.JA['Bestial Loyalty'].ThreestarLynn = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Muddy Broth"})
	sets.precast.JA['Bestial Loyalty'].BraveHeroGlenn = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Wispy Broth"})
	sets.precast.JA['Bestial Loyalty'].SharpwitHermes = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Saline Broth"})
	sets.precast.JA['Bestial Loyalty'].ColibriFamiliar = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Sugary Broth"})
	sets.precast.JA['Bestial Loyalty'].ChoralLeera = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Glazed Broth"})
	sets.precast.JA['Bestial Loyalty'].SpiderFamiliar = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Sticky Webbing"})
	sets.precast.JA['Bestial Loyalty'].GussyHachirobe = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Slimy Webbing"})
	sets.precast.JA['Bestial Loyalty'].AcuexFamiliar = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Poisonous Broth"})
	sets.precast.JA['Bestial Loyalty'].FluffyBredo = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Venomous Broth"})
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks that are called to process player actions at specific points in time.
-------------------------------------------------------------------------------------------------------------------

function job_precast(spell, action, spellMap, eventArgs)
	cancel_conflicting_buffs(spell, action, spellMap, eventArgs)

        if spell.type == "WeaponSkill" and spell.name ~= 'Mistral Axe' and spell.name ~= 'Bora Axe' and spell.target.distance > target_distance then
                cancel_spell()
                add_to_chat(123, spell.name..' Canceled: [Out of Range]')
                return
        end

	if spell.english == 'Reward' then
		equip(sets.precast.JA.Reward)
	end

-- Define class for Sic and Ready moves.
        if ready_moves_to_check:contains(spell.name) and pet.status == 'Engaged' then
                classes.CustomClass = "WS"
		equip(sets.midcast.Pet.ReadyRecast)
        end
end

function job_post_precast(spell, action, spellMap, eventArgs)
-- If Killer Instinct is active during WS, equip Ferine Gausape +2.
	if spell.type:lower() == 'weaponskill' and buffactive['Killer Instinct'] then
                equip(sets.buff['Killer Instinct'])
        end

end

function job_pet_midcast(spell, action, spellMap, eventArgs)
-- Equip monster correlation gear, as appropriate
        equip(sets.midcast.Pet.WS)

        if magic_ready_moves:contains(spell.english) and pet.status == 'Engaged' then
                equip(sets.midcast.Pet.MagicReady)
        end

	-- If Pet TP, before bonuses, is less than a certain value, equip Ferine Manoplas +1 or +2
	if PetJob == 'Warrior' then
                if pet.tp < 200 then
                        equip(sets.midcast.Pet.TPBonus)
                end
        elseif PetJob == 'Paladin' or PetJob == 'Thief' or PetJob == 'Monk' or PetJob == 'Red Mage' or PetJob == 'Black Mage' then
                if pet.tp < 250 then
                        equip(sets.midcast.Pet.TPBonus)
                end
        end
end

-- Return true if we handled the aftercast work.  Otherwise it will fall back
-- to the general aftercast() code in Mote-Include.
function job_aftercast(spell, action, spellMap, eventArgs)

end

-------------------------------------------------------------------------------------------------------------------
-- Customization hook for idle sets.
-------------------------------------------------------------------------------------------------------------------

function customize_idle_set(idleSet)
	if player.hpp < 50 and pet.status ~= 'Engaged' then
		idleSet = set_combine(idleSet, sets.ExtraRegen)
	end
	if world.day_element == 'Water' then
		idleSet = set_combine(idleSet, sets.WaterRegen)
	end
	return idleSet
end

-------------------------------------------------------------------------------------------------------------------
-- Hooks for Reward, Correlation, Treasure Hunter, and Pet Mode handling.
-------------------------------------------------------------------------------------------------------------------

function job_state_change(stateField, newValue, oldValue)
	if stateField == 'Pet Mode' then
                state.CombatWeapon:set(newValue)
        end
end

function get_custom_wsmode(spell, spellMap, default_wsmode)
        if default_wsmode == 'Normal' then
                if spell.english == "Ruinator" and (world.day_element == 'Water' or world.day_element == 'Wind' or world.day_element == 'Ice') then
                        return 'Mekira'
                end
        end
end

-------------------------------------------------------------------------------------------------------------------
-- User code that supplements self-commands.
-------------------------------------------------------------------------------------------------------------------

-- Called any time we attempt to handle automatic gear equips (ie: engaged or idle gear).
function job_handle_equipping_gear(playerStatus, eventArgs)    	
	if player.equipment.back == 'Mecisto. Mantle' or player.equipment.back == 'Aptitude Mantle' or player.equipment.back == 'Aptitude Mantle +1' then
		disable('back')
	else
		enable('back')
	end
end

function status_change(new,old)
  equip(sets.idle) 
end

function self_command(command)
  if command == 'update' then
    status_change(player.status)
    add_to_chat(207,'Update player status...')
  end
end

-- Called by the 'update' self-command, for common needs.
-- Set eventArgs.handled to true if we don't want automatic equipping of gear.
function job_update(cmdParams, eventArgs)
	get_combat_form()
end

-- Set eventArgs.handled to true if we don't want the automatic display to be run.
function display_current_job_state(eventArgs)
    local msg = 'Melee'
    
    if state.CombatForm.has_value then
        msg = msg .. ' (' .. state.CombatForm.value .. ')'
    end
    
    msg = msg .. ': '
    
    if state.Kiting.value then
        msg = msg .. ', Kiting'
    end

    add_to_chat(122, msg)

    eventArgs.handled = true
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

function get_combat_form()
	if player.sub_job == 'NIN' or player.sub_job == 'DNC' then
                state.CombatForm:set('DW')
	else
		state.CombatForm:reset()
        end
end
