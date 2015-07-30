AutoForm.addHooks(["new-seed-form"], {
  onSuccess: function(operation, result, template) {
    setTimeout(function(){ 
      if(Meteor.user().tweet_flag){
        Meteor.call('tweetMySeed',result)
      }
      Meteor.call('tweetSeed',result)
      Router.go("/seeds/" + result)
    },100)
  }
});
