Sprint 1:
User Functionality
/signup 
/login
/logout


1. Plan application

User
    authentication
    email/password
    unique emails
    many teams

Teams
    has_many Players

Teams
id       name       platform      user_id
1       Flyers         PC             1

Players
team_id       gamertag      name   
    1         Deadlock      James


/Teams/ => shows you your team
/teams/new
/teams/1 # show

/Teams/1/players #=> players resource
add players
edits players

/signup 
/login
/logout


-- Improvements to Corneal
1. removed env requirement from application controller
2. removed databas cleaner
3. unlocked all gem versions
4. removed thin
5. Check pending migrations -
ActiveRecord::Base.connection.migration_context.needs_migration?