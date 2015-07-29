Template.SeedNew.helpers
  'who':->
    Session.get 'who'
  'what':->
    Session.get 'what'
  'keyword':->
    Session.get 'keyword'

Template.SeedNew.events

AutoForm.hooks
  "new-seed-form":
    onSuccess: (operation, result, template) ->
      Router.go "seeds"

Template.SeedNew.rendered = ->
  Session.set 'who','こんな人々'
  Session.set 'what','あんな問題'
  Session.set 'keyword','あれで'

  setInterval ->
    Session.set 'keyword', $('#keyword').val() || Session.get('keyword')
    Session.set 'what', $('#what').val() || Session.get('what')
    Session.set 'who',  $('#who').val() || Session.get('who')
  ,100
