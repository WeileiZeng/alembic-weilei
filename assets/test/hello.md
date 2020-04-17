\maketitle
description of binary BP decoder
================================

The Belief Propagation (BP) algorithm can approximate the maginal
probability of errors, giving the received bits or the syndrome. It is
designed for factor graph. When the graph is a tree, it gives the exact
marginal probability. There are several equivalent/approximate versions
of it, let us start with the classical one.

codeword-based
--------------

BP decoder for classical binary codes:

A code is defined by a factor graph ( with assumed degree $d+1$ and)
with variable nodes $V=\{c_i\}$ and check nodes $C=\{c_i\}$. The message
from variable to check is
$$u_{v-c}(x) =m(x) = P(y_v|x) \prod_{j=1..d}  M_j(x)  \text {, where }
\{c_1,...,c_d \} = N(v)\setminus c,~x \in \{0,~1\}$$ The message from
check to variable is
$$u_{c-v} = M(x) = \sum_{x_1,...,x_d} \delta( {\bf h}_c {\bf x}^T=0)
\prod_{j=1}^d m_j(x) \text{, where} \{ v_1,...,v_d \} = N(c)
\setminus v$$ The initial condition is $M_j(x)=1, x \in \{0,1\}$.

(To generalize it to nonbinary case, one only need to modify the parity
check condition from matrix miltiplication to symplectic product.
Everything else will be extended smoothly)

codeword-based, LLR-simplified
------------------------------

By rewriting the probabilities and messages in terms of the
log-likelihood ratio

$l_i=\log( m_i(0)/m_i(1))$, $M_i=\log(
M_i(0)/M_i(1))$, one can get the simplified message:

$$l_i=l_i^{(0)}+\sum_{j=1}^d (L_j)$$

$$L_i = 2 \tanh^{-1} \prod_{j=1}^d \tanh (l_j/2)$$

$$l^{(0)}_i=\log (P(x_i=0|y_i)/P(x_i=1)|y_i),~ y_i \in \{0,1\}$$,

When $y_i= 0 \text{ or } 1$, $l_i^{(0)}$ will be flipped.

In this simplified form, only one message need to be sent per edge,
instead of two messages for 0 and 1 respectively. Hence, the complexity
is reduced.

syndrome-based
--------------

In classical case, the received bits was used, instead of the syndrome.
In quantum case, there are no received bits, but only the syndrome.
Hence, to get the formula in quantum case, one need to change it to a
syndrome-based decoder.

Ref [@mackay2003information chapter 47.2] show that the codeword-based
BP decoder is equivalent to the following syndrome-based decoder

$$u_{v-c}(x) =m(x) = P(x) \prod_{j=1..d}  M_j(x)  \text {, where }
\{c_1,...,c_d \} = N(v)\setminus c$$

$$u_{c-v} = M(x) = \sum_{x_1,...,x_d} \delta( {\bf h}_c {\bf x}^T={\bf
s}^T)
\prod_{j=1}^d m_j(x) \text{, where} \{ v_1,...,v_d \} = N(c)
\setminus v$$ The initial condition is still $M_j(x)=1, x \in \{0,1\}$.

The logic is that, the codeword-view calculate $P(x|y)$ (the most-likely
input codeword $x$ given the recieved vector $y$) and the syndrome-view
calculate $P(e|s)$ (the most-likely error $e$ given this syndrome $s$).
Here $x$ should be an valid zero-syndrome input codeword; $y$ is the
received vector; and $e$ is an error vector matching syndrome $s$.
Literally, these two marginal probability are describing the same event,
thus should lead to the same result. Mathematically, one has to write it
carefully and show they are isomorphic.

syndrome-based, LLR simplified
------------------------------

In a similar fashion of simplification, one can write the above
equations into the log-likelihood-ratio form, then reach the following
simple formula [@liu2018neural]

$$l_i=l_i^{(0)}+\sum_{j=1}^d (L_j)$$

$$L_i = (-1)^{s_i} 2 \tanh^{-1} \prod_{j=1}^d \tanh (l_j/2)$$

$$l_i^{(0)}=\log (P(x_i=0)/P(x_i=1)) = \text{const}$$

The posterior log-likelihood ratio can be estimated as
$l_i=l_i^{(0)}+\sum_{j=1}^{d+1} (L_j)$

This syndrome-based BP decoder can be used for quantum code as well. We
first discuss the case of CSS codes, then the case of GF(4) codes.

discussion on quantum case
--------------------------

In CSS codes, one has $GH^T=0$. Say $H$ is the parity check matrix, then
the only difference from a classical code with parity check matrix $H$
is that one need to check the decoded vector is an trivial error or not,
that is, if it can be eliminated by rows of $G$ or not. Hence, the CSS
code can use BP decoder directly with a post check.

In GF(4) code, the generator matrix $G=(A|B)$ satisfies $G \tilde
G^T=AB^T+BA^T=0$, where $\tilde G=(B|A)$. Here, one can just decode a
classical code with parity check matrix $\tilde G$, then check if it is
a combination of rows of $G$.

Note that, in both CSS codes and GF(4) codes, the correlation between X
and Z errors are not considered. One way to consider the correlations is
as following.

One can change the generator matrix from $$G=(A|B), H=(B|A)$$ to
$$\tilde G =G \left( \begin{array}{ccc} I&&I\\&I&I \end{array}\right)
=(A|B|A+B), \tilde H = \left( \begin{array}{ccc} B & A \\
                                I&I&I \end{array} \right)$$ The error
changes from $(e_X|e_Z)$ to $(e_X|e_Z|e_Y)$, which satisfy
$(I|I|I)(e_X|e_Z|e_Y)^T=0$. (Any single error will produce an even
number of 1s in the vector. This $e_Y$ is not the Pauli Y error, but
simply a superposition of X and Z, $e_Y=e_X+e_Z$ mod 2.) This extra Y
node contain the information that X and Z errors tend to appear or
disapear in pair but not alone.

In this construction, we can just take the new parity check matrix as a
classical binary code and use the basic BP decoder.

variation of BP
---------------

### Min-Sum

Finally, there are some optimization of BP decoder, including normalized
and offset min-sum decoder [@chen2005improved].
Ref [@panteleev2019degenerate] says they are always using normalized
offset min-sum decoder with mormalization factor $\alpha=0.625$.

Here I use $L^{BP},~L^{MS},~L^{NORM},~L^{OFF}$ to denote the
check-to-variable messages for BP, min-sum, normalized min-sum, and
off-set min-sum respectively. The relation on their sign and magnitute
are

$$\mathop{\rm sgn}(L^{BP})=\mathop{\rm sgn}(L^{MS})=(-1)^{s_c}\prod_i^d \mathop{\rm sgn}(l_j)$$

$$|L_i^{BP}| =  2 \tanh^{-1} \prod_{j=1}^d \tanh (|l_j|/2)$$

$$|L_i^{MS}| = \min_i^d |l_j|$$

$$|L_i^{NORM}| = \min_i^d |l_j|/\alpha,~\alpha>1$$

$$|L_i^{OFF}| = \max( \min_i^d |l_j| - \beta, 0),~\beta >0$$

### layered scheduling for updating rule

Ref [@panteleev2019degenerate] claim they used layered scheduling, which
helped to eliminate the oscillating errors caused by the trapping sets.
The criteria for how to choose the schedule is unclear for me yet.

### enhanced feedback

Ref [@wang2012enhanced] developed an optimization called Enhanced
Feedback iterative BP decoder. In the second round of BP decoding, he
locate the frustrated checks and some common qubits connected with them,
then use the output probability to replace the input probability for
those qubits. This approach is very similar to what I tried ( in the
codeword-based LLR-simplified BP decoder for toric codes). The
difference is that, I simply use the output probability (LLR vector) to
replace the input probability for all qubits. I saw it fix all double
errors on large-size (about 35x35) toric codes, but only tiny
improvement in the numerics of small size (5, 7, 9, 11, 13). I am not
sure about the reason on small size. there may be a bug in the program
as well.

\iffalse
![numerics on modified enhanced
feedback](../figure/gnuplot/iteration/rate-bp4-iteration20-compare0-cycle3000-logscale){width="\linewidth"}

![numerics on modified enhanced
feedback](../figure/gnuplot/iteration/rate-bp4-iteration20-compare0-cycle3000-normal){width="\linewidth"}

\fi
\bibliographystyle{alpha}
