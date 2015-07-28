User = Meteor.users


User.allow
  insert: ->
    true

  update: ->
    true

  remove: ->
    true

(global ? window).User = User
