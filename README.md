# sinatra-activerecord-followings

A simple example of how to setup a follower/following self-referential association between two users using Sinatra + ActiveRecord. 

Not too much view-wise here, you should run:

`rake db:migrate`

and

`rake db:seed`

to get started. Once you bootup the app (`ruby app.rb`), going to the main view will log you in as Zach and let you see any followings/followers you have. You can setup a relationship between that logged in user and any other user id using the /users/:id/follow route, so if you visit /users/2/follow, user 1 will follow user 2!

Accompany blog post can be found at:

[http://nycda.com/blog/followings-in-sinatra/](http://nycda.com/blog/followings-in-sinatra/)