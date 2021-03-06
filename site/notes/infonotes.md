# Information Theory Notes

  - [Prerequisites](#prerequisites)
  - [Notes](#notes)
  - [Entropy](#entropy)
  - [Joint entropy](#joint-entropy)
  - [Conditional entropy](#conditional-entropy)
  - [Chain rule](#chain-rule)
  - [Relative entropy/Kullback entropy/Kullback-Leibler divergence](#relative-entropy)
  - [Mutual information](#mutual-information)
  - [References](#references)


## Prerequisites
You're gonna need some probability theory. Probability distributions, conditional probability, Bayes' theorem (but I repeat myself, ah ah ah), marginal distributions, random variables. I reference expectation of a random variable, but I guess you could ignore those bits. You should know summation notation and how logarithms work, too.

## Notes
Throughout I use the shorthand $p(x)$ and $p(y)$ to stand in for more precise notation like $P(X = x)$ and $P(Y = y)$ or $p_X(x)$ and $p_Y(y)$. Do not be alarmed. If I leave out the qualifier under a summation, I'm implying that it ranges over all of the values the random variable can take on.

## Entropy
### In words
  - "The average number of bits needed to optimally encode independent draws of the discrete variable..." [^1]
  - "...a measure of the average uncertainty in the random variable." [^2]
  - "...a measure of the average information content one is missing when one does not know the value of the random variable... Entropy, in an information sense, is a measure of unpredictability." [^3]

### Def. 1a
$$H(X) = - \sum_x p(x) \log p(x)$$

Quick sanity check: why does this definition have an ugly negative sign out in front? Can we get rid of it? No, actually. A probability distribution takes values between 0 and 1, so when we take the log of values between 0 and 1, we get *negative numbers*. So unless you want your nice new thingamabob to spit out negative numbers, we have to counteract with a negative sign out front.

Due to the magic of logarithms, we can rewrite as this:

### Def. 1b
$$H(X) = \sum_x p(x) \log \frac{1}{p(x)}$$

Now, hopefully you know that the expectation of a random variable is the weighted sum of the values the variable can take on. If you squint hard enough, you will be able to see that the definitions we have just provided for entropy can be restated in terms of expectation:

### Def. 1c

$$H(X) = \mathbb{E}[\log \frac{1}{p(X)}]$$

Here's a side of intuition to go along with those symbols. Compare these 2 probability distributions: $X$ can take on 4 values, each equally likely. Then

$$H(X) = 4 * \frac{1}{4} \log 4 = \log 4 = 2$$

The total entropy is 2, but notice how we got there: 1/4 * 2 + 1/4 * 2 + 1/4 * 2 + 1/4 * 2. In other words, we represent each outcome with two bits: 00, 01, 10, 11. Each outcome is two bits, so on average we use two bits to describe this information.

Now consider a variable $Y$ with a distribution $[1/2, 1/4, 1/8, 1/8]$. Now the entropy calculation is:

$$H(Y) = \frac{1}{2} \log 2 + \frac{1}{4} \log 4 + 2 * \frac{1}{8} \log 8 = \frac{1}{2} + \frac{1}{2} + \frac{3}{4} = \frac{7}{4}$$.

Since there are four outcomes, we could choose to represent this information source with the same coding scheme (two bits each), but there's a way to save a bit on average. The $\frac{1}{2}$ outcome gets "0", the $\frac{1}{4}$ outcome gets "10", and the $\frac{1}{8}$ outcomes get "110" and "111". Half of the time we use 1 bit, one-fourth of the time we use 2 bits, and one-fourth of the time we use 3 bits. This should look familiar, because it lines up exactly with how entropy is calculated. (1 = log 2, 2 = log 4, 3 = log 8)

It's less clear how this intuitive picture lines up when we start considering distributions that don't involve inverse powers of two (how many bits do we need to represent an outcome that happens 1/7th of the time? The ansewr is 2.80735492, but what does that mean exactly? What about an outcome that happens $ \frac{1}{\pi}$ of the time?), but these examples are good for illustrating that there is some sense in which the entropy is the smallest number of bits needed to describe the information, on average.

## Relative entropy
### In words
  - "The relative entropy D(p||q) is a measure of the inefficiency of assuming that the distribution is q when the true distribution is p. For example, if we knew the true distribution p of the random variable, we could construct a code with average description length H(p). If, instead, we used the code for distribution q, we would need H(p) + D(p||q) bits on the average to describe the random variable." [^2] (p. 19)

### Def.

$$D(p || q) = \sum p(x) \log \frac{1}{q(x) / p(x)}$$

### Some notes

Relative entropy blows up if there is an outcome $x$ such that $p(x) > 0$ but $q(x) = 0$. This seems to be a defect in the measure, unless I haven't yet understood why it should be the case.

In some sense, relative entropy can be thought of a way of measuring the "distance" between two distributions. It's not a true metric, however, since it fails symmetricity and the triangle inequality. Turns out positive definiteness is pretty useful on its own, though.

After description, tie it all together with a pretties:

![Relationship between joint, conditional, relative entropies and mutual information](/images/entropy_venn_wiki.png)

## References

  [^1]: T. Schreiber. "Measuring Information Transfer".
  [^2]: T. Cover & J. Thomas. *Elements of Information Theory*. 2nd edition.
  [^3]: "Entropy (information theory)". <http://en.wikipedia.org/wiki/Entropy_(information_theory)>
