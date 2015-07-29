Seed = new Meteor.Collection "seeds"

Seed.attachSchema new SimpleSchema {
  who:
    type: String
    label: "だれの　(50文字以内)"
    max: 50
  how:
    type: String
    max: 200
    label: "どうやって解決する？　(200文字以内)"
  keyword:
    type: String
    label: "解決のキーワード　(20文字以内)"
    max: 20
  what:
    type: String
    label: "どんな問題、悩みを　(100文字以内)"
    max: 100
  yes:
    type: Number
  no:
    type: Number
  none:
    type: Number
  user:
    type: String
    autoValue:->
      @userId
}

Seed.before.insert (userId, seed)->
  seed.yes = 0
  seed.no = 0
  seed.none = 0

Seed.allow
  insert: (userId, doc) ->
    true

  update: (userId, doc, fields, modifier) ->
    true

  remove: (userId, doc) ->
    true

(global ? window).Seed = Seed
