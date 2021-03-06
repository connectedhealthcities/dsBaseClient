#-------------------------------------------------------------------------------
# Copyright (c) 2018-2020 University of Newcastle upon Tyne. All rights reserved.
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

context("ds.table1D::smk::setup")

connect.studies.dataset.cnsim(list("DIS_CVA","GENDER"))

test_that("setup", {
    ds_expect_variables(c("D"))
})

#
# Tests
#

context("ds.table1D::smk::generate a one dimensional table, outputting combined contingency tables")
res <- ds.table1D(x='D$GENDER')
test_that("GENDER_normal", {
    expect_equal(res$validity, "All tables are valid!")
    expect_equal(res$counts[2], 4611)
    expect_equal(res$counts[3], 9379)
})

context("ds.table1D::smk::generate a one dimensional table, outputting combined contingency tables fail")
res <- ds.table1D(x='D$DIS_CVA')
test_that("DIS_CVA_invalid", {
#    expect_equal(res$validity, "Invalid tables from 'sim2'!")
})

context("ds.table1D::smk::generate a one dimensional table, outputting combined contingency tables fail split")
res <- ds.table1D(x='D$DIS_CVA', type="split")
test_that("DIS_CVA_invalid_split", {
#    expect_equal(res$validity, "Invalid table(s) from 'sim2'!")
})

context("ds.table1D::smk::generate a one dimensional table, outputting study specific contingency tables")
res <- ds.table1D(x='D$GENDER', type="split")
test_that("GENDER_split", {
    expect_equal(res$validity, "All tables are valid!")
    expect_equal(res$counts$sim1[1], 1092)
    expect_equal(res$counts$sim2[2], 1503)
    expect_equal(res$counts$sim3[1], 2091)
})

context("ds.table1D::smk::generate a one dimensional table, outputting study specific contingency tables for study 1 and 2")
res <- ds.table1D(datasources=ds.test_env$connection.opal[1:2], x='D$GENDER', type="split")
test_that("GENDER_split_12", {
    expect_equal(res$validity, "All tables are valid!")
    expect_equal(res$counts$sim1[1], 1092)
    expect_equal(res$counts$sim2[2], 1503)
    expect_equal(res$counts$sim3[1], NULL)
})

context("ds.table1D::smk::generate a one dimensional table, outputting study specific and combined contingency tables")
res <- ds.table1D(datasources=ds.test_env$connection.opal, x='D$GENDER')
test_that("GENDER_normal_2", {
    expect_equal(res$validity, "All tables are valid!")
    expect_equal(res$counts[2], 4611)
    expect_equal(res$counts[3], 9379)
})

#
# Tear down
#

context("ds.table1D::smk::shutdown")

test_that("shutdown", {
    ds_expect_variables(c("D"))
})

disconnect.studies.dataset.cnsim()

context("ds.table1D::smk::done")
