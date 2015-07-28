SeedsController = ApplicationController.extend
  waitOn: -> [
    Meteor.subscribe("seeds")
  ]

  index: ->
    @render "SeedIndex", data: Seed.find()

  show: ->
    Session.set 'current_seed_id',@params._id
    @render "SeedShow", data: Seed.findOne(@params._id)

  new: ->
    @render "SeedNew"

  edit: ->
    @render "SeedEdit", data: Seed.findOne(@params._id)

(global ? window).SeedsController = SeedsController
