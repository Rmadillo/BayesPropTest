#' @title Bayesian Test of the Difference Between Proportions
#' @description This function provides a simple way to perform a Bayesian 
#' version of \code{prop.test} using the beta distribution. 
#' 
#' The default prior distributional parameters are \emph{a} = 1 and \emph{b} = 1. 
#' The prior can be adjusted if you have reasonable information to work with.
#' If you set \emph{a} < \emph{b}, the density will be weighted toward the lower
#' half of the distribution, and setting \emph{a} > \emph{b} would weight it 
#' toward the upper half. If \emph{a} = 0.5, much more weight is given to values
#' near 0, while if \emph{b} = 0.5, weight is stacked up near 1. Examples of 
#' different shapes of the beta distribution based on different parameter values
#' can be seen at Rocscience: \url{http://bit.ly/1hOWChG}. 
#' 
#' @usage bayes.prop.test(n1, d1, n2, d2, a=1, b=1, rep=10000)
#' @param n1 The numerator of the first group. Required.
#' @param d1 The denominator of the first group. Required. The 
#' proportion \emph{n1/d1} should be greater than or equal to \emph{n2/d2}.
#' @param n2 The numerator of the second group. Required.
#' @param d2 The denominator of the second group. Required. The 
#' proportion \emph{n2/d2} should be less than or equal to \emph{n1/d1}.
#' @param a Alpha prior parameter. Defaults to 1.
#' @param b Beta prior parameter. Defaults to 1. 
#' @param rep Number of replications for the \code{rbeta} function. Defaults to 10,000.
#' @keywords Bayesian beta proportions differences prop.test
#' @export
#' @examples bayes.prop.test(n1=50, d1=100, n2=20, d2=50)
#' # difference       p-hat        2.5%       97.5% prob.diff>0 
#' # 0.10000000  0.09695006 -0.07072376  0.25873452  0.87380000 

bayes.prop.test <- function (n1, d1, n2, d2, a=1, b=1, rep=10000) {
    # determine if first proportion is largest or not
    if ((n1/d1)-(n2/d2) < 0) {
        print("Please use the largest proportion to set n1 and d1")
    } else {
    # main function
        pdiff = (n1/d1)-(n2/d2)
        names(pdiff) = "difference"
    # using default uninformative prior: beta(1,1)
        P1 = rbeta(rep,n1+a,d1-n1+b) 
        P2 = rbeta(rep,n2+a,d2-n2+b)
        D = P1-P2
    # graph results
        hist(D,main="Posterior distribution of difference between proportions",
            xlab="Difference")
        abline(v=0, lwd=2, col="red") # no difference
    # obtain and print results
        phat = mean(D)
            names(phat) = "p-hat"
        q95 = quantile(D,c(0.025,0.975)) # 95% credible interval
        pgt0 = sum(D>0)/rep # prob that difference is > 0
            names(pgt0) = "prob.diff>0"
  return(c(pdiff, phat, q95, pgt0))
  }
}