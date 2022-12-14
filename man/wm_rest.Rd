% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/worms.R
\name{wm_rest}
\alias{wm_rest}
\title{Query WoRMS REST API with multiple requests}
\usage{
wm_rest(
  df,
  fld,
  operation = "AphiaRecordsByMatchNames",
  server = "https://www.marinespecies.org/rest",
  verbose = F,
  ...
)
}
\arguments{
\item{df}{data frame to match}

\item{fld}{field in data frame to use with operation}

\item{operation}{operation name of WoRMS REST API; One of operations listed
at \href{https://www.marinespecies.org/rest}{marinespecies.org/rest}, like
"AphiaRecordsByMatchNames" (non-paging), "AphiaRecordsByVernacular" (paging),
"AphiaRecordsByNames" (paging), or "AphiaRecordsByAphiaIDs" (paging);
default: "AphiaRecordsByMatchNames"}

\item{server}{URL of server REST endpoint; default: "https://www.marinespecies.org/rest"}

\item{...}{other query parameters to pass to operation}
}
\value{
data frame of results from WoRMS API prepended with unique values from \code{fld}
}
\description{
When trying to perform batch requests the WoRMS REST API unfortunately does
not return the requested field so it is not obvious which taxa requested
matches which response. Even when fetching records in batch by \code{aphia_id}
functions in the \code{worrms} R package do not page requests based on the record
limits of the WoRMS REST API. Finally, it is much preferred to use the
multiplexing capabilities of the latest \code{httr2} library to send multiple
requests in parallel, versus each one sequentially.
}
\examples{
\dontrun{
tmp_test <- tibble::tribble(
           ~common,                     ~scientific, aphia_id_0,
     "Minke whale",     "Balaenoptera acutorostrata", 137087,
      "Blue whale",          "Balaenoptera musculus", 137090,
"Bonaparte's Gull",   "Chroicocephalus philadelphia", 882954) # 882954 invalid non-marine -> valid marine 159076

wm_exact <- wm_rest(tmp_test, scientific, "AphiaRecordsByMatchNames")
wm_fuzzy <- wm_rest(tmp_test, scientific, "AphiaRecordsByNames")
wm_byid  <- wm_rest(tmp_test, scientific, "AphiaRecordsByNames", marine_only=F)
wm_add_aphia_id(df_test, scientific, tbl_str = "tmp_test")
}
}
\concept{worms}
