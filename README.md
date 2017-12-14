## Yelp Dish Api



# Endpoints/API calls

To see endpoint results sign in or create an account with Postman.
In the URI line put the following URIs:

* To get one page of meals:
  `GET 'http://localhost:3000/api/v1/meals'`
  * to get other pages add `?page={page number}` to the end of the URI
* To get a singular meal:
  `GET 'http://localhost:3000/api/v1/meals/{meal_id}'`
* To get meal by search query:
  `GET 'http://localhost:3000/api/v1/meals/'`
  Params key: dish, drink, or rating
         values: string, string, or number
* To get a meal's review:
  `GET 'http://localhost:3000/api/v1/meals/{meal_id}/reviews'`
* To get a meal's review by a specific key:
  `GET 'http://localhost:3000/api/v1/meals/{meal_id}/reviews'`
  Params key: author
         values: string
* To add a meal:
  `POST 'http://localhost:3000/api/v1/meals/`
  Params key: dish, drink, or rating
         values: string, string, or number
* To add a meal's review:
  `POST 'http://localhost:3000/api/v1/meals/{meal_id}/reviews`
  Params key: author, content
         values: string, string
* To update a meal:
  `PUT 'http://localhost:3000/api/v1/meals/{meal_id}`
  (add the key param of what you wish to change)
  Params key: author, content
         values: string, string
* To update a meal's review:
  `PUT 'http://localhost:3000/api/v1/meals/{meal_id}/reviews`
  (add the key param of what you wish to change)
  Params key: author, content
        values: string, string
* To delete a meal:
  `DELETE 'http://localhost:3000/api/v1/meals/{meal_id}`
* To delete a meal's review:
  `DELETE 'http://localhost:3000/api/v1/meals/{meal_id}/reviews/{review_id}`
