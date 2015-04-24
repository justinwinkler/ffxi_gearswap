function init_gear_sets()
end

function get_sets()
  mote_include_version = 2
  -- Load and initialize the include file.
  include('Mote-Include.lua')
	
  sets.precast = {}
  
  -- Precast Sets
  sets.precast.Attack = {
    main="Venabulum",
    sub="Elder's Grip +1",
    ammo="Dosis Tathlum",
    head="Nahtirah Hat",
    body="Hagondes Coat +1",
    hands="Hagondes Cuffs +1",
    legs="Orvail Pants",
    feet="Umbani Boots",
    neck="Twilight Torque",
    waist="Witful Belt",
    left_ear="Loquac. Earring",
    right_ear="Moonshade Earring",
    left_ring="Prolix Ring",
    right_ring="Sangoma Ring",
    back="Swith Cape"}
    
  sets.precast.Cure = {
    main="Venabulum",
    sub="Elder's Grip +1",
    ammo="Dosis Tathlum",
    head="Nahtirah Hat",
    body="Hagondes Coat +1",
    hands="Hagondes Cuffs +1",
    legs="Orvail Pants",
    feet="Umbani Boots",
    neck="Twilight Torque",
    waist="Witful Belt",
    left_ear="Loquac. Earring",
    right_ear="Moonshade Earring",
    left_ring="Prolix Ring",
    right_ring="Sangoma Ring",
    back="Pahtli Cape"}

  -- Midcast Sets
  sets.midcast = {}
  sets.midcast.attack = {}
    
  sets.midcast.attack.SparkFarm = {
    main="Venabulum",
    sub="Elder's Grip +1",
    ammo="Dosis Tathlum",
    head="Nahtirah Hat",
    body="Spae. Coat +1",
    hands="Bokwus Gloves",
    legs="Orvail Pants",
    feet="Umbani Boots",
    neck="Twilight Torque",
    waist="Yamabuki-no-Obi",
    left_ear="Loquac. Earring",
    right_ear="Ethereal Earring",
    left_ring="Dark Ring",
    right_ring="Dark Ring",
    back="Iximulew Cape"}

  sets.midcast.attack.MAcc = {
    main="Venabulum",
    sub="Elder's Grip +1",
    ammo="Dosis Tathlum",
    head="Nahtirah Hat",
    body="Spae. Coat +1",
    hands="Bokwus Gloves",
    legs="Hagondes Pants +1",
    feet="Umbani Boots",
    neck="Bokwus Boots",
    waist="Demonry Sash",
    left_ear="Lifestorm Earring",
    right_ear="Psystorm Earring",
    left_ring="Sangoma Ring",
    right_ring="Angha Ring",
    back="Bane Cape"}

  sets.midcast.attack.MPSaving = {
    main="Venabulum",
    sub="Elder's Grip +1",
    ammo="Dosis Tathlum",
    head="Bihu Roundlet +1",
    body="Spae. Coat +1",
    hands="Hagondes Cuffs +1",
    legs="Hagondes Pants +1",
    feet="Umbani Boots",
    neck="Eddy Necklace",
    waist="Yamabuki-no-Obi",
    left_ear="Friomisi Earring",
    right_ear="Crematio Earring",
    left_ring="Acumen Ring",
    right_ring="Demon's Ring",
    back="Argochampsa Mantle"}

  sets.midcast.attack.MAB = {
    main="Venabulum",
    sub="Elder's Grip +1",
    ammo="Dosis Tathlum",
    head="Hagondes Hat +1",
    body="Hagondes Coat +1",
    hands="Hagondes Cuffs +1",
    legs="Hagondes Pants +1",
    feet="Umbani Boots",
    neck="Eddy Necklace",
    waist="Yamabuki-no-Obi",
    left_ear="Friomisi Earring",
    right_ear="Crematio Earring",
    left_ring="Acumen Ring",
    right_ring="Demon's Ring",
    back="Argochampsa Mantle"}
  
  sets.midcast.Cure = {
    main="Apollo's Staff",
    sub="Elder's Grip +1",
    ammo="Dosis Tathlum",
    body="Twilight Cloak",
    hands="Bokwus Gloves",
    legs="Tethyan Trews +3",
    feet="Manabyss Pigaches",
    neck="Twilight Torque",
    waist="Demonry Sash",
    left_ear="Loquac. Earring",
    right_ear="Moonshade Earring",
    left_ring="Prolix Ring",
    right_ring="Sangoma Ring",
    back="Pahtli Cape"}

  
  sets.aftercast = {}
  
  sets.aftercast.PDT = {
    main="Terra's Staff",
    sub="Elder's Grip +1",
    ammo="Dosis Tathlum",
    body="Respite Cloak",
    hands="Hagondes Cuffs +1",
    legs="Hagondes Pants +1",
    feet="Umbani Boots",
    neck="Twilight Torque",
    waist="Yamabuki-no-Obi",
    left_ear="Ethereal Earring",
    right_ear="Moonshade Earring",
    left_ring="Dark Ring",
    right_ring="Dark Ring",
    back="Iximulew Cape"}
    
  sets.aftercast.Idle = sets.aftercast.PDT
  
  sets.lockstyle = {
    main="Venabulum",
    sub="Elder's Grip +1",
    ammo="Dosis Tathlum",
    body="Respite Cloak",
    hands="Hagondes Cuffs +1",
    legs="Hagondes Pants +1",
    feet="Umbani Boots",
    neck="Eddy Necklace",
    waist="Yamabuki-no-Obi",
    left_ear="Friomisi Earring",
    right_ear="Crematio Earring",
    left_ring="Acumen Ring",
    right_ring="Demon's Ring",
    back="Argochampsa Mantle"}

  send_command('input /macro book 16;wait .1;input /macro set 1')

  --Binds F10 to update player gear.
  send_command('bind f10 gs c update')
end

function job_precast(spell, action, spellMap, eventArgs)
  if spell.action_type == 'Magic' then
    if string.find(spell.english,'Cur') or spell.name ~= 'Cursna' then
      equip(sets.precast.Cure)
    else
      equip(sets.precast.Attack)
    end
  end
end

function job_midcast(spell, action, spellMap, eventArgs)
  if string.find(spell.english,'Cur') then
    equip(sets.midcast.Cure)
  else
    equip_attack_gear(spell)
  end
end

function equip_attack_gear(spell)
  add_to_chat(123, 'OffenseMode: '..state.OffenseMode.value)
  if state.OffenseMode.value == 'MAB' then
    equip(sets.midcast.attack.MAB)
  elseif state.OffenseMode.value == 'MAcc' then
    equip(sets.midcast.attack.MAcc)
  elseif state.OffenseMode.value == 'SparkFarm' then
    equip(sets.midcast.attack.SparkFarm)
  elseif state.OffenseMode.value == 'MPSaving' then
    equip(sets.midcast.attack.MPSaving)
  else
    equip(sets.midcast.attack.MAB)
  end
end

function job_aftercast(spell, action, spellMap, eventArgs)
  equip(sets.aftercast.Idle)
end

function job_status_change(newStatus, oldStatus, eventArgs)
  equip(sets.aftercast.Idle)
end

function job_self_command(cmdParams, eventArgs)
  if cmdParams[1] == 'update' then
    status_change(player.status)
    add_to_chat(207,'Update player status...')
  end
end

function user_setup()
  state.OffenseMode:options('MAB', 'SparkFarm', 'MAcc', 'MPSaving')
  -- Alt-F8
  send_command('bind !f8 gs c cycle OffenseMode')
end

function file_unload()
  send_command('unbind !f8')
  send_command('unbind f10')
end
