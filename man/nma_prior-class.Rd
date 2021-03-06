% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/nma_prior-class.R
\name{nma_prior-class}
\alias{nma_prior-class}
\alias{nma_prior}
\title{The nma_prior class}
\description{
The \code{nma_prior} class is used to specify prior distributions.
}
\details{
Objects of class \code{nma_prior} have the following components:
\describe{
\item{\code{dist}}{Distribution name}
\item{\code{fun}}{Name of constructor function, as string (e.g. \code{"normal"})}
\item{\code{...}}{Parameters of the distribution}
}

The distribution parameters, specified as named components in \code{...}, match
those in the constructor functions (see \link{priors}).
}
