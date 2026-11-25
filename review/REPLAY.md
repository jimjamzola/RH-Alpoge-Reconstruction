# Reproducing the manuscript and its Lean checks

The manuscript builds with a TeX distribution containing latexmk, pdfLaTeX, BibTeX and the packages listed in main.tex. From the manuscript directory run the following.

```sh
latexmk -pdf -interaction=nonstopmode -halt-on-error main.tex
```

To repeat the ten local Lean checks, use Lean 4.33.1. Put Lean 4.33.1 on PATH and run these commands from `review/companion/`. The following commands only write local compiler outputs.

```sh
export LEAN_PATH="$PWD"
lean -o LayerCounts.olean LayerCounts.lean
lean -o K1Assembly.olean K1Assembly.lean
lean -o ManuscriptLinks.olean ManuscriptLinks.lean
lean Check.lean
```

The [local check log](evidence/lean-check.txt) prints the axiom dependencies for each result. The checks cover finite counts, cancellation, composition of the K1 bound, a prism boundary identity, a period comparison on the image, scalar transfer, common-family selection, numerical constants and a common change to a height majorant. The abstract lemmas spell out their hypotheses. An integer identity in the companion illustrates the corresponding additive step; the manuscript gives the arithmetic or analytic setting of the application.

For the archive-dependent checks, use an independently built project at the source pin and its matching Mathlib and Lean versions. First build the lightweight companion files above and export COMPANION as their absolute directory. From the root of the built archive run the following.

```sh
lake env sh -c 'export LEAN_PATH="$COMPANION:$LEAN_PATH"; lean "$COMPANION/ArchiveK1.lean"'
lake env sh -c 'export LEAN_PATH="$COMPANION:$LEAN_PATH"; lean "$COMPANION/ArchivePassages.lean"'
```

ArchivePassages.lean probes the original declarations and expresses the base-period equality, the window-to-divisibility implication and the final character-to-RH implication in the archive's types. Both archive-linked companion files await elaboration against the full compiled environment. Only the lightweight modules were compiled in this pass.

For a source-level check, every passage ledger row carries a pinned GitHub link and the SHA-256 of the entire original source file. The archive paths begin at the Lake project root. For dependency evidence, bit 1 of the terminal mask is membership of the named constant in the original RH export. This records formal use. It cannot by itself establish equality with a separately constructed object in the manuscript.
