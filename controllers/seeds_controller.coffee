SeedsController = ApplicationController.extend
  waitOn: -> [
    Meteor.subscribe("seeds")
    Meteor.subscribe("users")
  ]

  index: ->
    document.title = 'iSeed アイディアを育てるSNS'
    @render "SeedIndex",
      data:
        users:User.find()

  show: ->
    seed = Seed.findOne(@params._id)
    document.title = "#{seed.who}の#{seed.what}問題を#{seed.keyword}で解決するアイディア"
    Session.set 'current_seed_id',@params._id
    @render "SeedShow", data: seed

  new: ->
    @render "SeedNew"

  edit: ->
    @render "SeedEdit", data: Seed.findOne(@params._id)

(global ? window).SeedsController = SeedsController
