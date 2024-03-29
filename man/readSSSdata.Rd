% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/read-sss-metadata.R
\name{readSSSdata}
\alias{readSSSdata}
\title{Reads a triple-s XML (asc) data file, as specified by the triple-s XML standard.}
\usage{
readSSSdata(x, ascFilename)
}
\arguments{
\item{x}{Name of .asc file containing the survey metadata}

\item{ascFilename}{No longer used. Use \code{x} instead.}
}
\description{
This function reads an `.asc`` data file.
}
\examples{
sampleRoot <- system.file("sampledata", package = "sss")
filenameSSS <- file.path(sampleRoot, "sample-1.sss")
filenameASC <- file.path(sampleRoot, "sample-1.asc")

readSSSdata(filenameSSS)
readSSSmetadata(filenameSSS)
}
\seealso{
\code{\link[=read.sss]{read.sss()}}, \code{\link[=readSSSmetadata]{readSSSmetadata()}}

Other read functions: 
\code{\link{read.sss}()},
\code{\link{readSSSmetadata}()}
}
\concept{read functions}
