using System;
using System.Collections;
using System.Collections.Specialized;
using System.Linq;

namespace csharp_sieve
{
    class Program
    {
        static void Main(string[] args)
        {
            var start = DateTime.Now;
            var iterations = 0;

            while (DateTime.Now.Subtract(start).TotalMilliseconds <= 5000)
            {
                findPrimes(1000000);
                iterations++;
            }

            Console.WriteLine($"C# completed {iterations} iterations in 5 seconds");

        }

        static void findPrimes(int max)
        {
            var bv = new bool[max / 2 + 1];
            Array.Fill(bv, true);

            bv[0] = false;

            for (int i = 3; i < (1 + (int)Math.Sqrt((float)max)); i += 2)
            {
                // Console.WriteLine(i);
                if (bv[i / 2])
                {
                    for (int j = i; i * j < max; j += 2)
                    {
                        bv[(i * j) / 2] = false;
                    }
                    // Console.WriteLine("Prime");
                }
            }

            var numPrimes = bv.Where(x => x).Count();
            if (numPrimes != 78498)
            {
                throw new Exception($"{numPrimes} != 78498");
            }
        }
    }
}
