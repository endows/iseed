AutoForm.addHooks(["new-seed-form"], {
  onSuccess: function(operation, result, template) {
    setTimeout(function(){
      FlashMessages.sendSuccess("投稿が完了しました。ツイートすることで、友達にも見てもらうことができます <a href='https://twitter.com/share' class='twitter-share-button' data-count='none'>Tweet</a>");
      Router.go("/seeds/" + result)
    },100)
  }
});
