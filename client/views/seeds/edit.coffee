Template.SeedEdit.helpers()

Template.SeedEdit.events()

Template.SeedEdit.rendered = ->

AutoForm.hooks
  "edit-seed-form":
    onSuccess: (operation, result, template) ->
      Router.go "seeds"
