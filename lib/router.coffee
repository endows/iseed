Router.configure
  layoutTemplate: "layout"
  loadingTemplate: "loading"
  waitOn: -> [
    # Meteor.subscribe("collection")
  ]

Router.map ->
  @route "/", -> @render "index"
  @route "seeds", controller: "SeedsController", action: "index", name: "seeds"
  @route "seeds/new", controller: "SeedsController", action: "new", name: "new_seed"
  @route "seeds/:_id", controller: "SeedsController", action: "show", name: "seed"
  @route "seeds/:_id/edit", controller: "SeedsController", action: "edit", name: "edit_seed"
  @route "users", controller: "UsersController", action: "index", name: "users"
  @route "users/new", controller: "UsersController", action: "new", name: "new_user"
  @route "users/:_id", controller: "UsersController", action: "show", name: "user"
  @route "users/:_id/edit", controller: "UsersController", action: "edit", name: "edit_user"
