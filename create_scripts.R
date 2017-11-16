library(httr)
library(jsonlite)
library(purrr)
library(tibble)
library(readr)

ua <- user_agent("http://github.com/hadley/httr")

p1 <- "https://api.github.com/orgs/DINA-Web/repos"
p2 <- paste0(p1, "?page=2")
p3 <- paste0(p2, "?page=3")

parse_url <- function(url) 
  fromJSON(content(GET(url), "text"), simplifyVector = FALSE)

parsed <- c(parse_url(p1), parse_url(p2), parse_url(p3))

repo_df <- function(x) {
  tibble(
    name = x$name, 
    url = x$clone_url
  )
}

repos <- map_df(parsed, repo_df)

clone_cmds <- c("#!/bin/bash", 
  paste0("git clone --depth=1 ", repos$url)
)

dest_file <- "~/repos/dina-web/bob-docker/clone.sh"

write_lines(clone_cmds, path = dest_file)
Sys.chmod(dest_file, mode = "0744")


