# topology notes

## Finer/coarser topologies
One of the first definitions right after the initial definition of a topological space in Munkres is the definition of finer/coarser topologies. If $\mathcal{T}$ and $\mathcal{T} \prime$ are topologies on some set $X$, then Munkres says that if $\mathcal{T} \subseteq \mathcal{T} \prime$, we say $\mathcal{T} \prime$ is *finer* than $\mathcal{T}$ (and $\mathcal{T}$ is *coarser* than $\mathcal{T} \prime$).

We can think about this in terms of lattices though. The powerset of X is a lattice, and any topology (collection of open sets) is a sublattice of the powerset lattice (since the intersection or union of any two open sets is an open set). So if $\mathcal{T}$ and $\mathcal{T} \prime$ are topolgies, with $T$ and $T \prime$ the respective sublattices, then $\mathcal{T} \prime$ being finer than $\mathcal{T}$ is exactly the situation where $T$ is a sublattice of $T \prime$ (or, in other words, there's a lattice embedding (injective lattice homomorphism) of $T$ in $T \prime$).

## Basis
Here's the standard definition: A **basis** for a topology on $X$ is a subcollection $\mathcal{B}$ of the powerset of $X$ which meets the following two conditions:

  1. $\mathcal{B}$ covers $X$ ($X$ is the union of elements of $\mathcal{B}$
  2. For any $A$, $B \in \mathcal{B}$, every point $x \in A \cap B$ has a set $B_x \in \mathcal{B}$ which contains $x$ and is a subset of $A \cap B$.

I invented a term, of likely limited utility, for describing the second conditon. A "basis neighborhood" of an $x \in X$ is a subset of $X$ that is a superset of a basis element containing $x$: an $S$ such that there's a $C \in \mathcal{B}$ such that $x \in C \subseteq S \subseteq X$. (The idea is that it's a neighborhood of $x$, but instead of simply containing a open set that contains $x$, it contains a *basis element* that contains $x$). Using this definition, the second condition becomes "the intersection of any two basis elements is a basis neighborhood of all of its points".

The point of defining this is that you can now describe a way of generating a topology from the basis as such: the open sets of the generated topology are the sets that are basis neighborhoods of each of its points.

So given a basis, you can recover a topology on a set. In a way, a basis "encodes" the topology, except that's not quite right because different bases on the same set might lead to the same topology. (That is, you can decode a basis to get a topology, but there is, in general, no canonical way to encode a topology as a basis (I haven't thought this through fully, perhaps this is confused)).

If you have a basis, then every open set in the generated topology is a union of basis elements: if $U$ is open in the generated topology, then every point of $U$ has a basis element that 1) contains the point and 2) is a subset of $U$, so unioning up these basis elements yields $U$. Question: Given a topology and a subcollection $\mathcal{C}$ of open sets such that every open set is a union of elements of $\mathcal{C}$, is it true that $\mathcal{C}$ is a basis? Clearly basis property 1 holds (the whole set is open), so we must prove property 2. For $C_1$, $C_2 \in \mathcal{C}$, the intersection $C_1 \cap C_2$ is open, so it is a union of elements of $\mathcal{C}$. Thus there's an element of $\mathcal{C}$ for every point of the intersection which contains that point as in contained in the intersection, proving that $\mathcal{C}$ is a basis.

I became interested in the relationships here because Armstrong's *Basic Topology* likes to give intuitive-but-not-quite-modern definitions of basic things in topology, and that's where I ran into the "a collection for which every open set is a union of collection elements" definition for a basis. The limitation here, of course, being that you need to already have a topology in order for that definition to work. The more abstract standard definition allows you to *make* a topology.


## Second countability implies separable
*Second countability* means that a topology has a countable basis. A topological space being *separable* means there's a countable dense subset (A subset being dense means every element of the underlying set is either in the set or is a limit point of the set. Equivalently, every open set intersects the set). But if you give me any basis, I can make a dense subset: for each basis set, pick an element. Put all these elements in a set $D$ and you've got a dense subset, because every open set is a union of basis sets, and every basis set intersects $D$, hence every open set intersects $D$.

From the above it immediately follows that a countable basis implies a countable dense subset. If you have a finite basis instead, then you can similarly make a finite dense subset.

Is a basis related to filters? It seems to be related to poset filters, possibly lattice filters.
