library(testthat)
rm(list = ls())
source("vize_q3_200401114_erlindi_isaj.R")


test_that("Global Workspace’de my_artists adlı bir değişken olmalı", {
  expect_true(exists("my_artists"))
})


test_that("my_artists adlı değişkenin class’ı “data.frame” olmalı", {
  expect_true(is.data.frame(my_artists))
})


test_that("my_artists adlı değişken 2 sütun bulundurmalı", {
  expect_true(ncol(my_artists) == 2)
})

test_that("my_artists adlı değişken sütun isimleri c(“artist”, “id”) olmalı", {
  expect_identical(names(my_artists) == c("artist", "id"),c(T,T))
})