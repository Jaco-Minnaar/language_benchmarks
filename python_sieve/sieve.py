import math;
import time;

def find_primes(max):
    bv = [True] * ((max // 2) + 1)
    bv[0] = False;

    for i in range(3,1+int(math.sqrt(float(max))), 2):
        #print(i)
        if bv[i // 2]:
            j = i
            while i * j < max:
                bv[(i * j) // 2] = False
                j += 2
            #print("Prime")

    numPrimes = bv.count(True)
    
    if numPrimes != 78498:
        print(f"{numPrimes} != 78498")


start = time.time()
iterations = 0

while (time.time() - start <= 5):
    find_primes(1000000)
    iterations += 1

print(f"Python did {iterations} iterations in 5 seconds")