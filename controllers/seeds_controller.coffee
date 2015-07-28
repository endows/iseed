SeedsController = ApplicationController.extend
  waitOn: -> [
    Meteor.subscribe("seeds")
    Meteor.subscribe("users")
  ]

  index: ->
    @render "SeedIndex", data: Seed.find().map (doc, index, cursor) ->
      _.extend doc, index: index + 1

  show: ->
    Session.set 'current_seed_id',@params._id
    @render "SeedShow", data: Seed.findOne(@params._id)

  new: ->
    @render "SeedNew"

  edit: ->
    @render "SeedEdit", data: Seed.findOne(@params._id)

(global ? window).SeedsController = SeedsController
