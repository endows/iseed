Seed = new Meteor.Collection "seeds"

Seed.attachSchema new SimpleSchema {
  who:
    type: String
  how:
    type: String
  what:
    type: String
  yes:
    type: Number
  no:
    type: Number
  none:
    type: Number
}

Seed.allow
  insert: (userId, doc) ->
    true

  update: (userId, doc, fields, modifier) ->
    true

  remove: (userId, doc) ->
    true

(global ? window).Seed = Seed
