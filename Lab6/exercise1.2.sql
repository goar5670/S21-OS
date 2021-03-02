select store_id, sum(amount) as total from payment z inner join staff s on z.staff_id = s.staff_id
  group by store_id order by total desc
