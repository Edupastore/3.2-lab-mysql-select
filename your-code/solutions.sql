CHALLENGE 1

SELECT authors.au_fname, authors.au_lname, authors.au_id, titles.title, publishers.pub_name
	FROM authors
		LEFT JOIN titleauthor
			ON titleauthor.au_id = authors.au_id
		LEFT JOIN titles
			ON titleauthor.title_id = titles.title_id
		LEFT JOIN publishers
			ON publishers.pub_id = titles.pub_id
		WHERE title IS NOT NULL;

CHALLENGE 2

SELECT authors.au_fname, authors.au_lname, authors.au_id, publishers.pub_name,
count(titles.title) as 'TITLE COUNT'
	FROM authors
		LEFT JOIN titleauthor
			ON titleauthor.au_id = authors.au_id
		LEFT JOIN titles
			ON titleauthor.title_id = titles.title_id
		LEFT JOIN publishers
			ON publishers.pub_id = titles.pub_id
    GROUP BY publishers.pub_name, authors.au_id
    ORDER BY `TITLE COUNT` DESC

CHALLENGE 3

SELECT authors.au_fname, authors.au_lname, authors.au_id,
sum(sales.qty) as 'TOTAL'
	FROM authors
		LEFT JOIN titleauthor
			ON titleauthor.au_id = authors.au_id
		LEFT JOIN titles
			ON titleauthor.title_id = titles.title_id
		LEFT JOIN sales
			ON sales.title_id = titles.title_id
    GROUP BY authors.au_id, authors.au_lname, authors.au_fname
    ORDER BY `TOTAL` DESC
    LIMIT 3

CHALLENGE 4

SELECT authors.au_fname, authors.au_lname, authors.au_id,
COALESCE(sum(sales.qty), 0) as 'TOTAL'
	FROM authors
		LEFT JOIN titleauthor
			ON titleauthor.au_id = authors.au_id
		LEFT JOIN titles
			ON titleauthor.title_id = titles.title_id
		LEFT JOIN sales
			ON sales.title_id = titles.title_id
    GROUP BY authors.au_id, authors.au_lname, authors.au_fname
    ORDER BY `TOTAL` DESC

    