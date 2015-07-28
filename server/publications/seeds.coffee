Meteor.publish "seeds", ->
  Seed.find()
