\name{get.aligned.function.data}
\alias{get.aligned.function.data}
\title{
Estimate aligned data for function-valued traits
}
\description{
Estiamtes function data for tip species curves from tip coefficients.
}
\usage{
get.aligned.function.data(tip.coefficients, ylength, ymin = 0.01, ymax = 0.99)
}
\arguments{
  \item{tip.coefficients}{
Matrix of estimated regression coefficients of tip curves. Row names should correspond to species names. The first column should contain the logit glm intercept; the second column contains the logit glm slope.
}
  \item{ylength}{
How many landmarks (points on the curve) to evaluate.
}
  \item{ymin}{
Because 0 and 1 are undefined for inverse logit functions, the minimum and maximum values are defaulted to .01 and .99. Can be adjusted as needed.
}
  \item{ymax}{
Because 0 and 1 are undefined for inverse logit functions, the minimum and maximum values are defaulted to .01 and .99. Can be adjusted as needed.
}
}
\value{
A data frame of aligned X-coordinates for function-valued traits for a given constant Y.
}
\references{
Goolsby, E.W. 2015. "Phylogenetic comparative methods for evaluating the evolutionary history of function-valued traits." Systematic Biology. In press.
}
\author{
Eric W. Goolsby
}
\examples{
# simulate evolution of a function-valued trait (glm with logit link)
sim_data <- sim.curves()

# get tip coefficients and aligned function data
tip.coefficients <- get.tip.coefficients(formula = y~x,tree = sim_data$tree,data = sim_data$data)
data <- get.aligned.function.data(tip.coefficients)

# estimate evolutionary rates
evo.model.fitted <- evo.model(sim_data$tree,data)
}
