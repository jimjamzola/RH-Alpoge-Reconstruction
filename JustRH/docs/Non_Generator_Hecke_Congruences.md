# The trimmed projection at the non-generator primes

Fix a lift \(j\) and a shift at a balanced mesh point. At a twisted place \(w\) of residue characteristic \(l\notin\{g_0,g_1\}\), use one trimmed lattice \(M=\pi_S(\Lambda_i)\) from §17 of the 297-page manuscript. Let \(O\) be its splitting discrete valuation ring, with fraction field \(K\), valuation \(v(\varpi)=1\) and \(e_O=v(l)\). Use the integral Hecke algebra \(T\) acting on \(M\). In the split semisimple setting of §17 write
\[
  K M=\bigoplus_{a\in S}V_a,\qquad m_a=\dim_K V_a.
\]
The character \(t\mapsto a(t)\) takes values in \(O\). Let \(G\) be the good labels in \(S\) and \(B=S\setminus G\). For \(a\in G,\ c\in B\), put
\[
  \delta(a,c)=\min_{t\in T}v(a(t)-c(t)),\qquad v(0)=+\infty.
\]
Separation makes this a finite nonnegative integer. It counts the powers \(\varpi^k\), \(k\ge1\), modulo which the characters agree on every integral Hecke operator.

**Lemma.** The trimmed projection quotient \(Q=\pi_G M/(M\cap V_G)\) satisfies
\[
  \operatorname{length}_O Q
    \le \sum_{a\in G,\ c\in B}\min(m_a,m_c)\,\delta(a,c).
\]

**Proof.** Projection induces two \(T\)-equivariant identifications
\[
 Q\simeq M/\big((M\cap V_G)+(M\cap V_B)\big)
   \simeq \pi_B M/(M\cap V_B).
\]
Order the good labels and let \(A_i\subset Q\) be the image of the intersection of \(\pi_G M\) with the first \(i\) good eigenspaces taken in direct sum. The successive quotient \(A_i/A_{i-1}\) is a quotient of an \(O\)-lattice in \(V_{a_i}\): project the filtered lattice to its last coordinate. It has at most \(m_{a_i}\) generators and \(t\) acts on it as \(a_i(t)\). The bad projection defines a second filtration \(B_k\) with corresponding bounds \(m_{c_k}\) and actions \(c_k(t)\).

For each \(i\), filter \(A_i/A_{i-1}\) by the images of \(A_i\cap B_k\). Its factors are
\[
 \frac{A_i\cap B_k}
 {(A_{i-1}\cap B_k)+(A_i\cap B_{k-1})}.
\]
Each factor is also a subquotient of \(B_k/B_{k-1}\), by interchanging the filtrations. Thus \(a_i(t)-c_k(t)\) kills it for every \(t\). A subquotient of an \(r\)-generated finite module over a DVR has at most \(r\) generators: lift its defining submodule to \(O^r\), where every submodule is free of rank at most \(r\). The factor therefore has at most \(\min(m_{a_i},m_{c_k})\) generators and exponent dividing \(\varpi^{\delta(a_i,c_k)}\). Summing lengths proves the lemma, including empty label sets.

**A test on the chosen data.** At each component one may use the minimum over any available finite collection of integral Hecke operators as an upper bound for \(\delta\). For a pair of labels it suffices that one of the chosen operators separate the pair. Put \(P_{j,w,i}=\sum_{a,c}\min(m_a,m_c)\delta(a,c)/e_{O_i}\) for that component. If
\[
 \sum_{\substack{w\ {\rm twisted}\\p_w\notin\{g_0,g_1\}}}
       \ell_w e_w\sum_i P_{j,w,i}
 \le C d_j^0 x^\varepsilon(B_0+N_c)
\]
for every lift with one \(C\) across the selected mesh points and windows, then the non-generator part of Kimi's trimmed estimate \((\mathrm{CD}_1)\) holds there. This follows by multiplying the lemma by the original place weight and summing. This sufficient test may overcount congruences. In particular, the projection quotient can vanish even when a positive-depth pair occurs.

**Size of one congruence.** Over \(O\), let \(T=\{(a,b)\in O^2:a-b\in\varpi^hO\}\), acting diagonally. With one good and one bad label, take \(M=T\) in \(K^2\) and \(h\ge1\). The good projection is \(O\), its intersection lattice is \(\varpi^hO\), and the length is \(h=\delta\). Taking \(M=O^2\) with the very same characters gives length zero. Thus good and bad multiplicities equal to one and separation alone allow arbitrarily large defect. For the balanced automorphic family the missing input in this test is an arithmetic estimate for the number and depths of the cross congruences, or a direct estimate for the particular lattices that improves on counting the pairs.

Source definitions and normalization: §17, Definition 17.1 and the subsection “The local Hecke setting” in the historical manuscript, and §3 of the integrated shift-defect report. The lemma above is a local argument on paper.

## Splitting by tame inertia at the two level primes

Keep the coefficient characteristic \(l\ne g_0,g_1\). For a host place \(u\mid g_0g_1\), fix a lift \(\tau_u\) of a tame inertia generator and put \(q_u=\mathrm Nu\), \(n=n_V\). At a label \(a\), record the characteristic polynomial of \(r_a(\tau_u)\). A class \(H\) consists of labels having the same polynomials at every such \(u\), including root multiplicities. The places \(u\) are used to test representations at the coefficient place \(w\).

**Hypotheses for this reduction.** Use integral Galois representations on the retained labels. Assume their characteristic-polynomial coefficient functions at the \(\tau_u\) belong to \(T\), and their local representations are tame at \(u\). In the source, the first property follows from \(\mathrm{GoodR}\) and the split-place Chebotarev clause by \(\mathrm{charpoly\_clause\_of\_chebotarev}\). For the second, \(\mathrm{CutD.Good.nice}\) gives \(\mathrm{Nc}\) for the local automorphic parameters of retained labels. With existence of a matching parameter and inertia local–global compatibility at each \(u\), its \(\mathrm{Tm}\) clause gives characteristic polynomial \((X-1)^n\) on wild inertia. Indeed the wild image is finite since its pro-\(g_k\) image intersects the pro-\(l\) kernel of reduction in the identity. Its unipotent elements of finite order are trivial in characteristic zero. These are arithmetic attachment and compatibility premises on the selected data. Balancing alone does not supply them.

**Proposition.** Define
\[
 N_u=\prod_{d=1}^{n}(q_u^d-1),\qquad
 D=\prod_{u\mid g_0g_1} N_u^{\,n},\qquad d_G=\dim_K V_G .
\]
Set \(M_H=\pi_H M\) and \(G_H=G\cap H\). With \(\eta\) the original normalized projection length,
\[
 \left|\eta(M,G)-\sum_H\eta(M_H,G_H)\right|\le d_G\,v_l(D).
\]

**Proof.** Arithmetic Frobenius acts on tame inertia by the \(q_u\)-power map. The multiset of eigenvalues of \(r_a(\tau_u)\) is therefore stable under this power. The orbit of a distinct eigenvalue has size \(d\le n\), so its order divides \(q_u^d-1\). All the roots lie in \(\mu_{N_u}\).

For one \(u\) write \(N=N_u\) and adjoin \(\mu_N\) to the coefficient field. For \(\xi\in\mu_N\) put \(L_\xi(z)=\sum_{b=0}^{N-1}\xi^{-b}z^b\). On \(\mu_N\) it takes value \(N\) at \(\xi\) and zero elsewhere. For a multiset \(h\) of \(n\) roots, sum \(\prod_{k=1}^n L_{\xi_k}(z_k)\) over the **distinct** orderings \((\xi_1,\ldots,\xi_n)\) of \(h\). For a given ordered input, exactly one term survives if its multiset is \(h\). The symmetric polynomial obtained in this way has integral coefficients and value \(N^n\mathbf1_h\) on the root tuples. By the fundamental theorem of symmetric polynomials it is an integral polynomial in the characteristic coefficients, with the usual signs. Thus \(N^n\pi_h\) preserves the lattice after scalar extension, including for repeated eigenvalues. Multiplying over the places gives \(D\pi_H\) for each simultaneous class. Membership of its matrix entries in \(O\) descends because they are in \(K\) and integral in the extension.

Let \(M'=\bigoplus_H M_H\). Then \(DM'\subseteq M\subseteq M'\), as one sees by applying each integral \(D\pi_H\) and adding. Both inclusions \(\pi_G M\subseteq\pi_G M'\) and \(M\cap V_G\subseteq M'\cap V_G\) have cokernel killed by \(D\) and length at most \(d_G v(D)\). The difference of the two projection lengths is the difference of these two indices. Since \(\eta(M',G)=\sum_H\eta(M_H,G_H)\), division by \(e_O\) proves the assertion.

**Sum on the mesh.** The integer \(D\) is common to all coefficient places and components of this host. It satisfies
\[
 \log D\le \tfrac12 n^2(n+1)[E:\mathbb Q]\log(g_0g_1).
\]
Indeed \(\sum_{u\mid p}\log q_u\le[E:\mathbb Q]\log p\). Under the standard rank comparison \(\sum_i d_{G_i}\le d_j^0\), the absolute error in the weighted non-generator sum is at most \(d_j^0\log D\), by the place-weight identity of §17. On the manuscript's scales, \([E:\mathbb Q]=4|H_{\rm host}|\), \(|H_{\rm host}|\le2x^{2+8\varepsilon}\), \(n=r+t_r\) is polynomial in \(x\), and \(\log(g_0g_1)\le18x^\varepsilon\). Thus \(\log D\le b=\exp(x^\varepsilon)\) for all sufficiently large \(x\) at fixed \(\varepsilon>0\). Since \(B_0=fmbx^\varepsilon\), the error fits the \((\mathrm{CD}_1)\) budget uniformly. Pure classes contribute zero. The remaining sum consists of classes containing both good and bad labels with identical characteristic polynomials at all these inertia generators. The proof gives no count or size estimate for those classes.

At \(l\nmid D\), every original local component already has a single inertia class. Indeed the characteristic coefficients agree modulo \(\varpi\) throughout that component, and reduction is injective on \(\mu_{N_u}\) because \(X^{N_u}-1\) has distinct roots in residue characteristic \(l\). Equal reduced polynomials then give identical root multisets upstairs. Thus the new bound controls mixing between inertia classes at the divisors of \(D\). Mixed components outside those divisors pass directly to the next test.

Local inputs can be located in §17 of the manuscript, \(\mathrm{CutD.Good}\) in HeckeGaloisCriteria/RhoBar.lean, \(\mathrm{Tm}\) and \(\mathrm{Nc}\) in TypeConditions/AutomorphicGaloisAdmissible.lean, and the Chebotarev clause and the inertia comparison in ExistsInertiaCharpolyFactorOfTameType.lean. The size estimates are in §§5 and 16. The tame conjugation fact is the action on \(I_K/P_K=\widehat{\mathbb Z}'(1)\) in Fontaine–Ouyang, *Theory of \(p\)-adic Galois representations*, §0.3.

## A trace test inside a remaining mixed class

First, the exact pairwise difference ideal in a retained local order is generated by \(a(H_{v,k})-c(H_{v,k})\) for the split unramified Hecke operators away from \(l,S_i,Q_i\). Reducing modulo the ideal of these differences makes the two \(O\)-algebra evaluations equal on a generating set, hence everywhere. The same ideal is generated by the coefficient differences of the Hecke polynomials since their norm factors are \(l\)-adic units. Every pair in a single local factor agrees modulo \(\varpi\). Its two residue evaluations have the same maximal ideal as kernel and both induce the identity on the image of the constant residue field, which maps onto the quotient. Restriction to a class preserves these statements. See \(\mathrm{T\_gen}\) and \(\mathrm{heckePol}\) in DataN.lean and the restricted algebra in OptInEqSome.lean.

Here is a simultaneous test using only \(H_{v,1}\). Fix one mixed class and restrict all label vectors to it. Assume the §17 semisimple Hecke–Galois attachments, split-place Frobenius density, the good-label decomposition containing \(\chi^1\), the multiplicity-free clause of \(\mathrm{At.G3}\), and the implication of \(\mathrm{admG6}\) that a \(\chi^1\)-line forces membership in \(Z\). Because the trim has \(Z\cap S=G\), the multiplicity of \(\chi^1\) in \(r_a\) is exactly \(\mathbf1_{G_H}(a)\). Here \(\chi^1\) denotes the first designated character. The good-label decomposition is the one displayed in §17 and in GoodCongruenceObjects. The Galois and character-line clauses appear in SumRepresentations.lean and DecompositionData.lean.

Let \(b_H=\mathbf1_{G_H}\) and let \(U\subseteq O^H\) be the \(O\)-span of the split-place columns
\[
 t_v=(\operatorname{tr}r_a(\operatorname{Frob}_v))_{a\in H}=(a(H_{v,1}))_{a\in H}.
\]
Then \(b_H\in KU\). Indeed the image of the group algebra over \(K\) on the direct sum of the \(r_a\) and \(\chi^1\) is a finite-dimensional semisimple algebra. Its radical annihilates this faithful semisimple module. The central idempotent belonging to the one-dimensional simple module \(\chi^1\) has trace \(b_H(a)\) on each \(r_a\). Lifting it to the group algebra writes \(b_H\) as a finite \(K\)-linear combination of group trace vectors. Each such vector belongs to \(KU\) by continuity, Frobenius density and closedness of a finite-dimensional \(K\)-subspace. The proof uses the global character line. For example, the \(\mathrm{admG5}\) diagonal formula at an auxiliary \(v\in Q_i\) assigns every label the very same inertia polynomial \((X-1)^r(X-\chi^1(\gamma))^{t_r}\).

Let \(h_H\) be the least \(h\ge0\) with \(\varpi^h b_H\in U\). This exists by the preceding argument. A corresponding integral linear combination of first Hecke operators acts as \(\varpi^{h_H}\pi_{G_H}\) on the class. Consequently
\[
 \eta(M_H,G_H)\le \frac{\dim_K V_{G_H}}{e_O}\,h_H .
\]
There is one scalar denominator per mixed class. It is a sufficient bound on the exponent of the lattice quotient and can exceed its actual exponent.

For a finite matrix \(A\) of allowed columns with \(s=\operatorname{rank}_K A=\operatorname{rank}_K[A\mid b_H]\), write \(I_s\) for the ideal of its \(s\)-rowed minors. The least exponent for these columns is exactly
\[
 h_H(A)=v(I_s(A))-v(I_s([A\mid b_H])) .
\]
Indeed this difference is the length of \((\operatorname{im}A+Ob_H)/\operatorname{im}A\). Both lattices have the same saturation in \(O^H\), and Smith normal form gives their indices in it. The quotient is cyclic, generated by \(b_H\). Thus a finite choice with the stated rank gives a verifiable upper bound \(h_H\le h_H(A)\). If the rank increases upon adjoining \(b_H\), that choice gives no certificate. Finitely many columns attain the full-span minimum since \(O^H\) is Noetherian.

It suffices to bound the weighted sum of \(\sum_{i,H}\dim V_{G_H}\,h_H(A)/e_{O_i}\), with one constant across the selected shifts and scales. For instance, a nonzero rational integer \(D_j'\) with \(h_H(A)\le e_{O_i}v_{p_w}(D_j')\) at every such class costs at most \(d_j^0\log|D_j'|\). The allowed test places must be valid for each component. The manuscript's qualitative density and generation statements provide neither a small common integer nor a uniform bound on this weighted sum. No matrices of eigenvalues for the selected balanced family were supplied by the shift-defect report.

As a check on the distinction, at \(l=3\) take the trivial and \(3\)-adic cyclotomic characters to powers \(0\) and \(k=2\cdot3^{h-1}\), respectively, on \(G_{\mathbb Q}\), with the trivial label good. All columns \((1,p^k)\) at \(p\ne3\) have equal coordinates modulo \(3^h\). The columns at 2 and 17 have determinant of valuation exactly \(h\), since \(v_3(4-1)=1,\ v_3(17^2-1)=2\), and cubing an element of \(1+3\mathbb Z_3\) increases the valuation of its difference from 1 by one. These two columns give exactly the trace denominator \(3^h\). This is a rank-one example outside the balanced family. It shows why qualitative detection, even at two fixed test primes, supplies no absolute bound on the depth as the characters vary.

## Removing the full-length strings

The following conditional paper argument bounds a portion of the defect inside a single inertia class. It bypasses the minors of the full trace table. Write \(r+t=n_V\), where \(t=t_r>r\), \(d=[E:\mathbb Q]\), \(\chi=\chi^1\), and \(\epsilon\) for the cyclotomic character. Keep \(l\ne g_0,g_1\).

Use the §17 cut, multiplicity comparison, actual semisimple Galois attachments, split Hecke–Galois and inertia compatibility, and the characteristic-zero string decomposition. Take the following specific inputs.

* Good labels have the global summand \(\bigoplus_{a=0}^{t-1}\chi\epsilon^{-a}\). At a chosen \(u\mid g_0\) the residual rank-\(r\) complement avoids the eigenvalue of \(\chi\) on a tame generator. The cut retains good labels, and a retained label with a global \(\chi\)-line is good, by G6 and the cut's theta clause. An eigenline over a finite coefficient extension descends for this test since its defining simultaneous linear equations are over the coefficient field.
* Use G1 for traces of arbitrary group elements, G2 for crystallinity and a common multiset of labelled Hodge–Tate weights at **every** place over \(l\), G4 outside \(S_i,Q_i,l\), and the G5 inertia formula at the auxiliary and distinguished places in \(S_i\cup Q_i\) away from the two level primes. At the latter primes use the tame inertia comparison proved under the hypotheses of the preceding reduction.
* A full-length label has a global summand \(\bigoplus_{a=0}^{t-1}\psi\epsilon^{-a}\) for a character \(\psi\). In the source string decomposition a block of length at least \(t\) has rank-one seed, since \(2t>r+t\). With the residual constituent count consisting of one irreducible of dimension \(r>1\) and \(t\) one-dimensional constituents, such a block also has length at most \(t\). For this last inference the count comes from residual semisimplification of the strings. Repeating a rank-one character \(s\) times with twists already uses \(s\) one-dimensional residual constituents.

Fix an inertia class \(H\) with a good label. Denote its good subset by \(G_H\), and let \(M_H\) be the projected lattice from the preceding reduction. The full-length assertion below uses no bound for the previously introduced trace minors.

**Proposition.** At all non-generator coefficient primes one may delete every bad full-length label, projecting \(M_H\) onto the retained labels. The increase needed in the upper bound for the original defect, summed with the §17 weights for lift \(j\), is at most \(d_j^0\log A\), for one positive integer \(A\) per host with \(\log A\ll x^C\) at fixed \(\varepsilon\). Thus this entire removal fits the \((\mathrm{CD}_1)\) budget for sufficiently large scales.

**A trace on the \(t\) character lines.** At \(u\mid g_0\) put \(z=\chi(\tau_u)\). The characteristic polynomial in the class is \((X-z)^t F(X)\), with \(F(z)\) a unit by the good residual nonroot condition. The two factors are comaximal in \(O[X]\). Choose \(P=1\bmod (X-z)^t,\ P=0\bmod F\). For each label \(x\) let \(P_x=P(r_x(\tau_u))\). It projects onto the \(z\)-primary space, of dimension \(t\). For a full-length label the \(t\) characters in its string agree on inertia at \(u\). Their common value at \(\tau_u\) must be \(z\), since no other root can have multiplicity \(t>r\). The whole primary space is consequently its global string. For all \(\gamma\in G_E\) the function
\[
 T_\gamma(x)=\chi(\gamma)^{-1}\operatorname{tr}\big(P_xr_x(\gamma)\big)
\]
belongs to the restricted Hecke algebra by expanding \(P\) and applying G1 to \(\tau_u^k\gamma\). On a full-length label it is the sum of the \(t\) character values \(\lambda_a(\gamma)\), with \(\lambda_a=(\psi/\chi)\epsilon^{-a}\). This identity also describes good labels with \(\psi=\chi\).

**Ramification and weights.** All these \(\lambda_a\) are unramified away from \(l\). Away from \(S_i,Q_i,l\) this follows from G4 and the good \(\chi\)-line. At every \(v\mid g_0g_1\), equality of the inertia polynomials in the class forces \(\psi(\tau_v)=\chi(\tau_v)\) by the same majority argument. Here even without the residual nonroot at \(v\), the good polynomial has at least \(t>r\) copies of \(\chi(\tau_v)\). Tameness makes equality on the generator sufficient. At the other exceptional inertia groups G5 gives eigenvalues \(1\) repeated \(r\) times and \(\chi(\gamma)\) repeated \(t\) times, on every inertia element \(\gamma\). Again only the latter can occur \(t\) times when they are distinct.

Over \(l\), the characters are crystalline as rank-one subquotients and tensor products of crystalline representations. Write their restrictions under local reciprocity on \((\mathcal O_E\otimes\mathbb Z_l)^\times\) as \(\prod_{\tau}\tau(u)^{k_\tau}\), in a coefficient field containing all embeddings. For a crystalline character this formula holds on the full unit group, including at ramified \(l\) and at 2. The integers are its labelled weights up to the common reciprocity sign. At each embedding the good and full-length strings give two intervals of \(t\) consecutive weights inside the same multiset of size \(t+r\). Their starting points differ by at most \(r\), since their union has at least \(t+\min(t,|\mathrm{difference}|)\) distinct elements. Thus \(|k_\tau|\le r+t\) for every \(\lambda_a\). For the rank-one local classification see Brian Conrad, *Lifting global representations with local properties*, Appendix B, Propositions B.3–B.4.

**Integral coefficient extraction.** Put \(\Delta=|\operatorname{disc}E|\) and \(K=r+t,\ m=2dK\). More generally, for any degree bound \(m\) define
\[
 J(E,m)=(m!)^d\,\Delta^m
 \left(\prod_{\substack{p\text{ prime}\\p\le m+d\ \mathrm{or}\ p\mid\Delta}}p\right)^m .
\]
For each \(l\), a specified monomial coefficient of a polynomial of total degree \(\le m\) in \(y_\tau=\tau(u)\), multiplied by \(J(E,m)\), is an integral linear combination of evaluations at units \(u\in(\mathcal O_E\otimes\mathbb Z_l)^\times\). The combination depends on the coefficient, field and prime, and works simultaneously for every such polynomial. A finite scalar extension of \(O\) is allowed.

To see this choose an integral basis \(\beta_i\), with \(B=(\tau(\beta_i))\) and \((\det B)^2=\pm\Delta\). If \(l>m+d\) and \(l\nmid\Delta\), use coordinates \(y=Bv\) and reduce. Any polynomial of degree \(\le m\) vanishing at all unit residue coordinates, multiplied by the norm polynomial, vanishes on all of \(\mathbf F_l^d\). It has total degree \(<l\), so it is the zero polynomial even over the extended residue field. The norm polynomial is nonzero, since it takes value 1 at the identity. Thus the evaluation matrix has full column rank in residue characteristic \(l\). A unit minor and the invertible change of coordinates give integral coefficient extraction. Otherwise take \(u=1+l\sum_i j_i\beta_i\), \(0\le j_i\le m\), so every sample is a unit. Tensor-product Lagrange interpolation of the polynomial in the \(j_i\) has denominators dividing \((m!)^d\). To return to \(y\), substitute \(j=l^{-1}B^{-1}(y-\mathbf1)\) in the reconstructed polynomial, whose **total** degree is at most \(m\). The extra denominator divides \(l^m\Delta^m\). These two cases prove the assertion with the stated integer.

**Construction and cost.** For each class \(s\in\mathrm{Cl}(E)\) choose \(\gamma_s\in G_E\) mapping to \(s\) in the Hilbert class group quotient. For a unit \(u\) choose a lift \(\widetilde u\in G_E\) of its idelic Artin image in \(G_E^{\rm ab}\). For each \(s\) form the integral Hecke functions \(\mathrm N(u)^K T_{\gamma_s\widetilde u}\) at the unit samples. On every full-length label this is the polynomial
\[
 \sum_{a=0}^{t-1}\lambda_a(\gamma_s)\prod_\tau y_\tau^{K+k_{\tau,a}},
\]
of total degree \(\le m\). Extract the coefficient of \(\prod_\tau y_\tau^K\) with the factor \(J(E,m)\). It sums exactly the characters with all \(k_{\tau,a}=0\). These are unramified at \(l\) and already unramified everywhere else. Since \(E\) is CM they factor through its ordinary class group. Summing over \(s\) gives \(h_EJ(E,m)\) times the number of trivial characters among the \(\lambda_a\). This number is one on good labels and zero on bad full-length labels by G6. No disjointness between the cyclotomic and Hilbert class fields is required, and no independence of the local representations at different coefficient places is required.

The resulting Hecke operator takes the scalar \(A=h_EJ(E,m)\) on the good spaces and zero on the full-length bad spaces. It has some integral action on all other labels, where a polynomial identity was never used. Apply §17's proposition on removing eigensystems to the **whole** class with retained set \(G_H\) together with the other bad labels. Explicitly, if \(u'\in\pi_{\rm retained}M_H\cap V_{G_H}\), a lift differs from \(u'\) by a deleted vector. Applying the operator gives \(Au'\in M_H\cap V_{G_H}\). The good projection lattice before and after deletion is the same. This proves the local error bound \(\dim V_{G_H}v_l(A)\). Calculating after a finite scalar extension gives the identical normalized lengths by flatness and the cancellation of the ramification index.

Summing gives \(d_j^0\log A\) by the rank and place-weight identities. The elementary estimate \(h_E\le 2^{3d}\Delta\) is in §17. The bounds \(d,n_V,\log\Delta\ll x^{C_0}\) follow from §§5, 16 and 18, including the root-discriminant bound. The logarithm of the prime product in \(J\) is at most \((m+d)\log(m+d)+\log\Delta\). Consequently \(\log A\ll x^C\) uniformly, and hence \(\log A\le b=\exp(x^\varepsilon)\) eventually. This cost is independent of the number of labels, classes, and eigenvalue tables. The preceding inertia-class split has its separate, already budgeted error.

### Short strings with a global sum of characters

There is a further deletion if the split unramified Satake comparisons of §17 hold. Suppose that in a short label (every string length \(s<t\)) the image of \(P_x\) is a \(G_E\)-stable sum of one-dimensional representations. On that label \(T_\gamma\) is the sum of their characters divided by \(\chi\), even when the chosen projector's kernel is not stable. Write \(\lambda\) for any character in this sum and \(e_\lambda=\sum_\tau k_\tau\) for its exponent on the rational scalar units in \(\mathbb Z_l^\times\).

For clarity, use the source normalization in which the good \(\chi\) has upper endpoint \(q^{(t-1)/2}\) after cancelling the common twist at a split unramified place of norm \(q\). A string of length \(s<t\) has eigenvalues \(\alpha q^{(s-1)/2-a}\) with \(0\le a<s,\ q^{-1/2}<|\alpha|<q^{1/2}\). Thus the modulus of **every** eigenvalue after division by \(\chi\) is strictly between \(q^{-t}\) and \(1\). This uses the open Satake bound for all the relevant seeds and the good endpoint identification.

Choose one rational prime \(p\ne l\) completely split in \(E\), outside the finite set of ramification and excluded test primes. At each \(v\mid p\), \(\lambda(\mathrm{Frob}_v)\) is one of these ratios with \(q=p\). Apply global reciprocity to the principal idèle \(p\). The \(l\)-adic unit contribution is \(p^{e_\lambda}\). Away from \(p,l\) the unit images have complex absolute value one since inertia for a one-dimensional \(l\)-adic character at residue characteristic different from \(l\) has finite image (use local abelian reciprocity). The complex places contribute trivially. Taking absolute values in the product identity gives
\[
  p^{-dt}<\prod_{v\mid p}|\lambda(\mathrm{Frob}_v)|=p^{-e_\lambda}<1
\]
with arithmetic Artin normalization. Reversing all reciprocity conventions only changes the sign used for the exponent. In particular \(e_\lambda\ne0\) and \(|e_\lambda|\le dt\). Here no upper bound for the least split prime is needed. The prime is used to prove a statement about an integer and supplies no operator denominator.

To include these short labels in the preceding deletion, put \(U=d(r+t)\). For each group argument \(\gamma\), first apply one-variable extraction to \(z^U T_{\gamma\widetilde z}\) with a rational scalar unit \(z\in\mathbb Z_l^\times\) embedded at every place over \(l\). Extract degree \(U\), paying \(J(\mathbb Q,2U)\). On the specified short labels this gives zero identically in \(\gamma\). On good and full-length labels it selects the lines with \(e_\lambda=0\), since \(|e_\lambda|\le U\) there. Now apply the multivariable extraction and the class-group sum as above. Every line with all labelled exponents zero survived the first extraction. The combined scalar is \(A'=J(\mathbb Q,2U)A\), still with \(\log A'\ll x^C\). §17's deletion argument applies directly, with arbitrary values on every remaining bad label.

Under all these inputs, the remaining non-generator defect is confined to mixed classes containing a short label for which the distinguished \(t\)-dimensional inertia space fails to be a global sum of character lines. No estimate for that remaining defect, and no verification of the §17 attachment hypotheses on the selected balanced family, is obtained here. In particular the number of surviving short labels could still be large. Source pointers for the hypotheses are At.G1–G4, ConclusionG5, ConclusionG6 and ResidualIrreducibility in SumRepresentations.lean, the cut in HeckeGaloisCriteria/RhoBar.lean, ResCount in HeckeCharEqOfLAdicRealisation.lean, and RankOneOfLong.lean, PartFrobEigNormO.lean and StrCalcO.lean under StringRepresentations. This is a paper proof.

Exact arithmetic checks for the interpolation step used the basis \(1,\sqrt2\) at the ramified prime 2. The unit grid recovered the coefficient of \(y_1y_2\) for all 15 monomials of total degree at most 4, with integral scaled coefficients. At 11, evaluation on units had rank 15 over the residue field for both the split quadratic algebra and the quadratic field. These checks concern the coefficient functional only.

## The exact residual defect at one split place

Keep the hypotheses of the short-string deletion, and take the actual projected lattice \(M\) of one remaining mixed class. Write its rational space as \(V_G\oplus V_B\) for its good and surviving bad subspaces. At any allowed split unramified test place \(v\), evaluate the integral Hecke polynomial at \(\chi(\operatorname{Frob}_v)\), and denote the resulting endomorphism of \(M\) by \(F\). The good representations contain \(\chi\). For a short label, the strict Satake bound above puts every Frobenius eigenvalue below the modulus of the good endpoint after the common normalization. This applies also when its distinguished inertia space fails to split globally. Thus \(\ker_K F=V_G\) and \(\operatorname{im}_K F=V_B\). The test place may depend on the component.

Put \(s=\dim V_B\). In an integral basis of \(M\), let \(I_s(F)\) be the ideal of the \(s\)-rowed minors, and write \(v_O\) for the normalized valuation. Then the unnormalized §17 defect is exactly
\[
 \operatorname{length}_O Q
 =v_O\!\left(\det(F|_{V_B})\right)-v_O(I_s(F)).
\]
Indeed let \(L_B=M\cap V_B\). The natural identification \(Q\simeq\pi_B M/L_B\) and the injectivity of \(F\) on \(V_B\) give \(Q\simeq FM/F L_B\). In \(F L_B\subseteq FM\subseteq L_B\), the outer index has length \(v_O(\det(F|_{V_B}))\). The inner image \(FM\) has saturation \(L_B\) in \(M\), so Smith normal form gives \(\operatorname{length}_O(L_B/FM)=v_O(I_s(F))\). Subtract and divide by \(e_O\) for the normalized defect. Up to sign the determinant in the formula is the lowest nonzero coefficient of \(\det(XI-F)\). Thus both terms use one integral matrix. Scaling that matrix by a nonzero scalar of valuation \(a\ge0\) adds \(sa\) to each term and leaves the answer unchanged.

The next arithmetic estimate is for this **difference** summed over the remaining components with weights \(\ell_we_w/e_O\), uniformly on the selected mesh. The local equality supplies no height bound for that sum.

## Testing several endpoints of a short string

Write \(C_h=\chi\epsilon^{-h}\) for \(0\le h<t\). Keep the hypotheses of the preceding short-string argument, including the good endpoint normalization, the strict Satake bound at split places, and crystallinity at every place above \(l\ne g_0,g_1\). Use the actual semisimple string attachments and the common residual semisimplification \(\bar\rho\oplus\bigoplus_h\bar C_h\) in each component containing a good label, with \(\bar\rho\) absolutely irreducible of rank \(r>1\). The host \(E\) is Galois and CM by §5. All irreducible summands are taken over a splitting coefficient field. Call a summand potentially abelian if it becomes a direct sum of characters over a finite extension of \(E\).

**Proposition.** For a short bad label \(x\) of longest string length \(s\), set
\[
 H_s=\{0\le h<t:|t-1-2h|\ge s\}.
\]
For each distinct residual character \(c\), let \(m_x(c)\) be its Jordan–Hölder multiplicity in the reduction of the sum of the irreducible summands of \(r_x\) that are not potentially abelian. Up to an additional weighted cost \(d_j^0\log A\) with \(\log A\ll x_{\rm scale}^{C}\), retain only short labels satisfying
\[
 m_x(c)\ \ge\ \#\{h\in H_s:\bar C_h=c\}\qquad\text{for every }c. \tag{1}
\]
The same integer \(A\) works throughout a host, including at \(l=2\) and when endpoint characters agree after reduction. Multiplicities in (1) are intrinsic to the residual semisimplification.

**Splitting fields and a common unit.** Work first in one component. A common finite Galois extension \(F/\mathbb Q\) containing \(E\) splits all the potentially abelian summands under consideration into characters and can be chosen unramified over \(E\) above \(l\). Indeed, for one such summand \(U\), first split it over some finite Galois extension \(F'/E\). On \(D=\operatorname{End}_{G_{F'}}(U)\) the conjugation action factors through a finite group. It is crystalline at every place over \(l\), as a subrepresentation of the crystalline \(\operatorname{End}(U)\). A finite-image crystalline representation is unramified. To see this, over a finite Galois local field extension \(L/K\) killing the image, its crystalline periods are \((L_0\otimes_{\mathbb Q_l}V)^{\operatorname{Gal}(L/K)}\). Inertia acts trivially on the maximal unramified field \(L_0\), so full crystalline dimension forces inertia to act trivially on \(V\). The kernel of the action on \(D\) acts on \(U\) through the commutant of \(D\), by scalars on each character-isotypic space. Its fixed field therefore gives the desired splitting over \(E\). Take the compositum and its conjugates over \(\mathbb Q\). Since \(E/\mathbb Q\) is Galois, all these extensions are still unramified over \(E\) above \(l\).

Fix a complex conjugation \(\iota\) on \(F\), put \(K=F^{\langle\iota\rangle}\), and choose a place \(w\mid l\) of \(K\). Write \(e=e(K_w/\mathbb Q_l)\). Since \(F/E\) is unramified there, \(e\le d=[E:\mathbb Q]\). For every rational unit \(z\in\mathbb Z_l^\times\) we will choose one group element \(g_z\in G_F\) that works for all the characters at once.

For a crystalline line \(\lambda\) on \(G_F\) occurring below, local reciprocity on the full \(l\)-adic unit group gives an algebraic character \(\prod_\sigma \sigma(u)^{k_\sigma}\) with integral exponents. Fix identifications with the algebraic closures used for the complex and \(l\)-adic embeddings, so embeddings of \(F\) are indexed by its Galois group. On a finite-index subgroup of the global units this algebraic character is one. Indeed global reciprocity kills principal idèles, the complex factors act trivially, and the local unit images away from \(l\) are finite and trivial outside finitely many places. Dirichlet's unit theorem, applied to absolute values in one complex embedding, implies \(k_\sigma+k_{\iota\sigma}\) is constant. Applying every automorphism to the algebraic unit identity gives the same assertion with every conjugate of \(\iota\) in its place. The constant is always
\[
 W_\lambda=2\sum_\sigma k_\sigma/[F:\mathbb Q]\in\mathbb Z .
\]
In particular \(k_\sigma+k_{\sigma\iota}=W_\lambda\), by using \(\sigma\iota\sigma^{-1}\). The two embeddings over each embedding of \(K\) pair in this last order. Hence the algebraic character restricted to the \(l\)-adic units of \(K\) embedded in those of \(F\) is the absolute norm raised to \(W_\lambda\).

Let \(K_w^{\rm ur}\) be the maximal unramified subfield of \(K_w/\mathbb Q_l\). Choose in it a unit of norm \(z\) to \(\mathbb Q_l\), using surjectivity of the unit norm for an unramified extension. Viewed in \(K_w\) this unit has norm \(z^e\). Put it at \(w\), take one at the other places, embed the idèle in \(F\), and lift its Artin image to \(g_z\in G_F\). This proves simultaneously
\[
 \lambda(g_z)=z^{e W_\lambda}.
\]
The exponent \(e\) depends on the chosen place but stays at most \(d\), regardless of the splitting degree. For the local character formula see B. Conrad, *Lifting global representations with local properties*, Proposition B.4(ii). For the unit norm see J. S. Milne, *Class Field Theory*, III, Proposition 1.1.

**An operator on the lines themselves.** Fix \(s<t\) and \(h\in H_s\). At a completely split rational prime \(p\) outside the exceptional sets, the normalized modulus of \(C_h\) is \(p^{(t-1-2h)/2}\). At any label of longest length at most \(s\), all normalized Frobenius moduli are strictly between \(p^{-s/2}\) and \(p^{s/2}\). For a character \(\nu\) obtained by splitting any potentially abelian summand of such a label over \(F\), put \(\lambda=\nu/C_h|_{G_F}\). Choose \(p\) completely split in \(F\) and in any auxiliary field required for the test places. Every ratio at a place over \(p\) lies strictly on the same side of one and in \((p^{-t},p^t)\) in absolute value. Applying reciprocity to the principal idèle \(p\) gives, with arithmetic Artin normalization,
\[
 \prod_{v\mid p}|\lambda(\operatorname{Frob}_v)|
     =p^{-\sum_\sigma k_\sigma}=p^{-[F:\mathbb Q]W_\lambda/2}.
\]
Consequently \(0<|W_\lambda|<2t\). For the good ratios \(C_a/C_h=\epsilon^{h-a}\), the absolute weight is \(2|h-a|\), and only \(a=h\) has weight zero.

Put \(L=2dt\) and \(B=J(\mathbb Q,2L)\) from the earlier interpolation lemma. Choose unit samples \(z\) and integral coefficients \(b_z\) giving \(B\) times the coefficient of degree \(L\) on polynomials of degree at most \(2L\). The group-algebra element
\[
 Z_h=\sum_z b_z z^L C_h(g_z)^{-1}[g_z]\ \in O[G_E]
\]
acts on the good line \(C_a\) by \(B\) if \(a=h\) and zero otherwise. On every potentially abelian summand of every bad label of longest length at most \(s\), it is the zero **endomorphism**. Indeed on each constituent line over \(F\) it extracts degree \(L\) from \(z^{L+eW_\lambda}\). Nothing about its action on other summands is needed.

**Counting coincident residual characters.** For a residual character \(c\) represented among the endpoints, take the image of the residue group algebra acting on one copy of each distinct residual simple type of the component. This image is finite-dimensional and semisimple because it acts faithfully on a semisimple module. Lift its central idempotent for \(c\) to an element \(a\in O[G_E]\) by lifting the coefficients of a finite group-algebra expression. Its reduction acts with characteristic roots zero and one on every stable lattice, with the multiplicity of one equal to the multiplicity of the one-dimensional type \(c\). This follows by filtering by Jordan–Hölder factors. Over the complete coefficient integer ring, factor the product of the characteristic polynomials of \(r_y(a)\) for the finitely many labels into the two coprime factors lifting the zero and one primary factors. Integral Chinese remaindering gives a polynomial in \(a\), denoted \(P_c\), acting as the projector onto the one primary factor on every label. Its rank on each characteristic-zero summand is exactly the residual multiplicity of \(c\) there. On a good label the rank-\(r\) summand contributes zero.

Set \(k=\#\{h\in H_s:\bar C_h=c\}>0\) and
\[
 U=P_c\Big(\sum_{h\in H_s:\bar C_h=c} Z_h\Big)P_c\in O[G_E].
\]
On every good label \(U\) acts by \(B\) on exactly \(k\) lines and by zero on the rest. On a bad label of longest length at most \(s\), it kills the potentially abelian summands and its rank on the rest is at most \(m_x(c)\). Every group-algebra expression here preserves the global direct summands. Thus when \(m_x(c)<k\) the \(k\)-th elementary symmetric function of \(r_x(U)\) vanishes. On a good label it equals \(B^k\). Newton's identities put \(k!\) times this symmetric function in the integral Hecke algebra since each \(\operatorname{tr}(r_y(U)^i)\) is an integral linear combination of group traces by G1. This argument handles residue characteristic dividing \(k!\).

**Uniform cost.** Do this for all \(1\le s<t\) and the residual types represented in \(H_s\), at most \(t^2\) tests. For each test its good scalar \(k!B^k\) divides \(D=t!B^t\). Scale its Hecke function integrally to give \(D\) on good labels, take the product, and pad with constant factors to \(A=D^{t^2}\). A bad label failing (1) is killed by the test at its own longest length. The previous lattice-deletion argument now applies with this single \(A\), even if every component used different group elements. Since \(2L=4dt\) and the logarithm of \(J(\mathbb Q,2L)\) is polynomial in \(dt\), the summed error is at most \(d_j^0\log A\ll d_j^0 x_{\rm scale}^{C}\), within the stated budget for large scales. This argument bounds the cost of projecting away those labels.

**Consequences for string length.** There are exactly \(2\lceil(t-s)/2\rceil\) positions in \(H_s\). A rank-one seed of length \(s\) already contributes \(s\) of the \(t\) residual characters through its characteristic-zero lines. If \(t-s\) is odd, (1) requires another \(t-s+1\) among summands that are not potentially abelian. The count exceeds \(t\), so every such label can be deleted. More generally, in a string of length \(s\ge2\) the seed occurs through \(s\) cyclotomic twists. Any residual factor of rank \(>1\) in that seed would give at least \(s\) such occurrences, while the whole component has just one. The string therefore uses \(s\) times the seed rank in one-dimensional residual factors. In particular \(s>t/2\) forces rank one. This removes every longest length \(s>t/2\) with odd \(t-s\), including \(t-1\), at every non-generator coefficient prime.

At \(s=t-2>t/2\) the rank-one string consumes \(t-2\) characters. Any surviving label must put both remaining characters, with multiset \(\{\bar C_0,\bar C_{t-1}\}\), into a single irreducible summand that is not potentially abelian. Indeed two such summands each receiving one character would both need the unique factor \(\bar\rho\) to have dimension greater than one. The single summand thus has dimension \(2\) or \(r+2\), according as it excludes or includes \(\bar\rho\) in its reduction. This accounts for multiplicity even if the two endpoints reduce to the same character. Existence and weighted defect of either configuration on the selected family remain open. The proposition and these consequences are conditional paper deductions. The application to that family and a Lean verification of the new argument remain outstanding.

### Which positions can the character summands occupy?

In fact the same construction tests all the positions, including those strictly inside the Satake interval. For every short label and every \(h\), the principal-idèle identity still gives \(|W_{\nu/C_h}|<2t\). The sign can now vary and the weight can vanish. The characters \(\nu\) obtained from a single potentially abelian irreducible \(V\) over \(F\) are conjugate under \(G_E\), since otherwise an orbit sum of character-isotypic spaces would be a proper global summand. Their labelled exponents are permuted by conjugation and \(C_h\) extends over \(E\). Thus \(W_{\nu/C_h}\) is independent of the line chosen in \(V\). Write \(V\) as matching position \(h\) if this weight is zero. The weights of the good lines are spaced by two, so \(V\) matches at most one \(h\). The single expression \(Z_h\) acts by the scalar \(B\) on \(V\) if it matches and by zero otherwise.

**Proposition.** Up to the same order of weighted cost, each one-dimensional residual factor of the potentially abelian summands of a surviving short label occupies a distinct good position. A factor of type \(c\) in \(V\) must occupy the unique position \(h\) matched by \(V\), and \(\bar C_h=c\).

To prove this, put \(I_c=\{h:\bar C_h=c\}\), \(q_c=|I_c|\). For each \(c\) use the preceding exterior-coefficient test on
\[
 P_c\Big(\sum_{h\in I} Z_h\Big)P_c,\qquad
 I=I_c\quad\hbox{or}\quad I=I_c\setminus\{a\},\ a\in I_c,\qquad k=|I|>0.
\]
The good scalar is \(k!B^k\). The total rank of \(P_c\) on each bad label is \(q_c\). If a potentially abelian summand contributes \(c\) without matching any position in \(I_c\), the full-set operator loses at least one of these dimensions and has rank less than \(q_c\). If at least two copies of \(c\) match \(a\), omitting \(a\) kills at least two dimensions, giving rank at most \(q_c-2<|I|\). If \(q_c=1\), two copies were already impossible by total multiplicity. This proves the assertion. There are at most \(2t\) tests in total, so \(D^{2t}\), with \(D=t!B^t\) as above, works uniformly. Every prime divisor of this integer is at most \(4dt+1\), by the formula for \(J(\mathbb Q,4dt)\). At a larger \(l\), the additional local length cost of this test is zero. This proposition also implies (1), since potentially abelian summands of a label of longest length \(s\) cannot match any position in \(H_s\).

A rank-one Speh seed of any length \(u\) has normalized seed modulus one at the split unramified test places. Its \(a\)-th line has modulus \(p^{(u-1)/2-a}\). Comparing to \(C_h\) in the principal-idèle identity gives a match exactly when \(h=(t-u)/2+a\). Hence every rank-one string in a surviving short label has the parity of \(t\), and its residual character sequence agrees position by position with the centered length-\(u\) segment of the good sequence. This holds even when several good characters have identical reductions. Since \(t\) is odd on the manuscript's mesh, every such segment contains position \((t-1)/2\). Two rank-one strings in one label would both occupy that position. Consequently a surviving label has **at most one rank-one seed, of odd length**, counting length one as well. The conclusion uses only the unitary normalization of rank-one seeds, not temperedness for higher-rank seeds. The all-string attachment and residual count are specified in \(\mathrm{CentredStringDecomposition}\) and \(\mathrm{ResCount}\) in HeckeCharEqOfLAdicRealisation.lean. This is a restriction on which labels can still contribute to the unbounded part of the defect.

### Exact characters in a surviving long rank-one string

For a rank-one string of length \(u>r\), the earlier inertia and Hodge hypotheses give a stronger assertion. Write its lines as \(\psi\epsilon^{-a}\), \(0\le a<u\). At a level prime all \(u\) have the same value on a tame generator. In the common good inertia polynomial at most \(r\) eigenvalues differ from the value of \(\chi\), so \(\psi\) and \(\chi\) agree there. The G5 inertia formula gives the same conclusion on each element of inertia at the other exceptional primes away from \(l\). By G4 and tameness, every ratio \(\psi\epsilon^{-a}/C_h\) is therefore unramified away from \(l\). At each embedding the good interval of \(t\) weights and the bad interval of \(u\) weights lie in the same multiset of cardinality \(t+r\). The latter interval has at most \(r\) weights outside the former and the intervals intersect since \(u>r\). Thus the absolute value of every labelled exponent of each ratio is at most \(K=r+t\).

For each \(h\) apply the earlier multivariable interpolation and class-group sum in the group algebra itself. More explicitly, let \(b_v\) be the coefficients for the all-\(K\) monomial at the unit samples \(v\) in the degree-\(2dK\) interpolation. For representatives \(\gamma_b\) of the Hilbert class field quotient and lifts \(\widetilde v\) of the idelic units, form
\[
 D_h=\sum_{b\in\operatorname{Cl}(E)}\sum_v b_v\,\mathrm N(v)^K
        C_h(\gamma_b\widetilde v)^{-1}[\gamma_b\widetilde v].
\]
On a good line or any line of one of these long strings, \(D_h\) has value \(B'=h_EJ(E,2dK)\) if the line equals \(C_h\) as a global character, and zero otherwise. Indeed interpolation keeps just the ratios with all labelled exponents zero. These are unramified everywhere, and the class-group sum detects the trivial character among them.

Use the tame projector \(P\) of rank \(t\) from the full-length argument. It acts by one on every line of these long strings, by the same multiplicity argument at the chosen level prime. On a good label \(P(\sum_hD_h)P\) has eigenvalue \(B'\) on the \(t\) good character lines and vanishes on their complement. If a long string on a bad label contains even one line unequal to every \(C_h\), its rank is at most \(t-1\) there. The \(t\)-th elementary symmetric function, scaled by \(t!\), thus removes all these labels for good scalar \(t!(B')^t\), whose logarithm is polynomial on the mesh. On surviving labels every such line is an actual \(C_h\). Its split Frobenius modulus fixes \(h=(t-u)/2+a\). In particular at \(s=t-2\) the entire centered string is exactly \(C_1,\ldots,C_{t-2}\) in characteristic zero under these hypotheses. Only the representation carrying the two outer residual characters and the possible separate rank-\(r\) piece remain to be compared.

### A finite test for the rank-two alternative at length \(t-2\)

Suppose \(l>2\) is unramified in \(E\), the two residual endpoint characters are distinct, and at each place over \(l\) one common local crystalline twist places the weights of the good and bad representations in the same Fontaine–Laffaille interval of width at most \(l-2\). Let \(S\) contain the allowed finite ramification outside \(l\). Put \(F_1=E(\mu_l)\), \(\Gamma=\operatorname{Gal}(F_1/E)\), and let \(\mathfrak m\) be the product of the primes of \(F_1\) over \(S\). Write \(k\) for the splitting residue coefficient field. If the rank-two alternative occurs, then
\[
 \operatorname{Hom}_{\mathbf F_l[\Gamma]}\left(
 \frac{\operatorname{Cl}_{\mathfrak m}(F_1)}
 {l\operatorname{Cl}_{\mathfrak m}(F_1)+\langle[v]:v\mid l\rangle},
 \ k(\bar\epsilon^{\,1-t})\right)\ne0. \tag{2}
\]
In particular, a vanishing computation for (2) leaves only the rank-\((r+2)\) alternative at that component.

Indeed, by the rank-two lattice lemma applied to the irreducible carrier, there is a lattice giving a globally nonsplit extension with subcharacter \(\bar C_{t-1}\) and quotient \(\bar C_0\). Its class has coefficient \(\bar C_{t-1}/\bar C_0=\bar\epsilon^{1-t}\). To check the local condition, use the covariant Fontaine–Laffaille functor with Hodge–Tate weight \(-1\) for \(\epsilon\). Exactness, full faithfulness and stability under subquotients identify the two rank-one torsion objects with the reductions of the good endpoint lines in that interval. At an embedding \(\tau\), their filtration jumps are \(h_\tau+t-1\) on the subline and \(h_\tau\) on the quotient. The map \(\varphi^{h_\tau}\) kills the subline in the torsion module, and its image on a lift of the quotient line gives a well-defined complementary line at the next Frobenius embedding. These lines form a filtered, Frobenius-stable section: at the low jump the image is in the chosen next line by construction, at lower indices the maps vanish, and above the low jump the complement has zero filtration. Thus the extension splits at every place over \(l\).

Restriction to \(G_{F_1}\) preserves the nonzero class because \(|\Gamma|\) is prime to \(l\). It gives a \(\Gamma\)-equivariant additive character to \(k(\bar\epsilon^{1-t})\), locally trivial above \(l\) and unramified off \(S\). At a prime over \(S\), principal units are pro-residue-characteristic, so the conductor exponent is at most one. Global Artin reciprocity now gives (2). The lattice lemma in the two required orientations follows, for example, from J. Bellaïche, *À propos d'un lemme de Ribet*, Theorem 1. For the covariant functor and weights see J. Booher, *Producing geometric deformations of orthogonal and symplectic Galois representations*, Fact 4.10 and Remark 4.11. No ray class group for the selected hosts has been evaluated here. The rank-\((r+2)\) alternative and primes outside these extra local hypotheses require separate arguments.

Exact-arithmetic checks of the operator calculation covered 140 rational interpolation identities at \(2,3,5,7\), 72,048 cases of the full-set and omitted-position rank counts, and 5,049 endpoint counts. These exercise the finite algebra and combinatorics. The Galois attachments and the weighted defect for the remaining labels have separate arithmetic content.
