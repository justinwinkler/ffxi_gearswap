--GearSwap Version 0.873
--File Created 2-16-13
--Update
--(7-30-14) Changed the way PDT/MDT sets lock on toggle. Added key bind F10 to update gear.
--Weakness timer added (Timers plugin needed for this to work)
--(3-22-14) Wildfire sets added.
--(2-21-14) [For the buff "Battlefield" you'll see you can use an echo or the actual JA Scavenge for when
--exiting a battlefield. By default when u exit a battlefield, you will receive a scavenge reminder. Change accordingly.]

function get_sets()
  TP_Index = 1
  Idle_Index = 1  
  Midshot_Index = 1
  Barrage_Index = 1
  Coronach_Index = 1
  LS_Index = 1 --Last Stand
  WF_Index = 1 --Wildfire
  NA_Index = 1 --Namas Arrow
  JR_Index = 1 --Jishnu's Radiance
  SW_Index = 1 --Sidewinder
  
  --Default Macro Set for RNG
  send_command('input /macro book 9;wait .1;input /macro set 1')
  
  --Binds F10 to update player gear.
  send_command('bind f10 gs c update')

  --PreSets Below (Snapshot/JA's)
  sets.precast = {}
  sets.precast.bullet = {ammo="Achiyalabopa Bullet"}
  sets.precast.arrow = {ammo="Achiyal. Arrow"}
  sets.precast.trialsammo = {ammo="Gargouille Arrow"}
  sets.precast['Double Shot'] = {head="Amini Gapette"}
  sets.precast['Velocity Shot'] = {body="Amini Caban +1"}
  sets.precast['Camouflage'] = {body="Orion Jerkin +1"}  
  sets.precast['Bounty Shot'] = {hands="Syl. Glvltte. +2"}
  sets.precast['Sharpshot'] = {legs="Orion Braccae +1"}
  sets.precast['Scavenge'] = {feet="Orion Socks +1"}
  sets.precast['Shadowbind'] = {hands="Orion Bracers +1"}
  
  sets.precast['Eagle Eye Shot'] = {
    head="Arcadian Beret +1",
    neck="Ocachi Gorget",
    ear1="Enervating Earring",
    ear2="Volley Earring",
    body="Amini Caban +1",
    hands="Manibozho Gloves",
    ring1="Paqichikaji Ring",
    ring2="Haverton Ring",
    back="Lutian cape",
    waist="Elanid Belt",
    legs="Arcadian Braccae +1",
    feet="Amini Bottillons +1"}
            
  sets.precast.PreShot = {
    head="Amini Gapette +1",
    neck="Ocachi Gorget",
    ear1="Enervating Earring",
    ear2="Volley Earring",
    body="Amini Caban +1",
    hands="Iuitl Wristbands",
    ring1="Paqichikaji Ring",
    ring2="Haverton Ring",
    back="Lutian cape",
    waist="Impulse Belt",
    legs="Arc. Braccae +1",
    feet="Wurrukatte Boots"}
    
  -- Magic Sets Below    
  sets.precast.FastCast = {
    head="Whirlpool Mask",
    neck="Twilight Torque",    
    hands="Iuitl Wristbands +1",
    ring1="Defending Ring",
    ring2="Patricius Ring",
    back="Iximulew Cape",    
    legs="Arc. Braccae +1",
    feet="Iuitl Gaiters"}
  
  sets.precast.Utsusemi = set_combine(sets.precast.FastCast,{neck="Magoraga Beads"})    
            
  --Midshot Sets Below
  Midshot_Set_Names = {'Normal','RAcc','MaxRAcc'}
  sets.Midshot = {}
  sets.Midshot.Normal = {
    head="Arcadian Beret +1",
    neck="Ocachi Gorget",
    ear1="Enervating Earring",
    ear2="Volley Earring",
    body="Amini Caban +1",
    hands="Manibozho Gloves",
    ring1="Paqichikaji Ring",
    ring2="Haverton Ring",
    back="Lutian cape",
    waist="Elanid Belt",
    legs="Arcadian Braccae +1",
    feet="Amini Bottillons +1"}
  sets.Midshot.RAcc = set_combine(sets.Midshot.Normal,{
    neck="Ej Necklace",
    hands="Sigyn's Bazubands",
    legs="Orion Braccae +1",
    ring1="Hajduk Ring +1",
    back="Jaeger Mantle"
  })
  sets.Midshot.MaxRAcc = set_combine(sets.Midshot.RAcc,{
    head="Amini Gapette +1"
  })
    

  --Barrage Sets Below
  Barrage_Set_Names = {'Normal'}
  sets.Barrage = {}
  sets.Barrage.Normal = sets.Midshot.Normal
  
  -- Coronach Sets Below
  Coronach_Set_Names = {'Normal'}
  sets.Coronach = {}
  sets.Coronach.Normal = {    
    head="Arcadian Beret +1",
    neck="Fotia Gorget",
    ear1="Enervating Earring",
    ear2="Volley Earring",
    body="Amini Caban +1",
    hands="Manibozho Gloves",
    ring1="Paqichikaji Ring",
    ring2="Haverton Ring",
    back="Lutian cape",
    waist="Fotia Belt",
    legs="Arcadian Braccae +1",
    feet="Amini Bottillons +1"}
  
  -- Last Stand Sets Below
  LS_Set_Names = {'Normal','Acc','Atk'}
  sets.LS = {}
  sets.LS.Normal = {
    head="Arcadian Beret +1",
    neck="Fotia Gorget",
    ear1="Enervating Earring",
    ear2="Volley Earring",
    body="Amini Caban +1",
    hands="Manibozho Gloves",
    ring1="Stormsoul Ring",
    ring2="Haverton Ring",
    back="Lutian cape",
    waist="Fotia Belt",
    legs="Arcadian Braccae +1",
    feet="Amini Bottillons +1"}
  
  -- Wildfire Sets Below
  WF_Set_Names = {'Normal'}
  sets.WF = {}
  sets.WF.Normal = {}
  
  -- Namas Arrow Sets Below
  NA_Set_Names = {'Normal'}
  sets.NA = {}
  sets.NA.Normal = {}
  
  -- Jishnu's Radiance Sets Below
  JR_Set_Names = {'Normal'}
  sets.JR = {}
  sets.JR.Normal = {
    head="Arcadian Beret +1",
    neck="Fotia Gorget",
    ear1="Enervating Earring",
    ear2="Volley Earring",
    body="Amini Caban +1",
    hands="Manibozho Gloves",
    ring1="Paqichikaji Ring",
    ring2="Haverton Ring",
    back="Lutian cape",
    waist="Fotia Belt",
    legs="Arcadian Braccae +1",
    feet="Amini Bottillons +1"}
  
  -- Sidewinder Sets Below
  SW_Set_Names = {'Normal'}
  sets.SW = {}
  sets.SW.Normal = {
    head="Arcadian Beret +1",
    neck="Fotia Gorget",
    ear1="Enervating Earring",
    ear2="Volley Earring",
    body="Amini Caban +1",
    hands="Manibozho Gloves",
    ring1="Paqichikaji Ring",
    ring2="Haverton Ring",
    back="Lutian cape",
    waist="Fotia Belt",
    legs="Arcadian Braccae +1",
    feet="Amini Bottillons +1"}
  
  -- TP Sets Below(I don't really use for RNG but feel free to add your own)
  TP_Set_Names = {"Normal","PDT","MDT"}
  sets.TP = {}
  sets.TP['Normal'] = {
    head="Arcadian Beret +1",
    neck="Ocachi Gorget",
    ear1="Enervating Earring",
    ear2="Volley Earring",
    body="Amini Caban +1",
    hands="Manibozho Gloves",
    ring1="Paqichikaji Ring",
    ring2="Haverton Ring",
    back="Lutian cape",
    waist="Elanid Belt",
    legs="Arcadian Braccae +1",
    feet="Amini Bottillons +1"}
    
  sets.TP['MDT'] = {
    head="Orion Beret +1",
    neck="Huani collar",
    ear1="Merman's Earring",
    ear2="Merman's Earring",
    body="Amini Caban +1",
    hands="Manibozho Gloves",
    ring1="Hajduk ring",
    ring2="Paqichikaji Ring",
    back="Tuilha Cape",
    waist="Resolute Belt",
    legs="Nahtirah Trousers",
    feet="Iuitl Gaiters"}
    
  sets.TP['PDT'] = {
    head="Whirlpool Mask",
    neck="Twilight Torque",
    ear1="Enervating Earring",
    ear2="Volley Earring",
    body="Amini Caban +1",
    hands="Iuitl Wristbands",
    ring1="Defending Ring",
    ring2="Patricius Ring",
    back="Iximulew Cape",
    waist="Elanid Belt",
    legs="Nahtirah Trousers",
    feet="Iuitl Gaiters"}
  
  --Idle Sets Below
  Idle_Set_Names = {'Normal','Regen','Town'}
  sets.Idle = {}
  sets.Idle.Normal = {
    head="Arcadian Beret +1",
    neck="Ocachi Gorget",
    ear1="Enervating Earring",
    ear2="Volley Earring",
    body="Amini Caban +1",
    hands="Manibozho Gloves",
    ring1="Paqichikaji Ring",
    ring2="Haverton Ring",
    back="Lutian cape",
    waist="Elanid Belt",
    legs="Arcadian Braccae +1",
    feet="Amini Bottillons +1"}
            
  sets.Idle.Town = {
    head="Arcadian Beret +1",
    neck="Ocachi Gorget",
    ear1="Enervating Earring",
    ear2="Volley Earring",
    body="Amini Caban +1",
    hands="Manibozho Gloves",
    ring1="Paqichikaji Ring",
    ring2="Haverton Ring",
    back="Lutian cape",
    waist="Elanid Belt",
    legs="Arcadian Braccae +1",
    feet="Amini Bottillons +1"}
        
  sets.Idle.Regen = set_combine(sets.Idle.Normal,{
    head="Ocelomeh headpiece +1",
    neck="Wiglen Gorget",            
    body="Kirin's Osode",
    hands="Orion Bracers +1",
    ring1="Paguroidea Ring",
    ring2="Sheltered Ring",
    back="Scuta Cape"})
  
  sets.lockstyle = {
    head="Arcadian Beret +1",
    neck="Iqabi necklace",
    ear1="Enervating Earring",
    ear2="Volley Earring",
    body="Amini Caban +1",
    hands="Orion Bracers +1",
    ring1="Hajduk ring",
    ring2="Paqichikaji Ring",
    back="Lutian cape",
    waist="Elanid Belt",
    legs="Orion Braccae +1",
    feet="Arcadian socks +1"}
  
  -- PDT (Set will lock and unlock on toggle)
  -- Macro /console gs c pdt
  set.pdt = {}
  pdt = {}
  pdt.on = {
    head="Whirlpool Mask",
    neck="Twilight Torque",
    ear1="Enervating Earring",
    ear2="Volley Earring",
    body="Amini Caban +1",
    hands="Iuitl Wristbands",
    ring1="Defending Ring",
    ring2="Patricius Ring",
    back="Iximulew Cape",
    waist="Elanid Belt",
    legs="Nahtirah Trousers",
    feet="Iuitl Gaiters"}
  pdt.off = {}
    
      -- MDT (Set will lock and unlock on toggle)
  -- Macro /console gs c mdt
  set.mdt = {}
  mdt = {}
  mdt.on = set_combine(pdt.on,{    
    ear1="Merman's Earring",
    ear2="Merman's Earring",
    body="Amini Caban +1",    
    back="Tuilha Cape",
    waist="Resolute Belt"})
  mdt.off = {}  
end

function precast(spell)  
  if sets.precast[spell.english] then
                equip(sets.precast[spell.english])
    elseif spell.type == 'WeaponSkill' then
      if spell.target.distance > 21.0  then            
      add_to_chat(167,''..spell.target.name..' is too far can not use '..spell.name..'!!!. Cancelling WeaponSkill ')                           
            cancel_spell()
            return      
      elseif spell.name == "Coronach" then
                equip(sets.Coronach[Coronach_Set_Names[Coronach_Index]])
      elseif spell.name == "Last Stand" then
                equip(sets.LS[LS_Set_Names[LS_Index]])
      elseif spell.name == "Namas Arrow" then
                equip(sets.NA[NA_Set_Names[NA_Index]])
      elseif spell.name == "Jishnu's Radiance" then
                equip(sets.JR[JR_Set_Names[JR_Index]])
      elseif spell.name == "Sidewinder" then
                equip(sets.SW[SW_Set_Names[SW_Index]])
      elseif spell.name == "Wildfire" then
                equip(sets.WF[WF_Set_Names[WF_Index]])
    end    
    elseif spell.name == "Ranged" then
      equip(sets.precast.PreShot)
      if player.equipment.range == 'Ajjub Bow' then
      equip(sets.precast.arrow)            
      elseif player.equipment.range == 'Yoichinoyumi' then
      equip(sets.precast.arrow)            
      elseif player.equipment.range == 'Annihilator' then
      equip(sets.precast.bullet)            
      elseif player.equipment.range == 'Astrild' then
      equip(sets.precast.trialsammo)      
    end
    elseif spell.type == "Ninjutsu" then
      if string.find(spell.english,'Utsusemi') then
        if buffactive['Copy Image (3)'] or buffactive['Copy Image (4)'] then
          cancel_spell()
          add_to_chat(167, spell.english .. ' Canceled: [3+ Images]')
          return
        else
          equip(sets.precast.Utsusemi)
        end
      else
        equip(sets.precast.FastCast)
    end
    elseif spell.english == 'Spectral Jig' and buffactive.Sneak then
      cast_delay(0.2)
      send_command('cancel Sneak')        
    end
end

function midcast(spell)
  if spell.name == "Ranged" then
    equip(sets.Midshot[Midshot_Set_Names[Midshot_Index]])
    if buffactive.Barrage then
      equip(sets.Barrage[Barrage_Set_Names[Barrage_Index]])            
    end
  end
end

function aftercast(spell)  
  if player.status=='Engaged' then
    equip(sets.TP[TP_Set_Names[TP_Index]])  
  else    
    equip(sets.Idle[Idle_Set_Names[Idle_Index]])    
  end
end

function status_change(new,old)
  if T{'Idle','Resting'}:contains(new) then    
    equip(sets.Idle[Idle_Set_Names[Idle_Index]]) 
  elseif new == 'Engaged' then
    equip(sets.TP[TP_Set_Names[TP_Index]])
  end
end

function buff_change(name,gain_or_loss)
  if name == 'Battlefield' and not gain_or_loss then
    --send_command('wait 3; input /ja "Scavenge" <me>')
    add_to_chat(167,'You left the Battlefield, don\'t forget to Scavenge!')
  end
  if name == 'weakness' and gain_or_loss then  
      send_command('timers create "Weakness" 300 up abilities/00255.png')      
  elseif name == 'weakness' and not gain_or_loss then  
      send_command('timers delete "Weakness"')
  end
end

--Toggle Self Commands with //gs c [command name] 
--Example type in chat //gs c tp (case sensitive)
--Example Make a macro /console gs c tp (case sensitive)
function self_command(command)
  if command == 'tp' then
    TP_Index = TP_Index +1    
    if TP_Index > #TP_Set_Names then TP_Index = 1 end
    add_to_chat(207,'TP Set Changed to: '..TP_Set_Names[TP_Index]..'')
    status_change(player.status)
  elseif command == 'idle' then
    Idle_Index = Idle_Index +1
    if Idle_Index > #Idle_Set_Names then Idle_Index = 1 end
    add_to_chat(207,'Idle Set Changed to: '..Idle_Set_Names[Idle_Index]..'')    
    equip(sets.Idle[Idle_Set_Names[Idle_Index]])  
  elseif command == 'pdt' then
    if sets.pdt == pdt.on then
      equip(pdt.off)
      sets.pdt = pdt.off
      enable('ammo','head','neck','ear1','ear2','body','hands','ring1','ring2','back','waist','legs','feet')
      status_change(player.status)
      add_to_chat(207,'>>>>> PDT Set Unlocked! <<<<<')
    else        
      equip(pdt.on)
      sets.pdt = pdt.on
      disable('ammo','head','neck','ear1','ear2','body','hands','ring1','ring2','back','waist','legs','feet')
      add_to_chat(66,'>>>>> PDT Set Locked! <<<<<')
    end
  elseif command == 'mdt' then
    if sets.mdt == mdt.on then
      equip(mdt.off)
      sets.mdt = mdt.off
      enable('ammo','head','neck','ear1','ear2','body','hands','ring1','ring2','back','waist','legs','feet')
      status_change(player.status)
      add_to_chat(207,'>>>>> MDT Set Unlocked! <<<<<')
    else        
      equip(mdt.on)
      sets.mdt = mdt.on
      disable('ammo','head','neck','ear1','ear2','body','hands','ring1','ring2','back','waist','legs','feet')
      add_to_chat(15,'>>>>> MDT Set Locked! <<<<<')
    end
  elseif command == 'midshot' then
    Midshot_Index = Midshot_Index +1
    if Midshot_Index > #Midshot_Set_Names then Midshot_Index = 1 end
    add_to_chat(207,'Midshot Set Changed to: '..Midshot_Set_Names[Midshot_Index]..'')    
  elseif command == 'barrage' then
    Barrage_Index = Barrage_Index +1
    if Barrage_Index > #Barrage_Set_Names then Barrage_Index = 1 end
    add_to_chat(207,'Barrage Set Changed to: '..Barrage_Set_Names[Barrage_Index]..'')
  elseif command == 'relicgunws' then
    Coronach_Index = Coronach_Index +1
    if Coronach_Index > #Coronach_Set_Names then Coronach_Index = 1 end
    add_to_chat(207,'Coronach Set Changed to: '..Coronach_Set_Names[Coronach_Index]..'')    
  elseif command == 'meritws' then
    LS_Index = LS_Index +1
    if LS_Index > #LS_Set_Names then LS_Index = 1 end
    add_to_chat(207,'Last Stand Set Changed to: '..LS_Set_Names[LS_Index]..'')
  elseif command == 'wildfirews' then
    WF_Index = WF_Index +1
    if WF_Index > #WF_Set_Names then WF_Index = 1 end
    add_to_chat(207,'Wildfire Set Changed to: '..WF_Set_Names[WF_Index]..'')  
  elseif command == 'relicbowws' then
    NA_Index = NA_Index +1
    if NA_Index > #NA_Set_Names then NA_Index = 1 end
    add_to_chat(207,'Namas Arrow Set Changed to: '..NA_Set_Names[NA_Index]..'')    
  elseif command == 'empws' then
    JR_Index = JR_Index +1
    if JR_Index > #JR_Set_Names then JR_Index = 1 end
    add_to_chat(207,'Jishnu\'s Radiance Set Changed to: '..JR_Set_Names[JR_Index]..'')    
  elseif command == 'sidewinderws' then
    SW_Index = SW_Index +1
    if SW_Index > #SW_Set_Names then SW_Index = 1 end
    add_to_chat(207,'Sidewinder Set Changed to: '..SW_Set_Names[SW_Index]..'')    
  elseif command == 'update' then
    status_change(player.status)
    add_to_chat(207,'Update player status...')
  elseif command == 'active' then
    add_to_chat(207,'Idle Set Active: '..Idle_Set_Names[Idle_Index]..'')    
    add_to_chat(207,'TP Set Active: '..TP_Set_Names[TP_Index]..'')
    add_to_chat(207,'Midshot Set Active: '..Midshot_Set_Names[Midshot_Index]..'')
    add_to_chat(207,'Barrage Set Active: '..Barrage_Set_Names[Barrage_Index]..'')
    add_to_chat(207,'Coronach Set Active: '..Coronach_Set_Names[Coronach_Index]..'')
    add_to_chat(207,'Last Stand Set Active: '..LS_Set_Names[LS_Index]..'')
    add_to_chat(207,'Wildfire Set Active: '..WF_Set_Names[WF_Index]..'')
    add_to_chat(207,'Namas Arrow Set Active: '..NA_Set_Names[NA_Index]..'')
    add_to_chat(207,'Jishnu\'s Radiance Set Active: '..JR_Set_Names[JR_Index]..'')
    add_to_chat(207,'Sidewinder Set Active: '..SW_Set_Names[SW_Index]..'')     
  elseif command == 'equipmidshot' then
    equip(sets.Midshot[Midshot_Set_Names[Midshot_Index]])
  end
end

function file_unload()
  send_command('unbind f10')  
end
