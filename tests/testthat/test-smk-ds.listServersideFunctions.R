#-------------------------------------------------------------------------------
# Copyright (c) 2019-2020 University of Newcastle upon Tyne. All rights reserved.
#
# This program and the accompanying materials
# are made available under the terms of the GNU Public License v3.0.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#-------------------------------------------------------------------------------

#
# Set up
#

connect.studies.dataset.cnsim(list("LAB_TSC", "LAB_HDL"))

#
# Tests
#

context("ds.listServersideFunctions::smk::check results")
test_that("check results", {
    assign.functions <- factor(c(
      "BooleDS", "as.character", "as.null", "as.numeric", "asCharacterDS", "asDataMatrixDS",
      "asFactorDS", "asFactorDS2", "asIntegerDS", "asListDS", "asLogicalDS", "asMatrixDS",
      "asMatrixDS", "asNumericDS", "attach", "c", "cDS", "cbind",
      "cbindDS", "changeRefGroupDS", "complete.cases", "dataFrameDS", "dataFrameSortDS", "dataFrameSubsetDS2",
      "dataFrameDS", "exp", "lexisDS2", "lexisDS3", "list",
      "listDS", "log", "matrixDS", "matrixDetDS2", "matrixDiagDS", "matrixDimnamesDS", "matrixInvertDS",
      "matrixMultDS", "matrixTransposeDS", "mergeDS", "rBinomDS", "rNormDS", "rPoisDS",
      "rUnifDS", "rbindDS", "reShapeDS", "recodeLevelsDS", "recodeValuesDS2", "rep",
      "replaceNaDS", "rowColCalcDS", "seedDS", "seqDS", "subsetByClassDS", "subsetDS", "sum",
      "tapplyDS.assign", "unlist", "unListDS"
    ))
    aggregate.functions <- factor(c(
      "NROW", "alphaPhiDS", "asFactorDS1", "asListDS",
      "checkNegValueDS", "class", "colnames", "cor.test",
      "covDS", "dataFrameSubsetDS1",
      "densityGridDS", "dim", "dimDS",
      "exists", "glmDS1", "glmDS1", "glmDS2",
      "glmDS2", "glmSLMADS2", "histogramDS1", "is.character",
      "is.factor", "is.list", "is.null", "is.numeric",
      "isNaDS", "isValidDS", "length", "lengthDS",
      "levels", "lexisDS1", "listDisclosureSettingsDS", "ls",
      "matrixDetDS1", "meanDS", "meanSdGpDS", "messageDS",
      "namesDS", "numNaDS", "quantileMeanDS", "rangeDS",
      "recodeValuesDS1", "rmDS", "scatterPlotDS",
      "scoreVectDS", "setSeedDS", "t.test", "tTestFDS2",
      "table1DDS", "table2DDS", "tapplyDS", "testObjExistsDS",
      "varDS"
    ))

    res <- ds.listServersideFunctions()

    expect_length(res, 2)
    expect_length(res$serverside.assign.functions, 3)
    expect_length(res$serverside.aggregate.functions, 3)

    sim1.assign.res    <- res$serverside.assign.functions$sim1
    sim1.aggregate.res <- res$serverside.aggregate.functions$sim1
    sim2.assign.res    <- res$serverside.assign.functions$sim2
    sim2.aggregate.res <- res$serverside.aggregate.functions$sim2
    sim3.assign.res    <- res$serverside.assign.functions$sim3
    sim3.aggregate.res <- res$serverside.aggregate.functions$sim3

    for (func.name in assign.functions)
        expect_true(func.name %in% sim1.assign.res, info = func.name)
    for (func.name in aggregate.functions)
        expect_true(func.name %in% sim1.aggregate.res, info = func.name)
    for (func.name in assign.functions)
        expect_true(func.name %in% sim2.assign.res, info = func.name)
    for (func.name in aggregate.functions)
        expect_true(func.name %in% sim2.aggregate.res, info = func.name)
    for (func.name in assign.functions)
        expect_true(func.name %in% sim3.assign.res, info = func.name)
    for (func.name in aggregate.functions)
        expect_true(func.name %in% sim3.aggregate.res, info = func.name)
})

#
# Done
#

disconnect.studies.dataset.cnsim()
