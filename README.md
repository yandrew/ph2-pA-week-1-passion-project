

### Quickstart

1.  `bundle install`
2.  `bundle exec shotgun config.ru`
3.  `bundle exec rake db:create`
4.  `bundle exec rake db:migrate`
5.  `bundle exec rake db:seed`
6.  [Local host page](http://localhost:9393/)

These tasks might not need `bundle exec` prepended to it

### A website for community sharing of Car Costs

1. Website has authentication and authorizations with login and registration
2. Website has a many to many relationship with Users, Prices and Cars.
3. Website uses activerecord CRUD to create, read, update and delete prices.
4. Website has validations and error handling.
5. Website uses html and css.
6. Website uses Sinatra for routing. 


## by Andrew Yan