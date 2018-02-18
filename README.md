# Simple Auth Starter App

The authentication of this app are adapted from the 
most awesome [*Ruby on Rails Tutorial:
Learn Web Development with Rails*](http://www.railstutorial.org/)
by [Michael Hartl](http://www.michaelhartl.com/). Thank you to Mr. Hartl
for making his amazing tutorial avaialable and keeping it current and relevant.
For more information, see the
[*Ruby on Rails Tutorial* book](http://www.railstutorial.org/book).

## Features
- Email activation
- External users cannot sign themselves up
- Internal administators add users to control membership
- Admins can reset password and update users
- Admins can archive (and un-archive) users
- Admins can resend activation email
- Admins can delete users

## Getting started

To get started with the app, clone the repo and then install the needed gems:

```
$ bundle install --without production
```

Next, migrate the database:

```
$ rails db:migrate
```

Finally, run the test suite to verify that everything is working correctly:

```
$ rails test
```

If the test suite passes, seed the db with development data:

```
$ rails db:seed
```

Run the app in a local server:

```
$ rails server
```

Go to http://localhost:3000/ in your browser. Login to the app using `admin@example.com` and `password` . Enjoy!
