UsersController = ApplicationController.extend
  waitOn: -> [
    Meteor.subscribe("users")
    Meteor.subscribe("seeds")
  ]

  index: ->
    @render "UserIndex", data: User.find()

  show: ->
    @render "UserShow", data:
      'user':User.findOne(@params._id)
      'seeds':Seed.find({user:@params._id})

  new: ->
    @render "UserNew"

  edit: ->
    @render "UserEdit", data: User.findOne(@params._id)

(global ? window).UsersController = UsersController
