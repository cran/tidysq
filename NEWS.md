# tidysq 1.2.3

## Fixed:
* Adjusted inner workings of alphabet subsetting in case of non-numeric parameter (fixes #99).

# tidysq 1.2.2

## Fixed:
* Using unsigned LenSq in loops. 

# tidysq 1.2.1

## Fixed:
* fixed incorrect codons
* add explicit casting of alphabet during construction of sequence prototype (fixes issues with new implementation of `union()`) 
* add skips for tests that use not available packages from "Suggests"

# tidysq 1.2.0
## New features:
* `write_fasta()` and `find_motifs()` accept `data.frame` arguments now; sequences and their names are taken from specified two columns
* more descriptive error messages for non-existing generics that print out classes of the first parameter

## Fixed:
* return to automatically exported `Rcpp` catch declaration

## Quality of code stuff:
* added tests and adjusted vignettes for the changes

# tidysq 1.1.3
## Fixed:
* replaced deprecated use of `iterator`

# tidysq 1.1.2-1
## Fixed:
* adjusted declaration of function autoexported by `Rcpp` to match new `testthat` standards

# tidysq 1.1.2
## Fixed:
* early return now works correctly for `remove_ambiguous()`
* ensured correct order of operations during sequence packing
* changed some values to `unsigned` wherever there was a mismatch

# tidysq 1.1.1
Updates for the CRAN god. Fixed `random_sq()` out-of-bounds possible problem, so there may be differences in sequences generated using the same seed in this and previous versions.

## Fixed:
* upper bound for `random_sq()` correctly ignores now "*" and "-" values while computing number of letters to draw from
* removed default move/copy constructors/assignment operators for `Sequence` and `ProtoSequence` classes
* lots of technical files cleanup

# tidysq 1.1.0
Expanded on v1.0.0, having implemented functions `paste()` and `collapse()` that allow the user to connect multiple sequences into one. Also made some optimization within C++ using templates, speeding up `translate()` and `complement()` functions significantly. Lastly, added support for object from `bioseq` package.

## Breaking changes:
* dropped argument `interpret_as_stop` from `translate()` function, as it is not feasible to implement well-working translation rules for tables with ambiguous codons (27, 28 & 31)

## New features:
* implemented `paste()` (a method for `sq` class)
* implemented `collapse()`
* added support for classes from `bioseq` package, i.e. `bioseq_aa`, `bioseq_dna` and `bioseq_rna`

## Improved:
* remade `translate()` to have codon tables created in compile time; this reduced execution time of `translate()` **by 95%**
* remade `complement()` to have tables created in compile time; this reduced execution time of `complement()` **by 85%**

## Fixed:
* made `random_sq()` actually use `seed` parameter while generating sequences

# tidysq 1.0.0
Initial stable release.
