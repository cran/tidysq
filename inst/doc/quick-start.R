## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
# devtools::install_github("BioGenies/tidysq")
library(tidysq)

## ----sq_from_string-----------------------------------------------------------
sq_dna <- sq(c("TAGGCCCTAGACCTG", "TAGGCCCTGGGCATG"))
sq_dna

## ----sq_subset----------------------------------------------------------------
sq_dna[1]

## ----sq_bite------------------------------------------------------------------
bite(sq_dna, 5:10)
bite(sq_dna, c(-9, -11, -13))

## ----sq_bite_reversing--------------------------------------------------------
# Don't do it like that!
bite(sq_dna, 15:1)

## ----sq_reverse---------------------------------------------------------------
reverse(sq_dna)

## ----sq_rev-------------------------------------------------------------------
rev(sq_dna)

## ----sq_c---------------------------------------------------------------------
sq_dna <- c(sq_dna, reverse(sq_dna))
sq_dna

## ----sq_complement_translate--------------------------------------------------
complement(sq_dna)
translate(sq_dna)

## ----sq_translate_other_table-------------------------------------------------
translate(sq_dna, table = 6)

## ----sq_has-------------------------------------------------------------------
sq_dna %has% "ATC"
# It can be used to subset sq
sq_dna[sq_dna %has% c("AG", "CC")]

## ----sq_find_motifs-----------------------------------------------------------
find_motifs(sq_dna, c("seq1", "seq2", "rev1", "rev2"), c("ATC", "TAG"))

## ----sq_find_motifs_amb-------------------------------------------------------
find_motifs(sq_dna, c("seq1", "seq2", "rev1", "rev2"), "GNCC")

## ----sq_find_motifs_start_end-------------------------------------------------
find_motifs(sq_dna, c("seq1", "seq2", "rev1", "rev2"), c("^TAG", "ATN$"))

## ----write_fasta, eval=FALSE--------------------------------------------------
#  write_fasta(sq_dna,
#              c("seq1", "seq2", "rev1", "rev2"),
#              "just_your_ordinary_fasta_file.fasta")

