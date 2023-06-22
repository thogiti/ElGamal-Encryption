   from sage.all import *

   # Find a safe generator 'g' for a given prime 'p'
   def find_safe_generator(p):
       q = (p - 1) // 2
       g = 2
       while True:
           if power_mod(g, q, p) != 1:
               return g
           g += 1
        
   # Key Generation
   p = random_prime(2^256, lbound=2^255, proof=False)  # 256-bit prime number
   g = find_safe_generator(p)   # Generator
   x = 6   # Bob's private key
   Y = power_mod(g, x, p)  # Bob's public key

   # Encryption (Alice)
   M = random_prime(2^256, lbound=2^255, proof=False)   # Message
   k = 3   # Random value
   a = power_mod(g, k, p)
   b = (power_mod(Y, k, p) * M) % p

   # Decryption (Bob)
   M_decrypted = (b * power_mod(a, -x, p)) % p

   print("Original message:", M)
   print("Encrypted message:", (a, b))
   print("Decrypted message:", M_decrypted)
