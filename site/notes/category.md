# category theory notes

## Definition
Ignoring class/set technicalities for now, a category is a structure that consists of a bag of objects $Ob$ and for each pair of objects $x, y \in Ob$, there's a bag of arrows $Arr(x, y)$. For each triple of objects $x,y,z$ there's a *composition* function $\circ: Arr(x,y) \times Arr(y,z) \to Arr(x,z)$, and for each object $z$ there's a function assigning its *identity* arrow $id_z \in Arr(z,z)$. We must also have the following properties hold:

  - Composition is associative
  - Composing any arrow with the appropriate identity arrow on the left or right yields the original arrow.


We can view preorders (quasiorders) and monoids as special kinds of categories:

### Preorder
Let the set be the collection of objects, and let there be an arrow between two objects $a$ and $b$ whenever $a \leq b$ in the preorder. We can find such a composition function for any triplet of objects because a preorder is transitive, and associativity holds here. Also, reflexivity provides us with identity arrows which satisfy the identity property.

### Monoid
This seems a bit strange to me even though it is commonly cited. The monoid set is sole object of this category, and I guess we let the binary operation be composition? This yields associativity and identity properties, but now the arrows of the category are the elements of the monoid, with each element being an arrow from the monoid set to itself. Seems strange, but it definitely works.


## Functor
Like any algebraic structure, we can consider structure-preserving maps between categories. These are called functors, and for any two categories $\mathcal{C}$, $\mathcal{D}$, a functor $\mathcal{F}: \mathcal{C} \to \mathcal{D}$, being a map that preserves the "structure" of $\mathcal{C}$ in $\mathcal{D}$, must make morphisms work the same way that they do in $\mathcal{C}$. So a functor should map each arrow $f: A \to B$ to an $\mathcal{F}(f): \mathcal{F}(A) \to \mathcal{F}(B)$. $\mathcal{F}$ should also preserve identities, so $\mathcal{F}(id_X)$ should equal $id_{\mathcal{F}(X)}$ (a functor should send the identity of any object $X$ to the identity of the object that the functor maps $X$ to.


## Some size-related definitions
A **small category** is a category where both the the objects and each collection of arrows are bona fide sets, no "collections", whatever those are. A **locally small category** is a category where every collection of arrows between two objects is a bona fide set, but the collection of objects might not be.
