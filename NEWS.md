# sss 0.2.2

* Minor fix in documentation to comply with new CRAN tests

# sss 0.2.1

* Re-document to fix HTML5 problems
* Added a `NEWS.md` file to track changes to the package.

# sss 0.2.0

This release contains very minor changes to comply with CRAN policies.

* Don't use `LazyData`, since the package doesn't contain data


Other changes

* The function `read.sss()` has a new argument `verbose = FALSE` that suppresses any messages.  If you want the messages, set `verbose = TRUE`


# sss 0.1.2


* This release fixes two issues that might introduce unintended consequences:
  - dealing with embedded <text> tags (#9)
  - dealing with self-closing tags (#10)
* Tests conform to `testthat_3.0.0`


# sss 0.1.1

* Mostly small cosmetic changes to keep the package up to date.
* `read.sss()` will now also guess `*.dat` files for the data, in addition to `*.csv` and `*.asc`


# sss 0.1-0

* You can now specify only the .sss file in `read.sss()`, and the function 
  will guess the name of the .asc
* Added `label.table` attribute
* Internal changes:
  - Imports `xml2` instead of `XML`
  - Better error checking using `assert_that()`


# sss 0.0-13

* Added support to read csv files
* Now supports multi-byte files (UTF-8)
* Expanded unit tests with real-world data

# sss 0.0-11

* No functional changes
* Added `.Rbuildignore` to comply with CRAN requirements for R-3.1.0


# sss 0.0-09

* Minor changes to remove redundant files and folders
* Now uses `packageStartupMessage()` rather than `message()` to display startup 
  message


# sss 0.0-08

* First experimental release to CRAN

Improvements:

* Performance gains as a result of using `plyr::quickdf()` rather than 
  `as.data.frame()`
* Imports `plyr` and `XML` rather than declaring dependency

# sss 0.0-07

Improvements:

* Substantial gains in speed by rewriting `fast.read.fwf()` and 
  `changeValues()` to use `lapply()` rather than loops.
* Documentation updates 

# sss 0.0-05

Fixed issues:

* Fixed issues with converting logical values to TRUE/FALSE
* Convert values where appropriate
* Add `variable.lable` attribute containing question text

# sss 0.0-04

* Refactored all function names to use "camelCase"
* Implemented `read.fast.fwf()` to read fixed width file 