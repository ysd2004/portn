#' Plot the efficient frontier line
#'
#' @description Plotting the efficient frontier line from Markowitz (static) portfolio analysis
#' @param mptres a list from \code{staticmpt} function
#' @details This function provides the efficient frontier (blue line) using the result from \code{staticmpt} function. An array of inefficient weights are presented with red line. The observed returns and standard deviations are black dots.
#' @return A plot of the efficient frontier
#' @importFrom graphics grid legend lines points
#' @export
#' @examples
#' ## No change likely scenario of CCI in Figure 2, Ando and Mallory (2012)
#' rs <- c(0.265,0.671,0.372)
#' vmat <- matrix(c(0.003,0.005,-0.006,0.005,0.013,-0.010,-0.006,-0.010,0.012),ncol=3)
#' mus <- seq(min(rs),max(rs),length.out=100)
#' cci <- staticmpt(mus,rs,vmat)
#' plotef(cci)
#' @seealso \code{\link{staticmpt}}
#' @references Ando, A. W. and M. L. Mallory. (2012) Optimal Portfolio Design to Reduce Climate-related Conservation Uncertainty in the Prairie Pothole Region. Proceedings of the National Academy of Sciences (PNAS). 109 (17) pp. 6484-6489.
plotef <- function(mptres){
  mptdata <- mptres[['efres']]
  plotdata <- mptdata[mptdata$ef ==1,]
  nonef <- mptdata[mptdata$ef == 0,]
  if(length(nonef) == 0){
    plot(plotdata$sd, plotdata$er,
         xlab="Standard Deviation", ylab="Expected Value",
         type="l", lwd=3, col="blue",
         xlim=c(min(plotdata$sd,sqrt(diag(mptres[['vmat']])))*0.95,
                max(plotdata$sd,sqrt(diag(mptres[['vmat']])))*1.05),
         ylim=c(min(plotdata$er,mptres[['rbar']])*0.95,
                max(plotdata$er,mptres[['rbar']])*1.05))
    points(sqrt(diag(mptres[['vmat']])),mptres[['rbar']],lwd=3)
    grid()
    legend('topleft',legend = c('Efficient','Observed'),
           pch=c(NA,1),lty=c(1,NA),col=c('blue','black'),
           lwd=c(3,NA),bty='n')
  }
  if(length(nonef) != 0){
    nonef <- rbind(nonef,plotdata[1,])
    plot(plotdata$sd, plotdata$er,
         xlab="Standard Deviation", ylab="Expected Value",
         type="l", lwd=3, col="blue",
         xlim=c(min(plotdata$sd,sqrt(diag(mptres[['vmat']])))*0.95,
                max(plotdata$sd,sqrt(diag(mptres[['vmat']])))*1.05),
         ylim=c(min(plotdata$er,mptres[['rbar']],nonef$er)*0.95,
                max(plotdata$er,nonef$er,mptres[['rbar']])*1.05))
    points(sqrt(diag(mptres[['vmat']])),mptres[['rbar']],lwd=3)
    lines(nonef$sd,nonef$er,col='red',lwd=3)
    grid()
    legend('topleft',legend = c('Efficient','Inefficient','Observed'),
           pch=c(NA,NA,1),lty=c(1,1,NA),col=c('blue','red','black'),
           lwd=c(3,3,NA),bty='n')
  }
}
