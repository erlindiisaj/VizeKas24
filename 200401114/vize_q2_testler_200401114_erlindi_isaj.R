library(testthat)
rm(list = ls())
source("./vize_q2_200401114_erlindi_isaj.R")

test_that("Global Workspace’de spotify_search_artist adlı bir değişken olmalı.", {
  expect_true(exists("spotify_search_artist"))
})


test_that("spotify_search_artist adlı değişkenin tipi “function” olmalı.", {
  expect_true(is.function(spotify_search_artist))
})


test_that("spotify_search_artist() herhangi bir artist ismi ile çağrıldığında döndürdüğü çıktı bir liste olmalı.", {
  res <- spotify_search_artist("The Doors")
  expect_true(typeof(res) == "list")
})


test_that("spotify_search_artist() çağrıldığında döndürdüğü listenin iki elementi olmalı", {
  res <- spotify_search_artist("The Doors")
  expect_true(length(res) == 2)
})


test_that("spotify_search_artist() çağrıldığında döndürdüğü listenin ilk elementinin ismi status_code olmalı", {
  res <- spotify_search_artist("The Doors")
  expect_true(names(res)[1] == "status_code")
})


test_that("spotify_search_artist() çağrıldığında döndürdüğü listenin ilk elementinin class’ı numeric olmalı", {
  res <- spotify_search_artist("The Doors")
  expect_true(is.numeric(res[[1]]))
})



test_that("spotify_search_artist() çağrıldığında döndürdüğü listenin status_code adlı elementinin değeri 200’e eşit olmalı", {
  res <- spotify_search_artist("The Doors")
  expect_true(res[[1]] == 200)
})


test_that("spotify_search_artist() çağrıldığında döndürdüğü listenin ikinci elementinin ismi search_results olmalı", {
  res <- spotify_search_artist("The Doors")
  expect_true(names(res)[2] == "search_results")
})


test_that("spotify_search_artist() çağrıldığında döndürdüğü listenin ikinci elementinin class’ı data.frame olmalı", {
  res <- spotify_search_artist("The Doors")
  expect_true(is.data.frame(res[[2]]))
})


test_that("spotify_search_artist() çağrıldığında döndürdüğü listenin ikinci elementinin iki sütun barındırmalı", {
  res <- spotify_search_artist("The Doors")
  expect_true(ncol(res[[2]]) == 2)
})


test_that("spotify_search_artist() çağrıldığında döndürdüğü listenin ikinci elementinin sütun isimleri c(“artist”, “id”) olmalı", {
  res <- spotify_search_artist("The Doors")
  expect_identical(names(res[[2]]) == c("artist", "id"), c(T,T))
})


test_that("spotify_search_artist(\"The Doors\") çağrıldığında döndürdüğü listenin ikinci elementinin birinci satırının \"id\" adlı sütunu \"22WZ7M8sxp5THdruNY3gXt\" olmalı", {
  res <- spotify_search_artist("The Doors")
  expect_true(res$search_results$id[1] == "22WZ7M8sxp5THdruNY3gXt")
})



