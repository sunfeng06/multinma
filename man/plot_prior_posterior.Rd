% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/stan_nma-class.R
\name{plot_prior_posterior}
\alias{plot_prior_posterior}
\title{Plot prior vs posterior distribution}
\usage{
plot_prior_posterior(
  x,
  ...,
  prior = NULL,
  post_args = list(),
  prior_args = list(),
  overlay = c("prior", "posterior"),
  ref_line = NA_real_
)
}
\arguments{
\item{x}{A \code{stan_nma} object}

\item{...}{Additional arguments passed on to methods}

\item{prior}{Character vector selecting the prior and posterior
distribution(s) to plot. May include \code{"intercept"}, \code{"trt"}, \code{"het"},
\code{"reg"}, or \code{"aux"}, as appropriate.}

\item{post_args}{List of arguments passed on to \link[ggplot2:geom_histogram]{ggplot2::geom_histogram} to
control plot output for the posterior distribution}

\item{prior_args}{List of arguments passed on to \link[ggplot2:geom_path]{ggplot2::geom_path} to
control plot output for the prior distribution. Additionally, \code{n} controls
the number of points the density curve is evaluated at (default \code{500}), and
\code{p_limits} controls the endpoints of the curve as quantiles (default
\code{c(.001, .999)}).}

\item{overlay}{String, should prior or posterior be shown on top? Default
\code{"prior"}.}

\item{ref_line}{Numeric vector of positions for reference lines, by default
no reference lines are drawn}
}
\value{
A \code{ggplot} object.
}
\description{
Produce plots comparing the prior and posterior distributions of model
parameters.
}
\details{
Prior distributions are displayed as lines, posterior distributions
are displayed as histograms.
}
\examples{
## Smoking cessation NMA
# Set up network of smoking cessation data
head(smoking)

smk_net <- set_agd_arm(smoking,
                       study = studyn,
                       trt = trtc,
                       r = r,
                       n = n,
                       trt_ref = "No intervention")

# Print details
smk_net

\donttest{
# Fitting a random effects model
smk_fit_RE <- nma(smk_net,
                  trt_effects = "random",
                  prior_intercept = normal(scale = 100),
                  prior_trt = normal(scale = 100),
                  prior_het = normal(scale = 5))

smk_fit_RE
}

\donttest{
# Plot prior vs. posterior, by default all parameters are plotted
plot_prior_posterior(smk_fit_RE)

# Plot prior vs. posterior for heterogeneity SD only
plot_prior_posterior(smk_fit_RE, prior = "het")

# Customise plot
plot_prior_posterior(smk_fit_RE, prior = "het",
                     prior_args = list(colour = "darkred", size = 2),
                     post_args = list(alpha = 0.6))
}

}
