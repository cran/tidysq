## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(tidysq)

## ----alphabet_access----------------------------------------------------------
sq_dna <- sq(c("CTGAATGCAGT", "ATGCCGT", "CAGACCATT"))
alphabet(sq_dna)

## ----get_standard_alphabet----------------------------------------------------
get_standard_alphabet("ami_ext")
get_standard_alphabet("rna_bsc")
get_standard_alphabet("DNA extended")

## ----rm_ambiguous-------------------------------------------------------------
sq_rna <- sq(c("UCGGNNCAGNN", "AUUCGGUGA", "CNCUUANNNCNU"))
sq_rna
remove_ambiguous(sq_rna)
remove_ambiguous(sq_rna, by_letter = TRUE)

## ----sub_ambiguous------------------------------------------------------------
substitute_letters(sq_rna, c(N = "-"))

## ----unt_vs_atp---------------------------------------------------------------
sq(c("PFN&I&VO*&P", "&IO*&PVO"))
sq(c("PFN&I&VO*&P", "&IO*&PVO"),
   alphabet = c("F", "I", "N", "O", "P", "V", "&", "*"))

## ----atp_w_more_letters-------------------------------------------------------
sq(c("PFN&I&VO*&P", "&IO*&PVO"),
   alphabet = c("E", "F", "I", "N", "O", "P", "Q", "V", "&", "*", ":"))

## ----atp_multichar------------------------------------------------------------
sq_multichar <- sq(c("TyrGlyArgArgAsp", "AspGlyArgGly", "CysGluGlyTyrProArg"),
                   alphabet = c("Arg", "Asp", "Cys", "Glu", "Gly", "Pro", "Tyr"))
sq_multichar

## ----sub_multichar------------------------------------------------------------
substitute_letters(sq_multichar, c(Arg = "X", Glu = "His", Pro = "X"))

## ----typify-------------------------------------------------------------------
sq_unt <- sq(c("UCGG&&CAG&&", "AUUCGGUGA", "C&CUUA&&&C&U"))
sq_sub <- substitute_letters(sq_unt, c(`&` = "-"))
sq_sub
typify(sq_sub, "rna_bsc")

## ----typify_fail, error=TRUE--------------------------------------------------
typify(sq_sub, "dna_bsc")

## ----find_invalid-------------------------------------------------------------
find_invalid_letters(sq_sub, "dna_bsc")

## ----amb_to_gap---------------------------------------------------------------
ambiguous_letters <- setdiff(
  get_standard_alphabet("rna_ext"),
  get_standard_alphabet("rna_bsc")
)
encoding <- rep("-", length(ambiguous_letters))
names(encoding) <- ambiguous_letters
encoding

sq_rna_sub <- substitute_letters(sq_rna, encoding)
typify(sq_rna_sub, "rna_bsc")

