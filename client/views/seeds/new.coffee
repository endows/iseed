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
  Meteor.users.update({_id:Meteor.userId()},{$set:{tweet_flag:true}})
  Session.set 'who','こんな人々'
  Session.set 'what','あんな問題'
  Session.set 'keyword','あれで'

  setInterval ->
    Session.set 'keyword', $('#keyword').val() || Session.get('keyword')
    Session.set 'what', $('#what').val() || Session.get('what')
    Session.set 'who',  $('#who').val() || Session.get('who')
    localStorage['tweet_flag'] = $('#tweet_flag').prop('checked')
    switch $('#tweet_flag').prop('checked')
      when true
        Meteor.users.update({_id:Meteor.userId()},{$set:{tweet_flag:true}})
      when false
        Meteor.users.update({_id:Meteor.userId()},{$set:{tweet_flag:false}})
  ,100
