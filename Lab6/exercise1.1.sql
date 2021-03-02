select title, rating, category.name from film, film_category, category 
  where not exists(select 1 from rental, inventory
           where film.film_id = inventory.film_id and inventory.inventory_id = rental.inventory_id)
           and film.film_id = film_category.film_id
           and film_category.category_id = category.category_id
           and (category.name = 'Horror' or category.name = 'Sci-Fi')
           and (film.rating = 'R' or film.rating = 'PG-13')
