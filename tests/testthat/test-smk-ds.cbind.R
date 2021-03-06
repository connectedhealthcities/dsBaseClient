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

context("ds.cbind::smk::setup")

connect.studies.dataset.survival(list("survtime", "time.id", "female", "age.60"))

test_that("setup", {
    ds_expect_variables(c("D"))
})

#
# Tests
#

context("ds.cbind::smk")
test_that("simple test", {
    res <- ds.cbind(c("D$survtime", "D$time.id", "D$female", "D$age.60"), newobj="cbind_newobj")

    expect_equal(res$is.object.created, "A data object <cbind_newobj> has been created in all specified data sources")
    expect_equal(res$validity.check, "<cbind_newobj> appears valid in all sources")
    
    res1 <- ds.class("cbind_newobj", datasources=ds.test_env$connection.opal)

    expect_equal(res1$survival1, "matrix")
    expect_equal(res1$survival2, "matrix")
    expect_equal(res1$survival3, "matrix")
})

#
# Done
#

context("ds.cbind::smk::shutdown")

test_that("setup", {
    ds_expect_variables(c("D", "cbind_newobj"))
})

disconnect.studies.dataset.survival()

context("ds.cbind::smk::done")
