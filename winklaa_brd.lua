function get_sets()
	sets.precast = {}
	sets.precast.JA = {}
	
	-- Precast Sets
	sets.precast.JA.Nightingale = {feet="Bihu Slippers+1"}
	sets.precast.JA.Troubadour = {body="Bihu Justaucorps+1"}
	sets.precast.JA['Soul Voice'] = {legs="Bihu Cannions+1"}
	
	sets.precast.FC = {}
	
	sets.precast.FC.Song = { main="Felibre's Dague", sub="Genbu's Shield",
		head="Aoidos' Calot +2", body="Marduk's Jubbah +1", hands="Mdk. Dastanas +1", legs="Gende. Spats +1",
		feet="Bihu Slippers +1", neck="Aoidos' Matinee", waist="Witful Belt", left_ear="Loquac. Earring", right_ear="Enchntr. Earring +1",
		left_ring="Prolix Ring", right_ring="Weather. Ring", back="Swith Cape"}

	sets.precast.FC.Normal = { -- main="Izhiikoh", sub="Genbu's Shield",
		head="Nahtirah Hat", body="Marduk's Jubbah +1", hands="Gende. Gages+1", legs="Artsieq Hose", feet="Chelona Boots",
		neck="Twilight Torque", waist="Witful Belt", left_ear="Loquac. Earring", right_ear="Enchntr. Earring +1", 
		left_ring="Prolix Ring", right_ring="Weather. Ring", back="Swith Cape"}
		
	sets.precast.Cure = { -- main="Izhiikoh", sub="Genbu's Shield",
		head="Nahtirah Hat", body="Marduk's Jubbah +1", hands="Gende. Gages+1", legs="Nabu's Shalwar", feet="Chelona Boots",
		neck="Twilight Torque",  waist="Witful Belt", left_ear="Loquac. Earring", right_ear="Enchntr. Earring +1",
		left_ring="Prolix Ring", right_ring="Weather. Ring",  back="Pahtli Cape"}
	
	sets.precast.WS = {}

	-- Midcast Sets
	sets.midcast = {}
		
	sets.midcast.Haste = { --main="Izhiikoh", sub="Genbu's Shield",
		head="Nahtirah Hat", ear1="Loquac. Earring",
		hands="Gendewitha Gages", ring2="Prolix Ring", back="Rhapsode's Cape"}

	sets.midcast.Debuff = { main="Twebuliij", sub="Mephitis Grip", range="Gjallarhorn",
		head="Bihu Roundlet +1", body="Brioso Just. +1", hands="Bihu Cuffs+1", legs="Brioso Cann. +1", feet="Brioso Slippers +1",
		neck="Aoidos' Matinee", waist="Demonry Sash", left_ear="Psystorm Earring", right_ear="Lifestorm Earring",
		left_ring="Sangoma Ring",  right_ring="Balrahn's Ring",  back="Rhapsode's Cape"}
	
	sets.midcast.Buff = { main="Felibre's Dague", sub="Genbu's Shield",
		head="Bihu Roundlet +1", body="Aoidos' Hngrln. +2", hands="Ad. Mnchtte. +2", legs="Mdk. Shalwar +1", feet="Brioso Slippers +1",
		neck="Aoidos' Matinee", waist="Witful Belt", left_ear="Psystorm Earring", right_ear="Lifestorm Earring",
		left_ring="Prolix Ring", right_ring="Tamas Ring", back="Rhapsode's Cape"}
	
	sets.midcast.Madrigal= {head="Aoidos' Calot +2"}	
	sets.midcast.Paeon = {head="Brioso Roundlet +1"}
	sets.midcast.Minuet = {body="Aoidos' Hngrln. +2"}	
	sets.midcast.March = {hands="Ad. Mnchtte. +2"}
	sets.midcast.Lullaby = {hands="Brioso Cuffs +1"}
	sets.midcast.Ballad = {legs="Aoidos' Rhing. +2"}
	sets.midcast.Scherzo = {feet="Aoidos' Cothrn. +2"}
		
	sets.midcast.Base = { --main="Izhiikoh", sub="Genbu's Shield",
		head="Bihu Roundlet +1", body="Gende. Bilaut +1", hands="Yaoyotl Gloves", legs="Brioso Cann. +1", feet="Bihu Slippers +1",
		neck="Twilight Torque", waist="Witful Belt", left_ear="Psystorm Earring", right_ear="Lifestorm Earring",
		left_ring="Prolix Ring", right_ring="Tamas Ring", back="Rhapsode's Cape"}
	
	sets.midcast.Cure = { main="Arka IV", sub="Mephitis Grip",
		head="Gende. Caubeen +1", body="Gende. Bilaut +1", hands="Gendewitha Gages", legs="Nares Trews", feet="Manabyss Pigaches",
		neck="Twilight Torque", waist="Witful Belt", left_ear="Psystorm Earring", right_ear="Lifestorm Earring",
		left_ring="Sirona's Ring", right_ring="Ephedra Ring", back="Rhapsode's Cape"}	
				
	--Aftercast Sets     Nares Trews" feet="Aoidos' Cothrn. +2" Serpentes Cuffs
	sets.aftercast = {}
	
	sets.aftercast.Refresh = { --main="Izhiikoh", sub="Genbu's Shield",
		head="Bihu Roundlet +1", body="Gende. Bilaut +1", hands="Serpentes Cuffs", legs="Nares Trews", feet="Serpentes Sabots",
		neck="Twilight Torque", waist="Witful Belt", left_ear="Psystorm Earring", right_ear="Lifestorm Earring",
		left_ring="Prolix Ring", right_ring="Tamas Ring", back="Rhapsode's Cape"}
	
	sets.aftercast.PDT = { main="Izhiikoh", sub="Genbu's Shield", --range="Gjallarhorn",
		head="Bihu Roundlet +1", body="Bihu Jstcorps +1", hands="Bihu Cuffs +1",
		legs="Mes'yohi Slacks", feet="Bihu Slippers +1",
		--legs="Bihu Cannions +1", 
		--feet="Aoidos' Cothrn. +2",
		neck="Twilight Torque", waist="Witful Belt", left_ear="Sanare Earring", right_ear="Lifestorm Earring",
		left_ring="Tamas Ring", right_ring="Patricius Ring", back="Rhapsode's Cape"}
	
	sets.aftercast.Engaged = { main="Izhiikoh", sub="Genbu's Shield", --range="Gjallarhorn",
		head="Bihu Roundlet +1", body="Bihu Jstcorps +1", hands="Bihu Cuffs +1", legs="Bihu Cannions +1", feet="Bihu Slippers +1",
		neck="Asperity Necklace", waist="Auguinus Belt", left_ear="Steelflash Earring", right_ear="Bladeborn Earring",
		left_ring="Prolix Ring", right_ring="Heed Ring", back="Rhapsode's Cape"}
		
	sets.aftercast.Idle = sets.aftercast.PDT
	
--	DaurdSongs = T{'Water Carol','Water Carol II','Ice Carol','Ice Carol II','Herb Pastoral','Goblin Gavotte'}
	
	send_command('input /macro book 7;wait .1;input /macro set 1')

end

function precast(spell)
	if spell.type == 'BardSong' then
		if buffactive.nightingale then
			equip_song_gear(spell)
			return
		else
		--	equip_song_gear(spell)
			equip(sets.precast.FC.Song)
		end
	elseif spell.action_type == 'Magic' then
		equip(sets.precast.FC.Normal)
		if string.find(spell.english,'Cur') or spell.name ~= 'Cursna' then
			equip(sets.precast.Cure)
			--send_command('@input /echo ----- precast -----')
		end
	elseif spell.type == 'WeaponSkill' then
		if sets.precast.WS[spell.name] then
			equip(sets.precast.WS[spell.name])
		end
	end
	
	--if sets.precast.FC[tostring(spell.element)] then equip(sets.precast.FC[tostring(spell.element)]) end
	if sets.precast.JA[spell.english] then equip(sets.precast.JA[spell.english]) end
end

function midcast(spell)
	if spell.type == 'BardSong' then
		equip_song_gear(spell)
	elseif string.find(spell.english,'Cur') then
		equip(sets.midcast.Cure)
		--send_command('@input /echo ----- midcast -----')
	end
end

function aftercast(spell)
		windower.add_to_chat(1,'-----' ..player.equipment.range ..'----')
	if player.status == 'Engaged' then
		equip(sets.aftercast.Engaged)
	else
		equip(sets.aftercast.Idle)
	end
end

function status_change(new,old)
	if new == 'Engaged' then
		equip(sets.aftercast.Engaged)
		--disable('main','sub')
	elseif T{'Idle','Resting'}:contains(new) then
		enable('main','sub')
		equip(sets.aftercast.Idle)
	end
end

function self_command(cmd)
	if cmd == 'unlock' then
		enable('main','sub')
	elseif cmd == 'midact' then
		midaction(false)
	elseif cmd == 'Meele' then
		equip(sets.aftercast.Engaged)
	end
end

function equip_song_gear(spell)
		windower.add_to_chat(1,'-----' ..player.equipment.range ..'----')
	if spell.target.type == 'MONSTER' then
		equip(sets.midcast.Debuff)
		if string.find(spell.english,'Lullaby') then equip(sets.midcast.Lullaby) end
	else
		equip(sets.midcast.Buff)
		if string.find(spell.english,'Ballad') then equip(sets.midcast.Ballad) end
		if string.find(spell.english,'Scherzo') then equip(sets.midcast.Scherzo) end
		if string.find(spell.english,'Madrigal') then equip(sets.midcast.Madrigal) end
		if string.find(spell.english,'Paeon') then equip(sets.midcast.Paeon) end
		if string.find(spell.english,'Minuet') then equip(sets.midcast.Minuet) end
		if string.find(spell.english,'March') then equip(sets.midcast.March) end
	end
end

--[[windower.register_event('zone change',function (...)
	for i,v in pairs(timer_reg) do
		send_command('timers delete "'..i..'"')
	end
	timer_reg = {}
end)]]