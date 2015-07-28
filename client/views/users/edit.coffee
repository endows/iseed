Template.UserEdit.helpers()

Template.UserEdit.events()

Template.UserEdit.rendered = ->

AutoForm.hooks
  "edit-user-form":
    onSuccess: (operation, result, template) ->
      Router.go "users"
