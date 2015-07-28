Template.SeedNew.helpers
  'who':->
    Session.get 'who'
  'what':->
    Session.get 'what'
  'how':->
    Session.get 'how'

Template.SeedNew.events
  'keyup input':->
    Session.set 'who', $('#who').val()
    Session.set 'what', $('#what').val()
    Session.set 'how', $('#how').val()
  'keyup textarea':->
    Session.set 'who', $('#who').val()
    Session.set 'what', $('#what').val()
    Session.set 'how', $('#how').val()

AutoForm.hooks
  "new-seed-form":
    onSuccess: (operation, result, template) ->
      Router.go "seeds"

Template.SeedNew.rendered = ->
  Session.set 'who','こんな人々'
  Session.set 'what','あんな問題'
  Session.set 'how','あれで'
