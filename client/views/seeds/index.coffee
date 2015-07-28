Template.SeedIndex.helpers()

Template.SeedIndex.events
  "click [data-action=delete]": ->
    Seed.remove @_id

Template.SeedIndex.rendered = ->
