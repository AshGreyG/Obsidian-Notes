---
tags:
  - computer-science
  - cryptography
book: Introduction to Modern Cryptography
author:
  - Jonathan Katz
  - Yehuda Lindell
date: 2025-11-25
---

## 1 Settings of Private-Key Encryption

+ [o] ciphers / encryption schemes: cipher algorithm
+ [o] key: the key to encrypt / decrypt message
+ [o] plaintext -> encrypt
+ [o] ciphertext -> decrypt
+ [o] symmetric-key: encrypt and decrypt using same key
+ [o] **syntax of encryption**: p.6
  + [i] a procedure generating keys $\mathsf{Gen}$
    algorithm that generates a key $k$
  + [i] a procedure for encrypting $\mathsf{Enc}$
    ciphertext $c$ is encrypted by $\mathsf{Enc}$, $c := \mathsf{Enc}_k(m)$
  + [i] a procedure for decrypting $\mathsf{Dec}$
    plaintext can be decrypted by $\mathsf{Dec}$, $m := \mathsf{Dec}(c)$
  + [i] **An encryption scheme must satisfy: for every key $k$ output
    by $\mathsf{Gen}$ and every message $m \in \mathcal{M}$, it holds:**

    $$
       \mathsf{Dec}_k(\mathsf{Enc}_k(m)) = m
    $$

  + [o] key space $\mathcal{K}$: space consisting of key $k$ generated
    by procedure $\mathsf{Gen}$
+ [o] Kerckhoff's principle p.7: importance: key > cipher

## 2 Historical Ciphers

+ [o] **Caesar's cipher** -> ROT-13 variant -> Shift cipher p.10
  + [o] Algorithm $\mathsf{Gen}$ :
    Algorithm $\mathsf{Gen}$ generates a key $k \in \{0, 1, \cdots, 25\}$
  + [o] Algorithm $\mathsf{Enc}$ :
    Message is denoted as $m = m_1m_2 \cdots m_n$, for $i$th character 
    $m_i$ in message, its corresponding encrypted character is

    $$
      c_i := \mathsf{Enc}_k(m_i) = [(m_i + k) \space\text{mod}\space 26]
    $$

    So for the message we have

    $$
      \mathsf{Enc}_k(m_1\cdots m_n) = c_1 \cdots c_n
      \space\text{where}\space c_i =
      [(m_i + k)\space\text{mod}\space 26]
    $$
 
  + [o] Algorithm $\mathsf{Dec}$ :
    Similarly we have the method to decrypt ciphertext:

    $$
      \mathsf{Dec}_k(c_1\cdots c_n) = m_1 \cdots m_n
      \space\text{where}\space m_i =
      [(c_i - k)\space\text{mod}\space 26]
    $$

  + [o] Brute-force attack: Key space of mono-alphabetic shift
    cipher is small (only $26$). So it's easy to automate to attack
    the ciphertext
+ [o] **Sufficient key-space principle**
  Key space should be large enough so that brute force cannot find
  the right key.
+ [ ] **Mono-alphabetic substitution cipher** p.11
  + [ ] Algorithm $\mathsf{Gen}$ :
  + [ ] Algorithm $\mathsf{Enc}$ :
  + [ ] Algorithm $\mathsf{Dec}$ :
  + [ ] Attack for mono-alphabetic substitution cipher
+ [ ] **Poly-alphabetic substitution cipher** p.13
  + [ ] Algorithm $\mathsf{Gen}$ :
  + [ ] Algorithm $\mathsf{Enc}$ :
  + [ ] Algorithm $\mathsf{Dec}$ :
  + [ ] -> **Poly-alphabetic shift cipher**
    + [ ] Algorithm $\mathsf{Gen}$ :
    + [ ] Algorithm $\mathsf{Enc}$ :
    + [ ] Algorithm $\mathsf{Dec}$ : 
  + [ ] -> **Vigenere cipher**
    + [ ] Algorithm $\mathsf{Gen}$ :
    + [ ] Algorithm $\mathsf{Enc}$ :
    + [ ] Algorithm $\mathsf{Dec}$ : 
    + [ ] Attack for Vigenere cipher p.14