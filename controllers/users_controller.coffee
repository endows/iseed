UsersController = ApplicationController.extend
  waitOn: -> [
    Meteor.subscribe("users")
  ]

  index: ->
    @render "UserIndex", data: User.find()

  show: ->
    @render "UserShow", data: User.findOne(@params._id)

  new: ->
    @render "UserNew"

  edit: ->
    @render "UserEdit", data: User.findOne(@params._id)

(global ? window).UsersController = UsersController
