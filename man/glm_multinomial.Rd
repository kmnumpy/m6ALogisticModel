% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/glm_multinomial.R
\name{glm_multinomial}
\alias{glm_multinomial}
\title{Build and visualize a logistic model to analyze the multinomial response varirable.}
\usage{
glm_multinomial(Y, PREDICTORS, HDER = "multinomial",
  MODE = c("against background", "against pivot"), CUT_OFF = 5)
}
\arguments{
\item{Y}{A \code{vector} that defines the observed multinomial response variable.}

\item{PREDICTORS}{A \code{data.frame} that defines the model design, which will include the predictors / features in the collumns.}

\item{HDER}{The subtitle and the file name of the plot.}

\item{MODE}{Define the 0 outcomes of each logistic model, should be one of "against background","against pivot",
default is "against background".}

\item{CUT_OFF}{The cut off of the occurence of the less abundence class in binary features, if the less frequent class is less than this threshold, the feature will be dropped, default is 5. This is important when we want to have a reliable asymptotics result in Wald test.}
}
\description{
\code{glm_multinomial} is a function used to build a multinomial logistic model on a given categorical Y.
}
\details{
By default, K independent logistic models will be fit against the outcomes in Y that is not in the Kth outcome. In the mode of "against pivot", the reference level in the provided Y will be treated as the pivot / reference class.

About deviance in GLM (from stackexchange):

Let LL = loglikelihood
Here is a quick summary of what you see from the summary(glm.fit) output,
Null Deviance = 2(LL(Saturated Model) - LL(Null Model)) on df = df_Sat - df_Null
Residual Deviance = 2(LL(Saturated Model) - LL(Proposed Model)) df = df_Sat - df_Proposed
The Saturated Model is a model that assumes each data point has its own parameters (which means you have n parameters to estimate.)
The Null Model assumes the exact "opposite", in that is assumes one parameter for all of the data points, which means you only estimate 1 parameter.
The Proposed Model assumes you can explain your data points with p parameters + an intercept term, so you have p+1 parameters.
If your Null Deviance is really small, it means that the Null Model explains the data pretty well. Likewise with your Residual Deviance.
What does really small mean? If your model is "good" then your Deviance is approx Chi^2 with (df_sat - df_model) degrees of freedom.
If you want to compare you Null model with your Proposed model, then you can look at
(Null Deviance - Residual Deviance) approx Chi^2 with df Proposed - df Null = (n-(p+1))-(n-1)=p
Are the results you gave directly from R? They seem a little bit odd, because generally you should see that the degrees of freedom reported on the Null are always higher than the degrees of freedom reported on the Residual. That is because again, Null Deviance df = Saturated df - Null df = n-1 Residual Deviance df = Saturated df - Proposed df = n-(p+1)

About multinomial logistic regression:

Please check the \href{https://en.wikipedia.org/wiki/Multinomial_logistic_regression#As_a_set_of_independent_binary_regressions}{wikipedia page}

Notice that I cannot sum the chisq statistics in background reference scenario, because the K models are dependent (not independent as in the pivot case).
}
