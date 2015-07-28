Seed = new Meteor.Collection "seeds"

Seed.attachSchema new SimpleSchema {
  who:
    type: String
    label: "だれの　(50文字以内)"
    max: 50
  how:
    type: String
    label: "どんな問題を　(100文字以内)"
    max: 100
  what:
    type: String
    label: "どうやって解決する？　(100文字以内)"
    max: 100
  yes:
    type: Number
    autoValue:->
      1
  no:
    type: Number
    autoValue:->
      1
  none:
    type: Number
    autoValue:->
      1
  user:
    type: String
    autoValue:->
      @userId
}

Seed.allow
  insert: (userId, doc) ->
    true

  update: (userId, doc, fields, modifier) ->
    true

  remove: (userId, doc) ->
    true

(global ? window).Seed = Seed
