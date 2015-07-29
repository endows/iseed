Session.setDefault 'time',100
Template.SeedShow.helpers
  'voted':->
    if localStorage[Session.get('current_seed_id')] == 'voted'
      true
    else
      false


Template.SeedShow.events
  'click #yes':->
    Seed.update({_id:Session.get('current_seed_id')},{$inc:{yes:1}})
    localStorage[Session.get('current_seed_id')] = 'voted'
    location.reload()
  'click #no':->
    Seed.update({_id:Session.get('current_seed_id')},{$inc:{no:1}})
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
  new_data = []
  doughnutData.filter (data)->
    data.value > 0
  if document.getElementById('sample')
    myDoughnut = new Chart(document.getElementById('sample').getContext('2d')).Doughnut(doughnutData)
