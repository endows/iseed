Meteor.publish "users", ->
  User.find({},{field:{
    profile:1
    }})
