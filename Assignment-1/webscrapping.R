#importing libraries
library(robotstxt)
library(rvest)

#scraping a website
url = "https://www.imdb.com/search/title/?groups=top_250&sort=user_rating"

#allowability
path = paths_allowed(url)

#read_html
my_html = read_html(url)
View(my_html)

#Movie Name
Name = my_html %>% html_nodes(".lister-item-header a") %>% html_text()
View(Name)

#Movie year
year = my_html %>% html_nodes(".text-muted.unbold") %>% html_text()
View(year)

#movie ratings
Ratings = my_html %>% html_nodes(".ratings-imdb-rating") %>% html_text()
View(Ratings)

#data frame
df = data.frame(Name,year,Ratings)
View(df)

#saving 
write.csv(df,"IMDB.csv")
