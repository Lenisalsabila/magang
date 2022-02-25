--
-- PostgreSQL database dump
--

-- Dumped from database version 10.10
-- Dumped by pg_dump version 10.10

-- Started on 2022-01-17 15:57:44 WIB

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12964)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 3191 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- TOC entry 2 (class 3079 OID 611844)
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- TOC entry 3192 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


--
-- TOC entry 635 (class 1247 OID 611857)
-- Name: cart_product; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.cart_product AS (
	product_id integer,
	name character varying(50),
	price numeric(10,2),
	quantity integer,
	subtotal numeric(10,2)
);


ALTER TYPE public.cart_product OWNER TO postgres;

--
-- TOC entry 638 (class 1247 OID 611860)
-- Name: cart_saved_product; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.cart_saved_product AS (
	product_id integer,
	name character varying(50),
	price numeric(10,2)
);


ALTER TYPE public.cart_saved_product OWNER TO postgres;

--
-- TOC entry 720 (class 1247 OID 611863)
-- Name: category_details; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.category_details AS (
	name character varying(50),
	description character varying(1000)
);


ALTER TYPE public.category_details OWNER TO postgres;

--
-- TOC entry 723 (class 1247 OID 611866)
-- Name: category_list; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.category_list AS (
	category_id integer,
	name character varying(50)
);


ALTER TYPE public.category_list OWNER TO postgres;

--
-- TOC entry 726 (class 1247 OID 611869)
-- Name: category_product; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.category_product AS (
	product_id integer,
	name character varying(50),
	description character varying(1000),
	price numeric(10,2),
	discounted_price numeric(10,2)
);


ALTER TYPE public.category_product OWNER TO postgres;

--
-- TOC entry 729 (class 1247 OID 611872)
-- Name: customer_list; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.customer_list AS (
	customer_id integer,
	name character varying(50)
);


ALTER TYPE public.customer_list OWNER TO postgres;

--
-- TOC entry 732 (class 1247 OID 611875)
-- Name: customer_login_info; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.customer_login_info AS (
	customer_id integer,
	password character varying(50)
);


ALTER TYPE public.customer_login_info OWNER TO postgres;

--
-- TOC entry 735 (class 1247 OID 611878)
-- Name: department_category; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.department_category AS (
	category_id integer,
	name character varying(50),
	description character varying(1000)
);


ALTER TYPE public.department_category OWNER TO postgres;

--
-- TOC entry 738 (class 1247 OID 611881)
-- Name: department_details; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.department_details AS (
	name character varying(50),
	description character varying(1000)
);


ALTER TYPE public.department_details OWNER TO postgres;

--
-- TOC entry 741 (class 1247 OID 611884)
-- Name: department_list; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.department_list AS (
	department_id integer,
	name character varying(50)
);


ALTER TYPE public.department_list OWNER TO postgres;

--
-- TOC entry 744 (class 1247 OID 611887)
-- Name: order_details; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.order_details AS (
	order_id integer,
	product_id integer,
	product_name character varying(50),
	quantity integer,
	unit_cost numeric(10,2),
	subtotal numeric(10,2)
);


ALTER TYPE public.order_details OWNER TO postgres;

--
-- TOC entry 747 (class 1247 OID 611890)
-- Name: order_info; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.order_info AS (
	order_id integer,
	total_amount numeric(10,2),
	created_on timestamp without time zone,
	shipped_on timestamp without time zone,
	status character varying(9),
	comments character varying(255),
	customer_id integer,
	auth_code character varying(50),
	reference character varying(50),
	shipping_id integer,
	shipping_type character varying(100),
	shipping_cost numeric(10,2),
	tax_id integer,
	tax_type character varying(100),
	tax_percentage numeric(10,2)
);


ALTER TYPE public.order_info OWNER TO postgres;

--
-- TOC entry 750 (class 1247 OID 611893)
-- Name: order_short_details; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.order_short_details AS (
	order_id integer,
	total_amount numeric(10,2),
	created_on timestamp without time zone,
	shipped_on timestamp without time zone,
	status integer,
	customer_name character varying(50)
);


ALTER TYPE public.order_short_details OWNER TO postgres;

--
-- TOC entry 753 (class 1247 OID 611896)
-- Name: product_category_details; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.product_category_details AS (
	category_id integer,
	department_id integer,
	name character varying(50)
);


ALTER TYPE public.product_category_details OWNER TO postgres;

--
-- TOC entry 756 (class 1247 OID 611899)
-- Name: product_details; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.product_details AS (
	product_id integer,
	name character varying(50),
	description character varying(1000),
	price numeric(10,2),
	discounted_price numeric(10,2),
	image character varying(150)
);


ALTER TYPE public.product_details OWNER TO postgres;

--
-- TOC entry 759 (class 1247 OID 611902)
-- Name: product_info; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.product_info AS (
	name character varying(50),
	image character varying(150),
	thumbnail character varying(150),
	display smallint
);


ALTER TYPE public.product_info OWNER TO postgres;

--
-- TOC entry 762 (class 1247 OID 611905)
-- Name: product_list; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.product_list AS (
	product_id integer,
	name character varying(50),
	description character varying(1000),
	price numeric(10,2),
	discounted_price numeric(10,2),
	thumbnail character varying(150)
);


ALTER TYPE public.product_list OWNER TO postgres;

--
-- TOC entry 765 (class 1247 OID 611908)
-- Name: product_recommendation; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.product_recommendation AS (
	product_id integer,
	name character varying(50),
	description character varying(1000)
);


ALTER TYPE public.product_recommendation OWNER TO postgres;

--
-- TOC entry 768 (class 1247 OID 611911)
-- Name: review_info; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.review_info AS (
	customer_name character varying(50),
	review text,
	rating smallint,
	created_on timestamp without time zone
);


ALTER TYPE public.review_info OWNER TO postgres;

--
-- TOC entry 254 (class 1255 OID 611912)
-- Name: catalog_add_category(integer, character varying, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.catalog_add_category(integer, character varying, character varying) RETURNS void
    LANGUAGE plpgsql
    AS $_$
  DECLARE
    inDepartmentId ALIAS FOR $1;
    inName         ALIAS FOR $2;
    inDescription  ALIAS FOR $3;
  BEGIN
    INSERT INTO category (department_id, name, description)
           VALUES (inDepartmentId, inName, inDescription);
  END;
$_$;


ALTER FUNCTION public.catalog_add_category(integer, character varying, character varying) OWNER TO postgres;

--
-- TOC entry 255 (class 1255 OID 611913)
-- Name: catalog_add_department(character varying, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.catalog_add_department(character varying, character varying) RETURNS void
    LANGUAGE plpgsql
    AS $_$
  DECLARE
    inName        ALIAS FOR $1;
    inDescription ALIAS FOR $2;
  BEGIN
    INSERT INTO department (name, description)
           VALUES (inName, inDescription);
  END;
$_$;


ALTER FUNCTION public.catalog_add_department(character varying, character varying) OWNER TO postgres;

--
-- TOC entry 258 (class 1255 OID 611914)
-- Name: catalog_add_product_to_category(integer, character varying, character varying, numeric); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.catalog_add_product_to_category(integer, character varying, character varying, numeric) RETURNS void
    LANGUAGE plpgsql
    AS $_$
  DECLARE
    inCategoryId  ALIAS FOR $1;
    inName        ALIAS FOR $2;
    inDescription ALIAS FOR $3;
    inPrice       ALIAS FOR $4;
    productLastInsertId INTEGER;
  BEGIN
    INSERT INTO product (name, description, price, image, thumbnail,
                         search_vector)
           VALUES (inName, inDescription, inPrice, 'generic.jpg',
                   'generic.thumb.jpg',
                   (setweight(to_tsvector(inName), 'A')
                    || to_tsvector(inDescription)));
    SELECT INTO productLastInsertId currval('product_product_id_seq');
    INSERT INTO product_category (product_id, category_id)
           VALUES (productLastInsertId, inCategoryId);
  END;
$_$;


ALTER FUNCTION public.catalog_add_product_to_category(integer, character varying, character varying, numeric) OWNER TO postgres;

--
-- TOC entry 271 (class 1255 OID 611915)
-- Name: catalog_assign_product_to_category(integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.catalog_assign_product_to_category(integer, integer) RETURNS void
    LANGUAGE plpgsql
    AS $_$
  DECLARE
    inProductId  ALIAS FOR $1;
    inCategoryId ALIAS FOR $2;
  BEGIN
    INSERT INTO product_category (product_id, category_id)
           VALUES (inProductId, inCategoryId);
  END;
$_$;


ALTER FUNCTION public.catalog_assign_product_to_category(integer, integer) OWNER TO postgres;

--
-- TOC entry 272 (class 1255 OID 611916)
-- Name: catalog_count_products_in_category(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.catalog_count_products_in_category(integer) RETURNS integer
    LANGUAGE plpgsql
    AS $_$
  DECLARE
    inCategoryId ALIAS FOR $1;
    outCategoriesCount INTEGER;
  BEGIN
    SELECT     INTO outCategoriesCount
               count(*)
    FROM       product p
    INNER JOIN product_category pc
                 ON p.product_id = pc.product_id
    WHERE      pc.category_id = inCategoryId;
    RETURN outCategoriesCount;
  END;
$_$;


ALTER FUNCTION public.catalog_count_products_in_category(integer) OWNER TO postgres;

--
-- TOC entry 256 (class 1255 OID 611917)
-- Name: catalog_count_products_on_catalog(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.catalog_count_products_on_catalog() RETURNS integer
    LANGUAGE plpgsql
    AS $$
  DECLARE
    outProductsOnCatalogCount INTEGER;
  BEGIN
      SELECT INTO outProductsOnCatalogCount
             count(*)
      FROM   product
      WHERE  display = 1 OR display = 3;
      RETURN outProductsOnCatalogCount;
  END;
$$;


ALTER FUNCTION public.catalog_count_products_on_catalog() OWNER TO postgres;

--
-- TOC entry 273 (class 1255 OID 611918)
-- Name: catalog_count_products_on_department(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.catalog_count_products_on_department(integer) RETURNS integer
    LANGUAGE plpgsql
    AS $_$
  DECLARE
    inDepartmentId ALIAS FOR $1;
    outProductsOnDepartmentCount INTEGER;
  BEGIN
    SELECT DISTINCT INTO outProductsOnDepartmentCount
                    count(*)
    FROM            product p
    INNER JOIN      product_category pc
                      ON p.product_id = pc.product_id
    INNER JOIN      category c
                      ON pc.category_id = c.category_id
    WHERE           (p.display = 2 OR p.display = 3)
                    AND c.department_id = inDepartmentId;
    RETURN outProductsOnDepartmentCount;
  END;
$_$;


ALTER FUNCTION public.catalog_count_products_on_department(integer) OWNER TO postgres;

--
-- TOC entry 274 (class 1255 OID 611919)
-- Name: catalog_count_search_result(text[], character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.catalog_count_search_result(text[], character varying) RETURNS integer
    LANGUAGE plpgsql
    AS $_$
  DECLARE
    -- inWords is an array with the words from user's search string
    inWords    ALIAS FOR $1;

    -- inAllWords is 'on' for all-words searches
    -- and 'off' for any-words searches
    inAllWords ALIAS FOR $2;

    outSearchResultCount INTEGER;
    query                TEXT;
    search_operator      VARCHAR(1);
  BEGIN
    -- Initialize query with an empty string
    query := '';
    -- Establish the operator to be used when preparing the search string
    IF inAllWords = 'on' THEN
      search_operator := '&';
    ELSE
      search_operator := '|';
    END IF;

    -- Compose the search string
    FOR i IN array_lower(inWords, 1)..array_upper(inWords, 1) LOOP
      IF i = array_upper(inWords, 1) THEN
        query := query || inWords[i];
      ELSE
        query := query || inWords[i] || search_operator;
      END IF;
    END LOOP;

    -- Return the number of matches
    SELECT INTO outSearchResultCount
           count(*)
    FROM   product,
           to_tsquery(query) AS query_string
    WHERE  search_vector @@ query_string;
    RETURN outSearchResultCount;
  END;
$_$;


ALTER FUNCTION public.catalog_count_search_result(text[], character varying) OWNER TO postgres;

--
-- TOC entry 275 (class 1255 OID 611920)
-- Name: catalog_create_product_review(integer, integer, text, smallint); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.catalog_create_product_review(integer, integer, text, smallint) RETURNS void
    LANGUAGE plpgsql
    AS $_$
  DECLARE
    inCustomerId ALIAS FOR $1;
    inProductId  ALIAS FOR $2;
    inReview     ALIAS FOR $3;
    inRating     ALIAS FOR $4;
  BEGIN
    INSERT INTO review (customer_id, product_id, review, rating, created_on)
           VALUES (inCustomerId, inProductId, inReview, inRating, NOW());
  END;
$_$;


ALTER FUNCTION public.catalog_create_product_review(integer, integer, text, smallint) OWNER TO postgres;

--
-- TOC entry 276 (class 1255 OID 611921)
-- Name: catalog_delete_category(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.catalog_delete_category(integer) RETURNS smallint
    LANGUAGE plpgsql
    AS $_$
  DECLARE
    inCategoryId ALIAS FOR $1;
    productCategoryRowsCount INTEGER;
  BEGIN
    SELECT      INTO productCategoryRowsCount
                count(*)
    FROM        product p
    INNER JOIN  product_category pc
                  ON p.product_id = pc.product_id
    WHERE       pc.category_id = inCategoryId;
    IF productCategoryRowsCount = 0 THEN
      DELETE FROM category WHERE category_id = inCategoryId;
      RETURN 1;
    END IF;
    RETURN -1;
  END;
$_$;


ALTER FUNCTION public.catalog_delete_category(integer) OWNER TO postgres;

--
-- TOC entry 277 (class 1255 OID 611922)
-- Name: catalog_delete_department(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.catalog_delete_department(integer) RETURNS smallint
    LANGUAGE plpgsql
    AS $_$
  DECLARE
    inDepartmentId ALIAS FOR $1;
    categoryRowsCount INTEGER;
  BEGIN
    SELECT INTO categoryRowsCount
           count(*)
    FROM   category
    WHERE  department_id = inDepartmentId;
    IF categoryRowsCount = 0 THEN
      DELETE FROM department WHERE department_id = inDepartmentId;
      RETURN 1;
    END IF;
    RETURN -1;
  END;
$_$;


ALTER FUNCTION public.catalog_delete_department(integer) OWNER TO postgres;

--
-- TOC entry 278 (class 1255 OID 611923)
-- Name: catalog_delete_product(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.catalog_delete_product(integer) RETURNS void
    LANGUAGE plpgsql
    AS $_$
  DECLARE
    inProductId ALIAS FOR $1;
  BEGIN
    DELETE FROM product_category WHERE product_id = inProductId;
    DELETE FROM shopping_cart WHERE product_id = inProductId;
    DELETE FROM product WHERE product_id = inProductId;
  END;
$_$;


ALTER FUNCTION public.catalog_delete_product(integer) OWNER TO postgres;

--
-- TOC entry 279 (class 1255 OID 611924)
-- Name: catalog_flag_stop_words(text[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.catalog_flag_stop_words(text[]) RETURNS SETOF smallint
    LANGUAGE plpgsql
    AS $_$
  DECLARE
    inWords ALIAS FOR $1;
    outFlag SMALLINT;
    query   TEXT;
  BEGIN
    FOR i IN array_lower(inWords, 1)..array_upper(inWords, 1) LOOP
      SELECT INTO query
             to_tsquery(inWords[i]);
      IF query = '' THEN
        outFlag := 1;
      ELSE
        outFlag := 0;
      END IF;
      RETURN NEXT outFlag;
    END LOOP;
  END;
$_$;


ALTER FUNCTION public.catalog_flag_stop_words(text[]) OWNER TO postgres;

--
-- TOC entry 280 (class 1255 OID 611925)
-- Name: catalog_get_categories(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.catalog_get_categories() RETURNS SETOF public.department_category
    LANGUAGE plpgsql
    AS $$
  DECLARE
    outDepartmentCategoryRow department_category;
  BEGIN
    FOR outDepartmentCategoryRow IN
      SELECT   category_id, name, description
      FROM     category
      ORDER BY category_id
    LOOP
      RETURN NEXT outDepartmentCategoryRow;
    END LOOP;
  END;
$$;


ALTER FUNCTION public.catalog_get_categories() OWNER TO postgres;

--
-- TOC entry 281 (class 1255 OID 611926)
-- Name: catalog_get_categories_for_product(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.catalog_get_categories_for_product(integer) RETURNS SETOF public.product_category_details
    LANGUAGE plpgsql
    AS $_$
  DECLARE
    inProductId ALIAS FOR $1;
    outProductCategoryDetailsRow product_category_details;
  BEGIN
    FOR outProductCategoryDetailsRow IN
      SELECT   c.category_id, c.department_id, c.name
      FROM     category c
      JOIN     product_category pc
                 ON c.category_id = pc.category_id
      WHERE    pc.product_id = inProductId
      ORDER BY category_id
    LOOP
      RETURN NEXT outProductCategoryDetailsRow;
    END LOOP;
  END;
$_$;


ALTER FUNCTION public.catalog_get_categories_for_product(integer) OWNER TO postgres;

--
-- TOC entry 282 (class 1255 OID 611927)
-- Name: catalog_get_categories_list(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.catalog_get_categories_list(integer) RETURNS SETOF public.category_list
    LANGUAGE plpgsql
    AS $_$
  DECLARE
    inDepartmentId ALIAS FOR $1;
    outCategoryListRow category_list;
  BEGIN
    FOR outCategoryListRow IN
      SELECT   category_id, name
      FROM     category
      WHERE    department_id = inDepartmentId
      ORDER BY category_id
    LOOP
      RETURN NEXT outCategoryListRow;
    END LOOP;
  END;
$_$;


ALTER FUNCTION public.catalog_get_categories_list(integer) OWNER TO postgres;

--
-- TOC entry 283 (class 1255 OID 611928)
-- Name: catalog_get_category_details(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.catalog_get_category_details(integer) RETURNS public.category_details
    LANGUAGE plpgsql
    AS $_$
  DECLARE
    inCategoryId ALIAS FOR $1;
    outCategoryDetailsRow category_details;
  BEGIN
    SELECT INTO outCategoryDetailsRow
           name, description
    FROM   category
    WHERE  category_id = inCategoryId;
    RETURN outCategoryDetailsRow;
  END;
$_$;


ALTER FUNCTION public.catalog_get_category_details(integer) OWNER TO postgres;

--
-- TOC entry 284 (class 1255 OID 611929)
-- Name: catalog_get_category_products(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.catalog_get_category_products(integer) RETURNS SETOF public.category_product
    LANGUAGE plpgsql
    AS $_$
  DECLARE
    inCategoryId ALIAS FOR $1;
    outCategoryProductRow category_product;
  BEGIN
    FOR outCategoryProductRow IN
      SELECT     p.product_id, p.name, p.description, p.price,
                 p.discounted_price
      FROM       product p
      INNER JOIN product_category pc
                   ON p.product_id = pc.product_id
      WHERE      pc.category_id = inCategoryId
      ORDER BY   p.product_id
    LOOP
      RETURN NEXT outCategoryProductRow;
    END LOOP;
  END;
$_$;


ALTER FUNCTION public.catalog_get_category_products(integer) OWNER TO postgres;

--
-- TOC entry 285 (class 1255 OID 611930)
-- Name: catalog_get_department_categories(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.catalog_get_department_categories(integer) RETURNS SETOF public.department_category
    LANGUAGE plpgsql
    AS $_$
  DECLARE
    inDepartmentId ALIAS FOR $1;
    outDepartmentCategoryRow department_category;
  BEGIN
    FOR outDepartmentCategoryRow IN
      SELECT   category_id, name, description
      FROM     category
      WHERE    department_id = inDepartmentId
      ORDER BY category_id
    LOOP
      RETURN NEXT outDepartmentCategoryRow;
    END LOOP;
  END;
$_$;


ALTER FUNCTION public.catalog_get_department_categories(integer) OWNER TO postgres;

--
-- TOC entry 257 (class 1255 OID 611931)
-- Name: catalog_get_department_details(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.catalog_get_department_details(integer) RETURNS public.department_details
    LANGUAGE plpgsql
    AS $_$
  DECLARE
    inDepartmentId ALIAS FOR $1;
    outDepartmentDetailsRow department_details;
  BEGIN
    SELECT INTO outDepartmentDetailsRow
           name, description
    FROM   department
    WHERE  department_id = inDepartmentId;
    RETURN outDepartmentDetailsRow;
  END;
$_$;


ALTER FUNCTION public.catalog_get_department_details(integer) OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 216 (class 1259 OID 611932)
-- Name: department; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.department (
    department_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description character varying(1000)
);


ALTER TABLE public.department OWNER TO postgres;

--
-- TOC entry 286 (class 1255 OID 611938)
-- Name: catalog_get_departments(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.catalog_get_departments() RETURNS SETOF public.department
    LANGUAGE plpgsql
    AS $$
  DECLARE
    outDepartmentRow department;
  BEGIN
    FOR outDepartmentRow IN
      SELECT   department_id, name, description
      FROM     department
      ORDER BY department_id
    LOOP
      RETURN NEXT outDepartmentRow;
    END LOOP;
  END;
$$;


ALTER FUNCTION public.catalog_get_departments() OWNER TO postgres;

--
-- TOC entry 287 (class 1255 OID 611939)
-- Name: catalog_get_departments_list(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.catalog_get_departments_list() RETURNS SETOF public.department_list
    LANGUAGE plpgsql
    AS $$
  DECLARE
    outDepartmentListRow department_list;
  BEGIN
    FOR outDepartmentListRow IN
      SELECT department_id, name 
      FROM department 
      ORDER BY department_id
    LOOP
      RETURN NEXT outDepartmentListRow;
    END LOOP;
  END;
$$;


ALTER FUNCTION public.catalog_get_departments_list() OWNER TO postgres;

--
-- TOC entry 288 (class 1255 OID 611940)
-- Name: catalog_get_product_details(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.catalog_get_product_details(integer) RETURNS public.product_details
    LANGUAGE plpgsql
    AS $_$
  DECLARE
    inProductId ALIAS FOR $1;
    outProductDetailsRow product_details;
  BEGIN
    SELECT INTO outProductDetailsRow
           product_id, name, description,
           price, discounted_price, image
    FROM   product
    WHERE  product_id = inProductId;
    RETURN outProductDetailsRow;
  END;
$_$;


ALTER FUNCTION public.catalog_get_product_details(integer) OWNER TO postgres;

--
-- TOC entry 289 (class 1255 OID 611941)
-- Name: catalog_get_product_info(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.catalog_get_product_info(integer) RETURNS public.product_info
    LANGUAGE plpgsql
    AS $_$
  DECLARE
    inProductId ALIAS FOR $1;
    outProductInfoRow product_info;
  BEGIN
    SELECT INTO outProductInfoRow
           name, image, thumbnail, display
    FROM   product
    WHERE  product_id = inProductId;
    RETURN outProductInfoRow;
  END;
$_$;


ALTER FUNCTION public.catalog_get_product_info(integer) OWNER TO postgres;

--
-- TOC entry 290 (class 1255 OID 611942)
-- Name: catalog_get_product_reviews(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.catalog_get_product_reviews(integer) RETURNS SETOF public.review_info
    LANGUAGE plpgsql
    AS $_$
  DECLARE
    inProductId ALIAS FOR $1;
    outReviewInfoRow review_info;
  BEGIN
    FOR outReviewInfoRow IN
      SELECT     c.name, r.review, r.rating, r.created_on
      FROM       review r
      INNER JOIN customer c
                   ON c.customer_id = r.customer_id
      WHERE      r.product_id = inProductId
      ORDER BY   r.created_on DESC
    LOOP
      RETURN NEXT outReviewInfoRow;
    END LOOP;
  END;
$_$;


ALTER FUNCTION public.catalog_get_product_reviews(integer) OWNER TO postgres;

--
-- TOC entry 291 (class 1255 OID 611943)
-- Name: catalog_get_products_in_category(integer, integer, integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.catalog_get_products_in_category(integer, integer, integer, integer) RETURNS SETOF public.product_list
    LANGUAGE plpgsql
    AS $_$
  DECLARE
    inCategoryId                    ALIAS FOR $1;
    inShortProductDescriptionLength ALIAS FOR $2;
    inProductsPerPage               ALIAS FOR $3;
    inStartItem                     ALIAS FOR $4;
    outProductListRow product_list;
  BEGIN
    FOR outProductListRow IN
      SELECT     p.product_id, p.name, p.description, p.price,
                 p.discounted_price, p.thumbnail
      FROM       product p
      INNER JOIN product_category pc
                   ON p.product_id = pc.product_id
      WHERE      pc.category_id = inCategoryId
      ORDER BY   p.product_id
      LIMIT      inProductsPerPage
      OFFSET     inStartItem
    LOOP
      IF char_length(outProductListRow.description) > 
         inShortProductDescriptionLength THEN
        outProductListRow.description :=
          substring(outProductListRow.description, 1,
                    inShortProductDescriptionLength) || '...';
      END IF;
      RETURN NEXT outProductListRow;
    END LOOP;
  END;
$_$;


ALTER FUNCTION public.catalog_get_products_in_category(integer, integer, integer, integer) OWNER TO postgres;

--
-- TOC entry 292 (class 1255 OID 611944)
-- Name: catalog_get_products_on_catalog(integer, integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.catalog_get_products_on_catalog(integer, integer, integer) RETURNS SETOF public.product_list
    LANGUAGE plpgsql
    AS $_$
  DECLARE
    inShortProductDescriptionLength ALIAS FOR $1;
    inProductsPerPage               ALIAS FOR $2;
    inStartItem                     ALIAS FOR $3;
    outProductListRow product_list;
  BEGIN
    FOR outProductListRow IN
      SELECT   product_id, name, description, price,
               discounted_price, thumbnail
      FROM     product
      WHERE    display = 1 OR display = 3
      ORDER BY product_id
      LIMIT    inProductsPerPage
      OFFSET   inStartItem
    LOOP
      IF char_length(outProductListRow.description) >
         inShortProductDescriptionLength THEN
        outProductListRow.description :=
          substring(outProductListRow.description, 1,
                    inShortProductDescriptionLength) || '...';
      END IF;
      RETURN NEXT outProductListRow;
    END LOOP;
  END;
$_$;


ALTER FUNCTION public.catalog_get_products_on_catalog(integer, integer, integer) OWNER TO postgres;

--
-- TOC entry 293 (class 1255 OID 611945)
-- Name: catalog_get_products_on_department(integer, integer, integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.catalog_get_products_on_department(integer, integer, integer, integer) RETURNS SETOF public.product_list
    LANGUAGE plpgsql
    AS $_$
  DECLARE
    inDepartmentId                  ALIAS FOR $1;
    inShortProductDescriptionLength ALIAS FOR $2;
    inProductsPerPage               ALIAS FOR $3;
    inStartItem                     ALIAS FOR $4;
    outProductListRow product_list;
  BEGIN
    FOR outProductListRow IN
      SELECT DISTINCT p.product_id, p.name, p.description, p.price,
                      p.discounted_price, p.thumbnail
      FROM            product p
      INNER JOIN      product_category pc
                        ON p.product_id = pc.product_id
      INNER JOIN      category c
                        ON pc.category_id = c.category_id
      WHERE           (p.display = 2 OR p.display = 3)
                      AND c.department_id = inDepartmentId
      ORDER BY        p.product_id
      LIMIT           inProductsPerPage
      OFFSET          inStartItem
    LOOP
      IF char_length(outProductListRow.description) > 
         inShortProductDescriptionLength THEN
        outProductListRow.description :=
          substring(outProductListRow.description, 1,
                    inShortProductDescriptionLength) || '...';
      END IF;
      RETURN NEXT outProductListRow;
    END LOOP;
  END;
$_$;


ALTER FUNCTION public.catalog_get_products_on_department(integer, integer, integer, integer) OWNER TO postgres;

--
-- TOC entry 294 (class 1255 OID 611946)
-- Name: catalog_get_recommendations(integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.catalog_get_recommendations(integer, integer) RETURNS SETOF public.product_recommendation
    LANGUAGE plpgsql
    AS $_$
  DECLARE
    inProductId                     ALIAS FOR $1;
    inShortProductDescriptionLength ALIAS FOR $2;
    outProductRecommendationRow product_recommendation;
  BEGIN
    FOR outProductRecommendationRow IN
      SELECT product_id, name, description
      FROM   product
      WHERE  product_id IN
            (SELECT   od2.product_id
             FROM     order_detail od1
             JOIN     order_detail od2
                        ON od1.order_id = od2.order_id
             WHERE    od1.product_id = inProductId
                      AND od2.product_id != inProductId
             GROUP BY od2.product_id
             ORDER BY COUNT(od2.product_id) DESC
             LIMIT    5)
    LOOP
      IF char_length(outProductRecommendationRow.description) >
         inShortProductDescriptionLength THEN
        outProductRecommendationRow.description :=
          substring(outProductRecommendationRow.description, 1,
                    inShortProductDescriptionLength) || '...';
      END IF;
      RETURN NEXT outProductRecommendationRow;
    END LOOP;
  END;
$_$;


ALTER FUNCTION public.catalog_get_recommendations(integer, integer) OWNER TO postgres;

--
-- TOC entry 295 (class 1255 OID 611947)
-- Name: catalog_move_product_to_category(integer, integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.catalog_move_product_to_category(integer, integer, integer) RETURNS void
    LANGUAGE plpgsql
    AS $_$
  DECLARE
    inProductId        ALIAS FOR $1;
    inSourceCategoryId ALIAS FOR $2;
    inTargetCategoryId ALIAS FOR $3;
  BEGIN
    UPDATE product_category
    SET    category_id = inTargetCategoryId
    WHERE  product_id = inProductId
           AND category_id = inSourceCategoryId;
  END;
$_$;


ALTER FUNCTION public.catalog_move_product_to_category(integer, integer, integer) OWNER TO postgres;

--
-- TOC entry 296 (class 1255 OID 611948)
-- Name: catalog_remove_product_from_category(integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.catalog_remove_product_from_category(integer, integer) RETURNS smallint
    LANGUAGE plpgsql
    AS $_$
  DECLARE
    inProductId  ALIAS FOR $1;
    inCategoryId ALIAS FOR $2;
    productCategoryRowsCount INTEGER;
  BEGIN
    SELECT INTO productCategoryRowsCount
           count(*)
    FROM   product_category
    WHERE  product_id = inProductId;
    IF productCategoryRowsCount = 1 THEN
      PERFORM catalog_delete_product(inProductId);
      RETURN 0;
    END IF;
    DELETE FROM product_category
    WHERE  category_id = inCategoryId AND product_id = inProductId;
    RETURN 1;
  END;
$_$;


ALTER FUNCTION public.catalog_remove_product_from_category(integer, integer) OWNER TO postgres;

--
-- TOC entry 297 (class 1255 OID 611949)
-- Name: catalog_search(text[], character varying, integer, integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.catalog_search(text[], character varying, integer, integer, integer) RETURNS SETOF public.product_list
    LANGUAGE plpgsql
    AS $_$
  DECLARE
    inWords                         ALIAS FOR $1;
    inAllWords                      ALIAS FOR $2;
    inShortProductDescriptionLength ALIAS FOR $3;
    inProductsPerPage               ALIAS FOR $4;
    inStartPage                     ALIAS FOR $5;
    outProductListRow product_list;
    query             TEXT;
    search_operator   VARCHAR(1);
    query_string      TSQUERY;
  BEGIN
    -- Initialize query with an empty string
    query := '';
    -- All-words or Any-words?
    IF inAllWords = 'on' THEN
      search_operator := '&';
    ELSE
      search_operator := '|';
    END IF;

    -- Compose the search string
    FOR i IN array_lower(inWords, 1)..array_upper(inWords, 1) LOOP
      IF i = array_upper(inWords, 1) THEN
        query := query||inWords[i];
      ELSE
        query := query||inWords[i]||search_operator;
      END IF;
    END LOOP;
    query_string := to_tsquery(query);

    -- Return the search results
    FOR outProductListRow IN
      SELECT   product_id, name, description, price,
               discounted_price, thumbnail
      FROM     product
      WHERE    search_vector @@ query_string
      ORDER BY rank(search_vector, query_string) DESC
      LIMIT    inProductsPerPage
      OFFSET   inStartPage
    LOOP
      IF char_length(outProductListRow.description) >
         inShortProductDescriptionLength THEN
        outProductListRow.description :=
          substring(outProductListRow.description, 1,
                    inShortProductDescriptionLength) || '...';
      END IF;
      RETURN NEXT outProductListRow;
    END LOOP;
  END;
$_$;


ALTER FUNCTION public.catalog_search(text[], character varying, integer, integer, integer) OWNER TO postgres;

--
-- TOC entry 298 (class 1255 OID 611950)
-- Name: catalog_set_image(integer, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.catalog_set_image(integer, character varying) RETURNS void
    LANGUAGE plpgsql
    AS $_$
  DECLARE
    inProductId ALIAS FOR $1;
    inImage     ALIAS FOR $2;
  BEGIN
    UPDATE product SET image = inImage WHERE product_id = inProductId;
  END;
$_$;


ALTER FUNCTION public.catalog_set_image(integer, character varying) OWNER TO postgres;

--
-- TOC entry 299 (class 1255 OID 611951)
-- Name: catalog_set_product_display_option(integer, smallint); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.catalog_set_product_display_option(integer, smallint) RETURNS void
    LANGUAGE plpgsql
    AS $_$
  DECLARE
    inProductId ALIAS FOR $1;
    inDisplay   ALIAS FOR $2;
  BEGIN
    UPDATE product SET display = inDisplay WHERE product_id = inProductId;
  END;
$_$;


ALTER FUNCTION public.catalog_set_product_display_option(integer, smallint) OWNER TO postgres;

--
-- TOC entry 300 (class 1255 OID 611952)
-- Name: catalog_set_thumbnail(integer, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.catalog_set_thumbnail(integer, character varying) RETURNS void
    LANGUAGE plpgsql
    AS $_$
  DECLARE
    inProductId ALIAS FOR $1;
    inThumbnail ALIAS FOR $2;
  BEGIN
    UPDATE product
    SET    thumbnail = inThumbnail
    WHERE  product_id = inProductId;
  END;
$_$;


ALTER FUNCTION public.catalog_set_thumbnail(integer, character varying) OWNER TO postgres;

--
-- TOC entry 301 (class 1255 OID 611953)
-- Name: catalog_update_category(integer, character varying, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.catalog_update_category(integer, character varying, character varying) RETURNS void
    LANGUAGE plpgsql
    AS $_$
  DECLARE
    inCategoryId  ALIAS FOR $1;
    inName        ALIAS FOR $2;
    inDescription ALIAS FOR $3;
  BEGIN
    UPDATE category
    SET    name = inName, description = inDescription
    WHERE  category_id = inCategoryId;
  END;
$_$;


ALTER FUNCTION public.catalog_update_category(integer, character varying, character varying) OWNER TO postgres;

--
-- TOC entry 302 (class 1255 OID 611954)
-- Name: catalog_update_department(integer, character varying, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.catalog_update_department(integer, character varying, character varying) RETURNS void
    LANGUAGE plpgsql
    AS $_$
  DECLARE
    inDepartmentId ALIAS FOR $1;
    inName         ALIAS FOR $2;
    inDescription  ALIAS FOR $3;
  BEGIN
    UPDATE department
    SET    name = inName, description = inDescription
    WHERE  department_id = inDepartmentId;
  END;
$_$;


ALTER FUNCTION public.catalog_update_department(integer, character varying, character varying) OWNER TO postgres;

--
-- TOC entry 303 (class 1255 OID 611955)
-- Name: catalog_update_product(integer, character varying, character varying, numeric, numeric); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.catalog_update_product(integer, character varying, character varying, numeric, numeric) RETURNS void
    LANGUAGE plpgsql
    AS $_$
  DECLARE
    inProductId       ALIAS FOR $1;
    inName            ALIAS FOR $2;
    inDescription     ALIAS FOR $3;
    inPrice           ALIAS FOR $4;
    inDiscountedPrice ALIAS FOR $5;
  BEGIN
    UPDATE product
    SET    name = inName, description = inDescription, price = inPrice,
           discounted_price = inDiscountedPrice,
           search_vector = (setweight(to_tsvector(inName), 'A')
                            || to_tsvector(inDescription))
    WHERE  product_id = inProductId;
  END;
$_$;


ALTER FUNCTION public.catalog_update_product(integer, character varying, character varying, numeric, numeric) OWNER TO postgres;

--
-- TOC entry 304 (class 1255 OID 611956)
-- Name: customer_add(character varying, character varying, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.customer_add(character varying, character varying, character varying) RETURNS integer
    LANGUAGE plpgsql
    AS $_$
  DECLARE
    inName     ALIAS FOR $1;
    inEmail    ALIAS FOR $2;
    inPassword ALIAS FOR $3;
    outCustomerId INTEGER;
  BEGIN
    INSERT INTO customer (name, email, password)
           VALUES (inName, inEmail, inPassword);
    SELECT INTO outCustomerId
           currval('customer_customer_id_seq');
    RETURN outCustomerId;
  END;
$_$;


ALTER FUNCTION public.customer_add(character varying, character varying, character varying) OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 611957)
-- Name: customer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer (
    customer_id integer NOT NULL,
    name character varying(50) NOT NULL,
    email character varying(100) NOT NULL,
    password character varying(50) NOT NULL,
    credit_card text,
    address_1 character varying(100),
    address_2 character varying(100),
    city character varying(100),
    region character varying(100),
    postal_code character varying(100),
    country character varying(100),
    shipping_region_id integer DEFAULT 1 NOT NULL,
    day_phone character varying(100),
    eve_phone character varying(100),
    mob_phone character varying(100)
);


ALTER TABLE public.customer OWNER TO postgres;

--
-- TOC entry 305 (class 1255 OID 611964)
-- Name: customer_get_customer(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.customer_get_customer(integer) RETURNS public.customer
    LANGUAGE plpgsql
    AS $_$
  DECLARE
    inCustomerId ALIAS FOR $1;
    outCustomerRow customer;
  BEGIN
    SELECT INTO outCustomerRow
                customer_id, name, email, password, credit_card,
                address_1, address_2, city, region, postal_code, country,
                shipping_region_id, day_phone, eve_phone, mob_phone
    FROM   customer
    WHERE  customer_id = inCustomerId;
    RETURN outCustomerRow;
  END;
$_$;


ALTER FUNCTION public.customer_get_customer(integer) OWNER TO postgres;

--
-- TOC entry 306 (class 1255 OID 611965)
-- Name: customer_get_customers_list(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.customer_get_customers_list() RETURNS SETOF public.customer_list
    LANGUAGE plpgsql
    AS $$
  DECLARE
    outCustomerListRow customer_list;
  BEGIN
    FOR outCustomerListRow IN
      SELECT customer_id, name FROM customer ORDER BY name ASC
    LOOP
      RETURN NEXT outCustomerListRow;
    END LOOP;
  END;
$$;


ALTER FUNCTION public.customer_get_customers_list() OWNER TO postgres;

--
-- TOC entry 307 (class 1255 OID 611966)
-- Name: customer_get_login_info(character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.customer_get_login_info(character varying) RETURNS public.customer_login_info
    LANGUAGE plpgsql
    AS $_$
  DECLARE
    inEmail ALIAS FOR $1;
    outCustomerLoginInfoRow customer_login_info;
  BEGIN
    SELECT INTO outCustomerLoginInfoRow
                customer_id, password
    FROM   customer
    WHERE  email = inEmail;
    RETURN outCustomerLoginInfoRow;
  END;
$_$;


ALTER FUNCTION public.customer_get_login_info(character varying) OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 611967)
-- Name: shipping_region; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shipping_region (
    shipping_region_id integer NOT NULL,
    shipping_region character varying(100) NOT NULL
);


ALTER TABLE public.shipping_region OWNER TO postgres;

--
-- TOC entry 308 (class 1255 OID 611970)
-- Name: customer_get_shipping_regions(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.customer_get_shipping_regions() RETURNS SETOF public.shipping_region
    LANGUAGE plpgsql
    AS $$
  DECLARE
    outShippingRegion shipping_region;
  BEGIN
    FOR outShippingRegion IN
      SELECT shipping_region_id, shipping_region
      FROM   shipping_region
    LOOP
      RETURN NEXT outShippingRegion;
    END LOOP;
    RETURN;
  END;
$$;


ALTER FUNCTION public.customer_get_shipping_regions() OWNER TO postgres;

--
-- TOC entry 309 (class 1255 OID 611971)
-- Name: customer_update_account(integer, character varying, character varying, character varying, character varying, character varying, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.customer_update_account(integer, character varying, character varying, character varying, character varying, character varying, character varying) RETURNS void
    LANGUAGE plpgsql
    AS $_$
  DECLARE
    inCustomerId ALIAS FOR $1;
    inName       ALIAS FOR $2;
    inEmail      ALIAS FOR $3;
    inPassword   ALIAS FOR $4;
    inDayPhone   ALIAS FOR $5;
    inEvePhone   ALIAS FOR $6;
    inMobPhone   ALIAS FOR $7;
  BEGIN
    UPDATE customer
    SET    name = inName, email = inEmail,
           password = inPassword, day_phone = inDayPhone,
           eve_phone = inEvePhone, mob_phone = inMobPhone
    WHERE  customer_id = inCustomerId;
  END;
$_$;


ALTER FUNCTION public.customer_update_account(integer, character varying, character varying, character varying, character varying, character varying, character varying) OWNER TO postgres;

--
-- TOC entry 310 (class 1255 OID 611972)
-- Name: customer_update_address(integer, character varying, character varying, character varying, character varying, character varying, character varying, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.customer_update_address(integer, character varying, character varying, character varying, character varying, character varying, character varying, integer) RETURNS void
    LANGUAGE plpgsql
    AS $_$
  DECLARE
    inCustomerId       ALIAS FOR $1;
    inAddress1         ALIAS FOR $2;
    inAddress2         ALIAS FOR $3;
    inCity             ALIAS FOR $4;
    inRegion           ALIAS FOR $5;
    inPostalCode       ALIAS FOR $6;
    inCountry          ALIAS FOR $7;
    inShippingRegionId ALIAS FOR $8;
  BEGIN
    UPDATE customer
    SET    address_1 = inAddress1, address_2 = inAddress2, city = inCity,
           region = inRegion, postal_code = inPostalCode,
           country = inCountry, shipping_region_id = inShippingRegionId
    WHERE  customer_id = inCustomerId;
  END;
$_$;


ALTER FUNCTION public.customer_update_address(integer, character varying, character varying, character varying, character varying, character varying, character varying, integer) OWNER TO postgres;

--
-- TOC entry 311 (class 1255 OID 611973)
-- Name: customer_update_credit_card(integer, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.customer_update_credit_card(integer, text) RETURNS void
    LANGUAGE plpgsql
    AS $_$
  DECLARE
    inCustomerId ALIAS FOR $1;
    inCreditCard ALIAS FOR $2;
  BEGIN
    UPDATE customer
    SET    credit_card = inCreditCard
    WHERE  customer_id = inCustomerId;
  END;
$_$;


ALTER FUNCTION public.customer_update_credit_card(integer, text) OWNER TO postgres;

--
-- TOC entry 312 (class 1255 OID 611974)
-- Name: orders_create_audit(integer, text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.orders_create_audit(integer, text, integer) RETURNS void
    LANGUAGE plpgsql
    AS $_$
  DECLARE
    inOrderId       ALIAS FOR $1;
    inMessage       ALIAS FOR $2;
    inMessageNumber ALIAS FOR $3;
  BEGIN
    INSERT INTO audit (order_id, created_on, message, message_number)
           VALUES (inOrderId, NOW(), inMessage, inMessageNumber);
  END;
$_$;


ALTER FUNCTION public.orders_create_audit(integer, text, integer) OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 611975)
-- Name: audit; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.audit (
    audit_id integer NOT NULL,
    order_id integer NOT NULL,
    created_on timestamp without time zone NOT NULL,
    message text NOT NULL,
    message_number integer NOT NULL
);


ALTER TABLE public.audit OWNER TO postgres;

--
-- TOC entry 313 (class 1255 OID 611981)
-- Name: orders_get_audit_trail(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.orders_get_audit_trail(integer) RETURNS SETOF public.audit
    LANGUAGE plpgsql
    AS $_$
  DECLARE
    inOrderId ALIAS FOR $1;
    outAuditRow audit;
  BEGIN
    FOR outAuditRow IN
      SELECT audit_id, order_id, created_on, message, message_number
      FROM   audit
      WHERE  order_id = inOrderId
    LOOP
      RETURN NEXT outAuditRow;
    END LOOP;
  END;
$_$;


ALTER FUNCTION public.orders_get_audit_trail(integer) OWNER TO postgres;

--
-- TOC entry 314 (class 1255 OID 611982)
-- Name: orders_get_by_customer_id(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.orders_get_by_customer_id(integer) RETURNS SETOF public.order_short_details
    LANGUAGE plpgsql
    AS $_$
  DECLARE
    inCustomerId ALIAS FOR $1;
    outOrderShortDetailsRow order_short_details;
  BEGIN
    FOR outOrderShortDetailsRow IN
      SELECT     o.order_id, o.total_amount, o.created_on,
                 o.shipped_on, o.status, c.name
      FROM       orders o
      INNER JOIN customer c
                   ON o.customer_id = c.customer_id
      WHERE      o.customer_id = inCustomerId
      ORDER BY   o.created_on DESC
    LOOP
      RETURN NEXT outOrderShortDetailsRow;
    END LOOP;
  END;
$_$;


ALTER FUNCTION public.orders_get_by_customer_id(integer) OWNER TO postgres;

--
-- TOC entry 315 (class 1255 OID 611983)
-- Name: orders_get_most_recent_orders(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.orders_get_most_recent_orders(integer) RETURNS SETOF public.order_short_details
    LANGUAGE plpgsql
    AS $_$
  DECLARE
    inHowMany ALIAS FOR $1;
    outOrderShortDetailsRow order_short_details;
  BEGIN
    FOR outOrderShortDetailsRow IN
      SELECT     o.order_id, o.total_amount, o.created_on,
                 o.shipped_on, o.status, c.name
      FROM       orders o
      INNER JOIN customer c
                   ON o.customer_id = c.customer_id
      ORDER BY   o.created_on DESC
      LIMIT      inHowMany
    LOOP
      RETURN NEXT outOrderShortDetailsRow;
    END LOOP;
  END;
$_$;


ALTER FUNCTION public.orders_get_most_recent_orders(integer) OWNER TO postgres;

--
-- TOC entry 316 (class 1255 OID 611984)
-- Name: orders_get_order_details(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.orders_get_order_details(integer) RETURNS SETOF public.order_details
    LANGUAGE plpgsql
    AS $_$
  DECLARE
    inOrderId ALIAS FOR $1;
    outOrderDetailsRow order_details;
  BEGIN
    FOR outOrderDetailsRow IN
      SELECT order_id, product_id, product_name, quantity,
             unit_cost, (quantity * unit_cost) AS subtotal
      FROM   order_detail
      WHERE  order_id = inOrderId
    LOOP
      RETURN NEXT outOrderDetailsRow;
    END LOOP;
  END;
$_$;


ALTER FUNCTION public.orders_get_order_details(integer) OWNER TO postgres;

--
-- TOC entry 317 (class 1255 OID 611985)
-- Name: orders_get_order_info(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.orders_get_order_info(integer) RETURNS public.order_info
    LANGUAGE plpgsql
    AS $_$
  DECLARE
    inOrderId ALIAS FOR $1;
    outOrderInfoRow order_info;
  BEGIN
    SELECT INTO outOrderInfoRow
                o.order_id, o.total_amount, o.created_on, o.shipped_on,
                o.status, o.comments, o.customer_id, o.auth_code,
                o.reference, o.shipping_id, s.shipping_type, s.shipping_cost,
                o.tax_id, t.tax_type, t.tax_percentage
    FROM       orders o
    INNER JOIN tax t
                 ON t.tax_id = o.tax_id
    INNER JOIN shipping s
                 ON s.shipping_id = o.shipping_id
    WHERE      o.order_id = inOrderId;
    RETURN outOrderInfoRow;
  END;
$_$;


ALTER FUNCTION public.orders_get_order_info(integer) OWNER TO postgres;

--
-- TOC entry 318 (class 1255 OID 611986)
-- Name: orders_get_order_short_details(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.orders_get_order_short_details(integer) RETURNS public.order_short_details
    LANGUAGE plpgsql
    AS $_$
  DECLARE
    inOrderId ALIAS FOR $1;
    outOrderShortDetailsRow order_short_details;
  BEGIN
    SELECT INTO outOrderShortDetailsRow
                o.order_id, o.total_amount, o.created_on,
                o.shipped_on, o.status, c.name
    FROM        orders o
    INNER JOIN  customer c
                  ON o.customer_id = c.customer_id
    WHERE       o.order_id = inOrderId;
    RETURN outOrderShortDetailsRow;
  END;
$_$;


ALTER FUNCTION public.orders_get_order_short_details(integer) OWNER TO postgres;

--
-- TOC entry 319 (class 1255 OID 611987)
-- Name: orders_get_orders_between_dates(timestamp without time zone, timestamp without time zone); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.orders_get_orders_between_dates(timestamp without time zone, timestamp without time zone) RETURNS SETOF public.order_short_details
    LANGUAGE plpgsql
    AS $_$
  DECLARE
    inStartDate ALIAS FOR $1;
    inEndDate   ALIAS FOR $2;
    outOrderShortDetailsRow order_short_details;
  BEGIN
    FOR outOrderShortDetailsRow IN
      SELECT     o.order_id, o.total_amount, o.created_on,
                 o.shipped_on, o.status, c.name
      FROM       orders o
      INNER JOIN customer c
                   ON o.customer_id = c.customer_id
      WHERE      o.created_on >= inStartDate AND o.created_on <= inEndDate
      ORDER BY   o.created_on DESC
    LOOP
      RETURN NEXT outOrderShortDetailsRow;
    END LOOP;
  END;
$_$;


ALTER FUNCTION public.orders_get_orders_between_dates(timestamp without time zone, timestamp without time zone) OWNER TO postgres;

--
-- TOC entry 320 (class 1255 OID 611988)
-- Name: orders_get_orders_by_status(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.orders_get_orders_by_status(integer) RETURNS SETOF public.order_short_details
    LANGUAGE plpgsql
    AS $_$
  DECLARE
    inStatus ALIAS FOR $1;
    outOrderShortDetailsRow order_short_details;
  BEGIN
    FOR outOrderShortDetailsRow IN
      SELECT     o.order_id, o.total_amount, o.created_on,
                 o.shipped_on, o.status, c.name
      FROM       orders o
      INNER JOIN customer c
                   ON o.customer_id = c.customer_id
      WHERE      o.status = inStatus
      ORDER BY   o.created_on DESC
    LOOP
      RETURN NEXT outOrderShortDetailsRow;
    END LOOP;
  END;
$_$;


ALTER FUNCTION public.orders_get_orders_by_status(integer) OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 611989)
-- Name: shipping; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shipping (
    shipping_id integer NOT NULL,
    shipping_type character varying(100) NOT NULL,
    shipping_cost numeric(10,2) NOT NULL,
    shipping_region_id integer NOT NULL
);


ALTER TABLE public.shipping OWNER TO postgres;

--
-- TOC entry 321 (class 1255 OID 611992)
-- Name: orders_get_shipping_info(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.orders_get_shipping_info(integer) RETURNS SETOF public.shipping
    LANGUAGE plpgsql
    AS $_$
  DECLARE
    inShippingRegionId ALIAS FOR $1;
    outShippingRow shipping;
  BEGIN
    FOR outShippingRow IN
      SELECT shipping_id, shipping_type, shipping_cost, shipping_region_id
      FROM   shipping
      WHERE  shipping_region_id = inShippingRegionId
    LOOP
      RETURN NEXT outShippingRow;
    END LOOP;
  END;
$_$;


ALTER FUNCTION public.orders_get_shipping_info(integer) OWNER TO postgres;

--
-- TOC entry 322 (class 1255 OID 611993)
-- Name: orders_set_auth_code(integer, character varying, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.orders_set_auth_code(integer, character varying, character varying) RETURNS void
    LANGUAGE plpgsql
    AS $_$
  DECLARE
    inOrderId   ALIAS FOR $1;
    inAuthCode  ALIAS FOR $2;
    inReference ALIAS FOR $3;
  BEGIN
    UPDATE orders
    SET    auth_code = inAuthCode, reference = inReference
    WHERE  order_id = inOrderId;
  END;
$_$;


ALTER FUNCTION public.orders_set_auth_code(integer, character varying, character varying) OWNER TO postgres;

--
-- TOC entry 323 (class 1255 OID 611994)
-- Name: orders_set_date_shipped(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.orders_set_date_shipped(integer) RETURNS void
    LANGUAGE plpgsql
    AS $_$
  DECLARE
    inOrderId ALIAS FOR $1;
  BEGIN
    UPDATE orders SET shipped_on = NOW() WHERE order_id = inOrderId;
  END;
$_$;


ALTER FUNCTION public.orders_set_date_shipped(integer) OWNER TO postgres;

--
-- TOC entry 324 (class 1255 OID 611995)
-- Name: orders_update_order(integer, integer, character varying, character varying, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.orders_update_order(integer, integer, character varying, character varying, character varying) RETURNS void
    LANGUAGE plpgsql
    AS $_$
  DECLARE
    inOrderId    ALIAS FOR $1;
    inStatus     ALIAS FOR $2;
    inComments   ALIAS FOR $3;
    inAuthCode   ALIAS FOR $4;
    inReference  ALIAS FOR $5;
    currentDateShipped TIMESTAMP;
  BEGIN
    SELECT INTO currentDateShipped
                shipped_on
    FROM   orders
    WHERE  order_id = inOrderId;

    UPDATE orders
    SET    status = inStatus, comments = inComments,
           auth_code = inAuthCode, reference = inReference
    WHERE  order_id = inOrderId;

    IF inStatus < 7 AND currentDateShipped IS NOT NULL THEN
      UPDATE orders SET shipped_on = NULL WHERE order_id = inOrderId;
    ELSEIF inStatus > 6 AND currentDateShipped IS NULL THEN
      UPDATE orders SET shipped_on = NOW() WHERE order_id = inOrderId;
    END IF;
  END;
$_$;


ALTER FUNCTION public.orders_update_order(integer, integer, character varying, character varying, character varying) OWNER TO postgres;

--
-- TOC entry 325 (class 1255 OID 611996)
-- Name: orders_update_status(integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.orders_update_status(integer, integer) RETURNS void
    LANGUAGE plpgsql
    AS $_$
  DECLARE
    inOrderId ALIAS FOR $1;
    inStatus  ALIAS FOR $2;
  BEGIN
    UPDATE orders SET status = inStatus WHERE order_id = inOrderId;
  END;
$_$;


ALTER FUNCTION public.orders_update_status(integer, integer) OWNER TO postgres;

--
-- TOC entry 326 (class 1255 OID 611997)
-- Name: shopping_cart_add_product(character, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.shopping_cart_add_product(character, integer) RETURNS void
    LANGUAGE plpgsql
    AS $_$
  DECLARE
    inCartId        ALIAS FOR $1;
    inProductId     ALIAS FOR $2;
    productQuantity INTEGER;
  BEGIN
    SELECT INTO productQuantity
                quantity
    FROM   shopping_cart
    WHERE  cart_id = inCartId AND product_id = inProductId;
    IF productQuantity IS NULL THEN
      INSERT INTO shopping_cart(cart_id, product_id, quantity, added_on)
             VALUES (inCartId, inProductId , 1, NOW());
    ELSE
      UPDATE shopping_cart
      SET    quantity = quantity + 1, buy_now = true
      WHERE  cart_id = inCartId AND product_id = inProductId;
    END IF;
  END;
$_$;


ALTER FUNCTION public.shopping_cart_add_product(character, integer) OWNER TO postgres;

--
-- TOC entry 327 (class 1255 OID 611998)
-- Name: shopping_cart_count_old_carts(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.shopping_cart_count_old_carts(integer) RETURNS integer
    LANGUAGE plpgsql
    AS $_$
  DECLARE
    inDays ALIAS FOR $1;
    outOldShoppingCartsCount INTEGER;
  BEGIN
    SELECT INTO outOldShoppingCartsCount
           COUNT(cart_id)
    FROM   (SELECT   cart_id
            FROM     shopping_cart
            GROUP BY cart_id
            HAVING   ((NOW() - ('1'||' DAYS')::INTERVAL) >= MAX(added_on)))
           AS old_carts;
    RETURN outOldShoppingCartsCount;
  END;
$_$;


ALTER FUNCTION public.shopping_cart_count_old_carts(integer) OWNER TO postgres;

--
-- TOC entry 328 (class 1255 OID 611999)
-- Name: shopping_cart_create_order(character, integer, integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.shopping_cart_create_order(character, integer, integer, integer) RETURNS integer
    LANGUAGE plpgsql
    AS $_$
  DECLARE
    inCartId     ALIAS FOR $1;
    inCustomerId ALIAS FOR $2;
    inShippingId ALIAS FOR $3;
    inTaxId      ALIAS FOR $4;
    outOrderId INTEGER;
    cartItem cart_product;
    orderTotalAmount NUMERIC(10, 2);
  BEGIN
    -- Insert a new record into orders
    INSERT INTO orders (created_on, customer_id, shipping_id, tax_id)
           VALUES (NOW(), inCustomerId, inShippingId, inTaxId);
    -- Obtain the new Order ID
    SELECT INTO outOrderId
           currval('orders_order_id_seq');
    orderTotalAmount := 0;
    -- Insert order details in order_detail table
    FOR cartItem IN
      SELECT     p.product_id, p.name,
                 COALESCE(NULLIF(p.discounted_price, 0), p.price) AS price,
                 sc.quantity,
                 COALESCE(NULLIF(p.discounted_price, 0), p.price) * sc.quantity
                   AS subtotal
      FROM       shopping_cart sc
      INNER JOIN product p
                   ON sc.product_id = p.product_id
      WHERE      sc.cart_id = inCartId AND sc.buy_now
    LOOP
      INSERT INTO order_detail (order_id, product_id, product_name,
                                quantity, unit_cost)
             VALUES (outOrderId, cartItem.product_id, cartItem.name,
                     cartItem.quantity, cartItem.price);
      orderTotalAmount := orderTotalAmount + cartItem.subtotal;
    END LOOP;
    -- Save the order's total amount
    UPDATE orders
    SET    total_amount = orderTotalAmount
    WHERE  order_id = outOrderId;
    -- Clear the shopping cart
    PERFORM shopping_cart_empty(inCartId);
    -- Return the Order ID
    RETURN outOrderId;
  END;
$_$;


ALTER FUNCTION public.shopping_cart_create_order(character, integer, integer, integer) OWNER TO postgres;

--
-- TOC entry 329 (class 1255 OID 612000)
-- Name: shopping_cart_delete_old_carts(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.shopping_cart_delete_old_carts(integer) RETURNS void
    LANGUAGE plpgsql
    AS $_$
  DECLARE
    inDays ALIAS FOR $1;
  BEGIN
    DELETE FROM shopping_cart
    WHERE cart_id IN
         (SELECT    cart_id
           FROM     shopping_cart
           GROUP BY cart_id
           HAVING   ((NOW() - (inDays||' DAYS')::INTERVAL) >= MAX(added_on)));
  END;
$_$;


ALTER FUNCTION public.shopping_cart_delete_old_carts(integer) OWNER TO postgres;

--
-- TOC entry 330 (class 1255 OID 612001)
-- Name: shopping_cart_empty(character); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.shopping_cart_empty(character) RETURNS void
    LANGUAGE plpgsql
    AS $_$
  DECLARE
    inCartId ALIAS FOR $1;
  BEGIN
    DELETE FROM shopping_cart WHERE cart_id = inCartId;
  END;
$_$;


ALTER FUNCTION public.shopping_cart_empty(character) OWNER TO postgres;

--
-- TOC entry 331 (class 1255 OID 612002)
-- Name: shopping_cart_get_products(character); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.shopping_cart_get_products(character) RETURNS SETOF public.cart_product
    LANGUAGE plpgsql
    AS $_$
  DECLARE
    inCartId ALIAS FOR $1;
    outCartProductRow cart_product;
  BEGIN
    FOR outCartProductRow IN
      SELECT     p.product_id, p.name,
                 COALESCE(NULLIF(p.discounted_price, 0), p.price) AS price,
                 sc.quantity,
                 COALESCE(NULLIF(p.discounted_price, 0),
                          p.price) * sc.quantity AS subtotal
      FROM       shopping_cart sc
      INNER JOIN product p
                   ON sc.product_id = p.product_id
      WHERE      sc.cart_id = inCartId AND buy_now
    LOOP
      RETURN NEXT outCartProductRow;
    END LOOP;
  END;
$_$;


ALTER FUNCTION public.shopping_cart_get_products(character) OWNER TO postgres;

--
-- TOC entry 332 (class 1255 OID 612003)
-- Name: shopping_cart_get_recommendations(character, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.shopping_cart_get_recommendations(character, integer) RETURNS SETOF public.product_recommendation
    LANGUAGE plpgsql
    AS $_$
  DECLARE
    inCartId                        ALIAS FOR $1;
    inShortProductDescriptionLength ALIAS FOR $2;
    outProductRecommendationRow product_recommendation;
  BEGIN
    FOR outProductRecommendationRow IN
      -- Returns the product recommendations
      SELECT product_id, name, description
      FROM   product
      WHERE  product_id IN
            (-- Returns the products that exist in a list of orders
             SELECT   od1.product_id
             FROM     order_detail od1
             JOIN     order_detail od2
                        ON od1.order_id = od2.order_id
             JOIN     shopping_cart
                        ON od2.product_id = shopping_cart.product_id
             WHERE    shopping_cart.cart_id = inCartId
                      -- Must not include products that already exist
                      -- in the visitor's cart
                      AND od1.product_id NOT IN
                     (-- Returns the products in the specified
                      -- shopping cart
                      SELECT product_id
                      FROM   shopping_cart
                      WHERE  cart_id = inCartId)
             -- Group the product_id so we can calculate the rank
             GROUP BY od1.product_id
             -- Order descending by rank
             ORDER BY COUNT(od1.product_id) DESC
             LIMIT    5)
    LOOP
      IF char_length(outProductRecommendationRow.description) >
         inShortProductDescriptionLength THEN
        outProductRecommendationRow.description :=
          substring(outProductRecommendationRow.description, 1,
                    inShortProductDescriptionLength) || '...';
      END IF;
      RETURN NEXT outProductRecommendationRow;
    END LOOP;
  END;
$_$;


ALTER FUNCTION public.shopping_cart_get_recommendations(character, integer) OWNER TO postgres;

--
-- TOC entry 333 (class 1255 OID 612004)
-- Name: shopping_cart_get_saved_products(character); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.shopping_cart_get_saved_products(character) RETURNS SETOF public.cart_saved_product
    LANGUAGE plpgsql
    AS $_$
  DECLARE
    inCartId ALIAS FOR $1;
    outCartSavedProductRow cart_saved_product;
  BEGIN
    FOR outCartSavedProductRow IN
      SELECT     p.product_id, p.name,
                 COALESCE(NULLIF(p.discounted_price, 0), p.price) AS price
      FROM       shopping_cart sc
      INNER JOIN product p
                   ON sc.product_id = p.product_id
      WHERE      sc.cart_id = inCartId AND NOT buy_now
    LOOP
      RETURN NEXT outCartSavedProductRow;
    END LOOP;
  END;
$_$;


ALTER FUNCTION public.shopping_cart_get_saved_products(character) OWNER TO postgres;

--
-- TOC entry 334 (class 1255 OID 612005)
-- Name: shopping_cart_get_total_amount(character); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.shopping_cart_get_total_amount(character) RETURNS numeric
    LANGUAGE plpgsql
    AS $_$
  DECLARE
    inCartId ALIAS FOR $1;
    outTotalAmount NUMERIC(10, 2);
  BEGIN
    SELECT     INTO outTotalAmount
               SUM(COALESCE(NULLIF(p.discounted_price, 0), p.price)
                   * sc.quantity)
    FROM       shopping_cart sc
    INNER JOIN product p
                 ON sc.product_id = p.product_id
    WHERE      sc.cart_id = inCartId AND sc.buy_now;
    RETURN outTotalAmount;
  END;
$_$;


ALTER FUNCTION public.shopping_cart_get_total_amount(character) OWNER TO postgres;

--
-- TOC entry 335 (class 1255 OID 612006)
-- Name: shopping_cart_move_product_to_cart(character, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.shopping_cart_move_product_to_cart(character, integer) RETURNS void
    LANGUAGE plpgsql
    AS $_$
  DECLARE
    inCartId    ALIAS FOR $1;
    inProductId ALIAS FOR $2;
  BEGIN
    UPDATE shopping_cart
    SET    buy_now = true, added_on = NOW()
    WHERE  cart_id = inCartId AND product_id = inProductId;
  END;
$_$;


ALTER FUNCTION public.shopping_cart_move_product_to_cart(character, integer) OWNER TO postgres;

--
-- TOC entry 336 (class 1255 OID 612007)
-- Name: shopping_cart_remove_product(character, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.shopping_cart_remove_product(character, integer) RETURNS void
    LANGUAGE plpgsql
    AS $_$
  DECLARE
    inCartId    ALIAS FOR $1;
    inProductId ALIAS FOR $2;
  BEGIN
    DELETE FROM shopping_cart
    WHERE  cart_id = inCartId AND product_id = inProductId;
  END;
$_$;


ALTER FUNCTION public.shopping_cart_remove_product(character, integer) OWNER TO postgres;

--
-- TOC entry 337 (class 1255 OID 612008)
-- Name: shopping_cart_save_product_for_later(character, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.shopping_cart_save_product_for_later(character, integer) RETURNS void
    LANGUAGE plpgsql
    AS $_$
  DECLARE
    inCartId    ALIAS FOR $1;
    inProductId ALIAS FOR $2;
  BEGIN
    UPDATE shopping_cart
    SET    buy_now = false, quantity = 1
    WHERE  cart_id = inCartId AND product_id = inProductId;
  END;
$_$;


ALTER FUNCTION public.shopping_cart_save_product_for_later(character, integer) OWNER TO postgres;

--
-- TOC entry 338 (class 1255 OID 612009)
-- Name: shopping_cart_update(character, integer[], integer[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.shopping_cart_update(character, integer[], integer[]) RETURNS void
    LANGUAGE plpgsql
    AS $_$
  DECLARE
    inCartId     ALIAS FOR $1;
    inProductIds ALIAS FOR $2;
    inQuantities ALIAS FOR $3;
  BEGIN
    FOR i IN array_lower(inQuantities, 1)..array_upper(inQuantities, 1)
    LOOP
      IF inQuantities[i] > 0 THEN
        UPDATE shopping_cart
        SET    quantity = inQuantities[i], added_on = NOW()
        WHERE  cart_id = inCartId AND product_id = inProductIds[i];
      ELSE
        PERFORM shopping_cart_remove_product(inCartId, inProductIds[i]);
      END IF;
    END LOOP;
  END;
$_$;


ALTER FUNCTION public.shopping_cart_update(character, integer[], integer[]) OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 612010)
-- Name: audit_audit_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.audit_audit_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.audit_audit_id_seq OWNER TO postgres;

--
-- TOC entry 3193 (class 0 OID 0)
-- Dependencies: 221
-- Name: audit_audit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.audit_audit_id_seq OWNED BY public.audit.audit_id;


--
-- TOC entry 222 (class 1259 OID 612012)
-- Name: category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.category (
    category_id integer NOT NULL,
    department_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description character varying(1000)
);


ALTER TABLE public.category OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 612018)
-- Name: category_category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.category_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.category_category_id_seq OWNER TO postgres;

--
-- TOC entry 3194 (class 0 OID 0)
-- Dependencies: 223
-- Name: category_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.category_category_id_seq OWNED BY public.category.category_id;


--
-- TOC entry 243 (class 1259 OID 632278)
-- Name: currency; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.currency (
    currency_id integer NOT NULL,
    currency_code character varying(10) NOT NULL,
    currency_name character varying(75) NOT NULL,
    currency_supported character varying(75),
    fund character varying(75)
);


ALTER TABLE public.currency OWNER TO postgres;

--
-- TOC entry 242 (class 1259 OID 632276)
-- Name: currency_currency_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.currency_currency_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.currency_currency_id_seq OWNER TO postgres;

--
-- TOC entry 3195 (class 0 OID 0)
-- Dependencies: 242
-- Name: currency_currency_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.currency_currency_id_seq OWNED BY public.currency.currency_id;


--
-- TOC entry 224 (class 1259 OID 612020)
-- Name: customer_customer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customer_customer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customer_customer_id_seq OWNER TO postgres;

--
-- TOC entry 3196 (class 0 OID 0)
-- Dependencies: 224
-- Name: customer_customer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customer_customer_id_seq OWNED BY public.customer.customer_id;


--
-- TOC entry 225 (class 1259 OID 612022)
-- Name: department_department_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.department_department_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.department_department_id_seq OWNER TO postgres;

--
-- TOC entry 3197 (class 0 OID 0)
-- Dependencies: 225
-- Name: department_department_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.department_department_id_seq OWNED BY public.department.department_id;


--
-- TOC entry 226 (class 1259 OID 612024)
-- Name: example_table; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.example_table (
    id character varying(64) NOT NULL,
    name character varying(100),
    created_date date DEFAULT now() NOT NULL,
    created_time timestamp without time zone NOT NULL,
    is_active boolean DEFAULT false,
    counter integer DEFAULT 0 NOT NULL,
    currency numeric NOT NULL,
    description text,
    floating double precision
);


ALTER TABLE public.example_table OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 612033)
-- Name: order_detail; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_detail (
    order_id integer NOT NULL,
    product_id integer NOT NULL,
    product_name character varying(50) NOT NULL,
    quantity integer NOT NULL,
    unit_cost numeric(10,2) NOT NULL
);


ALTER TABLE public.order_detail OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 612036)
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    order_id integer NOT NULL,
    total_amount numeric(10,2) DEFAULT 0.00 NOT NULL,
    created_on timestamp without time zone NOT NULL,
    shipped_on timestamp without time zone,
    status integer DEFAULT 0 NOT NULL,
    comments character varying(255),
    customer_id integer,
    auth_code character varying(50),
    reference character varying(50),
    shipping_id integer,
    tax_id integer
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 612041)
-- Name: orders_order_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_order_id_seq OWNER TO postgres;

--
-- TOC entry 3198 (class 0 OID 0)
-- Dependencies: 229
-- Name: orders_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_order_id_seq OWNED BY public.orders.order_id;


--
-- TOC entry 230 (class 1259 OID 612043)
-- Name: product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product (
    product_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description character varying(1000) NOT NULL,
    price numeric(10,2) NOT NULL,
    discounted_price numeric(10,2) DEFAULT 0.00 NOT NULL,
    image character varying(150),
    thumbnail character varying(150),
    display smallint DEFAULT 0 NOT NULL,
    search_vector tsvector
);


ALTER TABLE public.product OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 612051)
-- Name: product_category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_category (
    product_id integer NOT NULL,
    category_id integer NOT NULL,
    product_category_id character varying(64) DEFAULT public.uuid_generate_v4()
);


ALTER TABLE public.product_category OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 612055)
-- Name: product_product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_product_id_seq
    START WITH 460
    INCREMENT BY 1
    MINVALUE 460
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_product_id_seq OWNER TO postgres;

--
-- TOC entry 3199 (class 0 OID 0)
-- Dependencies: 232
-- Name: product_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_product_id_seq OWNED BY public.product.product_id;


--
-- TOC entry 233 (class 1259 OID 612057)
-- Name: review; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.review (
    review_id integer NOT NULL,
    customer_id integer NOT NULL,
    product_id integer NOT NULL,
    review text NOT NULL,
    rating smallint NOT NULL,
    created_on timestamp without time zone NOT NULL
);


ALTER TABLE public.review OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 612063)
-- Name: review_review_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.review_review_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.review_review_id_seq OWNER TO postgres;

--
-- TOC entry 3200 (class 0 OID 0)
-- Dependencies: 234
-- Name: review_review_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.review_review_id_seq OWNED BY public.review.review_id;


--
-- TOC entry 235 (class 1259 OID 612065)
-- Name: shipping_region_shipping_region_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.shipping_region_shipping_region_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shipping_region_shipping_region_id_seq OWNER TO postgres;

--
-- TOC entry 3201 (class 0 OID 0)
-- Dependencies: 235
-- Name: shipping_region_shipping_region_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.shipping_region_shipping_region_id_seq OWNED BY public.shipping_region.shipping_region_id;


--
-- TOC entry 236 (class 1259 OID 612067)
-- Name: shipping_shipping_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.shipping_shipping_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shipping_shipping_id_seq OWNER TO postgres;

--
-- TOC entry 3202 (class 0 OID 0)
-- Dependencies: 236
-- Name: shipping_shipping_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.shipping_shipping_id_seq OWNED BY public.shipping.shipping_id;


--
-- TOC entry 237 (class 1259 OID 612069)
-- Name: shopping_cart; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shopping_cart (
    cart_id integer NOT NULL,
    product_id integer NOT NULL,
    quantity integer NOT NULL,
    buy_now boolean DEFAULT true NOT NULL,
    added_on timestamp without time zone,
    user_id character varying NOT NULL
);


ALTER TABLE public.shopping_cart OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 612076)
-- Name: shopping_cart_cart_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.shopping_cart_cart_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shopping_cart_cart_id_seq OWNER TO postgres;

--
-- TOC entry 3203 (class 0 OID 0)
-- Dependencies: 238
-- Name: shopping_cart_cart_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.shopping_cart_cart_id_seq OWNED BY public.shopping_cart.cart_id;


--
-- TOC entry 239 (class 1259 OID 612078)
-- Name: tax; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tax (
    tax_id integer NOT NULL,
    tax_type character varying(100) NOT NULL,
    tax_percentage numeric(10,2) NOT NULL
);


ALTER TABLE public.tax OWNER TO postgres;

--
-- TOC entry 240 (class 1259 OID 612081)
-- Name: tax_tax_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tax_tax_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tax_tax_id_seq OWNER TO postgres;

--
-- TOC entry 3204 (class 0 OID 0)
-- Dependencies: 240
-- Name: tax_tax_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tax_tax_id_seq OWNED BY public.tax.tax_id;


--
-- TOC entry 241 (class 1259 OID 612198)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id character varying(64) DEFAULT public.uuid_generate_v4() NOT NULL,
    username character varying(100) NOT NULL,
    password character varying(255) NOT NULL,
    roles smallint DEFAULT 3 NOT NULL,
    is_login boolean,
    jam_login timestamp without time zone
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 3205 (class 0 OID 0)
-- Dependencies: 241
-- Name: COLUMN users.roles; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.users.roles IS '1=super admin, 2=admin,3 =operator';


--
-- TOC entry 2963 (class 2604 OID 612083)
-- Name: audit audit_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.audit ALTER COLUMN audit_id SET DEFAULT nextval('public.audit_audit_id_seq'::regclass);


--
-- TOC entry 2965 (class 2604 OID 612084)
-- Name: category category_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category ALTER COLUMN category_id SET DEFAULT nextval('public.category_category_id_seq'::regclass);


--
-- TOC entry 2982 (class 2604 OID 632281)
-- Name: currency currency_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.currency ALTER COLUMN currency_id SET DEFAULT nextval('public.currency_currency_id_seq'::regclass);


--
-- TOC entry 2961 (class 2604 OID 612085)
-- Name: customer customer_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer ALTER COLUMN customer_id SET DEFAULT nextval('public.customer_customer_id_seq'::regclass);


--
-- TOC entry 2959 (class 2604 OID 612086)
-- Name: department department_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.department ALTER COLUMN department_id SET DEFAULT nextval('public.department_department_id_seq'::regclass);


--
-- TOC entry 2971 (class 2604 OID 612087)
-- Name: orders order_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN order_id SET DEFAULT nextval('public.orders_order_id_seq'::regclass);


--
-- TOC entry 2974 (class 2604 OID 612088)
-- Name: product product_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product ALTER COLUMN product_id SET DEFAULT nextval('public.product_product_id_seq'::regclass);


--
-- TOC entry 2976 (class 2604 OID 612089)
-- Name: review review_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.review ALTER COLUMN review_id SET DEFAULT nextval('public.review_review_id_seq'::regclass);


--
-- TOC entry 2964 (class 2604 OID 612090)
-- Name: shipping shipping_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shipping ALTER COLUMN shipping_id SET DEFAULT nextval('public.shipping_shipping_id_seq'::regclass);


--
-- TOC entry 2962 (class 2604 OID 612091)
-- Name: shipping_region shipping_region_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shipping_region ALTER COLUMN shipping_region_id SET DEFAULT nextval('public.shipping_region_shipping_region_id_seq'::regclass);


--
-- TOC entry 2978 (class 2604 OID 612092)
-- Name: shopping_cart cart_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shopping_cart ALTER COLUMN cart_id SET DEFAULT nextval('public.shopping_cart_cart_id_seq'::regclass);


--
-- TOC entry 2979 (class 2604 OID 612093)
-- Name: tax tax_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tax ALTER COLUMN tax_id SET DEFAULT nextval('public.tax_tax_id_seq'::regclass);


--
-- TOC entry 3159 (class 0 OID 611975)
-- Dependencies: 219
-- Data for Name: audit; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3162 (class 0 OID 612012)
-- Dependencies: 222
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.category (category_id, department_id, name, description) VALUES (8, 2, 'SAXOPHONE', 'SAXOPHONE');
INSERT INTO public.category (category_id, department_id, name, description) VALUES (9, 2, 'FLUTE', 'FLUTE');
INSERT INTO public.category (category_id, department_id, name, description) VALUES (10, 2, 'Trumpet', 'Trumpet');
INSERT INTO public.category (category_id, department_id, name, description) VALUES (11, 2, 'TROMBONE', 'TROMBONE');
INSERT INTO public.category (category_id, department_id, name, description) VALUES (12, 2, 'MELOPHONE', 'MELOPHONE');
INSERT INTO public.category (category_id, department_id, name, description) VALUES (13, 2, 'BARCHIME', 'BARCHIME');
INSERT INTO public.category (category_id, department_id, name, description) VALUES (14, 2, 'MARCHING BELL', 'MARCHING BELL');
INSERT INTO public.category (category_id, department_id, name, description) VALUES (15, 2, 'PIANIKA', 'PIANIKA');
INSERT INTO public.category (category_id, department_id, name, description) VALUES (16, 2, 'SELANG PIANIKA', 'SELANG PIANIKA');
INSERT INTO public.category (category_id, department_id, name, description) VALUES (19, 5, 'KEYBOARD AMPLIFIER', 'KEYBOARD AMPLIFIER');
INSERT INTO public.category (category_id, department_id, name, description) VALUES (20, 5, 'ELECTRIC GUITAR', 'ELECTRIC GUITAR');
INSERT INTO public.category (category_id, department_id, name, description) VALUES (21, 5, 'ELECTRIC BASSES', 'ELECTRIC BASSES');
INSERT INTO public.category (category_id, department_id, name, description) VALUES (22, 5, 'MICROPHONES', 'MICROPHONES');
INSERT INTO public.category (category_id, department_id, name, description) VALUES (23, 5, 'Stomp Box & Multi Effects', 'Stomp Box & Multi Effects');
INSERT INTO public.category (category_id, department_id, name, description) VALUES (1, 1, 'RUSSEL & ROCKWELL
', 'RUSSEL & ROCKWELL
');
INSERT INTO public.category (category_id, department_id, name, description) VALUES (17, 1, 'POWER ART ', 'POWER ART ');
INSERT INTO public.category (category_id, department_id, name, description) VALUES (18, 1, 'SNAKE CABLE ', 'SNAKE CABLE ');
INSERT INTO public.category (category_id, department_id, name, description) VALUES (2, 1, 'SOUND ART ', 'SOUND ART ');
INSERT INTO public.category (category_id, department_id, name, description) VALUES (3, 1, 'CYMBAL-SILKEN-MMK', 'CYMBAL-SILKEN-MMK');
INSERT INTO public.category (category_id, department_id, name, description) VALUES (4, 1, 'PRO AUDIO MMK', 'PRO AUDIO MMK');
INSERT INTO public.category (category_id, department_id, name, description) VALUES (5, 1, 'MI & ASCESSORRIES MMK', 'MI & ASCESSORRIES MMK');
INSERT INTO public.category (category_id, department_id, name, description) VALUES (6, 1, 'MARCHING & BRASS MMK', 'MARCHING & BRASS MMK');
INSERT INTO public.category (category_id, department_id, name, description) VALUES (7, 1, 'TENOR BEATER ', 'TENOR BEATER ');


--
-- TOC entry 3183 (class 0 OID 632278)
-- Dependencies: 243
-- Data for Name: currency; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.currency (currency_id, currency_code, currency_name, currency_supported, fund) VALUES (971, 'AFN', 'Afghani', '2', NULL);
INSERT INTO public.currency (currency_id, currency_code, currency_name, currency_supported, fund) VALUES (8, 'ALL', 'Lek', '2', NULL);
INSERT INTO public.currency (currency_id, currency_code, currency_name, currency_supported, fund) VALUES (12, 'DZD', 'Algerian Dinar', '2', NULL);
INSERT INTO public.currency (currency_id, currency_code, currency_name, currency_supported, fund) VALUES (840, 'USD', 'US Dollar', '2', NULL);
INSERT INTO public.currency (currency_id, currency_code, currency_name, currency_supported, fund) VALUES (973, 'AOA', 'Kwanza', '2', NULL);
INSERT INTO public.currency (currency_id, currency_code, currency_name, currency_supported, fund) VALUES (951, 'XCD', 'East Caribbean Dollar', '2', NULL);
INSERT INTO public.currency (currency_id, currency_code, currency_name, currency_supported, fund) VALUES (32, 'ARS', 'Argentine Peso', '2', NULL);
INSERT INTO public.currency (currency_id, currency_code, currency_name, currency_supported, fund) VALUES (51, 'AMD', 'Armenian Dram', '2', NULL);
INSERT INTO public.currency (currency_id, currency_code, currency_name, currency_supported, fund) VALUES (533, 'AWG', 'Aruban Florin', '2', NULL);
INSERT INTO public.currency (currency_id, currency_code, currency_name, currency_supported, fund) VALUES (36, 'AUD', 'Australian Dollar', '2', NULL);
INSERT INTO public.currency (currency_id, currency_code, currency_name, currency_supported, fund) VALUES (978, 'EUR', 'Euro', '2', NULL);
INSERT INTO public.currency (currency_id, currency_code, currency_name, currency_supported, fund) VALUES (944, 'AZN', 'Azerbaijan Manat', '2', NULL);
INSERT INTO public.currency (currency_id, currency_code, currency_name, currency_supported, fund) VALUES (44, 'BSD', 'Bahamian Dollar', '2', NULL);
INSERT INTO public.currency (currency_id, currency_code, currency_name, currency_supported, fund) VALUES (48, 'BHD', 'Bahraini Dinar', '3', NULL);
INSERT INTO public.currency (currency_id, currency_code, currency_name, currency_supported, fund) VALUES (50, 'BDT', 'Taka', '2', NULL);
INSERT INTO public.currency (currency_id, currency_code, currency_name, currency_supported, fund) VALUES (52, 'BBD', 'Barbados Dollar', '2', NULL);
INSERT INTO public.currency (currency_id, currency_code, currency_name, currency_supported, fund) VALUES (933, 'BYN', 'Belarusian Ruble', '2', NULL);
INSERT INTO public.currency (currency_id, currency_code, currency_name, currency_supported, fund) VALUES (84, 'BZD', 'Belize Dollar', '2', NULL);
INSERT INTO public.currency (currency_id, currency_code, currency_name, currency_supported, fund) VALUES (60, 'BMD', 'Bermudian Dollar', '2', NULL);
INSERT INTO public.currency (currency_id, currency_code, currency_name, currency_supported, fund) VALUES (356, 'INR', 'Indian Rupee', '2', NULL);
INSERT INTO public.currency (currency_id, currency_code, currency_name, currency_supported, fund) VALUES (64, 'BTN', 'Ngultrum', '2', NULL);
INSERT INTO public.currency (currency_id, currency_code, currency_name, currency_supported, fund) VALUES (68, 'BOB', 'Boliviano', '2', NULL);
INSERT INTO public.currency (currency_id, currency_code, currency_name, currency_supported, fund) VALUES (984, 'BOV', 'Mvdol', '2', '1');
INSERT INTO public.currency (currency_id, currency_code, currency_name, currency_supported, fund) VALUES (977, 'BAM', 'Convertible Mark', '2', NULL);
INSERT INTO public.currency (currency_id, currency_code, currency_name, currency_supported, fund) VALUES (72, 'BWP', 'Pula', '2', NULL);
INSERT INTO public.currency (currency_id, currency_code, currency_name, currency_supported, fund) VALUES (578, 'NOK', 'Norwegian Krone', '2', NULL);
INSERT INTO public.currency (currency_id, currency_code, currency_name, currency_supported, fund) VALUES (986, 'BRL', 'Brazilian Real', '2', NULL);
INSERT INTO public.currency (currency_id, currency_code, currency_name, currency_supported, fund) VALUES (96, 'BND', 'Brunei Dollar', '2', NULL);
INSERT INTO public.currency (currency_id, currency_code, currency_name, currency_supported, fund) VALUES (975, 'BGN', 'Bulgarian Lev', '2', NULL);
INSERT INTO public.currency (currency_id, currency_code, currency_name, currency_supported, fund) VALUES (952, 'XOF', 'CFA Franc BCEAO', '0', NULL);
INSERT INTO public.currency (currency_id, currency_code, currency_name, currency_supported, fund) VALUES (108, 'BIF', 'Burundi Franc', '0', NULL);
INSERT INTO public.currency (currency_id, currency_code, currency_name, currency_supported, fund) VALUES (132, 'CVE', 'Cabo Verde Escudo', '2', NULL);
INSERT INTO public.currency (currency_id, currency_code, currency_name, currency_supported, fund) VALUES (116, 'KHR', 'Riel', '2', NULL);
INSERT INTO public.currency (currency_id, currency_code, currency_name, currency_supported, fund) VALUES (950, 'XAF', 'CFA Franc BEAC', '0', NULL);
INSERT INTO public.currency (currency_id, currency_code, currency_name, currency_supported, fund) VALUES (124, 'CAD', 'Canadian Dollar', '2', NULL);
INSERT INTO public.currency (currency_id, currency_code, currency_name, currency_supported, fund) VALUES (136, 'KYD', 'Cayman Islands Dollar', '2', NULL);
INSERT INTO public.currency (currency_id, currency_code, currency_name, currency_supported, fund) VALUES (152, 'CLP', 'Chilean Peso', '0', NULL);
INSERT INTO public.currency (currency_id, currency_code, currency_name, currency_supported, fund) VALUES (990, 'CLF', 'Unidad de Fomento', '4', '1');
INSERT INTO public.currency (currency_id, currency_code, currency_name, currency_supported, fund) VALUES (156, 'CNY', 'Yuan Renminbi', '2', NULL);
INSERT INTO public.currency (currency_id, currency_code, currency_name, currency_supported, fund) VALUES (170, 'COP', 'Colombian Peso', '2', NULL);
INSERT INTO public.currency (currency_id, currency_code, currency_name, currency_supported, fund) VALUES (970, 'COU', 'Unidad de Valor Real', '2', '1');
INSERT INTO public.currency (currency_id, currency_code, currency_name, currency_supported, fund) VALUES (174, 'KMF', 'Comorian Franc ', '0', NULL);
INSERT INTO public.currency (currency_id, currency_code, currency_name, currency_supported, fund) VALUES (976, 'CDF', 'Congolese Franc', '2', NULL);
INSERT INTO public.currency (currency_id, currency_code, currency_name, currency_supported, fund) VALUES (554, 'NZD', 'New Zealand Dollar', '2', NULL);
INSERT INTO public.currency (currency_id, currency_code, currency_name, currency_supported, fund) VALUES (188, 'CRC', 'Costa Rican Colon', '2', NULL);
INSERT INTO public.currency (currency_id, currency_code, currency_name, currency_supported, fund) VALUES (191, 'HRK', 'Kuna', '2', NULL);
INSERT INTO public.currency (currency_id, currency_code, currency_name, currency_supported, fund) VALUES (192, 'CUP', 'Cuban Peso', '2', NULL);
INSERT INTO public.currency (currency_id, currency_code, currency_name, currency_supported, fund) VALUES (931, 'CUC', 'Peso Convertible', '2', NULL);
INSERT INTO public.currency (currency_id, currency_code, currency_name, currency_supported, fund) VALUES (532, 'ANG', 'Netherlands Antillean Guilder', '2', NULL);
INSERT INTO public.currency (currency_id, currency_code, currency_name, currency_supported, fund) VALUES (1, 'DRA', 'Mata uang DRA', NULL, NULL);
INSERT INTO public.currency (currency_id, currency_code, currency_name, currency_supported, fund) VALUES (2, 'DRA2', 'DRA 2 Mata uang', NULL, NULL);
INSERT INTO public.currency (currency_id, currency_code, currency_name, currency_supported, fund) VALUES (3, 'IDRX', 'update MATA UANG IDRX', NULL, NULL);
INSERT INTO public.currency (currency_id, currency_code, currency_name, currency_supported, fund) VALUES (4, 'CEDD', 'CSDCSDFS', NULL, NULL);
INSERT INTO public.currency (currency_id, currency_code, currency_name, currency_supported, fund) VALUES (5, 'qqq', 'adfddfsdf', NULL, NULL);
INSERT INTO public.currency (currency_id, currency_code, currency_name, currency_supported, fund) VALUES (6, 'zxczxcz', 'xxxxxxx', NULL, NULL);
INSERT INTO public.currency (currency_id, currency_code, currency_name, currency_supported, fund) VALUES (7, 'CTXKODE', 'INI CEK KODE', NULL, NULL);


--
-- TOC entry 3157 (class 0 OID 611957)
-- Dependencies: 217
-- Data for Name: customer; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3156 (class 0 OID 611932)
-- Dependencies: 216
-- Data for Name: department; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.department (department_id, name, description) VALUES (2, 'MARCHING & BRASS MMK', 'MARCHING & BRASS MMK dll');
INSERT INTO public.department (department_id, name, description) VALUES (3, 'MI & ASCESSORRIES MMK', 'MI & ASCESSORRIES MMK');
INSERT INTO public.department (department_id, name, description) VALUES (4, 'PRO AUDIO MMK', 'PRO AUDIO MMK');
INSERT INTO public.department (department_id, name, description) VALUES (5, 'RUSSEL & ROCKWELL', 'RUSSEL & ROCKWELL');
INSERT INTO public.department (department_id, name, description) VALUES (1, 'ALAT MUSIK', 'ALAT MUSIK');


--
-- TOC entry 3166 (class 0 OID 612024)
-- Dependencies: 226
-- Data for Name: example_table; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.example_table (id, name, created_date, created_time, is_active, counter, currency, description, floating) VALUES ('001', 'Dimas Maryanto', '2020-01-29', '2020-01-29 03:42:09.728246', true, 0, 100000, NULL, 0.100000000000000006);
INSERT INTO public.example_table (id, name, created_date, created_time, is_active, counter, currency, description, floating) VALUES ('002', 'Muhamad yusuf', '2020-01-29', '2020-01-29 03:42:09.728246', true, 0, 100000, NULL, 0.100000000000000006);
INSERT INTO public.example_table (id, name, created_date, created_time, is_active, counter, currency, description, floating) VALUES ('003', 'Prima', '2020-01-29', '2020-01-29 03:42:09.728246', true, 0, 100000, NULL, 0.100000000000000006);
INSERT INTO public.example_table (id, name, created_date, created_time, is_active, counter, currency, description, floating) VALUES ('004', 'Gufron', '2020-01-29', '2020-01-29 03:42:09.728246', true, 0, 100000, NULL, 0.100000000000000006);
INSERT INTO public.example_table (id, name, created_date, created_time, is_active, counter, currency, description, floating) VALUES ('005', 'Abdul', '2020-01-29', '2020-01-29 03:42:09.728246', true, 0, 100000, NULL, 0.100000000000000006);


--
-- TOC entry 3167 (class 0 OID 612033)
-- Dependencies: 227
-- Data for Name: order_detail; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3168 (class 0 OID 612036)
-- Dependencies: 228
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3170 (class 0 OID 612043)
-- Dependencies: 230
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (110, 'MLC - 8 - 425 ', '8 Chanel - 4 Output - 25 Meter', 3000000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (111, 'MLC - 16 - 430 ', '16 Chanel input - 4 Output - 30 Meter', 3760000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (112, 'MLC - 16 - 450 ', '16 Chanel input - 4 Output - 50 Meter', 4820000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (113, 'MLC - 24 - 430 ', '24 Chanel input - 4 Output - 30 Meter', 5305000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (114, 'MLC - 24 - 450 ', '24 Chanel input - 4 Output - 50 Meter', 6335000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (115, 'MLC - 24 - 850', '24 Chanel input - 8 Output - 50 Meter', 7915000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (116, 'MLC - 32 - 850', '32 Chanel input - 8 Output - 50 Meter', 9200000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (117, 'MLCD - 24 - 850', '24 Chanel input - 8 Output - 50 Meter - Roll', 9200000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (118, 'MLCD - 32 - 850', '32 Chanel input - 8 Output - 50 Meter - Roll', 10300000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (119, 'SILKEN AURORA SET', 'Handmade Cymbal set 14" Hi-Hat, 16" Crash, 18" Crash w/bag', 2450000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (9, 'The Pope Hat', 'We''re not sure what the Vatican''s official position is on this hat, but we do know your friends will love you in this soft velour hat with gold lame accents. If you''re somewhat lacking in religion ... if you''re looking for some hope ... you might acquire just a smidgeon ... by faithfully wearing our Pope!', 409633.00, 0.00, 'ThePopeHat.jpg', 'ThePopeHat.thumb.jpg', 0, '''accent'':35 ''acquir'':52 ''faith'':57 ''friend'':23 ''gold'':33 ''hat'':3A,17,31 ''hope'':49 ''know'':21 ''lack'':40 ''lame'':34 ''look'':46 ''love'':25 ''might'':51 ''offici'':12 ''pope'':2A,60 ''posit'':13 ''re'':5,38,45 ''religion'':42 ''smidgeon'':55 ''soft'':29 ''somewhat'':39 ''sure'':7 ''vatican'':10 ''velour'':30 ''wear'':58');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (120, 'SILKEN AURORA SET BRASS SH', 'Handmade Cymbal set 14" Hi-Hat, 16" Crash, 20" Ride w/bag', 2800000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (47, 'RG-15 X', '15 watts Combo Amplifier, 1x8"" 8 Ohm
control: CD volume, Clean volume, Drive volume, Drive switch EQ, (Hig,Mid,Low) Reverb, Master
Jack: CD Input, Input, PreOut, Phones
220-240V 50/60Hz 
Dimension : (50.5 X 55.5 X 43.5) cm', 1780000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (121, 'SILKEN SEBRING SET HH 14"', 'Handmade Cymbal set 14" Hi-Hat, 16" Crash, 18" Crash, 20" Ride w/bag', 9780000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (46, 'RG-10 X', '10 Watts Combo Amplifier, 1x5"  8 Ohm,
control: Clean volume, Drive volume, Drive switch, Tone, Master,
Jack: Input,Phones 
220-240V 50/60Hz, 
Dimension : (42.7 X 27 X 35.5) cm', 1580000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (48, 'ROKR-80, HEAD', '80 watts Head Amplifier, 
Controls:Clean volume, Drive chanel (Gain,Switch,Level) EQ (High,Mid,Low) Reverb, Master,
Front Panel Jacks: Input                                      Back Panel Jacks: SpeakerOut, PreOut, Footswitch, TunerOut 
220-240V 50/60Hz (Footswitch Included)', 4235000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (49, 'RSG-408, CABINET', 'Cabinet 4 x 8" 8 Ohm ', 4235000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (50, 'ROKR-200, HEAD', 'Head Amplifier, 200Watt,  Controls:Cleanvolume,Drive chanel(Gain,Switch,Level)Equalization (High,Mid,Low) Reverb, Master,Jacks:Input, SpakerOut,PreOut,Footswitch,TunnerOut 220-240V 50/60Hz (Footswitch Included)', 6080000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (51, 'RSG-412 ', 'Cabinet 4x12" 8 Ohm', 6080000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (52, 'RG-30 DF', '30 watts Combo Amp 1x10"" Celestion 
Dual Channel (footswitch include)                Controls: Clean Vol, Drive/Crunch,                        EQ (High,Mid,Low) Reverb, (master) Volume
Front Panel Jacks: Input                                     Back Panel Jacks: Footswitch
220-240V 50/60Hz ', 2980000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (53, 'RG-60 DF', '60 watts Combo Amp 2x10"" Celestion 
Dual Channel (footswitch include)                Controls: Clean Vol, Drive/Crunch,                        EQ (High,Mid,Low) Reverb, (master) Volume
Front Panel Jacks: Input, Send, Return            Back Panel Jacks: Footswitch
220-240V 50/60Hz, ', 3880000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (54, 'ROKR 80 DF        HEAD/CAB', '80 Watts Head Amplifier
Dual Channel (footswitch include)                Controls: Clean Vol, Drive/Crunch,                        EQ (High,Mid,Low) Reverb, (master) Volume
Front Panel Jacks: Input, Send, Return            Back Panel Jacks: SpeakerOut, Footswitch,            Built in DI Box 
220-240V 50/60Hz .                                            Cabinet: 4 x 8"" Celestion Speaker. ', 5380000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (55, 'ROKR 200 DF        HEAD/CAB', '200 Watts Head Amplifier
Dual Channel (footswitch include)                Controls: Clean Vol, Drive/Crunch, Deep Switch               EQ (High,Mid,Low) Reverb, (master) Volume
Front Panel Jacks: Input, Send, Return            Back Panel Jacks: SpeakerOut, Footswitch,            Built in DI Box 
220-240V 50/60Hz .                                            Cabinet: 4 x 8"" Celestion Speaker. ', 6580000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (56, 'RB-20 CD ', '20 Watts Combo Amplifier, 1x8" 8 Ohm     Controls:CD volume, Gain, Bright Switch,           EQ (High,Mid,Low), Master                                Jacks: CD Input (RCA), Input, PreOut, Phones  220-240V 50/60Hz                                          Dimension : (43.5 X 28 X 44) cm', 1880000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (57, 'RB-50', '50 Watts Combo Amplifier                                    1x12" 8 Ohm with 1x3" Horn Tweeter,                                       Controls: Gain, EQ (High, Mid, Low), Compression (Switch,Level), Bright Switch, Master                                                                       Jacks: Input (Passive, Active), Phones, PreOut, Ext.Speaker, Tuner Out,                                                    220-240V 50/60Hz Dimension : (60 X 37.5 X 63.5) cm', 2780000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (58, 'STORM-100, HEAD', '100 watts Head Amp                                                 Controls: Gain, Compress (Switch, Level),        EQ (Low, LowMid, Mid, HighMid, High), Chorus, Master.                                                                              Jacks: Input, Ext.Speaker, PreOut, TunerOut         220-240V 50/60Hz', 2680000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (59, 'RSB-408, CABINET', 'Cabinet 4x8" 8 Ohm + Tweeter (Storm 100 Cabinet)', 1980000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (60, 'STORM-200, HEAD', '200 watts Head Amp                                                 Controls: Gain, Compress (Switch, Level),        EQ (Low, LowMid, Mid, HighMid, High), Chorus, Master.                                                                              Jacks: Input, Ext.Speaker, PreOut, TunerOut         220-240V 50/60Hz', 2880000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (61, 'RSB 410, CABINET', 'Cabinet 4x10" 8 Ohm + Tweeter', 2880000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (62, 'KB-30', '30 Watts Amplifier, 1 x 8” 8 Ohm,                             Input : 1/4” Jack, Micropone, Keyboard + RCA (CD In)
Control : Tune, Echo, Volume
Output : 1/4” Jack, Phones, 1/4” Jack Ext.Speaker 220-240 V,                                                  Dimension : (44.5 X 31 X 46) cm', 2480000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (84, 'RJB-20 MAPLE             ( NHS )', 'Body Bass Wood
Neck Maple
Inlay Custom Block
Scale 34” | Frets 24
Pick-Up 2 Jazz bass G&B Richard Miller
Controls 2 Vol, 1 Tone
Bridge Single Monorail', 2760000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (63, 'VICTORY-50', '50 watts Amplifier                                                        1x12" 8 Ohm, 1x3" Horn Tweeter.                            Controls:  Mic Channel (Tone, Echo, Volume), CD Volume, EQ (5 band), Volume.                         Jacks: Mic Input, CD Input (RCA), Input, Ext,Speaker, Phones, PreOut                                 220-240V 50/60Hz,                                                    Dimension :  (50 X 38 X 66.5) cm', 2980000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (64, 'KB-70', '70 Watts Amp, 1x12" 8 Ohm, 1x3" Horn Tweeter. Controls: Mic chanel (Level 1&2, Tone, Reverb), CD Channel (Volume), Keyboard Channel (Level 1&2,3 band EQ)                                                           Jacks: 2 Mic Input, CD Input (RCA), 2 Input, Speaker Out, Pre Out.                                               220-240V 50/60Hz', 2980000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (65, 'KB-100', '100 Watts Amplifier                                                    1x15" 8 Ohm, 2x3" Horn Tweeter.                           Controls: 2 Mic Channels (2 Volume, 3 band EQ) CD Channel (Volume), 2 Keyboard channels (2 Volume, 3 band EQ), Master.                                   Jacks: 2 Mic Input (1 Unbalanced), 2 input (Mono/Stereo), CD Input (RCA), Ext.Speaker, PreOut (Balanced & Unbalanced)                           220-240V 50/60Hz,                                                    Dimension : ( 72 X 38.5 X 74.5) cm', 4180000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (66, 'RG-01 Maple (NHS)', 'Body Bass Wood
Neck Maple
Scale 25.5” | Frets 24
Pick-up 1 Humbucker Richard Miller
Control 1 Vol. 1 Tone
Bridge Standard
Dimensi : 110 x 35 x 60 w/ new shape', 2050000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (67, 'RG-02 Maple (NHS)', 'Body Bass Wood
Neck  Maple
Scale 25.5” | Frets 24
Pick-Up 2 Single Richard Miller
Controls 1 Vol, 1 Tone
3 Way Lever Switch
Bridge Standard
Dimensi : 110 x 35 x 60 w/ new shape
', 2100000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (68, 'RG-112 Maple (NHS)', 'Body Bass Wood
Neck Maple
Scale 25.5” | Frets 24
Pick-Up 2 Single G&B Richard Miller
1 Humbucker G&B Richard Miller
Controls 1 Vol, 1 Tone
5 Way Lever Switch
Bridge Standard
Dimensi : 110 x 35 x 60 w/ new shape', 2225000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (69, 'RST-33 Maple (NHS)', 'Body Bass Wood
Neck  Maple                            
Fingerboard Rosewood
Scale 25.5” | Frets 22
Pick-Up 3 Single Richard Miller
Controls 1 Vol, 2 Tone
5 Way Lever Switch
Bridge Standard                                   
Hardware Chrome
Dimensi : 110 x 35 x 60 w/ new shape                            ', 2075000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (70, 'RG-212 Maple (NHS)', 'Body Bass Wood
Neck Maple
Scale 25.5” | Frets 24
Pick-Up 1 Single G&B Richard Miller
2 Humbucker G&B Richard Miller
Controls 1 Vol, 1 Tone
5 Way Lever Switch
Bridge Up-Down licensed by Floyd Rose', 3170000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (71, 'EX-22 ( NHS )', 'Body Bass Wood
Neck Maple                                               Fingerboard Rosewood                         Construction Bolt-On
Scale 24.75” | Frets 22
Pick-Up 2 Humbucker G&B Richard Miller
Controls 1 Vol, 1 Tone
3 Way Toggle Switch
Bridge Tone-O-Matic                                   Hardware Chrome', 2430000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (72, 'RLP-22 ( NHS )', 'Body Ash Wood
Neck Maple
Inlay Costume Block
Scale 24.75” | Frets 22
Pick-up 2 Humbucker G&B Richard Miller
Control 2 Vol. 2 Tone
3 Way Lever Switch
Bridge Tone-O-Matic 
Dimensi : 110 x 35 x 60 w/ new shape', 2610000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (73, 'BABY BLUES (NHS)', 'Body Ash Wood
Neck Maple
Inlay Costume Block
Scale 24.75” | Frets 22
Pick-up 2 Humbucker Richard Miller
Control 2 Vol. 2 Tone
3 Way Lever Switch
Bridge Tone-O-Matic ', 2500000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (74, 'X-22 ( NHS )', 'Body Bass Wood
Neck Maple
Scale 25.5” | Frets 24
Pick-Up 2 Humbucker G&B Richard Miller
Controls 1 Vol, 1 Tone
3 Way Lever Switch
Bridge Standard', 2300000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (75, 'STRADY CLASSY', 'Body American Bass Wood
Neck  Canadian Maple One Piece                            
Fingerboard Rosewood
Scale 25.5” | Frets 21
Pick-Up 3 Single Alnico Custom Richard Miller
Controls 1 Vol, 2 Tone
5 Way Lever Switch
Bridge Standard Rockwell 10,5 mm                               
Hardware Chrome
Dimensi : 110 x 35 x 60                                      String Blacksmith NW-1046                           Fingerboard Radius 14 ""                       ', 5550000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (76, 'STRADY BOLD', 'Body American Bass Wood
Neck  Canadian Maple One Piece                            
Fingerboard Rosewood
Scale 25.5” | Frets 22
Pick-Up SSH Alnico Custom Richard Miller
Controls 1 Vol, 1 Tone Coil Tap
5 Way Lever Switch
Bridge Standard Rockwell 10,5 mm                               
Hardware Chrome
Dimensi : 110 x 35 x 60                                      String Blacksmith NW-1046                           Fingerboard Radius 14 ""                       ', 5550000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (77, 'OFARIUS HSH', 'Body Swamp Ash w/ Glaze Striping
Neck  Canadian Maple One Piece                            
Fingerboard Rosewood
Scale 25.5” | Frets 24
Pick-Up Hum Sing Hum Custom Richard Miller 
Controls 1 Vol, 1 Tone
5 Way Lever Switch
Bridge Single Locking Tremolo Zinc Diecash                             
Hardware Chrome
Dimensi : 110 x 35 x 60                                      String Blacksmith NW-0942                           Fingerboard Radius 14 ""                       ', 4195000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (78, 'OFARIUS HH', 'Body Swamp Ash w/ Glaze Striping
Neck  Canadian Maple One Piece                            
Fingerboard Rosewood
Scale 25.5” | Frets 24
Pick-Up Hum Hum Custom Richard Miller 
Controls 1 Vol, 1 Tone
3 Way Lever Switch
Bridge Single Locking Tremolo Zinc Diecash                             
Hardware Chrome
Dimensi : 110 x 35 x 60                                      String Blacksmith NW-1046                           Fingerboard Radius 14 ""                       ', 3960000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (79, 'OFARIUS SSH', 'Body Swamp Ash w/ Glaze Striping
Neck  Canadian Maple One Piece                            
Fingerboard Rosewood
Scale 25.5” | Frets 24
Pick-Up Sing Sing Hum Custom Richard Miller 
Controls 1 Vol, 1 Tone
5 Way Lever Switch
Bridge Single Locking Tremolo Zinc Diecash                             
Hardware Chrome
Dimensi : 110 x 35 x 60                                      String Blacksmith NW-1046                           Fingerboard Radius 14 ""                       ', 3800000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (80, 'RB-01 Maple (NHS)', 'Body Bass Wood
Neck Maple
Scale 34” | Frets 24
Pick-Up 1 Precision Richard Miller
Controls 1 Vol, 1 Tone
Bridge Single Monorail
       ', 2050000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (81, 'RB-32 Maple (NHS)', 'Body Bass Wood
Neck Maple
Scale 34” | Frets 24
Pick-Up 2 Jazz Bass G&B Richard Miller
Controls 2 Vol, 2 Tone
Bridge Single Monorail', 2150000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (82, 'RBH-21 Maple (NHS)', 'Body Bass Wood
Neck  Maple
Scale 34” | Frets 24
Pick-Up 1 Jazz Bass G&B Richard Miller
1 Precision G&B
Controls 2 Vol, 2 Tone
Bridge Single Monorail', 2200000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (83, 'XB-32 Maple (NHS)', 'Body Bass Wood
Neck Maple
Scale 34” | Frets 24
Pick-Up 1 Jazz Bass G&B Richard Miller
Controls 2 Vol, 2 Tone
Bridge Single Monorail', 2300000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (198, 'RENEGADE DRUMHEAD DHO SERIES', 'Drumhead Two Ply Oil Skin 12 " Trans', 69000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (85, 'JAVA JJ', 'Body Swamp Ash
Neck One Piece Canadian Maple
Inlay Dot Abalone + Side Dots
Scale 34” | Frets 20 ( Medium Std Blacksmith )
Pick-Up 2 Jazz Bass Alnico Richard Miller 
Controls 2 Vol, Bal, Bass, Treble w/ act pre-amp
Bridge Single 20 mm                                               Fingerboard Radius 14""                                     String Blacksmith NW 45105 Nickle Round Wound ', 5550000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (86, 'JAVA PJ', 'Body Swamp Ash
Neck One Piece Canadian Maple
Inlay Dot Abalone + Side Dots
Scale 34” | Frets 20 ( Medium Std Blacksmith )
Pick-Up 2 Precission Bass Alnico Richard Miller
Controls 2 Vol, Bal, Bass, Treble w/ act pre-amp
Bridge Single 20 mm                                               Fingerboard Radius 14""                                     String Blacksmith NW 45105 Nickle Round Wound ', 5550000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (87, 'JAVA JJ 5 STRING', 'Body Swamp Ash
Neck One Piece Canadian Maple
Inlay Dot Abalone + Side Dots
Scale 34” | Frets 24 ( Medium Std Blacksmith )
Pick-Up 2 Jazz Bass Alnico Richard Miller 
Controls 2 Vol, Bal, Bass, Treble w/ act pre-amp
Bridge Single 20 mm                                               Fingerboard Radius 14""                                     String Blacksmith NW 45130 Nickle Round Wound ', 6300000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (88, 'ZENERGY JJ', 'Body Swamp Ash
Neck One Piece Canadian Maple
Inlay Dot Abalone + Side Dots
Scale 34” | Frets 24 ( Medium Std Blacksmith )
Pick-Up 2 Jazz Bass Alnico Richard Miller
Controls 2 Vol, Bal, Bass, Treble w/ act pre-amp
Bridge Custom 20 mm                                               Fingerboard Radius 14""                                     String Blacksmith NW 45105 Nickle Round Wound ', 3960000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (89, 'ZENERGY PJ', 'Body Swamp Ash
Neck One Piece Canadian Maple
Inlay Dot Abalone + Side Dots
Scale 34” | Frets 24 ( Medium Std Blacksmith )
Pick-Up 2 Precission Bass Alnico Richard Miller
Controls 2 Vol, Bal, Bass, Treble w/ act pre-amp
Bridge Custom 20 mm                                               Fingerboard Radius 14""                                     String Blacksmith NW 45105 Nickle Round Wound ', 3960000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (90, 'SINGLE CUT        ELITE', 'Body Swamp Ash
Neck One Piece Canadian Maple
Inlay Dot Abalone + Side Dots
Scale 34” | Frets 24 ( Medium Std Blacksmith )
Pick-Up 2 Double&Single coil Alnico Richard Miller 
Controls 2 Vol, Bal, Bass, Treble w/ act pre-amp
Bridge Single 2 Switch f/ change pickup system 20 mm    Fingerboard Radius 14""                                     String Blacksmith NW 45130 Nickle Round Wound ', 7100000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (155, 'RENEGADE BASS BEATER BBS', 'Stainless Steel Handle Bass Beater', 95000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (91, 'SA-58', 'DIRECTION : CARDIOID UNI-DIRECTION(DYN) FREQUENCY RESPONSE : 50-1600 Hz          IMPEDANCE : 600 OHM                                   SENSITIVITY : -75 dB ± 3 dB                           OUTPUT LINE : 4,5 M CABLE                                 BODY : ZYNC DIE-CAST BODY', 180000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (92, 'SA-3900', 'MODULATION MODE : WIDEBANK FM, FREQUENCY RANGE : 650 - 700 MHz,   CHANNEL NUMBER : 200 CH PRESET, DYNAMIC RANGE : 100 dB,     AUDIO FREQUNCY RESPONSE : 80 Hz - 18 KHz,   SENSITIVITY : 12 dB uV ( 80 dB S/N ), MAXIMUM OUTPUT LEVEL : +10 dB V, OPERATING TIME : HIGH POWER 10 hours', 2560000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (93, 'SA-68', 'IMPEDANCE : 600 Ohm +- 15 %,             SENSITIVITY : -53=+- 2 dB ,                 DIRECTIVITY : SUPER CARDIOID,    FREQUENCY RANGE : 50 Hz - 16 KHz,  BUILT IN ON/OFF SWITCH', 600000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (94, 'SA-980 +', 'MODULATION MODE :  FM,           FREQUENCY RANGE : 600 - 952 MHz,   CHANNEL NUMBER : 100 CH PRESET, DYNAMIC RANGE : 100 dB,   AUDIO FREQUENCY RESPONSE : 60 Hz - 17 KHz,   SENSITIVITY : -106 dB ( 60 dBm ),      OPERATING TEMPERATURE : -10 + 50*C, OPERATING TIME : 10 hours (DEPENDING ON BATTERY )', 5450000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (95, 'Rockwell Stomp Box High Gain HG-6', 'HG-6 Modern High Gain
1. Very high gain makes the distortion sound aggressive
2. 3 gain stages fully discrete circuit. 
FET simulate the characteristic distortion of tube amplifier
3. Active middle frequency EQ circuit
4. True bypass provides transparent tone
5. LED indicator shows status of effect and battery condition
6. The pedal can be powered by a battery or an optional AC adaptor
SPECS
• Input impedance: 1MΩ
• Output impedance: 10KΩ
• Power: 9V Battery or 9V AC Adapter
• Dimensions: 121(L) x77(W) x48(D) mm
• Weight: 230g', 500000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (96, 'Rockwell Stomp Box Over Drive OD-3', 'OD-3 Vintage Overdrive
1. Delivers that warm, natural tube overdrive sound
2. By rotating the knobs you can boost the guitar 
amp for colorful tone or overdrive itself for unique pedal sound.
3. True bypass provides transparent tone
4. LED indicator shows status of effect and battery condition
5. The pedal can be powered by a battery or an optional AC adaptor
SPECS
• Input impedance: 1MΩ
• Output impedance: 10KΩ
• Power: 9V Battery or 9V AC Adapter
• Dimensions: 121(L) x77(W) x48(D) mm
• Weight: 230g
', 500000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (97, 'Rockwell Stomp Box Amp Simulator AS-4', 'Amp Simulator AS 4
1. Simulates the characteristic distortion and cabinet 
sound of a guitar amplifier.
2. Extra amount of gain frequencies for greater distortion effect.
3. True bypass providestransparent tone.
4. Bass and high tune control
5. LED indicator shows effect status and battery condition.
6. The pedal can be powered by a battery or an optional AC adaptor
Specs
• Input impedance : 1 MOhms
• Output impedance : 10KOhms
• Power : One 9V battery
o Or external AC adaptor (9V)
• Dimensions : 121 (L) x 77 (W) x 48 (D) mm
• Weight : 230g', 500000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (98, 'Rockwell Stomp Box Chorus CH-3', 'CH-3 Vintage Chorus
1. Very high quality effect with flexible function
2. Adapted low noise BBD in delay circuit, natural and clear sound
3. True bypass provides transparent tone
4. LED indicator shows status of effect and battery condition
5. The pedal can be powered by a battery or an optional AC adaptor
SPECS
• Input impedance: 1MΩ
• Output impedance: 10KΩ
• Power: 9V Battery or 9V AC Adapter
• Dimensions: 121(L) x77(W) x48(D) mm
• Weight: 230g
', 550000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (99, 'Rockwell Stomp Box Metal Core', '1. 2 voice of metal sound. 
 2. 2-Band EQ.
3. Tone Lock function and one preset save/recall.
4. New generation 32-bit DSP, high performance 24-bit
5. 44.1 kHz AD/DA convert. 
6. True bypass.
7. Runs on battery or AC power
SPECS
• Presets:1 storable user preset
• Sampling Frequency: 44.1 kHz
• A/D converter: 24-bit
• Signal Processing:32-bit
• Frequency response:20Hz-20000Hz ±1dB
• THD+N: 93dBu (<0.003%) A-Weighting
• Dynamic Range:100dB
• INPUT:-20dBV@1MΩ
• OUTPUT:-10dBV (Output load impedance of 10kΩor more)
• Power:9V DC (9V Battery, ACD-007A Adapter)
• Dimensions: 122(L) x 72(W) x 47(H)mm
• Weight:270g
', 780000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (137, 'SILKEN DRAGON PIECE', 'Handmade Cymbal piece 13" Hi-Hat. Aggressive, Powerfull and Loud tone that cuts through both live and studio settings. Perfect for Hard Rock and Heavy Metal drumming.', 3400000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (138, 'RENEGADE SNARE DRUM 10"', 'Marching Snare Drum Band 10 x 6 ". 6 Lugs Single Tension + Strap. Include Stick, Beater & Sling. Colour : Met Red', 660000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (100, 'Rockwell Stomp Box Chorus Core', '1. Normal and Tri chorus
2. Tone Lock function and one preset save/recall
3. New generation 32-bit DSP, high performance 24-bit
4. 44.1 kHz AD/DA convert
5. True bypass
6. Runs on battery or AC power
SPECTS
• Presets:1 storable user preset
• Sampling Frequency: 44.1 kHz
• A/D converter: 24-bit
• Signal Processing:32-bit
• Frequency response:20Hz-20KHz ±1dB
• THD+N: 93dBu (<0.003%) A-Weighting
• Dynamic Range:100dB
• INPUT:-20dBV@1Mohm
• OUTPUT:-10dBV (Output load impedance of 10k or more)
• Power:9V DC (9V Battery, ACD-007A Adapter)
• Dimensions: 122(L) x 72(W) x 47(H)mm
• Weight:270g
', 715000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (101, 'Rockwell Stomp Box Flanger Core', 'Flanger Core
1. Normal and Tape Flanger
2. Tone Lock function and one preset save/recall
3. New generation 32-bit DSP, high performance 24-bit
4. 44.1 kHz AD/DA convert
5. True bypass
6. Runs on battery or AC power
SPECS
• Presets:1 storable user preset
• Sampling frequency: 44.1 kHz
• A/D converter: 24-bit
• Signaprocessing: 32-bit
• Frequency response: 20Hz-20kHz ±1dB
• THD+N: 93dBu (＜0.003%) A-Weighting
• Dynamic Range: 100dB
• Input: -20dBV@1MΩ
• Output: -10dBV(Output load impedance of 10 KΩ or more)
• Power: 9V DC (9V battery or optionaACD-007A Adaptor)
• Dimensions: 122(L) x 72(W) x 47(H)mm
• Weight:270g
', 660000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (102, 'Rockwell Stomp Box Drive Core', 'Drive Core
The Drive Core is a mixture of a signal booster and overdrive
, giving a player the ability to fatten up and 
overdrive their favorite amplifier sound.

1. Separate signal booster circuit 
2. Warm and natural overdrive of tube saturation 
3. Mixture of boost and overdrive sound 
4. True Bypass 
5. Runs on battery or AC power

SPECS
• Input Impedance: 1MΩ
• Output Impedance:10kΩ
• Power:9V DC (9V Battery, ACD-007A Adapter)
• Dimensions: 122(L) x 72(W) x 47(H)mm
• Weight:270g
', 550000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (103, 'Rockwell Stomp Box Delay Core', 'Effect types:7 modeling delay models
Presets:1 storable user preset
Sampling Frequency: 44.1 kHz
A/D converter: 24-bit
Signal Processing:32-bit
Frequency response:20Hz-20000Hz ±1dB
THD+N: 93dBu (<0.003%) A-Weighting
Dynamic Range:100dB
INPUT:-20dBV@1MΩ
OUTPUT:-10dBV (Output load impedance of 10kΩ or more)
Power:9V DC (9V Battery, ACD-007A Adapter)
Dimensions: 122(L) x 72(W) x 47(H)mm
Weight:270g', 800000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (104, 'Rockwell Stomp Box Amp Force', 'SPECTS
AMP FORCE Modeling Amp Simulator
• Effects types: 12 modeling guitar amp models
• Presets: up to 9 storable user presets plus manual mode
• Sampling frequency: 44.1 kHz
• A/D converter: 24-bit
• Signal processing: 32-bit
• Frequency response: 20Hz-20kHz ±1dB
• THD+N: 93dBu (＜0.003%) A-Weighting
• Dynamic Range: 100dB
• Input: -20dBV@1MΩ
• Output: -10dBV(Output load impedance of 10 K or more)
• Display: 128*128 TFT
•  Power: 9V DC (9V battery or optional ACD-007A Adaptor)
• Dimension: 125(L) * 108(W) * 57(H) mm
• Weight: 390 g', 1265000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (122, 'SILKEN SEBRING SET HH 13"', 'Handmade Cymbal set 13" Hi-Hat, 16" Crash, 18" Crash, 20" Ride w/bag', 9780000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (105, 'Rockwell Stomp Box Drive Force', 'SPECTS
• Effect types: 10 modeling 
stompbox models
• Presets: Up to 9 storable user 
presets plus manual mode
• Sampling frequency: 44.1 kHz
• A/D converter: 24-bit
• Signal processing: 32-bit
• Frequency response: 20Hz-20kHz ±1dB
• THD+N: 93dBu (＜0.003%) A-Weighting
• Dynamic Range: 100dB
• Input: -20dBV@1MΩ
• Output: -10dBV(Output load impedance of 10 KΩor more)
• Display: 128*128 TFT
• Power: 9V DC (9V battery or optional ACD-007A Adaptor)
• Dimension: 125(L) * 108(W) * 57(H) mm
• Weight: 390 g', 1265000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (106, 'Rockwell Portable Guitar Effect RCG-22', 'SPECTS• Sampling Frequency : 44.1 kHz
• A/D, D/A conversion : 24 bit
• Signal processing: 32-bit                                         • Nominal Input Impedance : 1Mohms
• AUX IN input : -10 dBu/22k ohm
• Headphones Output : 125mW+1255mW(into- 32ohm load)
• Presets : 18 (9 factary 9 user)
• Display : Backlit LCD
• Tuning Range : A0 (27.5Hz) - A6 (1760Hz)
• A4 (435-445Hz)
• Power: 3V DC (2xAA) Approx 9Hours of Battery-Operation
• Dimension: 114(L) * 82(W) * 36(D) mm
• Weight: 140 g', 715000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (107, 'NUX MG 200', 'NULL', 1820000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (108, 'Russel Sustain Pedal RPS 004', 'NULL', 150000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (109, 'Strap guitar  Rockwell', 'Pundakan', 60000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (123, 'SILKEN DRAGON SET', 'Handmade Cymbal set 14" Hi-Hat, 16" Crash, 18" Crash, 20" Ride w/bag. Aggressive, Powerfull and Loud tone that cuts through both live and studio settings. Perfect for Hard Rock and Heavy Metal drumming.', 9780000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (124, 'SILKEN OVERHAMMER SET', 'Handmade Cymbal set 14" Hi-Hat, 16" Crash, 18" Crash, 20" Ride w/bag. Finnish traditional with micro grooves and hammer marks. Sound focused, bright and clean tone. Perfect for Studio.', 9780000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (125, 'SILKEN METEORIDE SET', 'Handmade Cymbal set 14" Hi-Hat, 16" Crash, 18" Crash, 20" Ride w/bag. ', 5350000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (126, 'SILKEN QUIETE SET', 'Handmade Cymbal set 14" Hi-Hat, 16" Crash, 18" Crash, 20" Ride w/bag. Low Volume.', 5350000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (127, 'SILKEN FE SET', 'Handmade Cymbal set 14" Hi-Hat, 16" Crash, 20" Ride w/o bag. Steel shet.', 1800000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (128, 'SILKEN ROCK ', 'Handmade Cymbal piece 16" Crash. It is mainly used for effect sound embellishment. ', 1380000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (129, 'SILKEN ROCK ', 'Handmade Cymbal piece 18" Crash. It is mainly used for effect sound embellishment. ', 1780000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (130, 'SILKEN HOLES', 'Handmade Cymbal piece 16" Crash. It is mainly used for effect sound embellishment. ', 1380000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (131, 'SILKEN HOLES', 'Handmade Cymbal piece 18" Crash. It is mainly used for effect sound embellishment. ', 1780000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (132, 'SILKEN JAZZ', 'Handmade Cymbal piece 16" Crash. It is mainly used for effect sound embellishment. Various music styles can be easily controlled.', 1380000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (133, 'SILKEN JAZZ', 'Handmade Cymbal piece 18" Crash. It is mainly used for effect sound embellishment. Various music styles can be easily controlled.', 1780000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (134, 'SILKEN BELL ICE BURG', 'Handmade Bell Cymbal piece 8" . Ice Burg is hand polished to a high gloss finish. Has a bright tone and produces high volume performances with the strenght to cut through any genre of music.', 760000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (135, 'SILKEN STACK', 'Handmade Splash Cymbal set 8"+10" .  Has a bright tone and produces high volume performances with the strenght to cut through any genre of music.', 1160000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (136, 'SILKEN DRAGON PIECE', 'Handmade Cymbal piece 14" Hi-Hat. Aggressive, Powerfull and Loud tone that cuts through both live and studio settings. Perfect for Hard Rock and Heavy Metal drumming.', 3400000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (139, 'RENEGADE SNARE DRUM 12"', 'Marching Snare Drum Band 12" x 8 ". 12 Lugs Double Tension + Strap. Include Stick, Beater & Sling. Colour : Met Red', 740000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (140, 'RENEGADE SNARE DRUM 14"', 'Marching Snare Drum Band 14" x 10 ". 12 Lugs Double Tension + Strap. \Include Stick, Beater & Sling. Colour : Met Red', 850000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (141, 'RENEGADE TENOR DRUM 10"', 'Marching Tenor Drum Band 10" x 6 ". 6 Lugs Single Tension + Strap. \Include Stick, Beater & Sling.w/o Snapy. Colour : Met Red', 630000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (142, 'RENEGADE TENOR DRUM 12"', 'Marching Tenor Drum Band 12" x 8 ". 12 Lugs Double Tension + Strap. Include Stick, Beater & Sling. W/o Snapy.  Colour : Met Red', 700000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (143, 'RENEGADE TENOR DRUM 14"', 'Marching Tenor Drum Band 14" x 10 ". 12 Lugs Double Tension + Strap. \Include Stick, Beater & Sling. W/o Snapy. Colour : Met Red', 820000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (144, 'RENEGADE BASS DRUM 16"', 'Marching Bass Drum Band 16" x 8". 16 Lugs Double Tension + Strap. Include Stick, Beater & Sling. Colour : Met Red', 1060000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (145, 'RENEGADE BASS DRUM 18"', 'Marching Bass Drum Band 18" x 10". 16 Lugs Double Tension + Strap. Include Stick, Beater & Sling. Colour : Met Red', 1160000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (146, 'RENEGADE BASS DRUM 20"', 'Marching Bass Drum Band 20" x 10". 16 Lugs Double Tension + Strap. Include Stick, Beater & Sling. Colour : Met Red', 1290000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (147, 'RENEGADE BASS DRUM 22"', 'Marching Bass Drum Band 22" x 10". 16 Lugs Double Tension + Strap. Include Stick, Beater & Sling. Colour : Met Red', 1460000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (148, 'RENEGADE BASS DRUM 24"', 'Marching Bass Drum Band 24" x 10". 16 Lugs Double Tension + Strap. Include Stick, Beater & Sling. Colour : Met Red', 1560000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (149, 'RENEGADE BASS DRUM 26"', 'Marching Bass Drum Band 26" x 10". 16 Lugs Double Tension + Strap. Include Stick, Beater & Sling. Colour : Met Red', 1450000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (150, 'RENEGADE QUARTOM 681012', 'Marching Quart Tom ( 6",8",10",12" ). w/ Hardness & Stick. Colour : Met Red', 2260000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (151, 'RENEGADE QUARTOM 8101213', 'Marching Quart Tom ( 8",10",12",13" ). w/ Hardness & Stick. Colour : Met Red', 2380000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (152, 'RENEGADE TRIOTOM 6810', 'Marching Trio Tom ( 6",8",10" ). w/ Hardness & Stick. Colour : Met Red', 1960000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (153, 'RENEGADE TRIOTOM 81012', 'Marching Trio Tom ( 8",10",12" ). w/ Hardness & Stick. Colour : Met Red', 2100000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (154, 'RENEGADE QUINTOM JWM-03', 'Marching Quint Tom (6",8",10",12",13"). w/ Hardness & Stick. Colour : Met Red', 2500000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (156, 'RENEGADE BASS BEATER BBW', 'Wood Handle Bass Beater', 65000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (157, 'RENEGADE BASS BEATER BBA', 'Alluminium Handle Bass Beater', 65000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (158, 'RENEGADE TENOR BEATER TBS', 'Stainless Steel Handle Tenor Beater', 85000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (159, 'RENEGADE TENOR BEATER TBW', 'Wood Handle Tenor Beater', 60000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (160, 'RENEGADE TENOR BEATER TBA', 'Alluminium Handle Tenor Beater', 60000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (161, 'RENEGADE BEATER PDB 015', 'Beater Bass Pedal Drum Spons', 50000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (162, 'GNOSIS SAXOPHONE AWS 950', 'Alto Saxophone EB Key, Silver Nickle Plated', 5975000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (163, 'GNOSIS SAXOPHONE AWS 902', 'Straight Soprano Saxophone Gold Plated w/ Hardcase', 5975000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (164, 'GNOSIS FLUTE AW 511 SB', 'Flute 17 Holes, C Key Silver Plated', 2500000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (165, 'GNOSIS TRUMPET 8331 S', 'Trumpet Nickle w/ Hardcase', 2500000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (166, 'GNOSIS TROMBONE AWC 1311', 'Marching Trombone Nickle Bb Key Bell 216 mm, Bore 12,7 mm', 10500000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (167, 'GNOSIS MELOPHONE AWSY 635', 'Marching Melophone Nickle F Key Bell 269 mm, Bore 11,9 mm', 8400000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (168, 'GNOSIS BARCHIME BC 27', 'Barchime 36 Bar, Single w/ Stand Double Braced', 1260000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (169, 'GNOSIS BARCHIME BC 27 D', 'Barchime 36 Bar, Double w/ Stand Double Braced', 1850000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (170, 'GNOSIS CYMBAL M 10', 'Marching Cymbal 10" x 1,2 mm w/ Strap', 310000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (171, 'GNOSIS CYMBAL MC 12', 'Marching Cymbal 12" x 1,2 mm w/ Strap', 360000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (172, 'GNOSIS CYMBAL MC 14', 'Marching Cymbal 14" x 1,0 mm w/ Strap', 500000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (173, 'GNOSIS CYMBAL MC 16', 'Marching Cymbal 16" x 1,0 mm w/ Strap', 660000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (174, 'GNOSIS CYMBAL MC 18', 'Marching Cymbal 18" x 1,0 mm w/ Strap', 462500.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (175, 'GNOSIS MARCHING BELL XJQ-1', 'Marching Bell 32 Key w/ Harness & 2 Mallet', 1950000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (176, 'GNOSIS MARCHING BELL J 37 AH', 'Marching Bell 37 Key w/ Harness & 2 Mallet', 2200000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (177, 'GNOSIS PIANIKA MDC B-32/P-32', 'Pianika  32 K Blue/Pink w/ Softbag isi 10 pc / dos', 160000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (178, 'GNOSIS SELANG PIANIKA MH-01', 'Pianika Hose/Selang', 20000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (181, 'RENEGADE CAJON SLIDE', 'Cajon Slide. Include Softbag.', 1760000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (182, 'RENEGADE CAJON SUPER LUX', 'Cajon Super Lux w/ bag', 1100000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (183, 'RENEGADE CAJON SUPER   ', 'Cajon Super w/ bag', 880000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (184, 'RENEGADE DRUMHEAD DHB SERIES', 'Drumhead Black 6 ", 0,250 mm', 37000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (185, 'RENEGADE DRUMHEAD DHB SERIES', 'Drumhead Black 8 ", 0,250 mm', 39500.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (186, 'RENEGADE DRUMHEAD DHB SERIES', 'Drumhead Black 10 ", 0,250 mm', 44000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (187, 'RENEGADE DRUMHEAD DHB SERIES', 'Drumhead Black 12 ", 0,250 mm', 47000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (188, 'RENEGADE DRUMHEAD DHB SERIES', 'Drumhead Black 13 ", 0,250 mm', 50500.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (189, 'RENEGADE DRUMHEAD DHB SERIES', 'Drumhead Black 14 ", 0,250 mm', 55000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (190, 'RENEGADE DRUMHEAD DHB SERIES', 'Drumhead Black 16 ", 0,250 mm', 59000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (191, 'RENEGADE DRUMHEAD DHB SERIES', 'Drumhead Black 18 ", 0,250 mm', 72000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (192, 'RENEGADE DRUMHEAD DHB SERIES', 'Drumhead Black 20 ", 0,250 mm', 99000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (194, 'RENEGADE DRUMHEAD DHB SERIES', 'Drumhead Black 24 ", 0,250 mm', 123000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (195, 'RENEGADE DRUMHEAD DHO SERIES', 'Drumhead Two Ply Oil Skin 6 " Transp.', 52000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (196, 'RENEGADE DRUMHEAD DHO SERIES', 'Drumhead Two Ply Oil Skin 8 " Transp.', 61000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (197, 'RENEGADE DRUMHEAD DHO SERIES', 'Drumhead Two Ply Oil Skin 10 " Trans', 65500.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (199, 'RENEGADE DRUMHEAD DHO SERIES', 'Drumhead Two Ply Oil Skin 13 " Trans', 77000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (201, ' RENEGADE DRUMHEAD DHD SRS', 'Drumhead Bottom 10" Transparant', 36000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (203, ' RENEGADE DRUMHEAD DHD SRS', 'Drumhead Bottom 13" Transparant', 42000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (204, ' RENEGADE DRUMHEAD DHD SRS', 'Drumhead Bottom 14" Transparant', 44000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (205, 'RENEGADE DRUMHEAD DHW SERIES', 'Drumhead White 6", 0250 mm', 34000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (206, 'RENEGADE DRUMHEAD DHW SERIES', 'Drumhead White 8", 0250 mm', 35000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (207, 'RENEGADE DRUMHEAD DHW SERIES', 'Drumhead White 10", 0250 mm', 37000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (208, 'RENEGADE DRUMHEAD DHW SERIES', 'Drumhead White 12", 0250 mm', 41000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (209, 'RENEGADE DRUMHEAD DHW SERIES', 'Drumhead White 13", 0250 mm', 44000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (210, 'RENEGADE DRUMHEAD DHW SERIES', 'Drumhead White 14", 0250 mm', 49500.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (212, 'RENEGADE DRUMHEAD DHW SERIES', 'Drumhead White 16", 0250 mm', 55500.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (213, 'RENEGADE DRUMHEAD DHW SERIES', 'Drumhead White 18", 0250 mm', 66000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (214, 'RENEGADE DRUMHEAD DHW SERIES', 'Drumhead White 20", 0250 mm', 94000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (215, 'RENEGADE DRUMHEAD DHW SERIES', 'Drumhead White 22", 0250 mm', 98000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (216, 'RENEGADE DRUMHEAD DHW SERIES', 'Drumhead White 24", 0250 mm', 118000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (217, 'RENEGADE DRUMHEAD DHW SERIES', 'Drumhead White 26", 0250 mm', 130000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (218, 'RENEGADE DRUMHEAD DHW SERIES', 'Drumhead White 28", 0250 mm', 150000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (220, 'RENEGADE TAMBOURINE TG 8', 'Tambourine Hologram 8"', 220000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (221, 'RENEGADE TAMBOURINE TG 10', 'Tambourine Hologram 10"', 285000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (180, 'RENEGADE CAJON DELUXE', 'Cajon Deluxe. Include Softbag.', 1700000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (225, 'DRUM PEDAL C-02', 'Drum Pedal Single ( Double Chained )', 560000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (227, 'RING MUTE RM 4', 'Ring Mute Drum. Size 12", 13", 14", 15"', 50000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (228, 'RENEGADE PAD DRUM PD 6', 'Pad Drum Size 6"', 85000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (229, 'RENEGADE PAD DRUM PD 8', 'Pad Drum Size 8"', 95000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (230, 'RENEGADE PAD DRUM PD 10', 'Pad Drum Size 10"', 110000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (231, 'RENEGADE PAD DRUM PD 12', 'Pad Drum Size 12"', 135000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (232, 'CYMBAL STAND JA-005', 'Cymbal Boom Stand Double Brace Legs. Tube diameter : 25,4 mm/22 mm', 605000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (233, 'CYMBAL STAND JA-011', 'Straight Cymbal Stand Double Brace Legs. Tube diameter : 25,4 mm/22 mm', 520000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (234, 'HI-HAT STAND JA-009', 'Hi-Hat Stand Double Brace Legs. Tube diameter : 19 mm/16 mm', 585000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (235, 'SNARE STAND JB SERIES', 'Snare Stand  Tube Dia 19 mm/16 mm. Double Braced', 520000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (236, 'DRUM KEY DK 6', 'Drum Key', 25000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (237, 'RENEGADE DRUM JW 225', 'Drum Set Standart 5 pcs', 5900000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (238, 'RENEGADE DRUM JW 165', 'Drum Set Junior. Bass 16" Snare 12"', 3900000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (239, 'HARDCASE CYMBAL HCCB', 'Hardcase Cymbal', 920000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (241, 'SNARE DRUM BAG TSND', 'Tas Snare Drum', 85000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (242, 'DRUM STICK BAG TSD', 'Tas Drum Stick Logo Car ( isi 6 pr/dos )', 76000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (243, 'COWBELL 45', 'Cowbell 4,5"', 95000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (244, 'COWBELL 55', 'Cowbell 5,5"', 110000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (245, 'COWBELL 65', 'Cowbell 6,5"', 125500.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (246, 'COWBELL 75', 'Cowbell 7,5"', 143000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (247, 'COWBELL 85', 'Cowbell 8,5"', 160000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (248, 'COWB-HOLD', 'Cowbell Holder', 85000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (249, 'DRUM THRONE GD 10', 'Drum Thhrone ( Bangku ) Coat Legs', 550000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (251, 'SHAKER SH-8', 'shaker (Black, Red, Blue, Mirror)', 135000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (253, 'SHAKER SE-5', 'Shaker Sound Egg Short ( Plastic )', 46000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (254, 'SHAKER SE-4', 'Shaker Sound Egg Short ( Plastic )w/ handle', 60000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (255, 'CABASA CB-1', 'Cabasa ( Black , Natural )', 143000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (256, 'ROTOTOM PD-01', 'Rototom w/ Stand ( Pocket )6",8",10"', 2100000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (257, 'GNOSIS ACCORDION AW 1302', 'Accordion 25 Keys, 12 Bass ( Red )', 8360000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (258, 'GNOSIS ACCORDION AW 2351', 'Accordion 32 Keys, 32 Bass ( Red )', 9870000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (259, 'GNOSIS ACCORDION AW 1307', 'Accordion 34 Keys, 48 Bass ( Red )', 11550000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (260, 'GNOSIS ACCORDION AW 1308', 'Accordion 34 Keys, 60 Bass ( Red )', 12000000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (261, 'GNOSIS ACCORDION AW 1309', 'Accordion 37 Keys, 80 Bass ( Red )', 16000000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (264, 'LABELLA LF 710 C EQ', 'Acc.E  Guitar Folk Jumbo w/ EQ & cable. Colour : Natural, Black', 1450000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (265, 'LABELLA LFX 500 C EQ', 'Acc.E. Guitar Folk w/ EQ & cable. Colour : Natural, Black', 1950000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (266, 'LABELLA FC 315 SY', 'Acc Guitar Classic', 1000000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (267, 'CAPO B 10', 'Capo Guitar', 27000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (268, 'CAPO GC 006', 'Capo Guitar Labella Multi Colour', 46000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (269, 'CAPO BDJ 11 (RGC-900)', 'Capo Guitar ( Metal ) Black', 81000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (270, 'CAPO CP 005 (RGC-800)', 'Capo Guitar Plastic 6 warna', 26000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (271, 'CAPO 222', 'Capo Guitar Dastro ', 42000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (272, 'MARVELL CLEANER CC', 'Cleaner & Polish Cymbal', 62000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (273, 'MARVELL CLEANER GPC', 'Cleaner & Polish Guitar', 47000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (274, 'MARVELL CLEANER PNPO', 'Cleaner & Polish Piano', 47000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (275, 'MARVELL CLEANER SC', 'Cleaner & Polish String', 59000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (277, 'EQUALIZER LC-5', 'Equ Guitar Pre-Amp, Tuner w/Mic', 326000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (278, 'EQUALIZER 7545 EQR', 'Equ Guitar Pre-Amp+PickUp 4 Band', 226000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (280, 'GARPUTALA TF SERIES', 'Garputala "A" , "C" Tuning Folk', 59000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (281, 'FRET BAJA', 'Fret Gitar Baja', 41000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (282, 'FRET KUNINGAN', 'Fret Gitar Kuningan', 38000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (283, 'CABLE BZX-3', 'Cable Instrumen 3 m Black Renegade', 76000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (284, 'CABLE BZX-6', 'Cable Instrumen 6 m Black Renegade', 117000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (285, 'CABLE FXZ-3', 'Cable Instrumen 3 m Corak Renegade', 117000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (286, 'CABLE FXZ-6', 'Cable Instrumen 6 m Corak Renegade', 193000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (287, 'CABLE K-3', 'Cable Instrumen 3 m', 30000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (288, 'NUT NT-P3', 'Nut Guitar Classic White isi 6 pcs', 19000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (289, 'NUT NT-P1', 'Nut Guitar Folk White isi 6 pcs', 19000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (291, 'PICK G-B2/100', 'Pick Guitar Renegade isi 100 pcs', 210000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (292, 'PICK BJ/10', 'Pick Guitar Steel 0,3 mm isi 10 pcs', 126000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (293, 'PICK PCE/10', 'Pick Thumb isi 10 pcs', 126000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (294, 'PICK PCF/10', 'Pick Finger isi 10 pcs', 126000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (296, 'SADDLE NT-P4', 'Saddle Guitar Classic White isi 6 pcs', 20000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (297, 'SADDLE NT-P2', 'Saddle Guitar Folk White isi 6 pcs', 20000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (298, 'PICK-UP KQ 1', 'Pick Up Guitar u/ Acc Guitar', 168000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (299, 'PICK-UP KQ 3', 'Pick Up Guitar Acc', 145000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (224, 'DRUM PEDAL C-06', 'Drum Pedal Single ( Single Chained )', 520000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (339, 'POWER CA 8', '800 W @ 8 ohm Stereo Power.                    1300 W @ 4 ohm Stereo Power                  2200 W @ 8 Ohm Bridge Power                    20 Hz- 20 Khz ( +0/-0.5 dB ) Req Response    300-400 Dumping Factor                                 45/ s Slew Ratio                                               0dB ( 0.775 V ), 1V,1V, 1.4V Input sensitivity  Overheat, Short Circuit, DC.                             4 Cooling Fan. 2 Channel H Class', 7990000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (302, 'EQUALIZER 7545 T', 'Equ Guitar Pre-Amp+PickUp 4 Band w/LCD Tuner', 295000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (303, 'GARPUTALA TF SERIES', 'Garputala "A" , "C" Tuning Folk', 59000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (304, 'FRET BAJA', 'Fret Gitar Baja', 45000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (305, 'FRET KUNINGAN', 'Fret Gitar Kuningan', 40000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (307, 'CABLE BZX-6', 'Cable Instrumen 6 m Black Renegade', 117000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (308, 'CABLE FXZ-3', 'Cable Instrumen 3 m Corak Renegade', 117000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (309, 'CABLE FXZ-6', 'Cable Instrumen 6 m Corak Renegade', 195000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (310, 'CABLE K-3', 'Cable Instrumen 3 m', 30000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (311, 'NUT NT-P3', 'Nut Guitar Classic White isi 6 pcs', 20000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (312, 'NUT NT-P1', 'Nut Guitar Folk White isi 6 pcs', 20000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (313, 'CABLE BZX-3', 'Cable Instrumen 3 m Black Renegade', 76000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (314, 'D''ADDARIO EXL-170', 'String Gitar Bass 4 St', 155000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (315, 'D''ADDARIO EXL-170-5', 'String Gitar Bass 5 St', 170000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (316, 'D''ADDARIO EXL-120-09/42', 'String E. Guitar 09 / 42', 65000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (317, 'D''ADDARIO EXL-110-10/46', 'String E. Guitar 010 / 46', 65000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (318, 'D''ADDARIO EJ-46', 'String Acc Classic ( Hard Tension )', 65000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (319, 'D''ADDARIO EJ-45', 'String Acc Classic ( Normal Tension )', 65000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (320, 'D''ADDARIO EZ-900 ( 010-050)', 'String Acc Folk', 65000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (321, 'RENEGADE LBS 45/100', 'String E. G Bass 4 St + Pick', 145000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (322, 'RENEGADE LBS 45/130', 'String E. G Bass 5 St + Pick', 155000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (323, 'RENEGADE LGS 9/42', 'String E. Guitar 09 w/ pick', 46000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (324, 'RENEGADE LGS 10/46', 'String E.Guitar 010 w/ Pick', 46000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (325, 'RENEGADE LGS 28/43', 'String Accoustic Classic w/ Pick', 46000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (326, 'RENEGADE LGS 10/47', 'String Accoustic Folk w/ Pick', 46000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (327, 'RENEGADE EG 220-1', 'String E.Guitar eceran no 1 ( 1 lusin )', 47000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (328, 'RENEGADE EG 220-2', 'String E.Guitar eceran no 2 ( 1 lusin )', 51000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (329, 'RENEGADE EG 220-3', 'String E.Guitar eceran no 3 ( 1 lusin )', 62000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (330, 'RENEGADE EG 220-4', 'String E.Guitar eceran no 4 ( 1 lusin )', 82000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (331, 'RENEGADE EG 220-5', 'String E.Guitar eceran no 5 ( 1 lusin )', 90000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (332, 'RENEGADE EG 220-6', 'String E.Guitar eceran no 6 ( 1 lusin )', 100000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (333, 'GUITAR STAND DAGS SERIES', 'Stand Guitar/Wall Hanger Auto Grip System. ( Long / Short )', 170000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (334, 'GUITAR STAND J-03', 'Stand Guitar Single w/ Clib ( isi 20 pcs / dos )', 235000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (335, 'GIG BAG GUITAR', 'Gig Bag f/ Electric Guitar', 435000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (336, 'GIG BAG BASS GUITAR', 'Gig Bag f/ Electric Bass Guitar', 470000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (337, 'GIG BAG KEYBOARD', 'Semi Hardcase/Gigbag f/ keyboard Yamaha PSR ( Gemblok )', 450000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (338, 'STRING WINDER JQ-S2', 'String Winder', 25000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (179, 'RENEGADE CAJON CUTAWAY DLX', 'Cajon Cutaway Deluxe w/ Snappy wire setting system. Include softbag. Size : HWL 48 x 31 x 36', 1565000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (193, 'RENEGADE DRUMHEAD DHB SERIES', 'Drumhead Black 22 ", 0,250 mm', 102000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (200, 'RENEGADE DRUMHEAD DHO SERIES', 'Drumhead Two Ply Oil Skin 14 " Trans', 82000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (202, ' RENEGADE DRUMHEAD DHD SRS', 'Drumhead Bottom 12" Transparant', 39000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (211, 'RENEGADE DRUMHEAD DHW SERIES', 'Drumhead White 15", 0250 mm', 51000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (219, 'RENEGADE D-1 DRUMSTICK', 'Brushes Drumstick, Metal Brushes. Retractable brush wires allows the strenght to be varied. Length : 330 mm, Rubberized grip.', 185000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (222, 'RENEGADE TM 818', 'Tambourine Halfmoon, Red, Blue, Yellow, Black. Double Ring.', 126000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (223, 'RENEGADE PEDAL SUSTAIN', 'Pedal Sustain All in ( Roland, Yamaha, Korg, Casio, dll ). Colour : Jet Black, Burning Red, Dark Blue, Sweet Orange, Lime Green', 242000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (226, 'DRUM PEDAL JW-2003 B', 'Drum Pedal, Common Grade Twin Pedal. Double Chained.', 1700000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (240, 'HARDCASE STICK DRUM HCTB', 'Hardcase Stick Drum model tabung', 51000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (250, 'DRUM THRONE GD 4', 'Drum Throne Round Set Dia.280 mm', 570000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (252, 'MARACAS MA-38', 'Shaker Maracas Soft Plastic w/ Handle (2pcs / Pair )', 380000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (262, 'LABELLA LPB 200', 'E.G Bass Pick-Up SS w/ cable. Colour : Black, Met Red, Sunburst.', 2350000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (263, 'LABELLA LS 200', 'E. Gitar Pick-Up SSS w/ cable. Colour : Black, Met Red, Sunburst.', 1850000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (276, 'END PIN WD 1', 'End Pin Guitar Metal buckle Black/Chr', 17000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (279, 'EQUALIZER 7545 T', 'Equ Guitar Pre-Amp+PickUp 4 Band w/LCD Tuner', 293000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (290, 'PICK ALICE', 'Pick Guitar isi 100 pcs', 210000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (295, 'PICK HOLDER PH-020D', 'Pick Holder/Case Dadi', 15000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (300, 'PICK-UP AQ 601', 'Pick Up Guitar Acc w/ Tune and Vol', 195000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (301, 'PICK-UP KQ 2', 'Pick Up Violin w/ Vol and Tone', 185000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (306, 'CABLE BZX-3', 'Cable Instrumen 3 m Black Renegade', 76000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (340, 'POWER CA 18', 'Professional Power Amp H Class                     2 X 1200 W @ 8 Ohm                                       2 x 2300 W @ 4 Ohm                                       8 Ohm BTL 4000 watt                                        4 Ohm BTL 5400 watt                                       4 Cooling Fan', 9400000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (341, 'POWER CA 20', 'Professional Power Amp H Class                     2 X 1500 W @ 8 Ohm                                       2 x 2500 W @ 4 Ohm                                       8 Ohm BTL 4200 watt                                        4 Ohm BTL 5600 watt                                       4 Cooling Fan', 9950000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (342, 'RPA 4080 BK', 'Power Amplifier 4 Ch x 1200 W @8 Ohm  4Fan . Colour Black', 10300000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (343, 'RPA 4080 SL', 'Power Amplifier 4 Ch x 1200 W @8 Ohm  4Fan . Colour Silver', 10300000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (344, 'RPA 4120 BK', 'Power Amplifier 4 Ch x 1500 W @8 Ohm  4Fan . Colour Black', 13200000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (345, 'RPA 4120 SL', 'Power Amplifier 4 Ch x 1500 W @8 Ohm  4Fan . Colour Silver', 13200000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (346, 'ROADMASTER 15" PRO 15', 'Full Range Passive Loudspeaker 15" woofer, 1" compression driver. Impedance 6 Ohm. Sensitivity 90 dB. Response Freq 30 Hz - 20 KHz. Power Handling 100 W rms/200 W peak Dimension 466x390x664 mm                           Berat unit 16,5 Kg. Wooden box', 3200000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (347, 'LTV LS 18 P', 'Subwoofer Pasif. Driver 18" Hi-efficiency woofer. Freq response 29 Hz-1 KHz. Variable cut off LPF 40 Hz-240 KHz. Dimensi : 59 x 56 x 56 cm ( HWL )', 9900000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (348, 'LTV LS 18 A', 'Actived Subwoofer 18 "                                   Driver 18" Hi-Efficiency woofer. Sensitivity 101 dB/1 watt/1m. Rated Power 400 W RMS - 800 W Peak Power. Frequency response 29 Hz-1 KHz. Variable Cut off LPF 40Hz - 240 Hz.  Dimensi ( HWL ) 59 x 56 x 56 cm', 19000000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (349, 'ROADMASTER PRO BEAT 10', 'Powered Speaker 10" woofer 3" Midrange   Frequncy response 20 Hz - 20 KHz. Input sensitivity 600 mV. Impedance 50 K Ohm. Input terminal RCA (L/R) 3,5 stereo. Music controll Volume, Bass, X-Bass. USB Flashdisk, Blouetooth, Auxalary, FM Radio.', 2400000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (350, 'ROADMASTER PRO BEAT 12', 'Speaker Aktif 12" woofer 3" mid 1" Tweeter Frequency response 20 Hz-20 KHz. Impedance 50 K Ohm. Input Sensitivity 600 mV. 90 W RMS. USB SD Card, Bluetooth, FM Radio', 2650000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (351, 'ROADMASTER PRO BEAT 210', 'Speaker Aktif 2x10" double woofer 3" Mid 1" Tweeter. Frequency Response 20Hz - 20 KHz Impedance 50 K Ohm. Input Sensitivity 600 mV. 40.000 Watt PMPO. USB SD Card, Bluetooth, FM Radio. Dimensi ( WHD ) 418x962x442 mm', 3350000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (352, 'ROADMASTER PRO BEAT 212', 'Speaker Aktif 2x12" double woofer 3" Mid 1" Tweeter. Frequency Response 20Hz - 20 KHz Impedance 50 K Ohm. Input Sensitivity 600 mV. 60.000 Watt PMPO. Dimensi ( WHD ) 470x1062x485 mm', 3900000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (353, 'ROADMASTER PRO BEAT 15', 'Speaker Aktif 15" woofer 3" mid 1" Tweeter Frequency response 20 Hz-20 KHz. Impedance 50 K Ohm. Input Sensitivity 600 mV. 90 W RMS. USB SD Card, Bluetooth, FM Radio', 3650000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (354, 'ROADMASTER BASS 16', 'Speaker Aktif 6" woofer. Bluetooth, MP3 Playback FM Radio, X-Bass Sound, 2 Mic Input 15.000 PMPO. New Buffle with Carbon & Stylish Performance.', 1870000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (355, 'ROADMASTER PARTY DUO', 'Speaker Aktif 2x12" double woofer Horn tweeter. Bluetooth, USB/MMC, FM Radio, MP3 Playback Input, Mic Input. LED Party Ligth. 22.000 Watt PMPO.', 2700000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (356, 'ROADMASTER MONSTER 210', 'Speaker Aktif  Double 10" woofer 5" Mid 1" Super Tweeter. 3 Way Speaker system. Bluetooth, FM Digital, USB 2.0. Big Sound with Extra Bass.', 3500000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (357, 'ROADMASTER MONSTER 212', 'Speaker Aktif  Double 12" woofer 5" Mid 1" Super Tweeter. 3 Way Speaker system. Bluetooth, FM Digital, USB 2.0. Big Sound with Extra Bass.', 3990000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (358, 'RENEGADE RM 406 4 CH', 'Professional Mixer with DSP Effect & EBQ Feedback Detection System. With Digital Display MP3 ( U-Disk MP3 Input ).               With Record function USB. Single group main output control. Record Earphone monitor output. With 3 Band EQ each channel. Build in 99 DSP effect and Bluetooth.', 2350000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (359, 'RENEGADE RM 806 8 CH', 'Professional Mixer with DSP Effect & EBQ Feedback Detection System. With Digital Display MP3 ( U-Disk MP3 Input ).               With Record function USB. Single group main output control. Record Earphone monitor output. With 3 Band EQ each channel. Build in 99 DSP effect and Bluetooth.', 2800000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (360, 'RENEGADE RM 1206 12 CH', 'Professional Mixer with DSP Effect & EBQ Feedback Detection System. With Digital Display MP3 ( U-Disk MP3 Input ).               With Record function USB. Single group main output control. Record Earphone monitor output. With 3 Band EQ each channel. Build in 99 DSP effect and Bluetooth.', 3400000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (361, 'RENEGADE RM 60 S USB', 'Professional Mixer 6 Channel 48 V Phantom Power. USB/MP3 Player. Recording and Headphone listen output.', 1600000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (362, 'RENEGADE RM 80 S USB', 'Professional Mixer 8 Channel 48 V Phantom Power. USB/MP3 Player. Recording and Headphone listen output.', 2100000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (363, 'RENEGADE RM 120 S USB', 'Professional Mixer 12 Channel 48 V Phantom Power. USB/MP3 Player. Recording and Headphone listen output.', 2700000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (364, 'MIXER F-4', '4 Channel Live Mixer. USB Function. 5 KLR Mono Input Mic and 2 Groups of stereo input channel. 3-Band EQ in all channel. Built in Digital Delay Echo effect processor. Ine Aux output. 48 V Phantom power. Built in balanced and unbalanced recording and playback connector.', 1300000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (365, 'MIXER F-7', '7 Channel Live Mixer. USB Function. 5 KLR Mono Input Mic and 2 Groups of stereo input channel. 3-Band EQ in all channel. Built in Digital Delay Echo effect processor. Ine Aux output. 48 V Phantom power. Built in balanced and unbalanced recording and playback connector.', 1500000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (366, 'RENEGADE RPM 407 DSP', 'Professional Powered Mixer 4 Channel with digital display MP3 ( U-disk MP3 Input ). Record funtion USB. Dual twelve band level display main output. Single group main output control. 3-Band EQ each channel. Built in 99 DSP effect. +48 V Phantom power. Bluetooth. 2 x 250 W RMS Power.', 3550000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (367, 'RENEGADE RPM 807 DSP', 'Professional Powered Mixer 8 Channel with digital display MP3 ( U-disk MP3 Input ). Record funtion USB. Dual twelve band level display main output. Single group main output control. 3-Band EQ each channel. Built in 99 DSP effect. +48 V Phantom power. Bluetooth. 2 x 250 W RMS Power.', 3990000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (368, 'RENEGADE RPM 1207 DSP', 'Professional Powered Mixer 12 Channel with digital display MP3 ( U-disk MP3 Input ). Record funtion USB. Dual twelve band level display main output. Single group main output control. 3-Band EQ each channel. Built in 99 DSP effect. +48 V Phantom power. Bluetooth. 2 x 250 W RMS Power.', 4500000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (369, 'RENEGADE RPM-A 08', 'Powered Mixer 8 Channel with USB, MP3, Bluetooth and Effect. 7 Band Stereo Graphic Equalizer.                                                        300 - 1000 Watt RMS @ 8 Ohm                      500 - 1800 Watt RMS @ 4 Ohm', 5300000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (370, 'RENEGADE PMX 402 D-USB', 'Professional Powered Mixer 4 Channel with Ultra Low Noise. Power 2 x 200 W @ 8 Ohm. Ultra musical 2-Band EQ on all channel. Peak LED on all mono channel. 1 AUX Send per channel for external effect and monitoring. Simulate Effect ( 16 DSP ).', 2700000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (371, 'RENEGADE PMX 602 D-USB', 'Professional Powered Mixer 6 Channel with Ultra Low Noise. Power 2 x 200 W @ 8 Ohm. Ultra musical 2-Band EQ on all channel. Peak LED on all mono channel. 1 AUX Send per channel for external effect and monitoring. Simulate Effect ( 16 DSP ).', 2900000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (372, 'RENEGADE PMX 1002 D-USB', 'Professional Powered Mixer 10 Channel with Ultra Low Noise. Power 2 x 200 W @ 8 Ohm. Ultra musical 2-Band EQ on all channel. Peak LED on all mono channel. 1 AUX Send per channel for external effect and monitoring. Simulate Effect ( 16 DSP ).', 3200000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (373, 'RENEGADE PMX 1202 D-USB', 'Professional Powered Mixer 12 Channel with Ultra Low Noise. Power 2 x 200 W @ 8 Ohm. Ultra musical 2-Band EQ on all channel. Peak LED on all mono channel. 1 AUX Send per channel for external effect and monitoring. Simulate Effect ( 16 DSP ).', 3600000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (374, 'RENEGADE RGA 15 B', 'Speaker Actived 15 " woofer. 350 W RMS Bi-Amp. Impedance 8 Ohm. Max SPL 121 dB', 6100000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (375, 'RENEGADE RPA 1212 S', 'Portable Speaker 12 ". RMS Power 40 W with 2 Wires Microphone. USB, SD Card play MP3, Record Function, FM Radio, Bluetooth. Rechargeable Battery DC 12 V-7A', 2400000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (376, 'RENEGADE RPA 1215 S', 'Portable Speaker 15 " woofer . RMS Power 40 W with 2 Wires Microphone. USB, SD Card play MP3, Record Function, FM Radio, Bluetooth. Rechargeable Battery DC 12 V-7A', 2850000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (377, 'RENEGADE RPA 1510 Q', 'Portable Speaker 15 " woofer . RMS Power 40 W with 2 Wires Microphone ( 1 Hand Held, 1 Clip On ). USB, SD Card play MP3, Record Function, FM Radio, Bluetooth. Rechargeable Battery DC 12 V-7A', 3450000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (378, 'RENEGADE RPA 1503 WOOD', 'Wooden Portable Speaker 15" Actived. RMS Power 350 W. Built in USB, SD Card, Bluetooth, FM Radio. 2 Line Mic Input, 2 Line Guitar Input, 2 pcs Wireless Microphone, Line in / Line out. Roda & Handle tarik. Wood Box Pro.', 8700000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (379, 'ASA 7015', 'Speaker Actived 15 Inch Plastic                           250 Watt RMS                              3500 Watt Peak                                       Woofer 50 Oz 65 mm V.C 4 Ohm                                                  Tweeter 25 mm, Driver 8 Ohm                                                Paired', 6620000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (380, 'SRX 712', 'Loudspeaker 1 x 12" Passive                Freq Response : 65 Hz-20 KHz             System Sensitivity : 98 dB, 1W@1m     Rated Maximum SPL : 126dB @1m      System Input P.Rating RMS : 300 W    System Input P.Rating Peak : 600 W     Recommended Amp : 500 W                Paired', 8280000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (381, 'SRX 715', 'Loudspeaker 1 x 15" Passive                Freq Response : 55 Hz-18 KHz             System Sensitivity : 99 dB, 1W@1m     Rated Maximum SPL : 133dB @1m      System Input P.Rating RMS : 350 W    System Input P.Rating Peak : 700 W     Recommended Amp : 700 W                Paired', 9780000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (382, 'DE 118', 'Subwoofer 1 x 18" Passive                Freq Response : 40 - 300 Hz             Impedance : 8 Ohm                         Rated Power : 500 W                  Programme Power : 1000 W     Sensitivity : 98 dB ( 1W/1m )                Max SPL : 128 dB ( SPL peak/1m )                Paired', 12080000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (383, 'SAK 818', 'Speaker Karaoke 1 x 8" Passive            Impedance : 8 Ohm                              Input Maximal : 300 - 350 W                Sensitivity : 98 dB - 3 dB                       Frequency : 40 Hz - 18 KHz                 Paired ', 1400000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (384, 'SAK 101', 'Speaker Karaoke 1 x 10" Passive            Impedance : 8 Ohm                              Input Maximal : 400 - 450 W                Sensitivity : 98 dB - 3 dB                       Frequency : 40 Hz - 18 KHz                 Paired', 1800000.00, 0.00, 'NULL', 'NULL', 0, '''NULL''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (385, 'PA 400', 'IC Toshiba, Stereo Power : 
- 8 Ohm = 2 x 400 Watt 
- 4 Ohm = 2 x 600 Watt 
- 2 Ohm = 2 x 800 Watt 
Bridge Mono Power :
- 16 Ohm = 800 Watt 
- 8 Ohm = 1200 Watt 
- 4 Ohm = 1600 Watt 
Signal to noise 105dB 
 Power Supply : 220V 60/50Hz
 Net Weight : 17 Kg 
 Dimensions (mm) : 483W x 420D x 88H', 5250000.00, 0.00, ' NULL ', 'NULL', 0, '''NULL''''''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (386, 'PA 600', 'IC Toshiba, Stereo Power :
- 8 Ohm = 2 x 600 Watt
 - 4 Ohm = 2 x 900 Watt 
- 2 Ohm = 2 x 1100 Watt
Bridge Mono Power :
- 16 Ohm = 1200 Watt 
- 8 Ohm = 1800 Watt 
- 4 Ohm = 2000Watt
Signal to noise 105dB 
- Power Supply : 220V 60/50Hz
- Net Weight : 24 Kg 
- Dimensions (mm) : 483W x 420D x 88H', 6900000.00, 0.00, ' NULL ', 'NULL', 0, '''NULL''''''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (387, 'PA 600 DSP', 'NULL', 9300000.00, 0.00, ' NULL ', 'NULL', 0, '''NULL''''''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (388, 'PA 800', 'IC Toshiba, Stereo Power :
- 8 Ohm = 2 x 800 Watt 
- 4 Ohm = 2 x 1200 Watt 
- 2 Ohm = 2 x 1400 Watt 
Bridge Mono Power :
- 16 Ohm = 1600 Watt 
- 8 Ohm = 2000 Watt 
- 4 Ohm = 2400Watt
Signal to noise 106dB 
Power Supply : 220V 60/50Hz
Net Weight : 25 Kg 
Dimensions (mm) : 483W x 420D x 88H', 8250000.00, 0.00, ' NULL ', 'NULL', 0, '''NULL''''''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (389, 'PA 1000', 'IC Toshiba, Stereo Power :
- 8 Ohm = 2 x 1000 Watt 
- 4 Ohm = 2 x 1500 Watt 
- 2 Ohm = 2 x 2000 Watt 
Bridge Mono Power :
- 16 Ohm = 2000 Watt 
- 8 Ohm = 3000 Watt 
- 4 Ohm = 4200Watt
Signal to noise 106dB 
Power Supply : 220V 60/50Hz
Net Weight : 35 Kg 
Dimensions (mm) : 483W x 420D x 88H', 9050000.00, 0.00, ' NULL ', 'NULL', 0, '''NULL''''''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (390, 'PA 1200B', 'IC Toshiba, Stereo Power :
- 8 Ohm = 2 x 1300 Watt 
- 4 Ohm = 2 x 1800 Watt 
- 2 Ohm = 2 x 2400 Watt 
 Bridge Mono Power :
- 16 Ohm = 2600 Watt 
- 8 Ohm = 3600 Watt 
- 4 Ohm = 4800Watt
Signal to noise 106dB 
Power Supply : 220V 60/50Hz
Net Weight : 40 Kg 
Dimensions (mm) : 483W x 500D x 133H', 10780000.00, 0.00, ' NULL ', 'NULL', 0, '''NULL''''''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (391, 'PA 2.0 B', 'IC Toshiba, Stereo Power :
- 8 Ohm = 2 x 1500 Watt 
- 4 Ohm = 2 x 2400 Watt 
- 2 Ohm = 2 x 3000 Watt
Bridge Mono Power :
- 16 Ohm = 3000 Watt 
- 8 Ohm = 4800 Watt 
- 4 Ohm = 6000Watt
Signal to noise 106dB 
Power Supply : 220V 60/50Hz
Net Weight : 41 Kg 
Dimensions (mm) : 483W x 500D x 133H', 11000000.00, 0.00, ' NULL ', 'NULL', 0, '''NULL''''''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (392, 'PA 3.0B', 'IC Motorola, Stereo Power :
- 8 Ohm = 
Channel A 700 watt + 400 watt x 2 Channel B Channel C
- 4 Ohm = 
Channel A 980 watt + 560 watt x 2 Channel B Channel C
Signal to noise : 104dB 
Power Supply : 230V 50/60Hz Fuse : 10A
Dimensions : 483W x 420D x 88H', 11300000.00, 0.00, ' NULL ', 'NULL', 0, '''NULL''''''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (393, 'MG 12 FX', ' - Input Channel : Mono ( Mic/Line ), Mono/Stereo ( Mic/Line ), Stereo ( Line )
- 12 Channel with Effect 24 Programs
- USB Audio Class 2.0 Compliant
- Phantom Power Voltage : +48 V
- Power Consumption : 22 W
 ', 3950000.00, 0.00, ' NULL ', 'NULL', 0, '''NULL''''''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (394, 'MG 16 FX', ' - 16 Channel with Effect 24 Programs
- Peak Led : LED will turn on when post EQ signal reaches 3 dB
- USB Audio Class 2.0 Compliant
- Phantom Power Voltage : +48 V
- Power Consumption : 30 W
 ', 5900000.00, 0.00, ' NULL ', 'NULL', 0, '''NULL''''''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (395, 'PMG 1200', ' - 12 Channel Mono Powered Mixer 200 W per Channel
- With Input Fader Cutoff
- Group Routing Isolation
- Group Mix Crosstalk
- Universal main input
- Aux send off > 90 dBu
 ', 4290000.00, 0.00, ' NULL ', 'NULL', 0, '''NULL''''''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (396, 'PMG 800', ' - 8 Channel Mono Powered Mixer 200 W per Channel
- With Input Fader Cutoff
- Group Routing Isolation
- Group Mix Crosstalk
- Universal main input
- Aux send off > 90 dBu
 ', 3790000.00, 0.00, ' NULL ', 'NULL', 0, '''NULL''''''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (397, 'PMG 600', ' - 6 Channel Mono Powered Mixer 200 W per Channel
- With Input Fader Cutoff
- Group Routing Isolation
- Group Mix Crosstalk
- Universal main input
- Aux send off > 90 dBu
 ', 3390000.00, 0.00, ' NULL ', 'NULL', 0, '''NULL''''''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (398, 'Art - 300', ' - 200W, 1x15"" 8 Ohm
- 2 Ch Mic,Lo,Hi,FreqDelay
- 2 Ch Input,Level, Equalizer,Lo Bosst
- Level Master,Pree Out
- 220V 50/60 Hz
 ', 3980000.00, 0.00, ' NULL ', 'NULL', 0, '''NULL''''''');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (399, 'SP 100', 'Stand Speaker / paired', 406000.00, 0.00, ' NULL ', 'NULL', 0, NULL);
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (400, 'WS 101', 'Breacket / paired', 300000.00, 0.00, ' NULL ', 'NULL', 0, NULL);
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (3, 'Springy Santa Hat', 'Santa Hat - Boing-Boing-Boing. Santa will be springing into town with this outrageous cap! If your children are whiney and clingy ... and your head''s going ping-pong-pingy ... and you feel like just rowing away in your rubber dinghy ... Take heart! You''ll bounce bounce back ... if you just put on our Santa hat that''s Springy!', 273180.00, 0.00, 'SpringySantaHat.jpg', 'SpringySantaHat.thumb.jpg', 0, '''away'':42 ''back'':53 ''bo'':7,8,9 ''boing-boing-bo'':6 ''bounc'':51,52 ''cap'':19 ''children'':22 ''clingi'':26 ''dinghi'':46 ''feel'':38 ''go'':31 ''hat'':3A,5,61 ''head'':29 ''heart'':48 ''like'':39 ''ll'':50 ''outrag'':18 ''ping'':33 ''ping-pong-pingi'':32 ''pingi'':35 ''pong'':34 ''put'':57 ''row'':41 ''rubber'':45 ''santa'':2A,4,10,60 ''spring'':13 ''springi'':1A,64 ''take'':47 ''town'':15 ''whiney'':24');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (8, 'Chauffeur Hat', 'Uniform Chauffeur Cap. This cap is the real thing. Well-made and professional looking, our Chauffeur hat gets so many compliments from our customers who buy (and wear) them. It''s absolutely amazing how many of these we sell. One thing''s for sure, this authentic professional cap will let everyone know exactly who''s in the driver''s seat. So ... whether you''re driving Miss Daisy ... or driving yourself crazy ... I''ll bet your wife will coo and purr ... when she sees you in our authentic chauffer!', 955993.00, 0.00, 'ChauffeurHat.jpg', 'ChauffeurHat.thumb.jpg', 0, '''absolut'':35 ''amaz'':36 ''authent'':49,90 ''bet'':77 ''buy'':29 ''cap'':5,7,51 ''chauffer'':91 ''chauffeur'':1A,4,19 ''compliment'':24 ''coo'':81 ''crazi'':74 ''custom'':27 ''daisi'':70 ''drive'':68,72 ''driver'':61 ''everyon'':54 ''exact'':56 ''get'':21 ''hat'':2A,20 ''know'':55 ''let'':53 ''ll'':76 ''look'':17 ''made'':14 ''mani'':23,38 ''miss'':69 ''one'':43 ''profession'':16,50 ''purr'':83 ''re'':67 ''real'':10 ''seat'':63 ''see'':86 ''sell'':42 ''sure'':47 ''thing'':11,44 ''uniform'':3 ''wear'':31 ''well'':13 ''well-mad'':12 ''whether'':65 ''wife'':79');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (4, 'Plush Santa Hat', 'Get into the spirit of the season with this plush, velvet-like, Santa hat. Comes in a beautiful crimson red color with a faux-fur trim.', 163908.00, 0.00, 'PlushSantaHat.jpg', 'PlushSantaHat.thumb.jpg', 0, '''beauti'':22 ''color'':25 ''come'':19 ''crimson'':23 ''faux'':29 ''faux-fur'':28 ''fur'':30 ''get'':4 ''hat'':3A,18 ''like'':16 ''plush'':1A,13 ''red'':24 ''santa'':2A,17 ''season'':10 ''spirit'':7 ''trim'':31 ''velvet'':15 ''velvet-lik'':14');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (5, 'Red Santa Cowboy Hat', 'This velvet Cowboy Santa Hat is one size fits all and has white faux-fur trim all around. Here comes Santa Claus ... Here comes Santa Claus ... right down Cowboy Lane!', 341338.00, 0.00, 'RedSantaCowboyHat.jpg', 'RedSantaCowboyHat.thumb.jpg', 0, '''around'':23 ''claus'':27,31 ''come'':25,29 ''cowboy'':3A,7,34 ''faux'':19 ''faux-fur'':18 ''fit'':13 ''fur'':20 ''hat'':4A,9 ''lane'':35 ''one'':11 ''red'':1A ''right'':32 ''santa'':2A,8,26,30 ''size'':12 ''trim'':21 ''velvet'':6 ''white'':17');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (12, '454 Black Pirate Hat', 'Our wool felt Pirate Hat comes with the front and back brims turned upward. This sized hat has the pirate emblem on the front. So, ho, ho, ho and a bottle of rum ... if you''re about as crazy as they come ... wear our Pirate hat this coming Halloween ... and with an eyepatch to boot, you''ll be lusty, lean and mean!', 546223.00, 0.00, '454BlackPirateHat.jpg', '454BlackPirateHat.thumb.jpg', 0, '''454'':1A ''back'':15 ''black'':2A ''boot'':59 ''bottl'':35 ''brim'':16 ''come'':10,46,52 ''crazi'':43 ''emblem'':25 ''eyepatch'':57 ''felt'':7 ''front'':13,28 ''halloween'':53 ''hat'':4A,9,21,50 ''ho'':30,31,32 ''lean'':64 ''ll'':61 ''lusti'':63 ''mean'':66 ''pirat'':3A,8,24,49 ''re'':40 ''rum'':37 ''size'':20 ''turn'':17 ''upward'':18 ''wear'':47 ''wool'':6');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (6, 'Santa Jester Hat', 'This three-prong velvet jester is one size fits all and has an adjustable touch fastener back for perfect fitting.', 341338.00, 0.00, 'SantaJesterHat.jpg', 'SantaJesterHat.thumb.jpg', 0, '''adjust'':18 ''back'':21 ''fasten'':20 ''fit'':13,24 ''hat'':3A ''jester'':2A,9 ''one'':11 ''perfect'':23 ''prong'':7 ''santa'':1A ''size'':12 ''three'':6 ''three-prong'':5 ''touch'':19 ''velvet'':8');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (10, 'Vinyl Policeman Cop Hat', 'A hat that channels the 70s. This oversized vinyl cap with silver badge will make you a charter member of the disco era ... or is that disco error?', 409633.00, 0.00, 'VinylPolicemanCopHat.jpg', 'VinylPolicemanCopHat.thumb.jpg', 0, '''70s'':10 ''badg'':17 ''cap'':14 ''channel'':8 ''charter'':22 ''cop'':3A ''disco'':26,31 ''era'':27 ''error'':32 ''hat'':4A,6 ''make'':19 ''member'':23 ''overs'':12 ''policeman'':2A ''silver'':16 ''vinyl'':1A,13');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (41, 'Civil War Leather Kepi Cap', 'Calling all Civil War buffs! Yanks grab the blue, and Rebs get the gray. You''ll all be victorious in this suede cap worn in the "War Between the States." So, if on the Civil War you''re hep-eee ... then by all means, you gotta have our kepi!', 546223.00, 0.00, 'CivilWarLeatherKepiCap.jpg', 'CivilWarLeatherKepiCap.thumb.jpg', 0, '''blue'':14 ''buff'':10 ''call'':6 ''cap'':5A,28 ''civil'':1A,8,40 ''eee'':46 ''get'':17 ''gotta'':52 ''grab'':12 ''gray'':19 ''hep'':45 ''hep-ee'':44 ''kepi'':4A,55 ''leather'':3A ''ll'':21 ''mean'':50 ''re'':43 ''reb'':16 ''state'':35 ''sued'':27 ''victori'':24 ''war'':2A,9,32,41 ''worn'':29 ''yank'':11');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (25, 'Wool Beret', 'This classic tam from Kangol is one size fits all. It''s composed of 100% wool and measures 11" in diameter.', 341338.00, 0.00, 'WoolBeret.jpg', 'WoolBeret.thumb.jpg', 0, '''100'':17 ''11'':21 ''beret'':2A ''classic'':4 ''compos'':15 ''diamet'':23 ''fit'':11 ''kangol'':7 ''measur'':20 ''one'':9 ''size'':10 ''tam'':5 ''wool'':1A,18');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (16, 'Leprechaun Hat', 'Show them the green! This hand-blocked, wool felt hat will make you the hit of this year''s St. Paddy''s Day Celebration! Oh yes, the green you will don ... and what better way, hon ... than if this St. Patrick''s Day ... you''re wearing our cool Leprechaun!', 1215514.00, 0.00, 'LeprechaunHat.jpg', 'LeprechaunHat.thumb.jpg', 0, '''better'':37 ''block'':10 ''celebr'':27 ''cool'':51 ''day'':26,46 ''felt'':12 ''green'':6,31 ''hand'':9 ''hand-block'':8 ''hat'':2A,13 ''hit'':18 ''hon'':39 ''leprechaun'':1A,52 ''make'':15 ''oh'':28 ''paddi'':24 ''patrick'':44 ''re'':48 ''show'':3 ''st'':23,43 ''way'':38 ''wear'':49 ''wool'':11 ''year'':21 ''yes'':29');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (39, 'Campaign Hat', 'Dress the part of Dudley-Do-Right, State Trooper Bob, Smokey the Bear, or WWI Doughboy. Wear it in the rain ... wear it carrying a cane ... wear it if you''re crazy or sane ... just wear our versatile Campaign!', 614518.00, 0.00, 'CampaignHat.jpg', 'CampaignHat.thumb.jpg', 0, '''bear'':16 ''bob'':13 ''campaign'':1A,42 ''cane'':29 ''carri'':27 ''crazi'':35 ''doughboy'':19 ''dress'':3 ''dudley'':8 ''dudley-do-right'':7 ''hat'':2A ''part'':5 ''rain'':24 ''re'':34 ''right'':10 ''sane'':37 ''smokey'':14 ''state'':11 ''trooper'':12 ''versatil'':41 ''wear'':20,25,30,39 ''wwi'':18');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (36, 'Traditional Colonial Tricorn Hat', 'Truly revolutionary headgear. This hat is blocked from black wool, and edges are finished with white ribbon. The edges are tacked up for durability. So if you''re glad to be born ... if you wanna toot your own horn ... just hop out of bed some lovely morn ... and put on our Traditional Colonial Tricorn!', 546223.00, 0.00, 'TraditionalColonialTricornHat.jpg', 'TraditionalColonialTricornHat.thumb.jpg', 0, '''bed'':48 ''black'':13 ''block'':11 ''born'':36 ''coloni'':2A,57 ''durabl'':28 ''edg'':16,23 ''finish'':18 ''glad'':33 ''hat'':4A,9 ''headgear'':7 ''hop'':45 ''horn'':43 ''love'':50 ''morn'':51 ''put'':53 ''re'':32 ''revolutionari'':6 ''ribbon'':21 ''tack'':25 ''toot'':40 ''tradit'':1A,56 ''tricorn'':3A,58 ''truli'':5 ''wanna'':39 ''white'':20 ''wool'':14');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (45, 'Tarbucket Helmet Military Hat', 'This is a reproduction Tarbucket type hat. This style was a popular military style in the early to mid 1800s. The style is similar to a shako hat, with the main difference being that the crown flairs outward.', 4097563.00, 0.00, 'TarbucketHelmetMilitaryHat.jpg', 'TarbucketHelmetMilitaryHat.thumb.jpg', 0, '''1800s'':24 ''crown'':40 ''differ'':36 ''earli'':21 ''flair'':41 ''hat'':4A,11,32 ''helmet'':2A ''main'':35 ''mid'':23 ''militari'':3A,17 ''outward'':42 ''popular'':16 ''reproduct'':8 ''shako'':31 ''similar'':28 ''style'':13,18,26 ''tarbucket'':1A,9 ''type'':10');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (44, 'Union Civil War Kepi Cap', 'Union Soldier''s Cap - Yankee Cap - This kepi comes with the crossed musket emblem on the front.', 204748.00, 0.00, 'UnionCivilWarKepiCap.jpg', 'UnionCivilWarKepiCap.thumb.jpg', 2, '''cap'':5A,9,11 ''civil'':2A ''come'':14 ''cross'':17 ''emblem'':19 ''front'':22 ''kepi'':4A,13 ''musket'':18 ''soldier'':7 ''union'':1A,6 ''war'':3A ''yanke'':10');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (14, 'Professor McGonagall Witch Hat', 'Professor McGonagall, Deputy Headmistress of Hogwarts and Head of Gryffindor House, commands respect in this dramatic witch hat - and so will you! The inside of this hat has a touch fastener size-adjustment tab. The hat is a must for all Harry Potter fans!', 341338.00, 0.00, 'ProfessorMcGonagallWitchHat.jpg', 'ProfessorMcGonagallWitchHat.thumb.jpg', 0, '''adjust'':38 ''command'':16 ''deputi'':7 ''dramat'':20 ''fan'':49 ''fasten'':35 ''gryffindor'':14 ''harri'':47 ''hat'':4A,22,31,41 ''head'':12 ''headmistress'':8 ''hogwart'':10 ''hous'':15 ''insid'':28 ''mcgonagal'':2A,6 ''must'':44 ''potter'':48 ''professor'':1A,5 ''respect'':17 ''size'':37 ''size-adjust'':36 ''tab'':39 ''touch'':34 ''witch'':3A,21');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (35, 'Conductor Hat', 'Train Railroad Conductor Hat - You been working on the railroad all the live-long day? Well now, you can wear our Conductor''s hat, and your troubles will all go away! We sell a ton of these! Set the scene correctly with an authentic train or streetcar conductor''s uniform hat. Also makes a great gift for transportation enthusiasts. Don''t be a drain ... get on the train!', 955993.00, 0.00, 'ConductorHat.jpg', 'ConductorHat.thumb.jpg', 0, '''also'':55 ''authent'':47 ''away'':34 ''conductor'':1A,5,25,51 ''correct'':44 ''day'':18 ''drain'':67 ''enthusiast'':62 ''get'':68 ''gift'':59 ''go'':33 ''great'':58 ''hat'':2A,6,27,54 ''live'':16 ''live-long'':15 ''long'':17 ''make'':56 ''railroad'':4,12 ''scene'':43 ''sell'':36 ''set'':41 ''streetcar'':50 ''ton'':38 ''train'':3,48,71 ''transport'':61 ''troubl'':30 ''uniform'':53 ''wear'':23 ''well'':19 ''work'':9');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (42, 'Cavalier Hat - Three Musketeers', 'Reproduction of the original Cavalier hat complete with a feather! Handblocked from 100% wool felt. This is as close to the real thing as you get. It is better than downing a beer ... it is better than having your honey say, "Come on over here, Dear" ... All you gotta do is let go of your fear ... and order this stunning, galant Cavalier!', 2526915.00, 0.00, 'CavalierHat-ThreeMusketeers.jpg', 'CavalierHat-ThreeMusketeers.thumb.jpg', 1, '''100'':17 ''beer'':37 ''better'':33,40 ''cavali'':1A,9,66 ''close'':23 ''come'':46 ''complet'':11 ''dear'':50 ''down'':35 ''fear'':60 ''feather'':14 ''felt'':19 ''galant'':65 ''get'':30 ''go'':57 ''gotta'':53 ''handblock'':15 ''hat'':2A,10 ''honey'':44 ''let'':56 ''musket'':4A ''order'':62 ''origin'':8 ''real'':26 ''reproduct'':5 ''say'':45 ''stun'':64 ''thing'':27 ''three'':3A ''wool'':18');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (1, 'SILKEN AURORA SET', 'Handmade Cymbal set 14" Hi-Hat, 16" Crash, 18" Crash w/bag', 341338.00, 0.00, 'ChristmasCandyHat.jpg', 'ChristmasCandyHat.thumb.jpg', 0, '''15'':26 ''adjust'':33 ''candi'':2A,15,19 ''christma'':1A,18 ''elop'':23 ''everyon'':5 ''festiv'':13 ''fun'':11 ''hat'':3A,16,20 ''inch'':27 ''insid'':36 ''made'':21 ''peppermint'':14 ''size'':32 ''stand'':24 ''sweeti'':7 ''tall'':28 ''wear'':9');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (15, 'Black Wizard Hat', 'This cool Merlin-style wizard hat by Elope has a dragon that lays around the whole hat. The wizard hat is one size fits all and has a touch fastener on the inside to adjust accordingly.', 477928.00, 0.00, 'BlackWizardHat.jpg', 'BlackWizardHat.thumb.jpg', 0, '''accord'':40 ''adjust'':39 ''around'':18 ''black'':1A ''cool'':5 ''dragon'':15 ''elop'':12 ''fasten'':34 ''fit'':28 ''hat'':3A,10,21,24 ''insid'':37 ''lay'':17 ''merlin'':7 ''merlin-styl'':6 ''one'':26 ''size'':27 ''style'':8 ''touch'':33 ''whole'':20 ''wizard'':2A,9,23');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (30, 'Confederate Civil War Kepi', 'Rebel Hat - Southern Hat - This kepi comes with the crossed musket emblem on the front.', 204748.00, 0.00, 'ConfederateCivilWarKepi.jpg', 'ConfederateCivilWarKepi.thumb.jpg', 0, '''civil'':2A ''come'':11 ''confeder'':1A ''cross'':14 ''emblem'':16 ''front'':19 ''hat'':6,8 ''kepi'':4A,10 ''musket'':15 ''rebel'':5 ''southern'':7 ''war'':3A');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (27, 'Bond-Leather Driver', 'Leather was never so stylish. The Bond-Driver has an elastic sweatband for a sure fit. Seamed and unlined, this driver is perfect for cruising around town or saving the world.', 682813.00, 0.00, 'Bond-LeatherDriver.jpg', 'Bond-LeatherDriver.thumb.jpg', 0, '''around'':31 ''bond'':2A,12 ''bond-driv'':11 ''bond-leath'':1A ''cruis'':30 ''driver'':4A,13,26 ''elast'':16 ''fit'':21 ''leather'':3A,5 ''never'':7 ''perfect'':28 ''save'':34 ''seam'':22 ''stylish'':9 ''sure'':20 ''sweatband'':17 ''town'':32 ''unlin'':24 ''world'':36');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (18, 'Winter Walking Hat', 'Our declarative English walking hat by Christy''s of London comes in 100% Lana Wool and reveals a finished satin lining. Christy''s has been making hats since 1773 and knows how to make the best! Want proof? Try this one ... Irish eyes will be smiling.', 682813.00, 0.00, 'WinterWalkingHat.jpg', 'WinterWalkingHat.thumb.jpg', 0, '''100'':16 ''1773'':32 ''best'':39 ''christi'':10,25 ''come'':14 ''declar'':5 ''english'':6 ''eye'':46 ''finish'':22 ''hat'':3A,8,30 ''irish'':45 ''know'':34 ''lana'':17 ''line'':24 ''london'':13 ''make'':29,37 ''one'':44 ''proof'':41 ''reveal'':20 ''satin'':23 ''sinc'':31 ''smile'':49 ''tri'':42 ''walk'':2A,7 ''want'':40 ''winter'':1A ''wool'':18');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (34, 'Velvet Sombrero Hat', 'Ay Caramba! This is the real thing! Get into this velvet sombrero, which is richly embossed with sequins. Comes in red and black.', 1092583.00, 0.00, 'VelvetSombreroHat.jpg', 'VelvetSombreroHat.thumb.jpg', 0, '''ay'':4 ''black'':26 ''caramba'':5 ''come'':22 ''emboss'':19 ''get'':11 ''hat'':3A ''real'':9 ''red'':24 ''rich'':18 ''sequin'':21 ''sombrero'':2A,15 ''thing'':10 ''velvet'':1A,14');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (43, 'Hussar Military Hat', 'A "Hussar" was an enlisted Cavalry soldier. All hussar soldiers were taught to read and write, and they commonly kept journals of some sort - probably helping them to pass the time while they were away from home in the service of their country. They were required to keep records of their duties and work, as well.', 2731664.00, 0.00, 'HussarMilitaryHat.jpg', 'HussarMilitaryHat.thumb.jpg', 0, '''away'':38 ''cavalri'':9 ''common'':22 ''countri'':46 ''duti'':55 ''enlist'':8 ''hat'':3A ''help'':29 ''home'':40 ''hussar'':1A,5,12 ''journal'':24 ''keep'':51 ''kept'':23 ''militari'':2A ''pass'':32 ''probabl'':28 ''read'':17 ''record'':52 ''requir'':49 ''servic'':43 ''soldier'':10,13 ''sort'':27 ''taught'':15 ''time'':34 ''well'':59 ''work'':57 ''write'':19');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (23, 'Black Basque Beret', 'This is our tried and true men''s classic beret hat(tam). Our Basque beret is superbly crafted, 100% wool, and has a comfortable leather sweatband. Lined and water resistant, the beret is great for everyday wear and rolls up nicely to fit in your pocket. So ... if you''re antsy ... in your pantsy ... cause you wanna catch the fancy ... of the lady near your way ... then please don''t delay ... just get this beret ... today ... and soon you''ll be making hay!', 682813.00, 0.00, 'BlackBasqueBeret.jpg', 'BlackBasqueBeret.thumb.jpg', 0, '''100'':22 ''antsi'':54 ''basqu'':2A,17 ''beret'':3A,13,18,35,78 ''black'':1A ''catch'':61 ''caus'':58 ''classic'':12 ''comfort'':27 ''craft'':21 ''delay'':74 ''everyday'':39 ''fanci'':63 ''fit'':46 ''get'':76 ''great'':37 ''hat'':14 ''hay'':86 ''ladi'':66 ''leather'':28 ''line'':30 ''ll'':83 ''make'':85 ''men'':10 ''near'':67 ''nice'':44 ''pantsi'':57 ''pleas'':71 ''pocket'':49 ''re'':53 ''resist'':33 ''roll'':42 ''soon'':81 ''superbl'':20 ''sweatband'':29 ''tam'':15 ''today'':79 ''tri'':7 ''true'':9 ''wanna'':60 ''water'':32 ''way'':69 ''wear'':40 ''wool'':23');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (40, 'Civil War Union Slouch Hat', 'This Yankee slouch hat from the Civil War era comes in a black wool felt material and has the U.S. metal emblem on the front. This Union hat comes with the officer''s cords.', 1775534.00, 0.00, 'CivilWarUnionSlouchHat.jpg', 'CivilWarUnionSlouchHat.thumb.jpg', 0, '''black'':18 ''civil'':1A,12 ''come'':15,34 ''cord'':39 ''emblem'':27 ''era'':14 ''felt'':20 ''front'':30 ''hat'':5A,9,33 ''materi'':21 ''metal'':26 ''offic'':37 ''slouch'':4A,8 ''u.s'':25 ''union'':3A,32 ''war'':2A,13 ''wool'':19 ''yanke'':7');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (29, 'Herringbone English Driver', 'Herringbone is everywhere this year from head to toe. The English Driver ivy cap is made of wool with a cotton sweatband on the inside.', 409633.00, 0.00, 'HerringboneEnglishDriver.jpg', 'HerringboneEnglishDriver.thumb.jpg', 0, '''cap'':17 ''cotton'':24 ''driver'':3A,15 ''english'':2A,14 ''everywher'':6 ''head'':10 ''herringbon'':1A,4 ''insid'':28 ''ivi'':16 ''made'':19 ''sweatband'':25 ''toe'':12 ''wool'':21 ''year'':8');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (22, 'St. Patrick''s Irish Green Derby', 'This quality bowler will last you more than one St. Patrick''s Day! A proper derby for the day, it is made of wool felt and has a green grosgrain band. This hat is not lined.', 546223.00, 0.00, 'St.Patrick''sIrishGreenDerby.jpg', 'St.Patrick''sIrishGreenDerby.thumb.jpg', 0, '''band'':37 ''bowler'':9 ''day'':19,25 ''derbi'':6A,22 ''felt'':31 ''green'':5A,35 ''grosgrain'':36 ''hat'':39 ''irish'':4A ''last'':11 ''line'':42 ''made'':28 ''one'':15 ''patrick'':2A,17 ''proper'':21 ''qualiti'':8 ''st'':1A,16 ''wool'':30');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (20, 'Hole in One Golf Costume Hat', 'Golf Hat - OK, Ace. This spoof golfer''s hat sports an astro-turf "green," has an attached golf ball and flag, and includes a soft elastic band  for comfort. This hat also makes a great gift that is definitely "up to par" for any goofball''s - uh - golfballer''s taste. Perfect for Dad! And don''t you fore-get-it!', 409633.00, 0.00, 'HoleinOneGolfCostumeHat.jpg', 'HoleinOneGolfCostumeHat.thumb.jpg', 0, '''ace'':10 ''also'':39 ''astro'':19 ''astro-turf'':18 ''attach'':24 ''ball'':26 ''band'':34 ''comfort'':36 ''costum'':5A ''dad'':60 ''definit'':46 ''elast'':33 ''flag'':28 ''fore'':66 ''fore-get-it'':65 ''get'':67 ''gift'':43 ''golf'':4A,7,25 ''golfbal'':55 ''golfer'':13 ''goofbal'':52 ''great'':42 ''green'':21 ''hat'':6A,8,15,38 ''hole'':1A ''includ'':30 ''make'':40 ''ok'':9 ''one'':3A ''par'':49 ''perfect'':58 ''soft'':32 ''spoof'':12 ''sport'':16 ''tast'':57 ''turf'':20 ''uh'':54');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (21, 'Luck of the Irish Bowler', 'This one size fits all Irish Derby comes with a shamrock attached to the side. This hat is made of a soft velvet and is comfortably sized.', 409633.00, 0.00, 'LuckoftheIrishBowler.jpg', 'LuckoftheIrishBowler.thumb.jpg', 0, '''attach'':17 ''bowler'':5A ''come'':13 ''comfort'':31 ''derbi'':12 ''fit'':9 ''hat'':22 ''irish'':4A,11 ''luck'':1A ''made'':24 ''one'':7 ''shamrock'':16 ''side'':20 ''size'':8,32 ''soft'':27 ''velvet'':28');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (32, 'Mother Goose Hat', 'Sorceress Witch Hat - Boil, Boil, Toil and Trouble! Mix up a pot of your best witch''s brew in this blocked wool felt hat. Available in almost all color combinations - email us for more information.', 2048714.00, 0.00, 'MotherGooseHat.jpg', 'MotherGooseHat.thumb.jpg', 0, '''almost'':30 ''avail'':28 ''best'':18 ''block'':24 ''boil'':7,8 ''brew'':21 ''color'':32 ''combin'':33 ''email'':34 ''felt'':26 ''goos'':2A ''hat'':3A,6,27 ''inform'':38 ''mix'':12 ''mother'':1A ''pot'':15 ''sorceress'':4 ''toil'':9 ''troubl'':11 ''us'':35 ''witch'':5,19 ''wool'':25');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (28, 'Moleskin Driver', 'This quality ivy cap made by Christy''s comes with a finished lining. The material of this ivy is called moleskin and is very soft. If your life''s kinda in a hole ... and you wish you had a little more soul ... no need to beat your head against a pole, Ken ... just purchase our Christy''s Ivy Cap in Moleskin!', 409633.00, 341475.00, 'MoleskinDriver.jpg', 'MoleskinDriver.thumb.jpg', 2, '''beat'':48 ''call'':22 ''cap'':6,61 ''christi'':9,58 ''come'':11 ''driver'':2A ''finish'':14 ''head'':50 ''hole'':35 ''ivi'':5,20,60 ''ken'':54 ''kinda'':32 ''life'':30 ''line'':15 ''littl'':42 ''made'':7 ''materi'':17 ''moleskin'':1A,23,63 ''need'':46 ''pole'':53 ''purchas'':56 ''qualiti'':4 ''soft'':27 ''soul'':44 ''wish'':38');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (38, 'Confederate Slouch Hat', 'Our replica Confederate Slouch Hat from the Civil War comes with Cavalry yellow straps and crossed-sword emblem.', 1775534.00, 1393081.00, 'ConfederateSlouchHat.jpg', 'ConfederateSlouchHat.thumb.jpg', 1, '''cavalri'':15 ''civil'':11 ''come'':13 ''confeder'':1A,6 ''cross'':20 ''crossed-sword'':19 ''emblem'':22 ''hat'':3A,8 ''replica'':5 ''slouch'':2A,7 ''strap'':17 ''sword'':21 ''war'':12 ''yellow'':16');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (31, 'Hillbilly Hat', 'Blocked wool, with a rope band. Please allow 1-2 weeks for delivery. Some sizes available for immediate shipment. Corn Cob pipe not included! So, go ahead Joe, or Carl, or Billy ... act nutso and be silly ... because we''ve got you covered willy-nilly ... in our sleepy-hollow Hillbilly!', 1912124.00, 1706692.00, 'HillbillyHat.jpg', 'HillbillyHat.thumb.jpg', 2, '''1'':12 ''1-2'':11 ''2'':13 ''act'':36 ''ahead'':30 ''allow'':10 ''avail'':19 ''band'':8 ''billi'':35 ''block'':3 ''carl'':33 ''cob'':24 ''corn'':23 ''cover'':46 ''deliveri'':16 ''go'':29 ''got'':44 ''hat'':2A ''hillbilli'':1A,55 ''hollow'':54 ''immedi'':21 ''includ'':27 ''joe'':31 ''nilli'':49 ''nutso'':37 ''pipe'':25 ''pleas'':9 ''rope'':7 ''shipment'':22 ''silli'':40 ''size'':18 ''sleepi'':53 ''sleepy-hollow'':52 ''ve'':43 ''week'':14 ''willi'':48 ''willy-nilli'':47 ''wool'':4');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (13, 'Black Puritan Hat', 'Haentze Hatcrafters has been making quality theatrical and military headgear for decades. Each hat is made meticulously by hand with quality materials. Many of these hats have been used in movies and historical reproductions and re-enactments.', 1229173.00, 1037947.00, 'BlackPuritanHat.jpg', 'BlackPuritanHat.thumb.jpg', 2, '''black'':1A ''decad'':15 ''enact'':41 ''haentz'':4 ''hand'':22 ''hat'':3A,17,29 ''hatcraft'':5 ''headgear'':13 ''histor'':36 ''made'':19 ''make'':8 ''mani'':26 ''materi'':25 ''meticul'':20 ''militari'':12 ''movi'':34 ''puritan'':2A ''qualiti'':9,24 ''re'':40 ''re-enact'':39 ''reproduct'':37 ''theatric'':10 ''use'':32');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (37, 'Metal Viking Helmet', 'You can almost hear the creaking oars of your warship as you glide across open seas! Conquer new worlds with this authentic Nordic reproduction. Crafted from metal and horn, the Viking helmet is a necessity for any adventure. Would you adorn it while biking? ... How about on the wooded trials while hiking? ... Betcha it''ll always be to your liking ... wherever you wear our Metal Viking!', 1638943.00, 1447171.00, 'MetalVikingHelmet.jpg', 'MetalVikingHelmet.thumb.jpg', 2, '''across'':17 ''adorn'':44 ''adventur'':41 ''almost'':6 ''alway'':59 ''authent'':25 ''betcha'':56 ''bike'':47 ''conquer'':20 ''craft'':28 ''creak'':9 ''glide'':16 ''hear'':7 ''helmet'':3A,35 ''hike'':55 ''horn'':32 ''like'':63 ''ll'':58 ''metal'':1A,30,68 ''necess'':38 ''new'':21 ''nordic'':26 ''oar'':10 ''open'':18 ''reproduct'':27 ''sea'':19 ''trial'':53 ''vike'':2A,34,69 ''warship'':13 ''wear'':66 ''wherev'':64 ''wood'':52 ''world'':22 ''would'':42');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (7, 'Santa''s Elf Hat', 'Be Santa''s best looking helper with this velvet hat, complete with attached ears. So, if you don''t wanna be yourself ... don''t worry ... this Christmas, just be Santa''s elf! Happy Holidays!', 341338.00, 231520.00, 'Santa''sElfHat.jpg', 'Santa''sElfHat.thumb.jpg', 1, '''attach'':17 ''best'':8 ''christma'':31 ''complet'':15 ''ear'':18 ''elf'':3A,36 ''happi'':37 ''hat'':4A,14 ''helper'':10 ''holiday'':38 ''look'':9 ''santa'':1A,6,34 ''velvet'':13 ''wanna'':24 ''worri'':29');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (19, 'Green MadHatter Hat', 'St. Patrick''s Day Hat - Luck o'' the Irish! This oversized green velveteen MadHatter is great for St.Patrick''s day or a MadHatter''s tea party.One size fits most adults.', 546223.00, 395974.00, 'GreenMadHatterHat.jpg', 'GreenMadHatterHat.thumb.jpg', 2, '''adult'':33 ''day'':7,23 ''fit'':31 ''great'':19 ''green'':1A,15 ''hat'':3A,8 ''irish'':12 ''luck'':9 ''madhatt'':2A,17,26 ''o'':10 ''overs'':14 ''party.one'':29 ''patrick'':5 ''size'':30 ''st'':4 ''st.patrick'':21 ''tea'':28 ''velveteen'':16');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (17, '9 Green MadHatter Top Hat', 'Each of our MadHatter hats is made meticulously by hand with quality materials. Many of these hats have been used in movies and historical reproductions and re-enactments.', 2048714.00, 1706692.00, '9GreenMadHatterTopHat.jpg', '9GreenMadHatterTopHat.thumb.jpg', 2, '''9'':1A ''enact'':34 ''green'':2A ''hand'':15 ''hat'':5A,10,22 ''histor'':29 ''made'':12 ''madhatt'':3A,9 ''mani'':19 ''materi'':18 ''meticul'':13 ''movi'':27 ''qualiti'':17 ''re'':33 ''re-enact'':32 ''reproduct'':30 ''top'':4A ''use'':25');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (24, 'Cotton Beret', 'The Parkhurst SunGuard line of headwear offers the comfort and breathability of cotton and provides up to 50 times your natural protection from the sun''s rays. Fashionable, durable, and washable, Sunguard is the only choice.', 176884.00, 108589.00, 'CottonBeret.jpg', 'CottonBeret.thumb.jpg', 2, '''50'':20 ''beret'':2A ''breathabl'':13 ''choic'':38 ''comfort'':11 ''cotton'':1A,15 ''durabl'':31 ''fashion'':30 ''headwear'':8 ''line'':6 ''natur'':23 ''offer'':9 ''parkhurst'':4 ''protect'':24 ''provid'':17 ''ray'':29 ''sun'':27 ''sunguard'':5,34 ''time'':21 ''washabl'':33');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (11, 'Burgundy Kings Crown', 'Our burgundy Kings Crown is one size fits all. This crown is adorned with gold ribbon, gems, and a faux-fur headband. Be King for a Day ... Finally get your say ... Put your foot down ... and do it with humor, wearing our Elegant Burgundy King''s Crown!', 477928.00, 176884.00, 'BurgandyKingsCrown.jpg', 'BurgandyKingsCrown.thumb.jpg', 2, '''adorn'':16 ''burgundi'':1A,5,48 ''crown'':3A,7,14,51 ''day'':31 ''eleg'':47 ''faux'':24 ''faux-fur'':23 ''final'':32 ''fit'':11 ''foot'':38 ''fur'':25 ''gem'':20 ''get'':33 ''gold'':18 ''headband'':26 ''humor'':44 ''king'':2A,6,28,49 ''one'':9 ''put'':36 ''ribbon'':19 ''say'':35 ''size'':10 ''wear'':45');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (33, 'Uncle Sam Top Hat', 'Patriotic Hats, Uncle Sam Top Hat - This silk topper is a show stopper. Hand-fashioned quality will transform you into a Yankee Doodle Dandy ... Or you can call us a macaroni (something like that).', 2718141.00, 2390325.00, 'UncleSamTopHat.jpg', 'UncleSamTopHat.thumb.jpg', 2, '''call'':33 ''dandi'':29 ''doodl'':28 ''fashion'':20 ''hand'':19 ''hand-fashion'':18 ''hat'':4A,6,10 ''like'':38 ''macaroni'':36 ''patriot'':5 ''qualiti'':21 ''sam'':2A,8 ''show'':16 ''silk'':12 ''someth'':37 ''stopper'':17 ''top'':3A,9 ''topper'':13 ''transform'':23 ''uncl'':1A,7 ''us'':34 ''yanke'':27');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (26, 'Military Beret', 'As one of our best selling berets, this Black Military Beret is especially popular in these war-torn days. Made of wool felt, it''s a facsimile of what Monty wore in the deserts of Africa in World War II. We don''t guarantee any sweeping victories with this beret, but you might score a personal triumph or two!', 273043.00, 176884.00, 'MilitaryBeret.jpg', 'MilitaryBeret.thumb.jpg', 3, '''africa'':39 ''beret'':2A,9,13,53 ''best'':7 ''black'':11 ''day'':22 ''desert'':37 ''especi'':15 ''facsimil'':30 ''felt'':26 ''guarante'':47 ''ii'':43 ''made'':23 ''might'':56 ''militari'':1A,12 ''monti'':33 ''one'':4 ''person'':59 ''popular'':16 ''score'':57 ''sell'':8 ''sweep'':49 ''torn'':21 ''triumph'':60 ''two'':62 ''victori'':50 ''war'':20,42 ''war-torn'':19 ''wool'':25 ''wore'':34 ''world'':41');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (2, 'SILKEN AURORA SET BRASS SH', 'Handmade Cymbal set 14" Hi-Hat, 16" Crash, 20" Ride w/bag', 341338.00, 300361.00, 'HanukahHat.jpg', 'HanukahHat.thumb.jpg', 2, '''9'':26 ''adorn'':24 ''brighten'':33 ''candl'':27 ''celebr'':36 ''elop'':22 ''enjoy'':15 ''festiv'':10 ''fun'':8 ''hanukah'':1A,4 ''hat'':2A,5 ''holiday'':19 ''made'':20 ''menorah'':29 ''sure'':31 ''way'':11 ''winter'':35');
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (468, 'bbb', 'ket bbb', 1200000.00, 0.00, NULL, NULL, 0, NULL);
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (477, 'xxx', 'ket xxx', 666.00, 0.00, NULL, NULL, 0, NULL);
INSERT INTO public.product (product_id, name, description, price, discounted_price, image, thumbnail, display, search_vector) VALUES (478, 'proxmox', 'ket proxmox', 1234567.00, 0.00, NULL, NULL, 0, NULL);


--
-- TOC entry 3171 (class 0 OID 612051)
-- Dependencies: 231
-- Data for Name: product_category; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (1, 1, '7f514308-7881-44e0-b19a-e5b3e0e8d5ca');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (2, 1, '5e6bafb5-49eb-4006-b536-05bbddfbf5b9');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (3, 1, '84b0810c-f785-4f22-afb3-68da9ab9654d');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (4, 1, 'f03e5b67-8881-4acc-9b6b-f05b0c58e362');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (5, 1, '4e5d5854-7f2e-48d7-9f72-d38db6fa53dd');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (6, 1, 'b9a2776c-a172-4691-84de-10e1c1422f11');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (7, 1, '054a6c93-c124-4b9b-9866-38e45fd169be');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (8, 2, '06e4bc65-eae6-4698-bad7-ee22b3953348');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (9, 2, '3e4cbf76-0565-460e-82b1-70a493511b8b');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (10, 2, '407c7d32-802c-4ab1-9b59-8817ca2132b4');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (11, 2, '730aac15-5bb5-4bcc-875d-d084c3d7ac58');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (12, 2, '94e21a76-f7a3-436c-a3e3-f43734d4659d');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (13, 2, '3468f571-280b-4561-b4d4-67f1561461f8');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (14, 2, '4cbdc757-c668-4063-9c1a-b712daa70f84');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (15, 2, 'c168cde6-22f2-4ee9-939d-fd6096892c43');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (16, 3, 'b228351e-f840-4a0b-847e-50af7247b33c');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (17, 3, 'bce846ad-1468-4ba8-8fff-df15df3c36c2');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (18, 3, 'e0d86e9f-2e63-4ca3-a11f-792b75e945a2');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (19, 3, 'c9a7bec2-0f1f-48e2-b1f3-e78c3cf68dd0');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (20, 3, 'd91067dc-7517-4c9c-acfa-21e228dcf4fe');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (21, 3, '21534311-94d3-4439-befb-470557e0a80d');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (22, 3, '0fa86ce0-da6f-4c87-bfa3-f2bf79a80f62');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (23, 4, '0353f8b5-d605-4b01-9695-c35cafb07ed0');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (24, 4, '496c05a3-ed97-4ac6-9836-5842ed63b705');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (25, 4, '9a761349-312c-4b0e-868b-0e723afe1e92');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (26, 4, '35d46f57-b393-474b-9543-6a89cb6b9141');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (8, 5, 'e9f36a38-7048-4ec3-bb35-702b004ae451');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (27, 5, 'c5dd5238-9456-4359-b282-1fd7c3f9e654');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (28, 5, '178d61e0-7360-44fc-a2e6-144ebd34c7da');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (29, 5, 'ab82cd44-0d73-468e-bc28-11c83b95fc0a');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (30, 6, '18cf0636-fc5e-4b96-b935-39720e751608');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (31, 6, '1d8e80a4-a628-4184-9b3d-a6b88be2973f');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (32, 6, '5d7976d8-f35d-4448-a141-0be1666e4dbb');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (33, 6, '2ebaf4f1-49f6-4c87-bd37-16ebe6c2bb07');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (34, 6, 'f193fd07-1a25-4503-83da-e44666384d2b');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (35, 6, '177cc5b9-493b-47ec-80ca-674aea168292');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (26, 7, '2802e08c-087a-4475-95cf-64af80458bb3');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (36, 7, '5fd6e842-7467-4d60-8a7c-ae95c629e76f');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (37, 7, 'e00180a8-4eb3-4e54-8451-746a39f7a994');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (38, 7, '5c1e2458-78e1-41a1-b720-2279d622baed');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (39, 7, 'a0b145fc-5193-486c-a878-d637842a0d77');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (40, 7, 'e7661f0d-39e0-4e0b-b8ae-269f3afeea03');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (41, 7, '6b4c1411-5392-4146-8275-c7c5d7e95bba');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (42, 7, 'fbc78d00-8496-47a6-96ca-e22ce6f28d0b');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (43, 7, '8db84700-4b65-4e2b-92fb-3e242f6910ec');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (44, 7, '1a3132c8-f434-4ad1-b741-469513f594fd');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (119, 3, 'ea6f591c-62e0-46d1-a108-8185a4ab6d43');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (120, 3, '12446e62-6344-4a5d-9202-5549958924b1');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (121, 3, 'c5697fbb-09a2-482d-9f9c-6b43af944c15');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (122, 3, '8c1e754e-910d-445d-8608-b2b1213545e5');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (123, 3, '20aaa479-3248-468a-90cb-432b2895641d');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (124, 3, 'afee0872-1956-4d7c-b239-5a484fd242f3');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (125, 3, 'c71f4987-c556-44b5-9a53-fdb627b685f1');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (126, 3, 'b70c3f68-4fa1-412b-86d2-e94695983af3');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (127, 3, 'c7d52fee-c0ec-4493-967d-5f69215dfe25');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (128, 3, 'c80744c0-94c0-4934-9734-058f8d0c1287');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (129, 3, '0bd3f16b-5269-49d9-9c1f-696e6a78433c');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (130, 3, '81bfb305-d81b-4815-9f3c-d003924b254a');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (131, 3, 'a7d6bb1c-fa80-48b1-85a4-b6e40a349e7d');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (132, 3, '02154c44-8a78-4b0a-910f-5f705ee6a6b8');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (133, 3, 'f7fc1725-e380-47b8-a6ea-8f839e668c83');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (134, 3, '2fd65a1d-643d-4f93-9ef2-42b11311a3b7');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (135, 3, 'fdc211fe-4713-40b5-b677-45e04e092335');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (136, 3, 'a77cebae-c16d-4422-b5e0-8a2d13e0beb3');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (118, 18, 'd36038a4-1ce1-4e8f-a06c-4a0878cfef93');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (138, 6, '921011a5-9466-47ee-954e-df63cb2de5b1');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (139, 6, 'b65ca2ef-ca41-4264-81e2-e8e5d1611248');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (137, 3, '5d9459ef-ca21-4ffc-a996-2d9a0a817774');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (46, 1, '6e5d5478-e287-4df3-b512-d789e2fe48b5');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (47, 1, '423ef4d7-a48f-45d1-9912-f883315cf17b');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (45, 7, '3ead4e30-81fe-4c0d-ad8b-50a5a7db634e');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (48, 1, 'ffa0bb0c-f8fd-4798-a6f7-528b8bbc65b1');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (49, 1, '65e4ac97-417c-4718-9548-52c68edd95bd');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (50, 1, '32eca33a-e4fb-4e36-a5c9-179db3f1afd6');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (51, 1, 'af9728ac-e13e-424d-8ae1-7118eb9366a6');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (53, 1, '5812ec26-ec96-4ab3-9104-cd486222a05e');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (54, 1, '91eb1366-6bac-46a5-91c9-f3c0fbcf0a1c');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (55, 1, '64a7b495-1b17-4bbe-9c70-8fc9815c1417');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (56, 1, '8a3e103b-85b3-4c9f-934d-1666fd1dddb8');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (57, 1, '4d56cdac-e2a0-41df-b309-e43bbbd3aff0');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (58, 1, '893d246c-ebc0-4f47-8a5e-17a3f343698c');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (59, 1, '78eb2b25-2e5c-4b81-9398-946f8ac64ba2');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (60, 1, '11d5f0f2-71e6-475a-85ca-df7e87c23930');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (61, 1, '55aa3092-c99f-4f4c-bbab-19558f48e95a');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (62, 1, '61d46672-d377-4b03-8b75-66cbbb4683cc');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (63, 1, 'bd373d9d-5aa7-44ff-bf32-a33d9fec7eb2');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (64, 1, 'e40cf39a-b24d-4dcc-a946-763c218d6abd');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (65, 1, 'fb0c3cb4-c70f-4afd-962d-5fe6bb9c7cca');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (66, 1, '194aae19-c65a-4e52-ba29-1da6ee9d3676');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (67, 1, '970e1fc3-40ef-460c-84ee-f5ccf92a9aca');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (68, 1, '7b80fa07-7345-4c66-95a6-5af0abd8c118');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (69, 1, '45512517-c99c-4d12-8430-49c9928a74d3');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (70, 1, 'e3216b29-04be-4880-ba16-609a2f68bd59');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (71, 1, 'f03f1f86-81ea-420d-a431-e5aa8fdfefb3');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (72, 1, '86a86937-7142-4680-9646-da35523ab088');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (73, 1, 'ef0ea9c1-e80a-40e2-9b64-ea5480cae53e');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (74, 1, '5ef238bc-48ff-4bc8-87b5-8bd9385cde05');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (75, 1, '33afb6ea-8103-4877-9489-2be45bd59bd6');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (76, 1, '2c614d9e-f239-4278-81c7-0323779af768');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (77, 1, '03999554-1b2f-43e6-8335-784d3f814170');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (78, 1, 'bdc35228-2d70-4a03-aea6-2eeb4d34959c');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (79, 1, 'e9fb3ef6-8990-44c6-a639-c57f99617ce3');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (80, 1, '928a3359-e708-4c7e-8626-032087936242');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (81, 1, '709782b0-67ef-48f8-8321-221edfbf923b');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (82, 1, '9f4e6f58-8b45-4efd-8dd3-6aa97e34a142');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (83, 1, '98f02d39-0a35-47d5-b6ff-cae331c413ad');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (84, 1, '055dc72f-1539-4ae2-b38d-08a4cfbaf275');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (85, 1, '3ec7558c-e89e-459b-ae83-75270e55ca4b');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (86, 1, '66b0b619-60db-4b3a-9ec6-66c236bcf631');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (87, 1, '0bd52786-0b6a-42ed-a194-fafa696c0385');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (88, 1, 'ead101aa-afb7-4e79-9f98-c6b2e0724628');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (89, 1, '697ddace-0a91-4918-9068-9e3bf05c3cc9');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (90, 1, '052b2f1e-0a1d-4e90-b58f-098c5142e1a7');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (91, 1, '492414d1-452c-4695-bc0e-2dda5abf01ed');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (92, 1, '854b77b5-c54b-449b-bb13-34649cd64005');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (93, 1, 'dc4484ef-88f9-44c9-9fb0-3bb413a26f96');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (94, 1, '8ac1e154-fff8-4e6c-995a-dd7cec8543fe');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (95, 1, 'f3644dc0-94d8-4296-b153-709a054de74c');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (96, 1, '3658e7f3-8b63-4953-90de-200909dba9e4');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (97, 1, 'e50c0ba5-003b-45ff-b9ec-377db54543a0');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (98, 1, '3340dbc4-7760-46e6-9e7f-e835ce119292');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (99, 1, 'a8e0623d-9b0c-45c1-a755-0155d529916c');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (100, 1, '2ef88f8c-cfe9-4357-8571-5663cf3b1c6f');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (101, 1, '7dc36432-0934-48d1-be5d-2603e3131111');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (102, 1, '46d354f2-6c1d-4f6f-9e32-b0446b65529b');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (103, 1, '158b0105-e095-4537-a855-41ff3149e248');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (104, 1, 'a1dceb12-bb30-41a6-96fa-f4a638398550');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (105, 1, '2bd0a7eb-c7b2-4b8f-b647-f73d68f295f3');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (106, 1, 'd3489584-5fad-4d33-8b70-b5cf8911e371');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (107, 1, '12cfc1be-507a-4340-9fa1-f630fa731696');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (108, 1, '09d5fcde-eff5-4980-b83c-2d3ab74bac79');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (109, 1, '08e37e26-2934-49b9-a137-fa464a8a43df');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (110, 18, 'b3ad9cdd-dc33-44c1-8296-5e3941a8835c');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (111, 18, '1163535b-d091-4dd5-874e-1fa05b7d7416');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (112, 18, '0176de67-4d53-4943-ba02-d6026ecb3c2f');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (113, 18, '451ab30b-1232-4240-a9a1-2a6cf567a6ca');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (114, 18, '47f7bfc7-a390-4d41-bca0-69af20302739');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (115, 18, '58e417c1-1b73-463c-8163-463615cf1c72');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (116, 18, 'f3cc11e9-c52b-43be-89e9-faa4edadeca1');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (117, 18, '63e218ce-fb2a-4264-9bea-a1e9657bc798');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (140, 6, 'b8d37322-03ea-4a98-8d31-344e6b297ac0');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (141, 6, '4c563acc-4a76-4e74-851e-923e2792bb3c');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (142, 6, 'fb062fe8-4387-427c-9322-745be1b2bf29');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (143, 6, 'af17a105-0be3-4fa6-86d4-48ccea152157');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (144, 6, 'f3c4b70d-3301-4339-b625-6430f56d5998');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (145, 6, '2830cf34-f3f1-412b-91f5-25936e173fa1');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (146, 6, 'ae620f66-9c6f-482f-82aa-2f94048be449');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (147, 6, '57954f5a-50f1-4637-b240-dacac362774c');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (148, 6, '4fa9ffc7-bb11-4364-971f-49ce3a5aee61');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (149, 6, 'a5821397-6ecd-42d6-ae4a-08d10e035794');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (150, 6, 'f5899902-83d9-44f7-ac24-629bd07f8d8c');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (151, 6, '740da0ad-b8f7-43e7-a142-22ee9bc9ad95');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (152, 6, 'c100a07f-c97e-4cf8-a4ed-2b5749587b5f');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (153, 6, '47094634-9898-4695-bf98-2db51cc46ad2');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (154, 6, '39daed1f-20cc-4e76-9511-22bf0b087684');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (155, 6, '8fad95c5-588c-4dd6-aa80-37b1f982bca2');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (156, 6, '93b54ce2-ac2d-4778-9186-01830e868895');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (157, 6, 'c5835213-b569-4eed-926e-ac78400b6bba');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (158, 6, '4c350de7-f458-4a4e-8780-dcb24393a09b');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (159, 6, '65694b07-fb24-4e8d-bc3e-3e338f013e12');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (160, 6, '7806425a-5a62-4da3-92bc-a7d6354c8ca6');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (161, 6, '88423ef9-354c-41ca-a0d4-e712e45d4015');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (162, 6, '1d0500cb-e172-4974-8c23-389051ff9d3f');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (163, 6, '7df9ff43-9eaf-4339-b0cc-fdba1350bfb6');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (164, 6, 'f85edde7-336f-4fe5-b78d-fad457dc0eda');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (165, 6, 'c6fd3ad5-e559-4640-b319-c26d0b9dcae4');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (166, 6, 'fd847126-7254-48f6-8deb-b76173155a27');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (167, 6, '636fb4cb-08c2-4adb-b7e3-81609e000ba7');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (168, 6, '0dbbd382-136c-4153-87a3-f63a690416a0');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (169, 6, '81965d1f-0def-4117-9442-83c101a214a1');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (170, 6, '460f93e8-9c5a-4cc1-ab12-e29770c66397');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (171, 6, 'ba9bde2c-487d-457e-ab22-bb96ac82eab7');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (172, 6, '23d417b4-0d0c-48b8-8c72-d02f2f05bebb');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (173, 6, '641e02fa-d0ca-418a-aa91-df2f3da5c229');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (174, 6, '1346a650-f6fb-461a-bcaa-05e1cc2f3248');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (175, 6, '1187d8f0-5ced-495b-a6b1-19e24935b36c');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (176, 6, '65786b72-9a5b-45ca-866a-bf9434ace38c');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (177, 6, '332ad611-fd1c-4f14-bd3d-c92e87080c88');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (178, 6, '29f14477-e6c2-4ed0-8bcb-75b89b3207cc');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (179, 5, '0dcfe14a-2328-42be-bb08-bbb867834074');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (180, 5, 'c17b96be-06ad-434c-8525-2218f34e4945');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (181, 5, '2ebe557a-1623-4976-8003-87c3b5f791a4');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (182, 5, '0bcbeb79-1b9e-4070-8773-3e144f90825e');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (183, 5, 'df0da70c-9322-4f3a-8580-3310f865f690');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (184, 5, '87207f3e-c250-4db6-ac55-c9984c3268c8');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (185, 5, 'e59b5e82-a3e9-4a15-a126-3affe0002d92');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (186, 5, '3ea78fb9-2b60-4ef8-adf8-abf0fb0cd90e');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (187, 5, 'baa099e7-208c-4224-b174-fb1ab7ad8f19');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (188, 5, 'dc18e95e-e38e-47d4-93fb-1414b35e540d');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (189, 5, '5e0176a1-f8ff-481f-ab80-505672979567');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (190, 5, '38290813-b48d-4887-afdb-a720eff9bfbb');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (191, 5, '38d5c490-083b-4763-a319-9c6e85746d97');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (192, 5, 'bbb755fc-4c6c-4505-becb-9a9f9d37b550');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (193, 5, '270f8a79-aa02-4307-9fdc-dfdbfcdbb1a8');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (194, 5, '3dd66f98-90e8-4095-a384-2c87260c0128');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (195, 5, '2d824c0b-a09b-497b-ab1a-01bebea40b5a');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (196, 5, '1073fccb-1bb3-4b05-b4b7-c9eabba60893');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (197, 5, '0620f376-5af3-4612-b681-3497b9446883');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (198, 5, 'c64eb046-8d21-461a-817e-5dfd0447ed3b');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (199, 5, '330c9728-3553-4ff7-89ec-77855e892422');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (200, 5, '9424a8d2-73d0-4339-9934-69fabb990b82');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (201, 5, '20c7988d-5849-403e-b3e2-b21579518af2');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (202, 5, '4e94c6d2-c5a4-414a-9ca1-6aad45895a2f');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (203, 5, '3bb7f3f5-aa9e-4925-9760-7f86cd7f68d9');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (204, 5, '018e8088-6b66-4ece-933f-6a50a2ab59fa');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (205, 5, 'f8f7dff4-0262-419e-9e25-ee661e863a2a');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (206, 5, '4b103d28-75d1-465d-bc61-e13dd49a7c5f');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (207, 5, 'f870708b-2e9b-4260-86c7-eb4f86450961');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (208, 5, '7edb26da-2fb6-4d88-b6a4-477465eeee83');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (209, 5, '803612be-6c0d-465b-81e4-d69438546081');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (210, 5, '9937c649-9fee-47db-9304-53e5e8bbc421');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (211, 5, '38a4fb6f-4ddf-455a-9918-8cf06a85c60c');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (212, 5, 'e190f99e-a0e9-4f6d-9e11-ba863eedc50f');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (213, 5, '61be7c23-770d-4716-9a21-99977325db9e');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (214, 5, '37a3515f-7ca7-4b31-b162-260c7511f68b');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (215, 5, 'a3e8e12b-b327-46a6-b52f-566a84450f96');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (216, 5, '1fed2845-6082-46ca-ab87-e4357d12f3e8');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (217, 5, 'ae0fb594-d0c0-40f0-9e5a-61b96bf4e807');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (218, 5, '3f9b60ab-10d5-44a1-9917-2311c8a6747d');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (219, 5, '929ec1f4-804c-4543-83e1-7ae4ce063eb1');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (220, 5, '1bf5a740-4721-4563-985a-7df592ff1678');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (221, 5, '7845fa64-bdfb-406e-bc9a-8afaac8acd01');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (222, 5, 'a79b0188-a0c5-4bec-97a7-fd59f0aea359');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (223, 5, '5f878863-4858-44ea-8efb-bae09b4e17fd');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (224, 5, '66f79950-b224-46a7-9499-2ba6c19368f2');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (225, 5, 'fd459cca-9887-4a93-b05c-aececc8eafcf');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (226, 5, '39c780ff-cc20-4c1f-a039-c79e7717317f');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (227, 5, '1ea097c8-2bd9-4acc-ba6e-ca5a06cc2dce');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (228, 5, 'b3b1fff1-14d4-4734-864b-5cac4b456419');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (229, 5, '2b866674-700e-43dc-b8f8-414f18e3c5cb');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (230, 5, '4b8d1713-f6ad-4aa1-b6e1-45bb733ecf44');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (231, 5, '12694278-054f-4e8f-abf6-431b8d1156ee');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (232, 5, 'c8977a3e-63a6-41d2-a8b4-e0914d700ed4');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (233, 5, 'c34b5e49-8825-4b6e-8ad9-51ba7beda698');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (234, 5, '1abed838-c388-4f42-b649-a49393f2ff78');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (235, 5, '689e257a-aff6-4d12-bb26-476a192247ad');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (236, 5, '3a3b4928-3545-475b-9046-c01fb6aa32a0');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (237, 5, '881f82db-77a1-4241-a8ea-4da6ee1a08dc');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (238, 5, '66b19a20-3d60-44bb-89b5-4c60497d425d');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (239, 5, '3697f9dc-c6f3-403c-9b6b-44270bcdb64b');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (240, 5, 'bdcefc4e-b663-453f-82ba-14815a6125f6');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (241, 5, 'c80b5b08-6c3a-47e9-accc-20530c4e0b05');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (242, 5, '48a8d0f0-bf25-454e-9c48-09fa0b226f76');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (243, 5, 'a046251a-ff77-44da-abb3-58d5e1521f2b');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (244, 5, 'ad3b9048-d8bf-4031-b0dc-54753f5c1820');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (245, 5, 'ea7f38ed-062a-4f34-ba97-95a0fb03f89d');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (246, 5, '137f7e3b-58c4-46d4-b87c-e362131eb198');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (247, 5, '19049b1f-c808-4d52-9e14-c3d7e181f7b2');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (248, 5, 'b20a5b5e-dde8-4e2e-ba0e-3fc155de6117');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (249, 5, '2fb749d3-e799-42bd-ae79-d69bc119ea18');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (250, 5, 'e2fe3ced-e6fb-4268-9100-7d8e659bcd94');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (251, 5, 'd7abbc03-79ae-46b5-ac40-7ed06d0fff50');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (252, 5, 'c194f933-ad09-4e9e-b77a-c392eca674fe');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (253, 5, '0709f26a-be69-45f2-9a66-18f406fee7da');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (254, 5, 'b96b365f-886a-4f4a-b402-e169ad8e6244');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (255, 5, '2a120ccf-6a4c-4aa0-b15b-66ff836175d1');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (256, 5, '24bbf281-5aa9-4181-bb9a-f8de48fc83fc');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (257, 5, 'da6c076d-11b9-40aa-85ee-4745dc2e997e');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (258, 5, '264bcd33-df51-4b9e-b7fc-c93823e7659b');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (259, 5, '08a1cf51-c0af-4b85-963c-b4e5d6d60405');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (260, 5, '691091db-c358-41e5-958b-30935332b7c0');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (261, 5, 'b9fdcb6a-9634-4c9b-a843-ed2da128fa0a');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (262, 5, '17234039-7654-4bd5-a39b-338e1ce8728c');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (263, 5, '2c633013-445f-48bf-8c0c-a37ff29fa3ce');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (264, 5, '6140d865-6409-44dc-89db-595227da8330');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (265, 5, '1ade7789-1c20-4684-aa66-1989f32c654e');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (266, 5, '339ae48c-c55c-467c-a887-79dd204de805');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (267, 5, '02aad781-767d-4158-9a01-8f3a1c95028e');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (268, 5, '3b13518a-6559-43fb-91fe-982010979c2b');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (269, 5, 'e90d9934-a57b-425e-8f9d-9fe322d4d696');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (270, 5, '24358005-eb21-4dac-9cf6-07a22c311a7d');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (271, 5, '840ea636-f2b0-4309-95c0-6e561387aa60');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (272, 5, '822b521e-ce95-4d59-8913-2387956739c2');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (273, 5, '0548c001-8c98-486d-ad2a-9f9568f76988');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (274, 5, 'fbf93110-2a00-4234-8e29-d93551006cb4');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (275, 5, 'a28b1815-fc37-4bed-a4c4-900a66e6bcf4');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (276, 5, 'e53f6add-0784-4621-936b-8786e58759d9');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (277, 5, '21ad4876-264f-44ad-b0e2-6875dc103489');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (278, 5, 'cd044ba2-0c16-401b-9e5d-89fd18ef7bdb');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (279, 5, '7b3afc2d-4fb1-4950-bfff-87b35574e40c');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (280, 5, 'bcfc396a-375d-4ca8-a53f-419f7ce3c0a5');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (281, 5, '348911ba-c3db-4004-8209-1333a9efa75b');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (282, 5, '8b80fbd2-a349-4cbf-985a-6098408bf9d2');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (283, 5, 'cf9ad7e0-7fde-4401-9aea-d9790b3e71f5');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (284, 5, '094e26d4-d540-47b1-87fc-2e0dfadfb2e4');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (285, 5, '19a64334-1670-4f2a-a5dd-666f00fb4246');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (286, 5, '0904aecc-3313-4b96-ad51-89f8c0de3140');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (287, 5, '3597f092-4546-4575-921e-76425655e8b4');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (288, 5, 'a51d3dad-6613-4b47-b309-7da422a32fd5');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (289, 5, '93240fb0-2f8b-45df-9695-ea665147cf91');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (290, 5, 'f3eab562-6b2f-47fc-b9ac-691440d10353');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (291, 5, 'd21bfa6e-e75e-4737-b530-1ba281fa4605');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (292, 5, '066d4261-15ff-44a1-993c-ba758d4ffdf5');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (293, 5, '59c896f7-c887-4459-b227-45c2a89b8928');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (294, 5, '0a13df4f-e7c9-4308-bd68-e9af7b9f0170');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (295, 5, '08570211-f91d-4291-b087-999eb556b095');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (296, 5, '6b1c35a8-c4ee-4a46-8723-edcd1cdfa03a');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (297, 5, '6169a5ca-bd44-4520-9bc3-cc3c6d59d9be');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (299, 5, 'e34b0076-7f84-4ece-ac2a-37e77bb43a27');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (298, 5, '8704abe1-0212-4feb-b329-b69c1996a3df');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (300, 5, 'fd2934b5-120d-465c-a8f7-1ea219841949');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (301, 5, '44f5d9fa-1421-461e-9234-f73170f9d09a');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (302, 5, 'cef4f29b-8611-4e83-be9f-8116cbe013f7');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (303, 5, 'f2e159c5-7816-4baa-b6b3-9fefeefbec64');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (304, 5, '0c448eff-abce-475e-abf6-4289e505cdcb');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (306, 5, 'a2f9cc98-1be2-4804-a13b-52d99ca5a4d5');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (307, 5, '99c24a12-80f5-4cb2-a68f-c28596146b62');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (308, 5, '95ef70e1-243a-43a0-843e-21f5413b35bd');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (309, 5, '31a7c2bb-ba48-4e96-9522-ff9d9d8c5fe4');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (310, 5, '18620256-42c0-4a29-ae13-dca49ce77e4f');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (311, 5, '4da0b44c-9ba0-4208-b502-41fcb45b1592');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (312, 5, 'e00c6ae1-bd6d-447e-a8ae-13b63c97f727');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (313, 5, '4b583d82-3d8e-4f73-a0da-4dc7199f0378');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (314, 5, '10adac9a-6d4e-47af-88e5-7a8ea75bda8f');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (315, 5, 'd3ad25e9-863e-4b4f-a4d7-5174f0b7b8bb');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (316, 5, 'be5e7806-8caf-42ae-aa91-8816314435f8');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (317, 5, '868df7a1-433d-4605-add4-3d9ea6919c7a');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (318, 5, '5fd5da08-bee4-4113-b6a4-5d58132733e6');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (319, 5, '1a333316-b715-4115-b253-1a178b64b8b0');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (320, 5, '932b8be2-6f5d-4ad9-abd5-58a4d51c698d');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (321, 5, 'd31cbf8e-9d44-4dc2-b975-4229ee4541bd');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (322, 5, 'b87e9f17-d57c-4b73-a7e2-51070edaa4b5');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (323, 5, '615aafcf-9bde-47fe-ab65-84126441de05');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (324, 5, '592b97e5-a68d-44ff-8a50-eca19395dafd');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (305, 5, 'a8313b00-0ecb-4538-9812-f2d55d338ec9');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (325, 5, '0266c171-44aa-4d98-b8c5-c3c9c2c0976e');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (326, 5, 'b5120c6e-b1ba-4eea-9fd3-22a96ec9a5ed');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (327, 5, '39c72810-01c4-48f2-9322-d6f22fe92b40');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (328, 5, '83b16b51-55da-4b67-b824-ff56c4758285');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (329, 5, '8a959752-680f-44ac-a597-89f2f5204fa4');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (330, 5, 'f6ecff2a-db78-4719-a9fc-d0ad3b06aad3');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (331, 5, '783e760d-e8e3-45b6-95d0-6b30f65e8941');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (332, 5, '38820cf9-1ec8-4588-b7aa-ad76a9bf70ff');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (333, 5, 'dcb4e7ff-afc8-46f0-87d4-274b5ded16de');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (334, 5, '943516b2-b70a-4262-9b87-0e2b4dbaf289');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (335, 5, '1048107f-3c8c-435e-8f3e-c6e8aa0eefa3');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (336, 5, 'da38a831-5c41-4cba-b1a6-45e1547605ac');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (337, 5, '7651fb3d-023c-4829-9bea-e14be34354ca');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (338, 5, '329639e3-a135-41ce-992e-21ada3e4e5a9');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (339, 4, 'b9b2893c-31a3-42fc-95e9-5d040e8b35ea');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (340, 4, 'b33ce4c5-eb83-4992-b4ba-ab1b70d449b9');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (341, 4, 'c7de248e-2839-4c13-b9a1-a6061e6c2370');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (342, 4, 'ab7709c1-1c69-471b-af4c-0570bf3e50de');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (343, 4, '305a4b40-29a0-4aa9-8e21-3f2444475067');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (344, 4, 'd44b071d-c361-4e95-9c90-3d8ed2934ef5');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (345, 4, '764a2716-538e-4c3c-8aa1-f312fd5e876b');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (346, 4, '10a3589a-f7d5-4664-b52c-cc800709e31a');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (347, 4, '20666b55-c865-4d48-aabf-5e0b86027ad9');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (348, 4, 'b9b035f1-65be-455e-9edd-49a1391b9592');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (349, 4, '1a8d4b3f-a8cd-4f02-b105-4949135f93bb');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (350, 4, '8679ebe8-8ad2-4702-99dc-895490ccb1ac');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (351, 4, '6dfa7beb-6c9c-47d0-8df8-1fa733727604');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (352, 4, 'ee12a8df-cead-4989-ba5d-12e13038c804');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (353, 4, '87737678-9082-490f-9407-9f4ad8da0d5c');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (354, 4, '2fe94f1a-04f5-4179-972c-f11d45f1bce9');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (355, 4, 'f8e1b27e-4dc0-4fc3-8b33-b46357236297');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (356, 4, 'cc784e9c-5e76-4d84-b794-d3bc9b94aecd');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (357, 4, '13822061-1e3b-46b6-b5e3-5d528150ca86');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (358, 4, '07a9b637-4344-4b2f-a688-be74ddbebe7a');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (359, 4, '55f2e6ca-600f-42d7-85b7-7df4e809a086');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (360, 4, 'eff0e124-e12b-4408-a0fe-ff2de07f0926');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (361, 4, '2a5d662a-16cb-4a17-8a9c-16349725c1bf');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (362, 4, 'eb40f4fa-f36a-4097-a8f5-9b3d35e6472c');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (363, 4, '26807ba6-ee6a-4557-b862-653a52f320c4');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (364, 4, '2093b377-b554-4462-addd-4b8ec4772927');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (365, 4, 'fd55e2bd-cae7-4d9a-85e0-267ec7cb5029');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (366, 4, '5517eaa4-864a-4699-9afe-129df3678c39');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (367, 4, 'eedfe773-8c9a-466e-a8a6-130de6305323');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (368, 4, 'ce11a0a6-9ba5-4381-bd99-8e729ef1ef2e');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (369, 4, '9e850e8c-c3a1-4855-b712-38d7c490002c');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (370, 4, '23d6a10c-b81b-4fb2-9bdd-bea6eb343973');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (371, 4, '21755206-5306-4e49-8788-771450759840');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (372, 4, 'edfe79d5-22cc-4b13-9850-a8b27da1b0a7');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (373, 4, 'af8f4839-2a53-480e-b5c6-c9dc758f07da');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (374, 4, '893d851c-f6cc-456d-a44f-6f584f25c87a');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (375, 4, '1c0ead4f-8bf5-4549-a85d-f0fcae45b62e');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (376, 4, '684b3118-e337-4d96-8462-2267da9e9154');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (377, 4, '5cc344f7-5afc-48e1-80f4-df8c47d30e4e');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (378, 4, 'e8322d62-2a62-4040-9b29-15a8436a0433');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (379, 2, '85a26925-16fa-4e88-b062-bbedf7dd9ab3');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (380, 2, '0f08ad31-154c-41ac-aa89-fa8c5e66939d');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (381, 2, '8013004e-a02f-46cb-bae9-4091ed0b133a');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (382, 2, 'b69c1d03-72e6-446d-92a8-79db1a973962');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (383, 2, 'd94aaf02-76a0-4a26-9c9a-b5b586e07abe');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (384, 2, '68afc342-a35f-45e0-a757-54b776d00200');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (385, 17, '3c81cd1b-a71c-4163-a242-fd1094edb4e4');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (386, 17, 'cec4d83c-c365-4f60-82cd-b4c8d35d7524');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (387, 17, 'd828c633-421e-43f1-84cb-7730065eceb6');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (388, 17, '4284c6b7-5186-4703-a439-112309f72d0c');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (389, 17, 'a6b02007-f34b-43ad-92b9-caaad2164473');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (390, 17, '0e03e10a-bec3-45bf-a436-45bf391adecf');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (391, 17, 'ad4b6fca-35f0-4798-ad32-de9902b05b1d');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (392, 17, 'b7d2b66f-fc3b-46ab-8ebb-161b6eee302e');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (393, 17, '56414808-f81f-450e-a394-8efcb07d6a6a');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (394, 17, '3915c164-e8ac-488b-9b1f-2744becb7b98');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (395, 17, 'd07027ad-bef3-480a-81dc-058f9c3d82ca');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (396, 17, '11086999-ae2c-447f-8c48-3a4c6aff314e');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (397, 17, 'd11d3d23-db49-4e1d-92f4-350f5cfe9c05');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (398, 17, '3f726f5f-0c42-4032-8eb2-0a01d18ad536');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (399, 17, '8be6e315-3a29-47ff-a4ba-271d61893ec3');
INSERT INTO public.product_category (product_id, category_id, product_category_id) VALUES (400, 17, '87b0cb19-7772-4846-9197-f747107d460d');


--
-- TOC entry 3173 (class 0 OID 612057)
-- Dependencies: 233
-- Data for Name: review; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3160 (class 0 OID 611989)
-- Dependencies: 220
-- Data for Name: shipping; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.shipping (shipping_id, shipping_type, shipping_cost, shipping_region_id) VALUES (1, 'Next Day Delivery ($20)', 20.00, 2);
INSERT INTO public.shipping (shipping_id, shipping_type, shipping_cost, shipping_region_id) VALUES (2, '3-4 Days ($10)', 10.00, 2);
INSERT INTO public.shipping (shipping_id, shipping_type, shipping_cost, shipping_region_id) VALUES (3, '7 Days ($5)', 5.00, 2);
INSERT INTO public.shipping (shipping_id, shipping_type, shipping_cost, shipping_region_id) VALUES (4, 'By air (7 days, $25)', 25.00, 3);
INSERT INTO public.shipping (shipping_id, shipping_type, shipping_cost, shipping_region_id) VALUES (5, 'By sea (28 days, $10)', 10.00, 3);
INSERT INTO public.shipping (shipping_id, shipping_type, shipping_cost, shipping_region_id) VALUES (6, 'By air (10 days, $35)', 35.00, 4);
INSERT INTO public.shipping (shipping_id, shipping_type, shipping_cost, shipping_region_id) VALUES (7, 'By sea (28 days, $30)', 30.00, 4);


--
-- TOC entry 3158 (class 0 OID 611967)
-- Dependencies: 218
-- Data for Name: shipping_region; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.shipping_region (shipping_region_id, shipping_region) VALUES (1, 'Please Select');
INSERT INTO public.shipping_region (shipping_region_id, shipping_region) VALUES (2, 'US / Canada');
INSERT INTO public.shipping_region (shipping_region_id, shipping_region) VALUES (3, 'Europe');
INSERT INTO public.shipping_region (shipping_region_id, shipping_region) VALUES (4, 'Rest of World');


--
-- TOC entry 3177 (class 0 OID 612069)
-- Dependencies: 237
-- Data for Name: shopping_cart; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.shopping_cart (cart_id, product_id, quantity, buy_now, added_on, user_id) VALUES (2, 112, 1, true, '2020-02-07 06:45:54.018622', '002');
INSERT INTO public.shopping_cart (cart_id, product_id, quantity, buy_now, added_on, user_id) VALUES (18, 110, 1, false, NULL, 'john@gmail.com');
INSERT INTO public.shopping_cart (cart_id, product_id, quantity, buy_now, added_on, user_id) VALUES (19, 7, 1, false, NULL, 'john@gmail.com');
INSERT INTO public.shopping_cart (cart_id, product_id, quantity, buy_now, added_on, user_id) VALUES (20, 17, 1, false, NULL, 'john@gmail.com');
INSERT INTO public.shopping_cart (cart_id, product_id, quantity, buy_now, added_on, user_id) VALUES (21, 114, 1, false, NULL, 'john@gmail.com');


--
-- TOC entry 3179 (class 0 OID 612078)
-- Dependencies: 239
-- Data for Name: tax; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tax (tax_id, tax_type, tax_percentage) VALUES (1, 'Sales Tax at 8.5%', 8.50);
INSERT INTO public.tax (tax_id, tax_type, tax_percentage) VALUES (2, 'No Tax', 0.00);


--
-- TOC entry 3181 (class 0 OID 612198)
-- Dependencies: 241
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.users (id, username, password, roles, is_login, jam_login) VALUES ('1f8917c3-60cc-4800-87ca-f74e4db7a266', 'adminstok', '123456', 2, NULL, NULL);
INSERT INTO public.users (id, username, password, roles, is_login, jam_login) VALUES ('13d0f101-da62-407c-ab71-e8b22f13cba4', 'bos', '123456', 1, false, '2021-03-01 19:57:03.603');


--
-- TOC entry 3206 (class 0 OID 0)
-- Dependencies: 221
-- Name: audit_audit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.audit_audit_id_seq', 1, false);


--
-- TOC entry 3207 (class 0 OID 0)
-- Dependencies: 223
-- Name: category_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.category_category_id_seq', 8, true);


--
-- TOC entry 3208 (class 0 OID 0)
-- Dependencies: 242
-- Name: currency_currency_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.currency_currency_id_seq', 8, true);


--
-- TOC entry 3209 (class 0 OID 0)
-- Dependencies: 224
-- Name: customer_customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customer_customer_id_seq', 1, false);


--
-- TOC entry 3210 (class 0 OID 0)
-- Dependencies: 225
-- Name: department_department_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.department_department_id_seq', 4, false);


--
-- TOC entry 3211 (class 0 OID 0)
-- Dependencies: 229
-- Name: orders_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_order_id_seq', 1, false);


--
-- TOC entry 3212 (class 0 OID 0)
-- Dependencies: 232
-- Name: product_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_product_id_seq', 478, true);


--
-- TOC entry 3213 (class 0 OID 0)
-- Dependencies: 234
-- Name: review_review_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.review_review_id_seq', 1, false);


--
-- TOC entry 3214 (class 0 OID 0)
-- Dependencies: 235
-- Name: shipping_region_shipping_region_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shipping_region_shipping_region_id_seq', 5, false);


--
-- TOC entry 3215 (class 0 OID 0)
-- Dependencies: 236
-- Name: shipping_shipping_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shipping_shipping_id_seq', 8, false);


--
-- TOC entry 3216 (class 0 OID 0)
-- Dependencies: 238
-- Name: shopping_cart_cart_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shopping_cart_cart_id_seq', 21, true);


--
-- TOC entry 3217 (class 0 OID 0)
-- Dependencies: 240
-- Name: tax_tax_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tax_tax_id_seq', 3, false);


--
-- TOC entry 3021 (class 2606 OID 632283)
-- Name: currency currency_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.currency
    ADD CONSTRAINT currency_pkey PRIMARY KEY (currency_id);


--
-- TOC entry 2998 (class 2606 OID 612095)
-- Name: example_table example_table_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.example_table
    ADD CONSTRAINT example_table_pkey PRIMARY KEY (id);


--
-- TOC entry 2992 (class 2606 OID 612097)
-- Name: audit pk_audit_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.audit
    ADD CONSTRAINT pk_audit_id PRIMARY KEY (audit_id);


--
-- TOC entry 3011 (class 2606 OID 612099)
-- Name: shopping_cart pk_cart_id_product_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shopping_cart
    ADD CONSTRAINT pk_cart_id_product_id UNIQUE (cart_id, product_id);


--
-- TOC entry 2996 (class 2606 OID 612101)
-- Name: category pk_category_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT pk_category_id PRIMARY KEY (category_id);


--
-- TOC entry 2986 (class 2606 OID 612103)
-- Name: customer pk_customer_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT pk_customer_id PRIMARY KEY (customer_id);


--
-- TOC entry 2984 (class 2606 OID 612105)
-- Name: department pk_department_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.department
    ADD CONSTRAINT pk_department_id PRIMARY KEY (department_id);


--
-- TOC entry 3002 (class 2606 OID 612107)
-- Name: orders pk_order_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT pk_order_id PRIMARY KEY (order_id);


--
-- TOC entry 3000 (class 2606 OID 612109)
-- Name: order_detail pk_order_id_product_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_detail
    ADD CONSTRAINT pk_order_id_product_id PRIMARY KEY (order_id, product_id);


--
-- TOC entry 3005 (class 2606 OID 612111)
-- Name: product pk_product; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT pk_product PRIMARY KEY (product_id);


--
-- TOC entry 3007 (class 2606 OID 612113)
-- Name: product_category pk_product_id_category_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_category
    ADD CONSTRAINT pk_product_id_category_id PRIMARY KEY (product_id, category_id);


--
-- TOC entry 3009 (class 2606 OID 612115)
-- Name: review pk_review_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.review
    ADD CONSTRAINT pk_review_id PRIMARY KEY (review_id);


--
-- TOC entry 2994 (class 2606 OID 612117)
-- Name: shipping pk_shipping_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shipping
    ADD CONSTRAINT pk_shipping_id PRIMARY KEY (shipping_id);


--
-- TOC entry 2990 (class 2606 OID 612119)
-- Name: shipping_region pk_shipping_region_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shipping_region
    ADD CONSTRAINT pk_shipping_region_id PRIMARY KEY (shipping_region_id);


--
-- TOC entry 3015 (class 2606 OID 612121)
-- Name: tax pk_tax_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tax
    ADD CONSTRAINT pk_tax_id PRIMARY KEY (tax_id);


--
-- TOC entry 3013 (class 2606 OID 612123)
-- Name: shopping_cart shopping_cart_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shopping_cart
    ADD CONSTRAINT shopping_cart_pk PRIMARY KEY (cart_id);


--
-- TOC entry 2988 (class 2606 OID 612125)
-- Name: customer uk_email; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT uk_email UNIQUE (email);


--
-- TOC entry 3017 (class 2606 OID 612203)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 3019 (class 2606 OID 612207)
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- TOC entry 3003 (class 1259 OID 612126)
-- Name: idx_search_vector; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_search_vector ON public.product USING gist (search_vector);


--
-- TOC entry 3030 (class 2606 OID 612127)
-- Name: product_category fk_category_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_category
    ADD CONSTRAINT fk_category_id FOREIGN KEY (category_id) REFERENCES public.category(category_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 3027 (class 2606 OID 612132)
-- Name: orders fk_customer_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk_customer_id FOREIGN KEY (customer_id) REFERENCES public.customer(customer_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 3032 (class 2606 OID 612137)
-- Name: review fk_customer_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.review
    ADD CONSTRAINT fk_customer_id FOREIGN KEY (customer_id) REFERENCES public.customer(customer_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 3025 (class 2606 OID 612142)
-- Name: category fk_department_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT fk_department_id FOREIGN KEY (department_id) REFERENCES public.department(department_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 3026 (class 2606 OID 612147)
-- Name: order_detail fk_order_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_detail
    ADD CONSTRAINT fk_order_id FOREIGN KEY (order_id) REFERENCES public.orders(order_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 3023 (class 2606 OID 612152)
-- Name: audit fk_order_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.audit
    ADD CONSTRAINT fk_order_id FOREIGN KEY (order_id) REFERENCES public.orders(order_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 3031 (class 2606 OID 612157)
-- Name: product_category fk_product_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_category
    ADD CONSTRAINT fk_product_id FOREIGN KEY (product_id) REFERENCES public.product(product_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 3034 (class 2606 OID 612162)
-- Name: shopping_cart fk_product_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shopping_cart
    ADD CONSTRAINT fk_product_id FOREIGN KEY (product_id) REFERENCES public.product(product_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 3033 (class 2606 OID 612167)
-- Name: review fk_product_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.review
    ADD CONSTRAINT fk_product_id FOREIGN KEY (product_id) REFERENCES public.product(product_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 3028 (class 2606 OID 612172)
-- Name: orders fk_shipping_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk_shipping_id FOREIGN KEY (shipping_id) REFERENCES public.shipping(shipping_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 3024 (class 2606 OID 612177)
-- Name: shipping fk_shipping_region_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shipping
    ADD CONSTRAINT fk_shipping_region_id FOREIGN KEY (shipping_region_id) REFERENCES public.shipping_region(shipping_region_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 3022 (class 2606 OID 612182)
-- Name: customer fk_shipping_region_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT fk_shipping_region_id FOREIGN KEY (shipping_region_id) REFERENCES public.shipping_region(shipping_region_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 3029 (class 2606 OID 612187)
-- Name: orders fk_tax_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk_tax_id FOREIGN KEY (tax_id) REFERENCES public.tax(tax_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


-- Completed on 2022-01-17 15:57:46 WIB

--
-- PostgreSQL database dump complete
--

