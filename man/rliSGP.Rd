\name{rliSGP}
\alias{rliSGP}
\title{Wrapper function associated with SGP analyses for Renaissance Learning Incorporated (RLI) interim STAR assessments.}
\description{
rliSGP is a wrapper function design to expediate SGP analyses on Renaissance Learning Incorporated (RLI) interim STAR assessments.
}

\usage{
rliSGP(
	sgp_object,
        additional.data,
	state=NULL,
	content_areas=c("MATHEMATICS", "READING", "EARLY_LIT"),
        testing.window,
        eow.or.update="UPDATE",
	update.save.shell.only=FALSE,
        configuration.year,
        update.ids=NULL,
        parallel.config=NULL)
}

\arguments{
  \item{sgp_object}{The SGP object from which the goodness-of-fit data will be used. 
  }
  \item{additional.data}{Current window's data for UPDATE or EOW (end of window) processing. 
  }
  \item{state}{Abbreviation for STATE/ORGANIZATION being analyzed. Currently only available for 'RLI' or 'RLI_UK'.
  }
  \item{content_areas}{Character vector indicating which content areas \code{rliSGP} should be run for ('MATHEMATICS', 'READING', and/or 'EARLY_LIT'). Default is all.
  }
  \item{testing.window}{Argument indicating testing window being analyzed. Either 'FALL', 'WINTER', 'SPRING', 'EARLY_SPRING', 'LATE_SPRING' indicating what testing window's data is being analyzed.
  }
  \item{eow.or.update}{Argument indicating whether end-of-window or within-window updates are being done. Either 'EOW' (end of window) or 'UPDATE' (within window). 
  }
  \item{update.save.shell.only}{Boolean argument indicating whether End of Window processing should only produce/save RLI_SGP_UPDATE_SHELL and bypass coefficient matrix production.
  }
  \item{configuration.year}{Year associated with SGP analyses (configuration year) to be used.
  }
  \item{update.ids}{Argument that allows ID to be updated based upon a supplied two column data frame where the first column represents the ORIGINAL/OLD ID and the second column the NEW ID that
is to replace it. NOTE that ID needn't be replaced in either 'sgp_object' nor 'additional.data' that are provided as part of the 'rliSGP' call. Substitution will occur on entire data set before
analysis. Default is NULL, no ID replacement is performed.
  }
  \item{parallel.config}{Argument passed to \code{\link{abcSGP}} or \code{\link{updateSGP}} to activate parallel processing with an appropriate backend.
  }
}

\value{Saves relevant results to disc for use in subsequent analyses.
}

\author{Damian W. Betebenner \email{dbetebenner@nciea.org}}

\examples{
\dontrun{
####### For Within Window processing



####### For End-of-Window processing 


}  
}

\keyword{documentation}
