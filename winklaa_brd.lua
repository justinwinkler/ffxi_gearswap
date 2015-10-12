function get_sets()
  sets.precast = {}
  sets.precast.JA = {}
  
  -- Precast Sets
  sets.precast.JA.Nightingale = {feet="Bihu Slippers+1"}
  sets.precast.JA.Troubadour = {body="Bihu Justaucorps+1"}
  sets.precast.JA['Soul Voice'] = {legs="Bihu Cannions+1"}
  
  sets.precast.FC = {}
  
  sets.precast.FC.Song = {
    main="Felibre's Dague",
    sub="Genbu's Shield",
    range="Gjallarhorn",
    head="Aoidos' Calot +2",
    --body="Marduk's Jubbah +1", --TODO: Get this.
    body="Bihu Jstcorps +1",
    hands="Schellenband",
    legs="Orvail Pants",
    feet="Bokwus Boots",
    neck="Aoidos' Matinee",
    waist="Witful Belt",
    left_ear="Loquac. Earring",
    right_ear="Aoidos' Earring",
    left_ring="Prolix Ring",
    right_ring="Sangoma Ring",
    back="Swith Cape"}

  sets.precast.FC.Normal = {
    head="Nahtirah Hat",
    --body="Marduk's Jubbah +1", --TODO: Get this.
    body="Bihu Jstcorps +1",
    hands="Gendewitha Gages",
    legs="Orvail Pants",
    feet="Brioso Slippers +1",
    neck="Orunmila's Torque",
    waist="Witful Belt",
    left_ear="Loquac. Earring",
    right_ear="Moonshade Earring",
    left_ring="Prolix Ring",
    right_ring="Sangoma Ring",
    back="Swith Cape"}
    
  sets.precast.Cure = {
    head="Nahtirah Hat",
    body="Gendewitha Bliaut",
    hands="Gende. Gages+1",
    legs="Orvail Pants",
    feet="Brioso Slippers +1",
    neck="Orunmila's Torque",
    waist="Witful Belt",
    left_ear="Loquac. Earring",
    right_ear="Moonshade Earring",
    left_ring="Prolix Ring",
    right_ring="Sangoma Ring",
    back="Pahtli Cape"}
  
  sets.precast.WS = {}

  -- Midcast Sets
  sets.midcast = {}
    
  sets.midcast.Haste = {
    head="Nahtirah Hat",
    ear1="Loquac. Earring",
    hands="Gendewitha Gages",
    ring2="Prolix Ring",
    back="Rhapsode's Cape"}

  sets.midcast.Debuff = {
    main="Venabulum",
    sub="Mephitis Grip",
    range="Gjallarhorn",
    head="Bihu Roundlet +1",
    body="Bihu Jstcorps +1",
    hands="Bihu Cuffs+1",
    legs="Bihu Cannions +1",
    feet="Brioso Slippers +1",
    neck="Aoidos' Matinee",
    waist="Demonry Sash",
    left_ear="Psystorm Earring",
    right_ear="Lifestorm Earring",
    left_ring="Sangoma Ring",
    right_ring="Angha Ring",
    back="Rhapsode's Cape"}
  
  sets.midcast.Buff = {
    main="Felibre's Dague",
    sub="Genbu's Shield",
    head="Bihu Roundlet +1",
    body="Aoidos' Hngrln. +2",
    hands="Ad. Mnchtte. +2",
    legs="Aoidos' Rhing. +2",
    feet="Brioso Slippers +1",
    neck="Aoidos' Matinee",
    waist="Witful Belt",
    left_ear="Psystorm Earring",
    right_ear="Lifestorm Earring",
    left_ring="Prolix Ring",
    right_ring="Sangoma Ring",
    back="Rhapsode's Cape"}
  
  sets.midcast.Madrigal= {head="Aoidos' Calot +2"}  
  --sets.midcast.Paeon = {head="Brioso Roundlet +1"}
  sets.midcast.Minuet = {body="Aoidos' Hngrln. +2"}  
  sets.midcast.March = {hands="Ad. Mnchtte. +2"}
  --sets.midcast.Lullaby = {hands="Brioso Cuffs +1"}
  sets.midcast.Ballad = {legs="Aoidos' Rhing. +2"}
  sets.midcast.Scherzo = {feet="Aoidos' Cothrn. +2"}
    
  sets.midcast.Base = {
    head="Bihu Roundlet +1",
    body="Gendewith Bilaut",
    hands="Bihu Cuffs +1",
    legs="Bihu Cannions +1",
    feet="Brioso Slippers +1",
    neck="Twilight Torque",
    waist="Witful Belt",
    left_ear="Psystorm Earring",
    right_ear="Lifestorm Earring",
    left_ring="Prolix Ring",
    right_ring="Sangoma Ring",
    back="Rhapsode's Cape"}
  
  sets.midcast.Cure = {
    main="Apollo's Staff",
    sub="Mephitis Grip",
    head="Nahtirah Hat",
    body="Gendewith Bilaut",
    hands="Augur's Gloves",
    legs="Tethyan Trews +3",
    feet="Manabyss Pigaches",
    neck="Twilight Torque",
    waist="Witful Belt",
    left_ear="Psystorm Earring",
    right_ear="Lifestorm Earring",
    left_ring="Prolix Ring",
    right_ring="Sangoma Ring",
    back="Rhapsode's Cape"}  
        
  sets.aftercast = {}
  
  sets.aftercast.PDT = {
    main="Terra's Staff",
    sub="Mephitis Grip",
    body="Respite Cloak",
    hands="Bihu Cuffs +1",
    legs="Bihu Cannions +1",
    feet="Brioso Slippers +1",
    neck="Twilight Torque",
    waist="Yamabuki-no-Obi",
    left_ear="Ethereal Earring",
    right_ear="Moonshade Earring",
    left_ring="Patricius Ring",
    right_ring="Defending Ring",
    back="Iximulew Cape"}
    
  sets.aftercast.Idle = sets.aftercast.PDT
  
  sets.lockstyle = {
    main="Felibre's Dague",
    sub="Genbu's Shield",
    body="Respite Cloak",
    hands="Bihu Cuffs +1",
    legs="Bihu Cannions +1",
    feet="Brioso Slippers +1",
    neck="Twilight Torque",
    waist="Yamabuki-no-Obi",
    left_ear="Ethereal Earring",
    right_ear="Moonshade Earring",
    left_ring="Patricius Ring",
    right_ring="Defending Ring",
    back="Iximulew Cape"}

  send_command('input /macro book 3;wait .1;input /macro set 1')

  --Binds F10 to update player gear.
  send_command('bind f10 gs c update')
end

function precast(spell)
  if spell.type == 'BardSong' then
    if buffactive.nightingale then
      equip_song_gear(spell)
      return
    else
    --  equip_song_gear(spell)
      equip(sets.precast.FC.Song)
    end
  elseif spell.action_type == 'Magic' then
    equip(sets.precast.FC.Normal)
    if string.find(spell.english,'Cur') or spell.name ~= 'Cursna' then
      equip(sets.precast.Cure)
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
  end
end

function aftercast(spell)
  --windower.add_to_chat(1,'-----' ..player.equipment.range ..'----')
  equip(sets.aftercast.Idle)
end

function status_change(new,old)
  equip(sets.aftercast.Idle)
end

function self_command(cmd)
  if cmd == 'unlock' then
    enable('main','sub','range')
  elseif cmd == 'lock' then
    disable('main','sub','range')
  elseif cmd == 'midact' then
    midaction(false)
  elseif cmd == 'Melee' then
    equip(sets.aftercast.Engaged)
  elseif cmd == 'update' then
    status_change(player.status)
    add_to_chat(207,'Update player status...')
  end
end

function equip_song_gear(spell)
  --windower.add_to_chat(1,'-----' ..player.equipment.range ..'----')
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

function file_unload()
  send_command('unbind f10')
end
