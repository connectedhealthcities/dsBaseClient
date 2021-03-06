% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ds.matrixDiag.R
\name{ds.matrixDiag}
\alias{ds.matrixDiag}
\title{ds.matrixDiag calling assign function matrixDiagDS}
\usage{
ds.matrixDiag(
  x1 = NULL,
  aim = NULL,
  nrows.scalar = NULL,
  newobj = NULL,
  datasources = NULL
)
}
\arguments{
\item{x1}{This argument determines the input object. Depending on the
specified value of the <aim> argument it may be a character string
identifying the name of a serverside vector or scalar. Alternatively,
it may be a single number e.g. 29, or a vector specified as
e.g. c(3,5,-2,8) or it can be the name (but not in inverted commas) of
a clientside scalar or clientside vector which have already been assigned
values e.g. scalar.s<-83, x1=scalar.s; or vector.v<-c(7,0,-2,3:9), x1=vector.v.}

\item{aim}{a character string specifying what behaviour is required
of the function. It must take one of five values:
"serverside.vector.2.matrix"; "serverside.scalar.2.matrix";
"serverside.matrix.2.vector"; "clientside.vector.2.matrix";
or "clientside.scalar.2.matrix"}

\item{nrows.scalar}{if this takes value k, it forces the output
matrix to have k rows and k columns. If x1 is a scalar, this argument
must be set as otherwise the dimensions of the square matrix are undefined.
If x1 is a vector and no value is set for the <nrows.scalar> argument the
dimensions of the square matrix are defined by the length of the vector. If
x1 is a vector and the <nrows.scalar> is set at k, the vector will be used
repeatedly to fill up the diagonal. If for example the vector is of length
7 and <nrows.scalar> is specified as 18, a square diagonal matrix with
18 rows and 18 columns will be created with the vector repeated twice from
element 1,1 to element 14,14 and the first 4 elements of the vector will
fill diagonal elements 15,15 to 18,18. All off diagonal elements will be 0.
The <nrows.scalar> argument can either be set as a number, a clientside
scalar holding a single number or a character string representing the
name of a serverside scalar.}

\item{newobj}{A character string specifying the name of the output object
to be written to the serverside which may be a matrix or a vector
depending on the value of the <aim> argument.If no <newobj> argument is
specified, the output object name defaults to "matrixdiag.newobj".}

\item{datasources}{specifies the particular opal object(s) to use. If the <datasources>
argument is not specified the default set of opals will be used. The default opals
are called default.opals and the default can be set using the function
{ds.setDefaultOpals}. If the <datasources> is to be specified, it should be set without
inverted commas: e.g. datasources=opals.em or datasources=default.opals. If you wish to
apply the function solely to e.g. the second opal server in a set of three,
the argument can be specified as: e.g. datasources=opals.em[2].
If you wish to specify the first and third opal servers in a set you specify:
e.g. datasources=opals.em[c(1,3)]}
}
\value{
the matrix or vector specified by the <newobj> argument
(or default name diag)
which is written to the serverside. In addition, two validity messages are returned
indicating whether <newobj> has been created in each data source and if so whether
it is in a valid form. If its form is not valid in at least one study - e.g. because
a disclosure trap was tripped and creation of the full output object was blocked -
ds.matrixDiag also returns any studysideMessages that can explain the error in creating
the full output object. As well as appearing on the screen at run time,if you wish to
see the relevant studysideMessages at a later date you can use the {ds.message}
function. If you type ds.message("newobj") it will print out the relevant
studysideMessage from any datasource in which there was an error in creating <newobj>
and a studysideMessage was saved. If there was no error and <newobj> was created
without problems no studysideMessage will have been saved and ds.message("newobj")
will return the message: "ALL OK: there are no studysideMessage(s) on this datasource".
}
\description{
Extracts the diagonal vector from a square matrix A or
creates a diagonal matrix A based on a vector or a scalar value and
writes the output to the serverside
}
\details{
Depending on the specified value of the <aim> argument this
function behaves differently. If aim=="serverside.vector.2.matrix"
the function takes a serverside vector and writes out a square matrix with
the vector as its diagonal and all off-diagonal values = 0. The dimensions
of the output matrix are determined by the length of the vector.
If the vector is of length k, the output matrix has k rows and k columns.
If aim=="serverside.scalar.2.matrix"
the function takes a serverside scalar and writes out a square matrix with all
diagonal values equal to the value of the scalar
and all off diagonal values = 0. The dimensions of the square
matrix are determined by the value of the <nrows.scalar> argument;
If aim=="serverside.matrix.2.vector"
the function takes a square serverside matrix and extracts
its diagonal values as a vector which is written to the serverside;
If aim=="clientside.vector.2.matrix"
the function takes a vector specified on the clientside
and writes out a square matrix to the serverside with
the vector as its diagonal and all off-diagonal values = 0. The dimensions
of the output matrix are determined by the length of the vector.
If the vector is of length k, the output matrix has k rows and k columns;
If aim=="clientside.scalar.2.matrix"
the function takes a scalar specified on the clientside
and writes out a square matrix with all diagonal values equal
to the value of the scalar. The dimensions of the square
matrix are determined by the value of the <nrows.scalar> argument.
}
\author{
Paul Burton for DataSHIELD Development Team
}
