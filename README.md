# Book Cellar API Server

Phase 3 Sinatra-React project frontend application source code. An web applicaiton that allows users to browse a library of books. The app enables the user to view a list of books, select a book and add to cart, to make an order, and purchase the items in the cart. The web application enables the user to add reviews on the various books and rate the books on a scale of one to five. The Web application allows a user to browse into a library of books from the comfort of there homes.

## Running the project locally

Clone the project locally in your machine:

```bash
git clone git@github.com:najma-hannan/phase-3-sinatra-react-project.git
```

Move into the project directory:

```bash
cd phase-3-sinatra-react-project
```

- Install dependencies `bundle install`
- Run migrations `bundle exec rake db:migrate`
- Start the API server `bundle exec rake server`

## App Features

- CRUD for books
- CRUD for authors
- CRUD for users
- Users can add reviews to books
- User can make an order of books

## Entity Description

 Author: id, name (unique),
 Book: id, title (unique), description, date_of_publication, image, quantity, price
 Author_Book : id, author_id, book_id
 User: id, name, email, password_hash, token
 Review: id, user_id, book_id, rating, comment
 Order: id, user_id, created_at
 OrderItem: id, order_id, book_id, quantity, price


## Languages and Tools Used

- Ruby
- SinatraAPI
- Active Record
- Postman

## Authors

- [Najma Mahat](https://github.com/najma-hanna)
