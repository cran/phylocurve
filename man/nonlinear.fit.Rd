\name{nonlinear.fit}
\alias{nonlinear.fit}
\title{
Fit nonlinear curves to species data
}
\description{
Transforms raw data into regression curves using the \code{drm} function in the \code{drc} package. The response data can be constrained between minima and maxima (for example, the default sets any negative predicted y value to 0).
}
\usage{
nonlinear.fit(data, x_variable, y_variable, fct = LL2.3(),
  min_x = -Inf, max_x = Inf, min_y = 0, max_y = Inf, eval_length = 30, ...)
}
\arguments{
  \item{data}{
Data frame with function-valued species data along with a column named "species"
}
  \item{x_variable}{
The name of the column in \code{data} corresponding to the predictor (x) variable
}
  \item{y_variable}{
The name of the column in \code{data} corresponding to the response (y) variable
}
  \item{fct}{
Function type to pass to \code{drm}. Use \link{getMeanFunctions} for a full list.
}
  \item{min_x}{
Lower range to remove from raw x data
}
  \item{max_x}{
Upper range to remove from raw x data
}
  \item{min_y}{
Lower range to remove from predicted response (for example, for response data in which only positive values are allowed, the min_y can be set to 0 (the default)).
}
  \item{max_y}{
Upper range to remove from predicted response.
}
  \item{eval_length}{
How many points to evaluate along the range of x.
}
  \item{\dots}{
Optional further arguments to pass to the \link{drm} function.
}
}
\value{
\item{X }{X (formatted for phylocurve.generalized)}
\item{Y }{Y (formatted for phylocurve.generalized)}
}
\examples{
x_length <- 50
nspecies <- 25
sim_data <- sim.curves(nspecies = nspecies,x_length = x_length)

# Fit nonlinear curves to raw data
curve_data <- nonlinear.fit(data = sim_data$data,x_variable = "x",y_variable = "y",min_y = 0)

# Align curve data using dynamic time warping
# NOT RUN (takes several minutes)
# P <- phylocurve.generalized(tree = sim_data$tree,X = curve_data$X,Y = curve_data$Y)
}