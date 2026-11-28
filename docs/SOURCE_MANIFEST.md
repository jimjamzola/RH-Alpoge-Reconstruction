# Source manifest

This file identifies the formal object that the manuscript describes, and the versions of the documents in this repository. Hashes are SHA-256.

## 1. The formal archive reconstructed

| Item | Value |
|---|---|
| Archive | The Lean 4 proof archive released by Levent Alpöge on 20 November 2026 with the note [*Remark*](https://alpo.ge/remark.pdf) |
| Published archive | Fourteen files at https://alpo.ge/lean.tar.gz.part01 through `.part14`, joined in numerical order |
| Form in which it was obtained | One gzipped tarball `lean.tar.gz`, also split into fourteen parts `lean.tar.gz.part01` to `part14` |
| Date obtained | 20 November 2026 |
| `lean.tar.gz` SHA-256 | `9631b4f020199e580ba86178cb56c6e9b09f690c2369a80dc4334aa93f49c7fc` |
| Concatenation of `part01` to `part14` | same SHA-256 as `lean.tar.gz` |
| Git mirror revision | [Original commit 40e56bab026552e089d7afcfeff08d2defb9c005](https://github.com/leanprover-community/riemann-hypothesis/tree/40e56bab026552e089d7afcfeff08d2defb9c005). The archive's `lean/` maps to the repository root. Root tree `e517b335d21898fd2506ad538a1e1775c0aaa4e4`, source subtree `b41b516b1f7baee4d83ced235ecc71fd43c97695`. The [archive comparison](../review/evidence/archive-verification.txt) covered all regular files and independently recomputed the Git tree. |
| Contents | 175,190 regular files, namely 175,187 `.lean` files plus `lean-toolchain`, `lakefile.toml` and `lake-manifest.json` |
| Size | 17,374,215 lines, 1,030,531,854 bytes of Lean source |
| Compiled artifacts shipped | none (no `.olean`, `.ilean`, `.lake/` or `build/`) |
| Per-file hash list | 175,190 lines, SHA-256 of the list `380706b2ca07209ec036033503a2cfb11ce3d5a7dc002d172174f4b41d65d0a6`. Not included here because of its size (about 30 MB). It can be regenerated from the tarball |
| Integrity of the working copy | every file in the tarball was hashed and compared with the extracted tree used for the reconstruction. Mismatches 0, missing 0, extra 0 |

The [companion instructions](../review/REPLAY.md) describe the checks run on the reconstruction and the checks that require a full archive build.

### Build configuration of the archive

| Item | Value |
|---|---|
| `lean-toolchain` | `leanprover/lean4:v4.33.1` |
| Lake package | `tree` (`lakefile.toml`, `srcDir = "src"`) |
| Extra Lean arguments | `--tstack=400000` |
| Package options | `autoImplicit = false`, `relaxedAutoImplicit = false`, `maxSynthPendingDepth = 3`, `pp.unicode.fun = true`, `maxHeartbeats = 4000000` |
| Libraries | `BuildAid`, `CompanionTheory`, `Development`, `Formalism`, `GroundTheory`, `GroundTheoryFields`, `Lemmata`, `PositivityTheory`, `ReciprocityTheory`, `Supplements`, `Main` (roots `Statements`, `Main`) |
| Intended build target | `lake build Main` |

### Pinned dependencies (from `lake-manifest.json`)

| Package | Repository | Revision |
|---|---|---|
| mathlib | `https://github.com/leanprover-community/mathlib4` | `0df444a360eaa60ab8c11dca51a86af692955474` |
| plausible | `https://github.com/leanprover-community/plausible` | `b7eb3304aeae834b12dda98993a37f6a41f6f0bb` |
| LeanSearchClient | `https://github.com/leanprover-community/LeanSearchClient` | `5f4d51b81cbd3f6b32b156bfad9056621a040404` |
| importGraph | `https://github.com/leanprover-community/import-graph` | `16f02aa7642864af59f1ff0e384a015994db9118` |
| proofwidgets | `https://github.com/leanprover-community/ProofWidgets4` | `4be2e3d5087eeb272cf5a8853b8f9dd025ef5957` |
| aesop | `https://github.com/leanprover-community/aesop` | `3448c0bcc5ce01b2d1546e483ec3620e32df3d0e` |
| Qq | `https://github.com/leanprover-community/quote4` | `92c15be17b7caf78c2ad767ec40f89052d908d81` |
| batteries | `https://github.com/leanprover-community/batteries` | `4488d40d070b9700d4d5a6aa342f0d40c31b2a2d` |
| Cli | `https://github.com/leanprover/lean4-cli` | `6130a47896ce867c6a4a55373441e59e565bad0f` |

The Mathlib commit exists on GitHub (commit message `chore: bump toolchain to v4.33.1`, dated 21 August 2026), its own `lean-toolchain` is `leanprover/lean4:v4.33.1`, and the eight transitive revisions above agree with Mathlib's own manifest at that commit.

### The final theorem

`lean/src/Main.lean` (path inside the tarball), line 4.

```lean
theorem riemannHypothesis : RiemannHypothesis := rhOfAll
```

`Main.lean` also proves `riemannZeta_eq_zero_re`, `LFunction_ne_zero_of_half_lt_re`, `LFunction_eq_zero_re` and `LFunction_eq_zero_re_of_isPrimitive`, whose types are defined in `Statements.lean` from Mathlib's `riemannZeta` and `DirichletCharacter.LFunction`.

A search of all 175,187 files finds no declaration that introduces the names `RiemannHypothesis` or `riemannZeta`, so `RiemannHypothesis` is Mathlib's definition (`Mathlib/NumberTheory/LSeries/RiemannZeta.lean`, line 185, at the pinned commit). This is a reading of the source. Lean confirms name resolution when the file is elaborated.

## 2. Formal verification information

| Item | Status |
|---|---|
| Kernel replay (`lake build Main`) | **not run** in this work. The attempt of 20 November 2026 was blocked by the environment (the Mathlib cache hosts were unreachable, and the available machines lacked the memory, disk and run time). This says nothing for or against the proof |
| `#print axioms riemannHypothesis` | not run |
| `lean4checker` | not run |
| Formal check by a third party | done by the Lean and Mathlib communities, who certified on 21 November 2026 that both the statement and the proof are correct ([joint statement](https://leanprover-community.github.io/blog/posts/riemann-hypothesis/)) |
| Textual trust audit of the full closure | done. Zero occurrences of `axiom`, `sorry`, `admit`, `unsafe`, `native_decide`, `implemented_by`, `extern`, `opaque`, `ofReduceBool`, `trustCompiler`, `skipKernelTC` or any kernel-disabling option, comments included. Metaprogramming present and noted for a kernel-level check: `addDecl` in one file (a theorem-copying command), and custom tactics `kcopy` and `kexactB` (56 files mention one of these three) |
| Dependency closure | following `import` lines from `Main.lean`, the closure is all 175,187 project files |

The formal check of the archive is the one made by the Lean and Mathlib communities ([joint statement](https://leanprover-community.github.io/blog/posts/riemann-hypothesis/)). Section 4 records the commands for a reader who wants to reproduce a build.

### Additional external verification report

In [issue #10](https://github.com/jimjamzola/RH-Alpoge-Reconstruction/issues/10), Manuel Menéndez-González (Fundación de Neurociencias / CoResearcher) shared the v1.4 verification dossier for the original archive. The following records are pinned to dossier commit [`0143de8`](https://github.com/Fundacion-de-Neurociencias/riemann-hypothesis-audit-dossier/tree/0143de873669d518f9193b01119052cdd0379cad). The archive SHA-256 in its certificate agrees with Section 1 above.

| Check | Result reported by the dossier | Published record |
|---|---|---|
| Compilation with `lake build Main` | Exit code 0; 175,187 project modules, using Lean v4.33.1 and Mathlib `0df444a3` | [Kernel certificate](https://github.com/Fundacion-de-Neurociencias/riemann-hypothesis-audit-dossier/blob/0143de873669d518f9193b01119052cdd0379cad/certificates/alpoge_rh_kernel_certificate.json) |
| Axiom trace for the five root exports | Only `propext`, `Classical.choice`, and `Quot.sound` | [Axiom log](https://github.com/Fundacion-de-Neurociencias/riemann-hypothesis-audit-dossier/blob/0143de873669d518f9193b01119052cdd0379cad/certificates/alpoge_rh_axioms.log) |
| `lake env leanchecker --fresh Main` | The published log records start and finish times and exit code 0 | [Fresh replay log](https://github.com/Fundacion-de-Neurociencias/riemann-hypothesis-audit-dossier/blob/0143de873669d518f9193b01119052cdd0379cad/certificates/alpoge_rh_leanchecker_fresh.log) |
| `lean4lean` module replay | 175,187 modules and 1,927,488 declarations; no failed modules | [Replay summary](https://github.com/Fundacion-de-Neurociencias/riemann-hypothesis-audit-dossier/blob/0143de873669d518f9193b01119052cdd0379cad/certificates/lean4lean_summary.json) |

For this documentation update, five retrieved files (the kernel certificate, axiom log, fresh replay log, replay summary, and cross-audit JSON) were hashed and matched against the pinned [`SHA256SUMS.txt`](https://github.com/Fundacion-de-Neurociencias/riemann-hypothesis-audit-dossier/blob/0143de873669d518f9193b01119052cdd0379cad/SHA256SUMS.txt). The certificate's hashes for `src/Main.lean` and `src/Statements.lean` also match those files at the original source pin `40e56bab026552e089d7afcfeff08d2defb9c005`. These are artifact-integrity and source-identity checks; no compilation or kernel replay was rerun for this update. The internal execution statuses in the table above remain unchanged.

The dossier states that its `lean4lean` module replay trusts precompiled Mathlib and imported `.olean` boundaries, and distinguishes it from the reported `--fresh` replay. Those reported executions are not independently reproduced by checking their published hashes.

The [reconstruction cross-audit](https://github.com/Fundacion-de-Neurociencias/riemann-hypothesis-audit-dossier/blob/0143de873669d518f9193b01119052cdd0379cad/certificates/phase2_prose_reconstruction_cross_audit.json) concerns snapshot `b50dae1`. Its coverage figures describe that snapshot and its stated counting method; they are not measurements of the current manuscript's mathematical correctness. Recording this report does not verify the prose reconstruction or establish equivalence with the later readable refactor, and no original-to-refactor statement comparison or refactor replay was performed for this update.

## 3. Versions of the documents in this repository

| Document | Version | SHA-256 |
|---|---|---|
| `manuscript/main.tex` | 25 November 2026, community review edition (multi-file source) | `92042b1410b70ddb41eb8c08e43203567eb66d01d4a0ce36a4f827a6ed678dab` |
| `manuscript/main.pdf` | 297 pages, compiled from the 25 November 2026 source | `8361fb258bd06713645b56eecc8a194791a9c6499cc14d5ef596824e8197e5f1` |
| `RH_Route_Notes.tex` | 21 November 2026 (end-to-end reconciliation pass), 66 pages | `9613835dadf51040b800aed1db5119f59b19ffe6b2b491ffe4345238f546506a` |
| `RH_Route_Notes.pdf` | compiled from the source above on 21 November 2026 | `7a403dc745cad5d665bf78dddb1cacf2936d3b94e8434eab051506cad6e397cd` |
| `audit/Post_Closure_Synthesis.pdf` | post-closure-wave synthesis, 21 November 2026 | `0c7972aa3b155af86255865830b6dda90cce3e498c0cfaaa3610ab27ab56a4fc` |
| `audit/Post_Closure_Internal_Residuals.md` | 21 November 2026 | `7fdc8a6f58111cb168e67630921dd659e36896c56d357e120555c8478e588e4a` |
| `audit/Post_Closure_Verification_Boundary.md` | 21 November 2026 | `fbeec4c303342fc03fb7264b5feb2f5100cbdb31c3210c81f9c22ac048652e44` |

Reconstruction snapshot dates: **21 November 2026** for `RH_Route_Notes` and the audit synthesis, **25 November 2026** for the current manuscript. All of them describe the archive identified in Section 1.

## 4. Reproducing the formal check

These commands are recorded for a reader with a suitable machine (many cores, 64 GB or more of memory, on the order of 100 GB of free disk, and network access to the Mathlib cache). They were not run in this work.

```sh
shasum -a 256 lean.tar.gz      # expect 9631b4f020199e580ba86178cb56c6e9b09f690c2369a80dc4334aa93f49c7fc
mkdir replay && tar xzf lean.tar.gz -C replay && cd replay/lean
find . -name '*.olean' -o -name '.lake'      # expect nothing
elan toolchain install leanprover/lean4:v4.33.1
lake exe cache get                           # Mathlib oleans, not project artifacts
lake build Main 2>&1 | tee build.log
printf 'import Main\n#check @riemannHypothesis\n#print axioms riemannHypothesis\n' > Check.lean
lake env lean Check.lean
```

A replay of the compiled environment through the kernel, independent of the elaborator, can then be made with `lean4checker` at the tag matching v4.33.1, run on module `Main`. Lean's standard axioms (`propext`, `Classical.choice`, `Quot.sound`) are expected through Mathlib, and any further axiom would need to be reported.
