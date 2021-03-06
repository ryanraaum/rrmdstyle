% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/rr_pdf.R
\name{pdf_worksheet}
\alias{pdf_worksheet}
\alias{pdf_assignment}
\title{PDF formats for literate, interactive R Markdown documents}
\usage{
pdf_worksheet(fig_width = 6, fig_height = 3.7, ...)

pdf_assignment(...)
}
\arguments{
\item{fig_width}{Default width (in inches) for figures}

\item{fig_height}{Default height (in inches) for figures}

\item{...}{See other arguments in the documentation for \code{\link[rmarkdown:pdf_document]{rmarkdown::pdf_document()}}
(note that you cannot use the \code{template} argument in either
\code{pdf_worksheet} or \code{pdf_assignment} becaues it is set
internally).}
}
\value{
An R Markdown output format.
}
\description{
These formats are for PDF versions of worksheets and assignments used in
my Quantitative Methods in Biological Anthropology course.
}
\section{Details}{
 You can find more details about each output format below.
}

\section{\code{pdf_worksheet}}{
 Format for creating a worksheet including fancy
page headers and logo on the first page.
}

\section{\code{pdf_assignment}}{
 Format for creating a minimally styled
assignment document.
}

