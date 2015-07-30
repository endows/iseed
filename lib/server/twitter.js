var options = {
    consumer_key: '6P3TPIF1WXQWOa3nM5njprVVi',
    consumer_secret: '8PzJQmJtITriEixvzquRBz3JbGy0y8T8b4gRdcyjXYp5Mv0zyV',
    access_token_key: "3300302892-DHipsgSHrODWvI4g3oySvc7ebNIqM4bbRHN1S1D",
    access_token_secret: "HlzIfohxl6EjPQfgrwa8SWzxtD8MRJE0JfDG6aiGDPtsN"
}
var client = new Twitter(options);




Meteor.methods({
  'tweetSeed':function(seed_id){
    var seed = Seed.findOne({_id:seed_id})
    var url = Meteor.absoluteUrl('seeds/' + seed._id)
    var params = {
      status:seed.who + "の" + seed.what + "を" + seed.keyword + "で解決するアイディア " + url
    }
    Twitter.postAsync(client, 'statuses/update', params, function(error, tweets, response){
      console.log(error)
    });
  },
  'tweetMySeed':function(seed_id){
    var user = User.findOne({_id:this.userId})
    options.access_token_key = user.services.twitter.accessToken
    options.access_token_secret = user.services.twitter.accessTokenSecret
    var _client = new Twitter(options);
    var seed = Seed.findOne({_id:seed_id})
    var url = Meteor.absoluteUrl('seeds/' + seed._id)
    var params = {
      status:seed.who + "の" + seed.what + "を" + seed.keyword + "で解決するアイディア " + url
    }
    Twitter.postAsync(_client, 'statuses/update', params, function(error, tweets, response){
      console.log(error)
    });
  }
})
