% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plotef.R
\name{plotef}
\alias{plotef}
\title{Plot the efficient frontier line}
\usage{
plotef(mptres)
}
\arguments{
\item{mptres}{a list from \code{staticmpt} function}
}
\value{
A plot of the efficient frontier
}
\description{
Plotting the efficient frontier line from Markowitz (static) portfolio analysis
}
\details{
This function provides the efficient frontier (blue line) using the result from \code{staticmpt} function. An array of inefficient weights are presented with red line. The observed returns and standard deviations are black dots.
}
\examples{
## No change likely scenario of CCI in Figure 2, Ando and Mallory (2012)
rs <- c(0.265,0.671,0.372)
vmat <- matrix(c(0.003,0.005,-0.006,0.005,0.013,-0.010,-0.006,-0.010,0.012),ncol=3)
mus <- seq(min(rs),max(rs),length.out=100)
cci <- staticmpt(mus,rs,vmat)
plotef(cci)
}
\references{
Ando, A. W. and M. L. Mallory. (2012) Optimal Portfolio Design to Reduce Climate-related Conservation Uncertainty in the Prairie Pothole Region. Proceedings of the National Academy of Sciences (PNAS). 109 (17) pp. 6484-6489.
}
\seealso{
\code{\link{staticmpt}}
}
