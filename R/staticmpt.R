#' Static Portfolio Optimization
#'
#' @description The function generates portfolio weights for nature or conservation
#' @param mus An array of the expected values
#' @param rbar An array of the observed mean returns
#' @param vmat A variance and covariance matrix
#' @details This function solves the series of the standard Markowitz portfolio analysis for nature or conservation, i.e., the quadratic problem without shorting.\cr
#' \cr
#' min w' vmat w \cr
#' s.t. w rbar = mu \cr
#' w' 1 = 1 where w >= 0 \cr
#' \cr
#' where \code{w} is an array of non-negative portfolio weights, \code{rbar} is an array of the observed mean returns, \code{vmat} a matrix of variance-covariance matrix, and \code{mu} is an expected value.
#' @return A list including the following component: \cr
#' \cr
#' \code{rbar} An array of the observed mean returns \cr
#' \cr
#' \code{vmat} A variance and covariance matrix \cr
#' \cr
#' \code{efdata} A data.frame including: \cr
#' - \code{sd} standard deviation \cr
#' - \code{er} expected return in mus \cr
#' - \code{conv} convergence status in optimization (0 = successful, otherwise: not an interior solution) \cr
#' - \code{w1, w2, ...} portfolio weights \cr
#' - \code{ef} 1 = on the efficient frontier and 0 = not on the efficient frontier \cr
#' @export
#' @importFrom Rsolnp solnp
#' @examples
#' ## No change likely scenario of CCI in Figure 2, Ando and Mallory (2012)
#' rs <- c(0.265,0.671,0.372)
#' vmat <- matrix(c(0.003,0.005,-0.006,0.005,0.013,-0.010,-0.006,-0.010,0.012),ncol=3)
#' mus <- seq(min(rs),max(rs),length.out=100)
#' cci <- staticmpt(mus,rs,vmat)
#' @seealso \code{\link{plotef}}
#' @references Ando, A. W. and M. L. Mallory. (2012) "Optimal Portfolio Design to Reduce Climate-related Conservation Uncertainty in the Prairie Pothole Region." Proceedings of the National Academy of Sciences (PNAS). 109 (17) pp. 6484-6489.
staticmpt <- function(mus,rbar,vmat){
  nn <- length(rbar)

  fx <- function(w){
    obj <- t(w)%*%(vmat)%*%w
    return(as.numeric(obj))
  }

  resdata <- vector()
  for (i in 1:length(mus)){
    message('Processing ',i, ' -th optimization')
    mu <- mus[i]

    gx <- function(w){
      g1 <- sum(w) - 1
      g2 <- rbar%*%w - mu
      return(c(g1,g2))
    }

    res <- solnp(pars=rep(1/nn,nn), fun=fx, eqfun=gx, eqB = c(0,0), LB=rep(0,nn), UB=rep(1,nn),
                 control = list(trace = 0))
    tempres <- cbind(sqrt(res$values[length(res$values)]),mus[i],res$convergence,t(res$pars))
    resdata <- rbind(resdata,tempres)
  }
  colnames(resdata) <- c("sd","er","conv",paste("w",1:nn,sep=""))
  resdata <- as.data.frame(resdata)
  resdata$ef <- 1
  resdata$ef[resdata$er < resdata$er[which(resdata$sd == min(resdata$sd))]] <- 0

  mptres <- list(rbar=rbar,vmat=vmat,efres=resdata)

  return(mptres)
}
