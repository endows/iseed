AutoForm.addHooks(["new-seed-form"], {
  onSuccess: function(operation, result, template) {

    setTimeout(function(){
      Router.go("/seeds/" + result)
      
      if(Meteor.user().tweet_flag){
        Meteor.call('tweetMySeed',result)
      }
      Meteor.call('tweetSeed',result)
    },100)
  }
});
