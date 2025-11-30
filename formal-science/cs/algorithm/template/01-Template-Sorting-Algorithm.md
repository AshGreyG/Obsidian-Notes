---
tags:
  - computer-science
  - algorithm
date: 2025-11-25
---

## 1 Compared Sort

+ [o] **Bubble Sort**
  + Time complexity: best $\Omega(n)$, average $\Theta(n^2)$, worst $O(n^2)$
  + Space complexity: $\Theta(1)$
  + Python implementation:

     ``` python
     def bubble_sort(array : List[int]) -> None :
        swapped = True
        while swapped :
            swapped = False
            for i in range(1, len(array)) :
                if array[i] < array[i - 1] :
                    array[i - 1], array[i] = array[i], array[i - 1]
                    swapped = True
     ```

  + Benchmark
    <div style="display: flex; justify-content: space-between">
      <img
        src="_assets/svg/Bubble-Sort-Benchmark-Time.svg"
        style="width:49%"
      />
      <img
        src="_assets/svg/Bubble-Sort-Benchmark-Memory.svg"
        style="width:49%"
      />
    </div>
+ [o] **Insertion Sort**
  + Time complexity: best $\Omega(n)$, average $\Theta(n^2)$, worst $O(n^2)$
  + Space complexity: $\Theta(1)$
  + Python implementation

    ``` python
    def insertion_sort(array : List[int]) -> None :
        i = 1
        while i < len(array) :
            j = i
            while j > 0 and array[j - 1] > array[j] :
                array[j - 1], array[j] = array[j], array[j - 1]
                j -= 1
            i += 1
    ```

  + Benchmark
    <div style="display: flex; justify-content: space-between">
      <img
        src="_assets/svg/Insertion-Sort-Benchmark-Time.svg"
        style="width:49%"
      />
      <img
        src="_assets/svg/Insertion-Sort-Benchmark-Memory.svg"
        style="width:49%"
      />
    </div>

## 2 Un-compared Sort

+ [o] **Bucket Sort**
  + Principle: Bucket sort assumes that the input is in **linear
    distribution**, every element has same probability to fall in a
    bucket. Bucket sort divides the input array into $k$ part and
    each bucket represents a interval whose length is $n / k$. When
    a element is in this interval then it falls into this bucket.
    We can consider the input array has $n$ elements and
    there are $k$ buckets, each bucket of index $i$ has $n_i$ 
    elements. Here we have $\sum_{i = 1}^{k} n_i = n$. Assume the sort
    algorithm in bucket has complexity $f(n)$.
  + Time complexity:
    + best

    $$
      \boxed{\Theta\left(n + k + \min_{\{n_i\}}\sum_i f(n_i)\right) 
      \xrightarrow{k = \Theta(n)} \Theta(n) }
    $$

    + average

    $$
      \boxed{\Theta\left(n + k + k \cdot \mathbb{E}[f(n_1)] \right)
      \xrightarrow[\text{input in linear distribution}]{k = \Theta(n)} \Theta(n) }
    $$

    + worst

    $$
      \boxed{\Theta(n + k + f(n)) = \Theta(f(n))}
    $$

  + Space complexity: $\Theta(n + k)$
  + Python implementation

    ``` python
    def internal_sort(array : List[int]) -> None : ...
    def bucket_sort(array : List[int]) -> None :
        min_val = min(array)
        max_val = max(array)
        bucket_count = len(array)
        bucket_size = max((max_val - min_val + 1) // bucket_count, 1);
        buckets : List[List[int]] = [[] for _ in range(bucket_count)]

        for num in array :
            bucket_index = int((num - min_val) / bucket_size)
            bucket_index = min(bucket_index, bucket_count - 1)
            buckets[bucket_index].append(num)

        sorted_array = []
        for bucket in buckets :
            if bucket :
                internal_sort(bucket)
                sorted_array.extend(bucket)

        for i in range(len(array)) :
            array[i] = sorted_array[i]
    ```
