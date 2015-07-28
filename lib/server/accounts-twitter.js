Accounts.onCreateUser(function(options, user) {
  user.profile = {}
  user.profile.image = user.services.twitter.profile_image_url
  user.profile.name = options.profile.name
  user._id = user.services.twitter.id
  return user
});


Meteor.startup(function() {
  ServiceConfiguration.configurations.remove({
    service: "twitter"
  })
  ServiceConfiguration.configurations.insert({
    "service": "twitter",
    "consumerKey": "6P3TPIF1WXQWOa3nM5njprVVi",
    "secret": "8PzJQmJtITriEixvzquRBz3JbGy0y8T8b4gRdcyjXYp5Mv0zyV"
  })
})
