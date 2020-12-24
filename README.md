# Sinatra MVC, REST, FORMS

Level of importance:
Flow -> Concept -> Syntax

Flow will lead into concepts which will lead into syntax.

## What is MVC ?

MVC Stands For: Models Views Controller

### What is the job of a controller?

- To Accept Requests.
- Relay the data.
- Communicate with Models.
- Alter / Delete Data.
- Send Documents to client.

### What is the job of a model?

- Represent data from a database.

### What is the job of a view?

- The HTML
- What the user looks at and interacts with.

## What are the 4 different http verbs we are going to use with Sinatra?

- GET
- POST
- PATCH
- DELETE

- (PUT) Optional but we're not gonna use it.

## What is REsT?

It's a convention for routing using all of CRUD (Create, Read, Update, Delete).

### What are the 7 different restful routes?

GET Routes

```
- index route - /games (list of games)
- show route - /games/:id (showing more information about a game)
- new route - /games/new (displaying a form to create a new game)
- edit route - /games/:id/edit (displaying a form to edit a game)
```

POST ROUTE

```
- create route - /games (creating a new game)
```

PATCH ROUTE

```
- update route - /games/:id (updating a previous game)
```

DELETE ROUTE

```
- delete route - /games/:id (deleting a previous game)
```

## What is the Sinatra Flow?

Request -> Controller -> Query / Insert database -> redirect / render (erb line)

## Models

## Game

- title
- release_date
- genre

belong to a user

## User

- username / email
- password_digest (encrypted (bcrypt))

has many games

## Sessions (cookies (not choc chip))
