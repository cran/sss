# Test sss integration
# 
# Author: Andrie
#------------------------------------------------------------------------------

if(interactive()) library(testthat)
  


if(interactive()) library(testthat)
sampleRoot <- system.file("sampledata", package = "sss")
filenameSSS <- file.path(sampleRoot, "sample-1.sss")
filenameASC <- file.path(sampleRoot, "sample-1.asc")


expectedNames <- c("Q1", "Q2_1", "Q2_2", "Q2_3", "Q2_4", "Q2_5", "Q2_6", 
                   "Q2_7", "Q2_8", "Q2_9", "Q3", "Q4_1", "Q4_2", "Q5", "Q6", 
                   "Q7", "Q99")
expectedNames2 <- c("Q1", "Q2.1", "Q2.2", "Q2.3", "Q2.4", "Q2.5", "Q2.6", 
                    "Q2.7", "Q2.8", "Q2.9", "Q3", "Q4.1", "Q4.2", "Q5", "Q6",
                    "Q7", "Q99")


test_that("parsing of .sss and .asc works", {
  test <- read.sss(filenameSSS, filenameASC)
  
  rest <- structure(list(
    Q1 = c(
      "Visited before within the year", 
      "Visited before that", 
      "Visited before within the year"), 
    Q2_1 = c(1L, 0L, 1L), 
    Q2_2 = c(0L, 1L, 0L), 
    Q2_3 = c(1L, 0L, 0L), 
    Q2_4 = c(0L, 0L, 1L), 
    Q2_5 = c(0L, 0L, 0L), 
    Q2_6 = c(0L, 0L, 0L), 
    Q2_7 = c(0L, 0L, 0L), 
    Q2_8 = c(0L, 0L, 0L), 
    Q2_9 = c(1L, 0L, 1L), 
    Q3 = c("Amusement Park                ", 
           "                              ", 
           "\"Marco's\" Restaurant          "
    ), 
    Q4_1 = c(
      "Sherwood Forest",
      "Nottingham Castle",
      "Other"), 
    Q4_2 = c(
      "Other",
      NA,
      "\"Maid Marion\" Cafe"), 
    Q5 = c(12L, 999L, 58L), 
    Q6 = c(TRUE, TRUE, FALSE), 
    Q7 = c(
      "Within 3 months",
      "More than 1 years time",
      NA), 
    Q99 = c(1.4, 0.9, 0.7)), 
    row.names = c(NA, -3L), 
    .Names = c("Q1", "Q2_1", "Q2_2", "Q2_3", "Q2_4", "Q2_5", "Q2_6", "Q2_7", 
               "Q2_8", "Q2_9", "Q3", "Q4_1", "Q4_2", "Q5", "Q6", "Q7", "Q99"), 
    class = "data.frame", 
    variable.labels = c("Number of visits", 
                        rep("Attractions visited", 9), 
                        "Other attractions visited", 
                        "Two favourite attractions visited", 
                        "Two favourite attractions visited", 
                        "Miles travelled", "Would come again", 
                        "When is that most likely to be", "Case weight"),
    label.table = (list(
      `1` = setNames(c("1","2", "3"), 
                     c("First visit", "Visited before within the year", 
                       "Visited before that")), 
      `2` = setNames(c("1", "2", "3", "4", "5", "9"), 
                     c("Sherwood Forest", "Nottingham Castle", 
                       "\"Friar Tuck\" Restaurant", "\"Maid Marion\" Cafe", 
                       "Mining museum", "Other")), 
      `3` = setNames(NA_character_, NA_character_), 
      `4` = setNames(c("1", "2", "3", "4", "5", "9"), 
                     c("Sherwood Forest", "Nottingham Castle", 
                       "\"Friar Tuck\" Restaurant", "\"Maid Marion\" Cafe", 
                       "Mining museum", "Other")), 
      `5` = setNames(c("500", "999"), 
                     c("500 or more", "Not stated")), 
      `6` = setNames(NA_character_, NA_character_), 
      `7` = setNames(c("1", "2", "3"), 
                     c("Within 3 months", "Between 3 months and 1 year", 
                       "More than 1 years time")), 
      `99` = setNames(NA_character_, NA_character_))
  ))
  
  expect_s3_class(test,  "data.frame")
  expect_equal(nrow(test), 3)
  expect_equal(ncol(test), 17)
  expect_equal(names(test), expectedNames)
  expect_equal(test, rest)
})

test_that("question text is assigned to variable.labels attribute", {
  test <- read.sss(filenameSSS, filenameASC)
  expectedLabels <- c(
    "Number of visits",
    "Attractions visited",
    "Attractions visited",
    "Attractions visited",
    "Attractions visited",
    "Attractions visited",
    "Attractions visited",
    "Attractions visited",
    "Attractions visited",
    "Attractions visited",
    "Other attractions visited",
    "Two favourite attractions visited",
    "Two favourite attractions visited",
    "Miles travelled",
    "Would come again",
    "When is that most likely to be",
    "Case weight"
  )
  expect_equal(attr(test, "variable.labels"), expectedLabels)
})

test_that("separator parameter works", {
  d <- read.sss(filenameSSS, filenameASC, sep=".")
  
  expect_equal(names(d), expectedNames2)
})
