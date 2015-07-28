Template.UserIndex.helpers()

Template.UserIndex.events
  "click [data-action=delete]": ->
    User.remove @_id

Template.UserIndex.rendered = ->
