#include <stdio.h>
#include <math.h>
#include <time.h>

int find_primes(size_t max)
{
    size_t length = max / 2;
    int bv[length];
    for (size_t i = 0; i < length; i++)
    {
        bv[i] = 1;
    }

    size_t iSqrt = 1 + (size_t)sqrt((double)max);

    for (size_t i = 3; i < iSqrt; i += 2)
    {
        if (bv[i / 2] == 1)
        {
            for (size_t j = i; i * j < max; j += 2)
            {
                bv[(i * j) / 2] = 0;
            }
        }
    }

    size_t primes = 0;
    for (size_t i = 0; i < length; i++)
    {
        if (bv[i] == 0) {
            continue;
        }

        primes += 1;
    }

//    if (primes != 78498)
//    {
//        printf("%i != 78498\n", primes);
//        return -1;
//    }

    return 0;
}

int main() {
    int max = 1000000;

    double start = clock();
    int iterations = 0;
    // find_primes(max);
     while (((clock() - start) / CLOCKS_PER_SEC) < 5)
     {
         find_primes(max);
         iterations++;
     }

    printf("C performed %i iterations in 5 seconds\n", iterations);

    return 0;
}
