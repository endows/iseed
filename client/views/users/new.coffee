Template.UserNew.helpers()

Template.UserNew.events()

AutoForm.hooks
  "new-user-form":
    onSuccess: (operation, result, template) ->
      Router.go "users"

Template.UserNew.rendered = ->
