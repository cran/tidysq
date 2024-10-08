#' Save sq to fasta file
#'
#' @templateVar name_null_ok FALSE
#'
#' @description Writes \code{\link[=sq-class]{sq}} objects with their names to
#' a fasta file.
#'
#' @template x
#' @template name
#' @param file [\code{character(1)}]\cr
#'  Absolute path to file to write to.
#' @template dot-sq
#' @template dot-name
#' @param width [\code{integer(1)}]\cr
#'  Maximum number of characters to put in each line of file. Must be positive.
#' @template NA_letter
#' @template three-dots
#'
#' @return No value is returned.
#'
#' @details
#' Whenever a name has more letters than \code{width} parameter, nothing
#' happens, as only sequences are split to fit within designated space.
#'
#' @examples
#' \dontrun{
#' sq_dna <- sq(c("ACTGCTG", "CTTAGA", "CCCT", "CTGAATGT"),
#'              alphabet = "dna_bsc")
#' write_fasta(sq_dna,
#'             c("bat", "cat", "rat", "elephant_swallowed_by_A_snake"),
#'             tempfile())
#' }
#'
#' # It can be a part of tidyverse pipeline:
#' library(dplyr)
#' fasta_file <- system.file(package = "tidysq", "examples/example_aa.fasta")
#' read_fasta(fasta_file) %>%
#'   mutate(name = toupper(name)) %>%
#'   write_fasta(tempfile())
#'
#' @family output_functions
#' @export
write_fasta <- function(x, ...) {
  UseMethod("write_fasta")
}

#' @export
write_fasta.default <- function(x, ...)
  stop_no_method(write_fasta, x)

#' @rdname write_fasta
#' @export
write_fasta.sq <- function(x, name, file,
                           width = 80,
                           NA_letter = getOption("tidysq_NA_letter"),
                           ...) {
  assert_character(name, len = vec_size(x), any.missing = FALSE)
  assert_string(file)
  assert_count(width, positive = TRUE)
  assert_string(NA_letter, min.chars = 1)

  CPP_write_fasta(x, name, file, width, NA_letter)
}

#' @rdname write_fasta
#' @export
write_fasta.data.frame <- function(x, file,
                                   .sq = "sq",
                                   .name = "name",
                                   width = 80,
                                   NA_letter = getOption("tidysq_NA_letter"),
                                   ...) {
  assert_string(.sq, min.chars = 1)
  assert_string(.name, min.chars = 1)
  assert_subset(c(.sq, .name), colnames(x))

  write_fasta(x[[.sq]], x[[.name]], file, width = width, NA_letter = NA_letter)
}
