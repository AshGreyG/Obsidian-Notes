---
tags:
  - math
  - probability
date: 2026-02-27
---

## 1 Sample Space

+ [ ] Sample Space
  + [ ] The set of all possible outcomes of a statistical experiment is called
    the **sample space** and is represented by the symbol $\Omega$.
  + [ ] Each outcome in a sample space is called **element** or **sample point**.
  + [ ] More than one sample space can be used to describe the outcomes of an
    experiment. Use $\Omega_1 = \{1,2,3,4,5,6\}$ to denote **number showing on
    the top face**, and use $\Omega_2 = \{\mathsf{even}, \mathsf{odd}\}$ to
    denote **whether the number is even or odd**.

## 2 Events

+ [ ] Events
  + [ ] An **event** is a subset of a sample space, for example event $A$,
    $A \subseteq \Omega$. We use $\emptyset$ to denote a **null set** or
    **empty set**.
  + [ ] The **complement** of an event $A$ with respect to $\Omega$ is the subset
    of all elements of $\Omega$ that are not in $A$. We denote the complement of
    $A$ by the symbol $\overline{A}$
  + [ ] The **intersection** of two events $A$ and $B$ denoted by the symbol
    $A \cap B$, is the event containing all elements that common to $A$ and $B$.
  + [ ] Two events $A$ and $B$ are **mutually exclusive** or **disjoint**.
    If $A \cap B = \emptyset$, that is if $A$ and $B$ have no elements in common.
  + [ ] The **union** of the two events $A$ and $B$, denoted by the symbol
    $A \cup B$, is the event containing all the elements that belong to $A$ or
    $B$ or both.

## 3 Counting Sample Points

+ [ ] If an operation can be performed in $n_1$ ways, and if for each of these
  ways a second operation can be performed in $n_2$ ways, then the two operations
  can be performed together in $n_1n_2$ ways.

  => (**generalized multiplication**). If an operation can be performed in $n_1$
  ways, second operation can be performed in $n_2$ ways ..., $k$-th operation
  can be performed in $n_k$ ways, then the sequence of $k$ operations can be
  performed in $n_1n_2 \cdots n_k$ ways.

+ [ ] A **permutation** is an arrangement of all parts of a set of objects. The
  number of permutations of $n$ objects is $n! = n \times (n-1) \cdots \times 1$.

  => The number of permutations of $n$ distinct objects taken $r$ at a time is

  $$
    \binom{n}{r} = \phantom{a}_n P_r = \frac{n!}{(n - r)!}
  $$

  => Permutations that occur by arranging objects in a circle are called
  **circular permutations**. The number of permutations of $n$ distinct objects
  arranged in a circle is $(n - 1)!$.

  => The number of distinct permutations of $n$ things of which $n_1$ are of
  one kind and $n_2$ are of second kind, ..., $n_k$ of a $k$-th kind is

  $$
    \frac{n!}{n_1! n_2! \cdots n_k!}
  $$

  => The number of ways of partitioning a set of $n$ objects into $r$ cells with
  $n_1$ elements in the first cell, $n_2$ elements in the second, and so forth, is

  $$
    \binom{n}{n_1,n_2, \cdots, n_r} = \frac{n!}{n_1! n_2! \cdots n_r!}
  $$

  where $n_1 + n_2 + \cdots + n_r = n$

+ [ ] We are interested in the number of ways of selecting $r$ objects from $n$
  without regard to order. These selections are called **combinations**,
  *combination is actually a partition with two cells*, the one cell contains
  $r$ objects and the other cell containing the $(n - r)$ objects that are left.

## 4 Probability of an Event

+ [ ] We consider only those experiments for which the sample space contains
  a **finite number** of an event resulting from such a statistical experiment
  is evaluated by means of a set of **real numbers**, called **weights** or
  **probabilities**.

  The probability of an event $A$ is the sum of the weights of all sample points
  in $A$. Therefore, $0 \le P(A) \le 1$, $P(\emptyset) = 0$ and $P(\Omega) = 1$.

  If $A_1,A_2,\cdots$ is a sequence of mutually exclusive events, then

  $$
    P(A_1 \cup A_2 \cup \cdots) = P(A_1) + P(A_2) + \cdots
  $$

+ [ ] If an experiment can result in any one of $N$ different equally likely
  outcomes, if exactly $n$ of these outcomes correspond to event $A$, then the
  probability of $A$ is

  $$
    P(A) = \frac{n}{N}
  $$

## 5 Additive Rules

+ [ ] If $A$ and $B$ and two events then

  $$
    P(A \cup B) = P(A) + P(B) - P(A \cap B)
  $$

  and if $A$ and $B$ are mutually exclusive, then $P(A \cup B) = P(A) + P(B)$.
  Also this theorem can be generalized to multiple events: if $A_1, A_2, \cdots,
  A_n$ are mutually exclusive then $P(A_1 \cup A_2 \cup \cdots \cup A_n) = 
  P(A_1) + P(A_2) + \cdots + P(A_n) = P(\Omega) = 1$

+ [ ] If $A$ and $\overline{A}$ are complementary events then

  $$
   P(A) + P(\overline{A}) = 1
  $$

## 6 Conditional Probability

+ [ ] The probability of an event $B$ occurring when it is known that some
  event $A$ has occurred is called a **conditional probability** and is denoted
  as $P(B | A)$. The conditional probability of $B$ given $A$ is calculated by

  $$
    P(B | A) = \frac{P(A \cap B)}{P(A)} = \frac{n(A \cap B)}{n(A)}
  $$

  here $n(A)$ is the number of elements in any set $A$.

+ [ ] Two events $A$ and $B$ are **independent** if and only if

  $$
    P(B | A) = P(B)
  $$

  assuming the existences of the conditional probabilities. Otherwise $A$  and
  $B$ are **dependent**. The occurrence of $A$ has no impact on the odds of
  occurrence of $B$.

+ [ ] If in an experiment the events $A$ and $B$ can both occur, then

  $$
    P(A \cap B) = P(A) \cdot P(B | A)
  $$

  so the two events $A$ and $B$ are independent if and only $P(A \cap B) =
  P(A) P(B)$

+ [ ] If in an experiment the events $A_1, A_2, \cdots, A_k$ can occur, then

  $$
  \begin{aligned}
    P(A_1 & \cap A_2 \cap \cdots \cap A_k) \\
      & = P(A_1) \cdot P(A_2 | A_1) \cdot P(A_3 | A_1 \cap A_2) \cdots
      P(A_k | A_1 \cap A_2 \cap \cdots \cap A_{k-1})
  \end{aligned}
  $$

  so the events $A_1,A_2, \cdots, A_k$ are independent then $P(A_1 \cap A_2
  \cap \cdots \cap A_k) = P(A_1) \cdot P(A_2) \cdots P(A_k)$