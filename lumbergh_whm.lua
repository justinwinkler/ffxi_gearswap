function get_sets()
  sets.precast = {}
  sets.precast.JA = {}
  
  -- Precast Sets
  sets.precast.JA.Nightingale = {feet="Bihu Slippers+1"}
  sets.precast.JA.Troubadour = {body="Bihu Justaucorps+1"}
  sets.precast.JA['Soul Voice'] = {legs="Bihu Cannions+1"}
  
  sets.precast.FC = {}
  
  sets.precast.FC.Normal = {
    main="Tamaxchi",
    sub="Sors Shield",
    head="Gende. Caubeen",
    body="Orison Bliaud +2",
    hands="Gendewitha Gages",
    legs="Orsn. Pantaln. +2",
    feet="Gende. Galoshes",
    neck="Orison Locket",
    waist="Witful Belt",
    left_ear="Orison Earring",
    right_ear="Graiai Earring",
    left_ring="Weather. Ring",
    right_ring="Ephedra Ring",
    back="Pahtli Cape",
    ammo="Incantor Stone"}
    
  -- Midcast Sets
  sets.midcast = {}
    
  sets.midcast.Erase = {
    head="Orison Cap +2"}
  
  sets.midcast.Cure = {}
  
  sets.aftercast = {}
  
  sets.aftercast.PDT = {
    main="Tamaxchi",
    sub="Genbu's Shield",
    body="Respite Cloak",
    hands="Gendewitha Gages",
    legs="Wayfarer Slops",
    feet="Wayfarer Clogs",
    neck="Twilight Torque",
    waist="Witful Belt",
    left_ear="Orison Earring",
    right_ear="Graiai Earring",
    left_ring="Weather. Ring",
    right_ring="Ephedra Ring",
    back="Pahtli Cape",
    ammo="Incantor Stone"}
    
  sets.aftercast.Idle = sets.aftercast.PDT
  
  sets.lockstyle = {
    main="Tamaxchi",
    sub="Sors Shield",
    head="Gende. Caubeen",
    body="Orison Bliaud +2",
    hands="Gendewitha Gages",
    legs="Orsn. Pantaln. +2",
    feet="Gende. Galoshes",
    neck="Orison Locket",
    waist="Witful Belt",
    left_ear="Orison Earring",
    right_ear="Graiai Earring",
    left_ring="Weather. Ring",
    right_ring="Ephedra Ring",
    back="Pahtli Cape",
    ammo="Incantor Stone"}

  send_command('input /macro book 1;wait .1;input /macro set 1')

  --Binds F10 to update player gear.
  send_command('bind f10 gs c update')
end

function precast(spell)
  if spell.action_type == 'Magic' then
    equip(sets.precast.FC.Normal)
  end
  
end

function midcast(spell)
  if string.find(spell.english,'Cur') then
    equip(sets.midcast.Cure)
  elseif string.find(spell.english,'na') or string.find(spell.english,'Erase') then
    equip(sets.midcast.Erase)
  end
end

function aftercast(spell)
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

function file_unload()
  send_command('unbind f10')
end

