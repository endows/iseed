Template.SeedNew.helpers
  'who':->
    Session.get 'who'
  'what':->
    Session.get 'what'
  'how':->
    Session.get 'how'

Template.SeedNew.events()

AutoForm.hooks
  "new-seed-form":
    onSuccess: (operation, result, template) ->
      Router.go "seeds"

Template.SeedNew.rendered = ->
  Session.set 'who','こんな人々'
  Session.set 'what','あんな問題'
  Session.set 'how','あれで'
