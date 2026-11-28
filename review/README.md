# Reviewing the manuscript against the archive

Begin with a passage in the [manuscript](../manuscript/main.pdf) and its entries in the [passage ledger](passage-ledger.tsv). The ledger records the scope of each comparison. The statement index also lists passages awaiting a link.

## What a reviewer still has to establish

| Passage | Specific remaining work |
|---|---|
| §17.4.3 | Check the integral lattice construction, stable separation and invariant forms, the arithmetic face-complex torsion estimate, and the tower and duality comparisons with the stated hypotheses. The text gives the deductions from these results and their source locations. |
| §14 | Compare the independently defined seesaw period with the rational definite period on pairs of basis vectors, at the single common embedding needed for the Bessel realization. Away from the base tuple, identify the scalar in the chosen normalizations. |
| §15 | Match the concrete row inclusion, reduced Gram matrices, positive-side hooks and finite-level measures. The size estimate and the cost of increasing the frame error have been computed. |
| §18.7 | On the chosen family, compare the actual Hecke lattices, test systems, kernel and pairing, indices and local lengths with the earlier constructions. The paragraph on word heights gives the formula that must agree and proves the recorded variation bound. The concluding paragraphs specify outstanding prerequisites, including the covolume comparison and the rank-four and integral theta inputs. |

The mathematical review concerns the prose and its correspondence with the pinned proof. Building a reader can proceed independently using the files below. Issue 2 remains assigned to the optimization project. The issue 3 audit and its comparison with the later cleanup are preserved in the [original-name audit](evidence/issue3-85.tsv) and the [later-name comparison](evidence/community-cleanup.tsv). [Issue 2](https://github.com/jimjamzola/RH-Alpoge-Reconstruction/issues/2) · [Issue 3](https://github.com/jimjamzola/RH-Alpoge-Reconstruction/issues/3)

## Files for independent checking

- [Passage-to-Lean ledger](passage-ledger.tsv) gives 60 comparisons, 148 passage–declaration links, manuscript line ranges, pinned source links, source-file hashes, the original RH dependency bit, and the scope of each conclusion. Some declarations serve several passages. One supplementary equivalence is outside the RH dependency cone. The frame entries use the live declarations ending in scal_rowsR and scal_liftsR.
- [Statement index](statement-index.tsv) gives all 453 theorem-like environments, including hypotheses, definitions and remarks, and indicates when this pass supplies a comparison. An overlapping passage identifies material for review. It does not certify a whole theorem. The index does not count every assertion in running prose.
- [Manuscript references](manuscript-references.tsv) lists the 1,144 explicit references and citations appearing in those statements and their immediately following proofs. These are author-written references. Some dependencies are implicit or occur in intervening prose.
- [Explicit omissions](explicit-omissions.tsv) collects the 29 passages marked as such by the author. Other conditional inputs appear in hypothesis environments and in §18.7.
- [Lean checks and reproduction](REPLAY.md) distinguishes the ten locally checked lemmas from the archive-dependent files. [K1 inputs](evidence/K1-inputs.tsv) and [the original terminal paths](evidence/RH-paths.tsv) preserve the prior proof audit. [Passage dependency paths](evidence/passage-RH-paths.tsv) records the sequence of formal references from RH to every live declaration in the new ledger. [Preserved alternatives](optimization_preservation/README.md) gives the provenance of the shortcuts.

## Issue #1: period conventions

The [period-normalization comparison](issue1-period-normalization.md) answers the three reported questions: the good-subspace restriction, the defining family tie, and the inverse conventions for the two scalar multipliers. It also distinguishes the rational row map from the complex orthogonal section. These source-level answers do not certify the separate comparison of independently constructed geometric period models or their finite-place normalizations.
