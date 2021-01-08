---
title: "Quantum Computer Architecture"
categories:
- Research
published: true
excerpt: |
  Rules to build a quantum computer
---

In the past decades, an enormous amount of capital poured into the field of quantum computing, both from the government and the market. Though people doubt the reality and risk, it is true that the development of quantum computing has been boosted and evolved into a new shape. The research is no longer limited to diverse topics from various theoretical and experiment group, but people are also trying to put things together for a full-stack quantum computer architecture. In this article, I will introduce its structure and the landscape of industrial implementation.

The architecture of a quantum computer has been proposed in multiple places. Many companies, whose ambition is to build a universal fault-tolerant quantum computer, have published their blueprint or roadmap according to the architecture structure.

In (Meter and Horsman 2013)[1], the architecture is defined as

{% include figure.html image="/assets/fig/architecture-meter.png" caption="kodi" %}



In (Fu et al 2016) [2], it is depicted as

{% include figure.html image="/assets/fig/architecture-fu.png" caption="kodi" %}


They tried to make it compatible and complete for most hardware platforms. Those structures are not necessarily static. They evolve as the development of each part. For today's discussion, I simplify it as the following.

- Qubit Technologies
  - qubit storage, gate operations, qubit interconnections, measurement
- Quantum error correction
  - use physical qubits to encode logical qubits
  - allow universal and fault-tolerant logical operations
- Quantum programming
  - From human-readable language to machine-executable commands
- Quantum algorithm
- Quantum complexity theory

Many companies have the ambition to build a universal fault-tolerant quantum computer. Some of them have posted their architecture blueprint.

|Team|[Xanadu](https://xanadu.ai/)|[Amazon Braket](https://aws.amazon.com/braket/)| [Universal Quantum](https://universalquantum.com/)|[PsiQuantum](https://psiquantum.com/)|
|-|-|-|-|-|
|Location| Toronto| Los Angeles | UK| San Francisco|
|Blueprint|[arxiv 2010.02905](https://arxiv.org/abs/2010.02905) [3]|[arxiv 2012.04108](https://arxiv.org/pdf/2012.04108.pdf) [4]|[arxiv 1508.00420](https://arxiv.org/pdf/1508.00420.pdf) [5]| [thesis](https://spiral.imperial.ac.uk/handle/10044/1/43936) [6]|
|Qubit tech| photonic, GBS |acoustic resonators coupled to superconducting circuits| trapped ion|linear optics|
|QEC| surface-GKP | concatenated cat code | surface code|topological code|
|Non-Clifford elements|PNR|Toffoli magic state distillation |T-type magic state|?|
|logical operation|lattice surgery| lattice surgery| ?|?|

note: 
- A Clifford circuit can be simulated efficiently by a classical computer, hence provide no quantum advantage. It is also easy to implement in a quantum system. Non-Clifford elements are required for universal quantum computation to achieve any quantum advantage.
- GKP: Gottesman-Kitaev-Preskill codes
- PNR: photon number resolver
- Concatenated cat codes are two-layer structure, with cat code as the inner code and another qubit code as the outer code. In its paper, repetition code and surface code are used.
- ? means I am not sure by a brief reading. 

The main contribution of those blueprints is to put different components together so that people can see the full picture of a quantum computer. Those are still in the early stages. Each part has a huge space for improvement. It is also nontrial to optimize the connection between different layers.



In fact, IBM[7], IonQ[8], D-wave, and others have published roadmaps for their hardware. But they haven't discussed quantum error correction and fault tolerance yet, hence not included in today's comparison. For statistics on hardware, there is a paid version on [https://quantumcomputingreport.com/](https://quantumcomputingreport.com/)


**References**

[1] Van Meter, R., & Horsman, C. (2013). A blueprint for building a quantum computer. Communications of the ACM, 56(10), 84-93.

[2] Fu, X., Riesebos, L., Lao, L., Almudever, C. G., Sebastiano, F., Versluis, R., ... & Bertels, K. (2016, May). A heterogeneous quantum computer architecture. In Proceedings of the ACM International Conference on Computing Frontiers (pp. 323-330).


**Blueprints**

[3] Bourassa, J. E., Alexander, R. N., Vasmer, M., Patil, A., Tzitrin, I., Matsuura, T., ... & Dhand, I. (2020). Blueprint for a scalable photonic fault-tolerant quantum computer. arXiv preprint arXiv:2010.02905.

[4] Chamberland, C., Noh, K., Arrangoiz-Arriola, P., Campbell, E. T., Hann, C. T., Iverson, J., ... & Brandão, F. G. (2020). Building a fault-tolerant quantum computer using concatenated cat codes. arXiv preprint arXiv:2012.04108.

[5] Lekitsch, B., Weidt, S., Fowler, A. G., Mølmer, K., Devitt, S. J., Wunderlich, C., & Hensinger, W. K. (2017). Blueprint for a microwave trapped ion quantum computer. Science Advances, 3(2), e1601540.

[6] Gimeno-Segovia, M. (2015). Towards practical linear optical quantum computing (Doctoral dissertation, Imperial College London).


**players**

Xanadu [http://xanadu.ai/](http://xanadu.ai/)

Amazon Braket [https://aws.amazon.com/braket/](https://aws.amazon.com/braket/)

Universal Quantum [https://universalquantum.com/](https://universalquantum.com/)

PsiQuantum [https://psiquantum.com/](https://psiquantum.com/)

**Hardware roadmaps**

[7] IBM hardware roadmap
[https://www.ibm.com/blogs/research/2020/09/ibm-quantum-roadmap/](https://www.ibm.com/blogs/research/2020/09/ibm-quantum-roadmap/)

[8] IonQ’s roadmap: Quantum machine learning by 2023, broad quantum advantage by 2025
[https://venturebeat.com/2020/12/09/ionq-roadmap-quantum-machine-learning-2023-broad-quantum-advantage-2025/](https://venturebeat.com/2020/12/09/ionq-roadmap-quantum-machine-learning-2023-broad-quantum-advantage-2025/)
