var options = {
    consumer_key: '6P3TPIF1WXQWOa3nM5njprVVi',
    consumer_secret: '8PzJQmJtITriEixvzquRBz3JbGy0y8T8b4gRdcyjXYp5Mv0zyV',
    access_token_key: "3300302892-DHipsgSHrODWvI4g3oySvc7ebNIqM4bbRHN1S1D",
    access_token_secret: "HlzIfohxl6EjPQfgrwa8SWzxtD8MRJE0JfDG6aiGDPtsN"
}
var client = new Twitter(options);

var params = {status: 'I Love Twitter'}



Meteor.methods({
  'tweet':function(){
    Twitter.postAsync(client, 'statuses/update', params, function(error, tweets, response){
      console.log(error)
        if (!error) {
            console.log(tweets);
        }

    });
  },
  // 'getSeed':function(){
  //   Meteor.warp
  // }
})
