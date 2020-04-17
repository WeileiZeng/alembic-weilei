---
title: "Weekly Reading"
categories:
- Research
published: true
---
Notes on readings.
<!-- more -->

##### Feb 22, 2020

* Correcting coherent errors with surface codes {% cite bravyi2018correcting %} [nature](https://www.nature.com/articles/s41534-018-0106-y)

So far the error models I use, either depolarizing channels or circuit error models, with or without measurement error, are stochastic models which assume almost all qubits are independent. In realistic situations, there are also coherent error. For example, a misalignment of the pulse frequency will result in small rotation errors everywhere. 


##### Apr 16, 2020
* GRAND (Guessing Random Additive Noised Decoding) {% cite duffy2019capacity %}
  * Given Channel output y, ititialize a set of most likely error with descending probabilities.
  * Run through the set until finding an error matches the syndrome. That would be the decoding result

* Refined Belief Propagation Decoding of Sparse-Graph Quantum Codes {% cite kuo2020refined %}
  * define a new scheme for single-message-passing BP decoding for quantum codes. The scheme cannot incorporate correlation between X and Z error. It is also unknown whether it has same complexity as the binary version of BP decoder of GF(4) codes.
  * Give a clear description of layered/serial scheduling in BP, which improve both rate and speed of convergence.
  * More thinking: single message passing is possible as long as syndrome is binary, with the classification of two categories for each syndrome result



##### References
{% bibliography --cited %}



