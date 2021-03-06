\name{updateSGP}
\alias{updateSGP}
\title{Function to update SGP object with additional year's analyses}
\description{
updateSGP takes an object of class SGP and adds in additional data (usually an additional year's data) and runs analyses on that additional year's data including the results in the supplied
SGP object.
}

\usage{
updateSGP(
	what_sgp_object=NULL,
	with_sgp_data_LONG=NULL,
	with_sgp_data_INSTRUCTOR_NUMBER=NULL,
	state=NULL,
	steps=c("prepareSGP", 
		"analyzeSGP", 
		"combineSGP", 
		"summarizeSGP", 
		"visualizeSGP", 
		"outputSGP"),
	years=NULL,
	content_areas=NULL,
	grades=NULL,
	sgp.percentiles=TRUE,
	sgp.projections=TRUE,
	sgp.projections.lagged=TRUE,
	sgp.percentiles.baseline=TRUE,
	sgp.projections.baseline=TRUE,
	sgp.projections.lagged.baseline=TRUE,
	simulate.sgps=FALSE,
	save.old.summaries=TRUE,
	save.intermediate.results=TRUE,
	calculate.simex=NULL,
	calculate.simex.baseline=NULL,
	sgp.use.my.coefficient.matrices=NULL,
	sgp.target.scale.scores=FALSE,
	sgp.target.scale.scores.only=FALSE,
	overwrite.existing.data=FALSE,
	update.old.data.with.new=TRUE,
	sgPlot.demo.report=TRUE,
	outputSGP.output.type=c("LONG_Data", 
				"LONG_FINAL_YEAR_Data", 
				"WIDE_Data", 
				"INSTRUCTOR_Data"),
	sgp.config=NULL,
	goodness.of.fit.print=TRUE,
	parallel.config=NULL,
	sgp.sqlite=NULL,
	...)
}

\arguments{
  \item{what_sgp_object}{The SGP object to which the additional data will be added and analyzed. This object must be specified.
  }
  \item{with_sgp_data_LONG}{The additional data in LONG format to be added to the supplied SGP object. The additional data must be in the same form as the data in the @Data slot. If with_sgp_data_LONG is not supplied, the function with update the sgp_object supplied in 'what_sgp_object' using the embedded coefficient matrices, essentially re-doing the analyses.
  }
  \item{with_sgp_data_INSTRUCTOR_NUMBER}{The addition INSTRUCTOR_NUMBER data in LONG format to be added to the supplied SGP object. The additional data must be in the same format as the data in the
  @Data_Supplementary[['INSTRUCTOR_NUMBER']] slot.  Default is NULL, no INSTRUCTOR_NUMBER data is supplied.
  }
  \item{state}{The 'state' for the sgp_object. Derived from sgp_object name if not explicitly supplied. 
  }
  \item{steps}{A vector indicting the steps abcSGP will perform as part of the update. Defaults to all steps: \code{\link{prepareSGP}}, \code{\link{analyzeSGP}}, \code{\link{combineSGP}}, 
  \code{\link{summarizeSGP}}, \code{\link{visualizeSGP}}, \code{\link{outputSGP}}.
  }
  \item{years}{If only 'what_sgp_object' is supplied, years specifies the years to be run among those in the provided sgp_object.
  }
  \item{content_areas}{If only 'what_sgp_object' is supplied, content_areas specifies the content areas to be run among those provided by the coefficient matrices in the sgp_object. Default is to run all analyses associated with the coefficient matrices.
  }
  \item{grades}{A vector indicating grades for which to calculate student growth percentiles and/or student growth projections/trajectories. 
If missing the function will use the data to infer all the grade progressions for student growth percentile and student growth projections/trajectories analyses.   This argument is passed to either \code{\link{abcSGP}} or \code{\link{analyzeSGP}} depending on the update context.
  }
  \item{sgp.percentiles}{Boolean variable indicating whether to calculate student growth percentiles (if analyzeSGP is included in the 'steps' argument). Defaults to TRUE.
  }
  \item{sgp.projections}{Boolean variable indicating whether to calculate student growth projections (if analyzeSGP is included in the 'steps' argument). Defaults to TRUE.
  }
  \item{sgp.projections.lagged}{Boolean variable indicating whether to calculate lagged student growth projections often used for growth to standard analyses (if analyzeSGP is included in the 'steps' argument). Defaults to TRUE.
  }
  \item{sgp.percentiles.baseline}{Boolean variable indicating whether to calculate baseline student growth percentiles and/or coefficient matrices (if analyzeSGP is included in the 'steps' argument). Defaults to TRUE.
  }
  \item{sgp.projections.baseline}{Boolean variable indicating whether to calculate baseline student growth projections (if analyzeSGP is included in the 'steps' argument). Defaults to TRUE.
  }
  \item{sgp.projections.lagged.baseline}{Boolean variable indicating whether to calculate lagged baseline student growth projections (if analyzeSGP is included in the 'steps' argument). Defaults to TRUE.
  }
  \item{simulate.sgps}{Boolean variable indicating whether to simulate SGP values for students based on test-specific Conditional Standard Errors of Measurement (CSEM).  Test CSEM data must be available for simulation and included in \code{SGPstateData}.  This argument must be set to TRUE for confidence interval construction. Defaults to FALSE.  This argument is passed to \code{\link{analyzeSGP}}.
  }
  \item{save.old.summaries}{A Boolean argument (defaults to FALSE which will delete the \code{@Summary} slot before creating new summaries)
  indicating whether the call to \code{\link{summarizeSGP}} should save existing summaries in the \code{@Summary} slot.
  }
  \item{save.intermediate.results}{A Boolean argument (defaults to FALSE) indicating whether results should be save to the current directory after each step of the analysis.
  }
  \item{calculate.simex}{A character state acronym or list including state/csem variable, simulation.iterations, lambda and extrapolation method. Defaults to NULL, no simex calculations performed.  Alternatively, setting the argument to TRUE sets the list up with state=state, lambda=seq(0,2,0.5), simulation.iterations=50, simex.sample.size=25000, extrapolation="linear" and save.matrices=TRUE.  This argument is passed to \code{\link{analyzeSGP}}.
  }
  \item{calculate.simex.baseline}{A character state acronym or list including state/csem variable, simulation.iterations, lambda and extrapolation method. Defaults to NULL, no simex calculations performed.  Alternatively, setting the argument to TRUE sets the list up with state=state, lambda=seq(0,2,0.5), simulation.iterations=50, simex.sample.size=25000, extrapolation="linear", save.matrices=TRUE and simex.use.my.coefficient.matrices = TRUE.  This argument is passed to \code{\link{analyzeSGP}}.
  }
  \item{sgp.use.my.coefficient.matrices}{A Boolean argument (defaults to FALSE/NULL) passed to \code{\link{analyzeSGP}} indicating whether previous coefficient matrices should be used as 
  part of the analyses.
  }
  \item{sgp.target.scale.scores}{A Boolean argument (defaults to FALSE/NULL) passed to \code{\link{combineSGP}} indicating whether to calculate scale scores associated with SGP targets as 
  part of the analyses.
  }
  \item{sgp.target.scale.scores.only}{A Boolean argument (defaults to FALSE/NULL) passed to \code{\link{combineSGP}} indicating whether ONLY to calculate scale scores associated with SGP targets as 
  part of the \code{\link{combineSGP}}.
  }
  \item{overwrite.existing.data}{A Boolean argument (defaults to FALSE) indicating whether updateSGP should overwrite existing data/results from an earlier run as part of updateSGP.
  }
  \item{update.old.data.with.new}{A Boolean argument (defaults to TRUE) indicating whether updateSGP should add new data supplied in arugment with_SGP_Data_LONG to existing longitudinal data
  or reduce data set to run analyses on only that which is provided. 
  }
  \item{sgPlot.demo.report}{A Boolean argument (defaults to TRUE) indicating whether updateSGP should produce just the demo student growth plots or those associated with all students in the last year.
  }
  \item{outputSGP.output.type}{Specifies the type of output generated as part of intermediate step when adding addition data and using old coefficient matrices. Defaults are the defaults of outputSGP,
  \code{LONG_Data}, \code{LONG_FINAL_YEAR_Data}, \code{WIDE_Data}, and \code{INSTRUCTOR_Data}.

  }
  \item{sgp.config}{List of analysis control parameters passed to \code{\link{analyzeSGP}}. For details on this argument see document for that function.
  }
  \item{goodness.of.fit.print}{A Boolean variable passed to \code{\link{analyzeSGP}} indicating whether to print goodness of fit plots.
  }
  \item{parallel.config}{Parallel computation configuration passed to \code{\link{abcSGP}}, \code{\link{analyzeSGP}}, \code{\link{combineSGP}}, and \code{\link{summarizeSGP}}. See documentation 
  under those functions for details.
  }
 \item{sgp.sqlite}{A Boolean argument (defaults to NULL) indicating whether a SQLite database file of the essential SGP data should be created from the \code{@Data} slot and subsequently used to extract data subsets for analyses conducted in order to reduce the amount of RAM memory required.  See full argument description in \code{\link{analyzeSGP}}.
 }
  \item{...}{Arguments to be passed to \code{\link{abcSGP}} for finer control over SGP calculations. For example, 'parallel.config' can be supplied to abcSGP for parallel computation.
  }

}

\value{Returns and object of class SGP including additional analyses.
}

\author{Damian W. Betebenner \email{dbetebenner@nciea.org}}

\seealso{\code{\link{prepareSGP}} and \code{\link{abcSGP}}}

\examples{
\dontrun{
### Run analyses on all but final year's of data

Demonstration_Data_LONG <- subset(sgpData_LONG, YEAR %in% c("2009_2010", "2010_2011", "2011_2012", "2012_2013"))
Demonstration_Data_LONG_2013_2014 <- subset(sgpData_LONG, YEAR %in% c("2013_2014"))

Demonstration_SGP <- abcSGP(
        sgp_object=Demonstration_Data_LONG,
        sgPlot.demo.report=TRUE)


### Run updateSGP on Demonstration_SGP and the 2013_2014 data

Demonstration_SGP <- updateSGP(
        what_sgp_object=Demonstration_SGP,
        with_sgp_data_LONG=Demonstration_Data_LONG_2013_2014)
}  
}

\keyword{documentation}
