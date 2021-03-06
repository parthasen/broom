% Generated by roxygen2 (4.1.0): do not edit by hand
% Please edit documentation in R/survival_tidiers.R
\name{pyears_tidiers}
\alias{glance.pyears}
\alias{pyears_tidiers}
\alias{tidy.pyears}
\title{Tidy person-year summaries}
\usage{
\method{tidy}{pyears}(x, ...)

\method{glance}{pyears}(x, ...)
}
\arguments{
\item{x}{a "pyears" object}

\item{...}{extra arguments (not used)}
}
\value{
\code{tidy} returns a data.frame with the columns
  \item{pyears}{person-years of exposure}
  \item{n}{number of subjects contributing time}
  \item{event}{observed number of events}
  \item{expected}{expected number of events (present only if a
  \code{ratetable} term is present)}

If the \code{data.frame = TRUE} argument is supplied to \code{pyears},
this is simply the contents of \code{x$data}.

\code{glance} returns a one-row data frame with
  \item{total}{total number of person-years tabulated}
  \item{offtable}{total number of person-years off table}

This contains the values printed by \code{summary.pyears}.
}
\description{
These tidy the output of \code{pyears}, a calculation of the person-years
of follow-up time contributed by a cohort of subject. Since the output of
\code{pyears$data} is already tidy (if the \code{data.frame = TRUE} argument
is given), this does only a little work and should rarely be necessary.
}
\examples{
if (require("survival", quietly = TRUE)) {
    temp.yr  <- tcut(mgus$dxyr, 55:92, labels=as.character(55:91))
    temp.age <- tcut(mgus$age, 34:101, labels=as.character(34:100))
    ptime <- ifelse(is.na(mgus$pctime), mgus$futime, mgus$pctime)
    pstat <- ifelse(is.na(mgus$pctime), 0, 1)
    pfit <- pyears(Surv(ptime/365.25, pstat) ~ temp.yr + temp.age + sex,  mgus,
                   data.frame=TRUE)
    head(tidy(pfit))
    glance(pfit)

    # if data.frame argument is not given, different information is present in
    # output
    pfit2 <- pyears(Surv(ptime/365.25, pstat) ~ temp.yr + temp.age + sex,  mgus)
    head(tidy(pfit2))
    glance(pfit2)
}
}
\seealso{
\link{pyears}
}

