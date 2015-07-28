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
      location.reload()
  'click #no':->
    if localStorage[Session.get('current_seed_id')] != 'voted'
      Seed.update({_id:Session.get('current_seed_id')},{$inc:{none:-1,no:1}})
      localStorage[Session.get('current_seed_id')] = 'voted'
      location.reload()


Template.SeedShow.rendered = ->
  seed = Seed.findOne Session.get('current_seed_id')
  doughnutData = [
    {
      value: seed.yes
      color: '#aaf2fb'
      label:'使ってみたい'
    }
    {
      value: seed.no
      color: '#ffb6b9'
      label:'使いたくない'
    }
    {
      value: seed.none
      color: '#A8BECB'
      label:'無回答'
    }
  ]
  myDoughnut = new Chart(document.getElementById('sample').getContext('2d')).Doughnut(doughnutData)
  if !localStorage[Session.get('current_seed_id')]
    Seed.update({_id:Session.get('current_seed_id')},{$inc:{none:1}})
    localStorage[Session.get('current_seed_id')] = 'none'
