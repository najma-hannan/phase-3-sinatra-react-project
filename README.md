# Phase 3 Project Guidelines

## Restful endpoint

 GET /books/ -- fetch list of all books
 POST /books/ -- create a new book (send with book details)
 GET /books/<book_id> -- Fetch single book with specified book_id
 PUT/PATCH /books/<book_id> -- Update book details for specified book
 DELETE /books/<book_id> -- Delete book with specified id.

## App Features

- CRUD for books -- track inventory levels
- CRUD for authors
- CRUD for users
- Users can add reviews to books
- User can purchase books

## Entity Description

 Author: id, name (unique),
 Book: id, title (unique), description, date_of_publication, image, quantity, price
 Author_Book : id, author_id, book_id
 User: id, name, email
 Review: id, user_id, book_id, rating, comment
 Order: id, user_id, created_at
 OrderItem: id, order_id, book_id, quantity, price

## Endpoints

- Books: Get all, get single,  (should include reviews for the single endpoint)
- Author: All crud
- User: All crud
- Create review: POST, PATCH
- Create Order: POST, GET SINGLE, GET LIST

## Milestones

- Created all domain model classes
- Created CRUD endpoints for the following:
  - Book
  - Author
  - User
  - Orders
  - Review
- [Optional] Create seed data for books, authors and user

## Migrations and Models

- [x] Create a relationship migration for author and books
- [x] Create migration for the following tables: orders, order_items, reviews
- [x] checkpoint commit "init migrations for entities"
- [x] Create the model classes for User, Author, Book, Review, Order, OrderItem
- [x] checkpoint commit "init model classes for entities"

## Books endpoints

- [ ] GET /books -- fetch a list of books
book record schema: all book attributes, author:
- [ ] POST /books -- create book record
input: <all book details without primary key (id)>, author_id
- [ ] GET /books/<id> -- fetch a book with the specified id
book records should includes a list of reviews
returns the newly created record with a HTTP status 201
- [ ] PUT /books/<id> -- update book details for the specified id
input: <book attributes>, author_id
- [ ] DELETE /books/<id> -- delete book with specified id
Returns HTTP status 204 - No Content

> Repeat the same for User, Author, Review, Orders
