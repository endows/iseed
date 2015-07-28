Template.SeedShow.helpers
  'voted':->
    if localStorage[Session.get('current_seed_id')] == 'voted'
      true
    else
      false


Template.SeedShow.events
  'click #yes':->
    if localStorage[Session.get('current_seed_id')] != 'voted'
      Seed.update({_id:Session.get('current_seed_id')},{$inc:{none:-1,yes:1}})
      localStorage[Session.get('current_seed_id')] = 'voted'
  'click #no':->
    if localStorage[Session.get('current_seed_id')] != 'voted'
      Seed.update({_id:Session.get('current_seed_id')},{$inc:{none:-1,no:1}})
      localStorage[Session.get('current_seed_id')] = 'voted'


Template.SeedShow.rendered = ->
  if !localStorage[Session.get('current_seed_id')]
    Seed.update({_id:Session.get('current_seed_id')},{$inc:{none:1}})
    localStorage[Session.get('current_seed_id')] = 'none'
