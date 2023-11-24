
library(testthat)
rm(list = ls())
source("./vize_q1_200401114_erlindi_isaj.R")


test_that("Global Workspace’de spotify_token adlı bir değişken var.", {
  expect_true(exists("spotify_token"))
})


test_that("spotify_token adlı değişkenin tipi “function” olmalı.", {
  expect_true(is.function(spotify_token))
})

test_that("spotify_token() çağrıldığında döndürdüğü çıktı bir liste olmalı", {
  expect_true(typeof(spotify_token()) == "list")
})


test_that("spotify_token() çağrıldığında döndürdüğü listenin iki elementi olmalı.", {
  expect_true(length(spotify_token()) == 2)
})


test_that("listenin ilk elementinin ismi status_code olmalı", {
  expect_true(names(spotify_token()[1]) == "status_code")
})


test_that("döndürdüğü listenin ilk elementinin class’ı numeric olmalı", {
  expect_true(is.numeric(spotify_token()[[1]]))
})


test_that("döndürdüğü listenin status_code adlı elementinin değeri 200’e eşit olmalı", {
  expect_true(spotify_token()[[1]] == 200)
})




test_that("listenin ikinci elementinin ismi token olmalı", {
  expect_true(names(spotify_token()[2]) == "token")
})

test_that("döndürdüğü listenin ilk elementinin class’ı numeric olmalı", {
  expect_true(is.character(spotify_token()[[2]]))
})

test_that("döndürdüğü listenin ikinci elementi ’Bearer ’ ile başlamalı", {
  expect_true(grepl("^Bearer ",spotify_token()[[2]]))
})


test_that("döndürdüğü listenin ikinci elementi ’Bearer ’ ile başlamalı", {
  expect_true(nchar(spotify_token()[[2]]) == 122)
})



