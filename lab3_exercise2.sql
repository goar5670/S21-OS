CREATE OR REPLACE VIEW public.strygin_view
 AS
 SELECT customer.customer_id,
	customer.store_id,
	customer.first_name,
	customer.last_name,
	customer.email,
	customer.address_id,
	customer.activebool,
	customer.create_date,
	customer.last_update,
	customer.active
   FROM customer
  WHERE ((customer.last_name)::text ~~ 'S%'::text);

ALTER TABLE public.strygin_view
	OWNER TO dcnick3;

-- View: public.bl7aview

-- DROP VIEW public.bl7aview;

CREATE OR REPLACE VIEW public.bl7aview
 AS
 SELECT customer.customer_id,
	customer.store_id,
	customer.first_name,
	customer.last_name,
	customer.email,
	customer.address_id,
	customer.activebool,
	customer.create_date,
	customer.last_update,
	customer.active
   FROM customer
  WHERE ((customer.first_name)::text ~~ 'N%'::text);

ALTER TABLE public.bl7aview
	OWNER TO dcnick3;

-- Trigger

-- FUNCTION: public.remove_bad_guys()

-- DROP FUNCTION public.remove_bad_guys();

CREATE FUNCTION public.remove_bad_guys()
	RETURNS SETOF trigger
	LANGUAGE 'plpgsql'
	COST 100
	VOLATILE NOT LEAKPROOF
	ROWS 1
AS $BODY$
BEGIN
    IF NOT NEW.first_name LIKE 'Bad%' THEN
   	 RETURN NEW;
    END IF;
    RAISE 'NO BAD GUYS ALLOWED!!';
END;
$BODY$;

ALTER FUNCTION public.remove_bad_guys()

-- Trigger: remove_bad_guys

-- DROP TRIGGER remove_bad_guys ON public.customer;

CREATE TRIGGER remove_bad_guys
	BEFORE INSERT
	ON public.customer
	FOR EACH ROW
	EXECUTE PROCEDURE public.remove_bad_guys();

