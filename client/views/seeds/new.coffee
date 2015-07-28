Template.SeedNew.helpers()

Template.SeedNew.events()

AutoForm.hooks
  "new-seed-form":
    onSuccess: (operation, result, template) ->
      Router.go "seeds"

Template.SeedNew.rendered = ->
