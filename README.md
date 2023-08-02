# *portn*: Portfolio Analysis for Nature

![CRAN/METACRAN](https://img.shields.io/cran/v/acdcR?color=blue) ![](http://cranlogs.r-pkg.org/badges/grand-total/acdcR?color=blue) 

*This repository is to develop and distribute a testing version of R-package _portn_. The stable latest version is directly available from R-CRAN.*
*Data and code are subject to change*

GitHub Repository maintained by: Seong Yun\
Department of Agricultural Economics\
Mississippi State University\
**<seong.yun@msstate.edu>**\
**<https://sites.google.com/site/yunsd2004/>**\
*Last updated: Aug. 2, 2023*

------------------------------------------------------------------------

1 *portn* R-package
==========

An R-package Portfolio Analysis for Nature (*portn*) is designed to provide the functions to
find the efficient mean-variance frontier or portfolio weights for static portfolio (called  Markowitz portfolio) analysis in resource economics or nature conservation. Using the nonlinear programming solver (Rsolnp), this package deals with the quadratic minimization of the variance-covariances without shorting (i.e., non-negative portfolio weights).

2 Getting started:
==================

2.1. Install the latest version (complete) of *portn* from the R-CRAN repository:
--------------------------------------------------

The latest version of *portn* is available from the R-CRAN repository. Users can install and use all functions and features directly installing it from the R-CRAN repository.

``` r
    ## In R
    install.packages("portn")
    library(portn)
```

2.2. Install *portn* testing version from the github repository:
---------------------------------
For your testing purpose, a version currently developing is available from this GitHub repository.


``` r
    ## Need to install devtools packages
    install.packages("devtools")
    ## Then use
    devtools::install_github("ysd2004/portn")
    library(portn)
```

3 Authors
====================================
Seong D. Yun, Associate Professor, Mississippi State University (<seong.yun@msstate.edu>)

Maintainer/Bug report or quetion to Seong Yun (<seong.yun@msstate.edu>)

4 Citation
====================================
Please cite the software in publications;

4.1. *portn* (stable and latest) from the R-CRAN repository
---------------------------------
To cite the R-package *portn*, use `citation()` for information on how to cite the software;

```r
citation(package = "portn")
 
To cite package 'portn' in publications use:

  Seong D. Yun, (2023). portn: Portfolio Analysis for Nature. 
  R package version 1.0.0. https://CRAN.R-project.org/package=portn

A BibTeX entry for LaTeX users is

  @Manual{,
    title = {portn: Portfolio Analysis for Nature},
    author = {Seong D. Yun},
    year = {2023},
    note = {R package version 1.0.0},
    url = {https://CRAN.R-project.org/package=portn},
  }
```

4.2. *portn* (testing) from the R-CRAN repository
---------------------------------
To cite this GitHub repository:

```r
To cite 'portn' package in publications use:

  Yun, Seong D., 2023, "portn: Portfolio Analysis for Nature" Data retrieved from the GitHub,
  https://github.com/ysd2004/portn.

A BibTeX entry for LaTeX users is

  @misc{,
    title = {portn: Portfolio Analysis for Nature},
    author = {Seong D. Yun},
    year = {2023},
    note = {Data retrieved from the GitHub,
    \url{https://github.com/ysd2004/portn}}
  }
```

5 Acknowledgement
====================================
The author is grateful for financial support through the “Sustainable Bioenergy Production and Integrated Valuation of Ecosystem Services” project provided by United States Department of Agriculture (USDA) National Institute for Food and Agriculture (NIFA) Agriculture and Food Research Initiative (AFRI) competitive award [no. 2019-67024-29677]. The views expressed herein do not necessarily reflect the views of the USDA-NIFA. 

6 News
====================================

Below are the development history of R-package *portn*.

* XX-XX-2023: The first relese of *portn* v.1.0.0 on R-Repository.

* 08-02-2023: V. 1.0.0 was embeded in GitHub.

* 06-20-2022: The first beta version was tested.


