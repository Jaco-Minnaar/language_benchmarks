package com.company;

import java.io.Console;
import java.util.Arrays;

public class Main {

    public static void main(String[] args) {
        var start = System.nanoTime();
        var iterations = 0;

        while ((System.nanoTime() - start)/1000000 < 5000) {
            findPrimes(1000000);
            iterations++;
        }

        System.out.printf("Java performed %d iterations in 5 seconds%n", iterations);
    }

    public static void findPrimes(int max) {
        var bv = new boolean[max/2+1];
        Arrays.fill(bv, true);

        bv[0] = false;

        for (int i = 3; i < 1 + (int)Math.sqrt(max); i+=2) {
            if (bv[i/2]) {
                for (int j = i; i*j < max; j+=2) {
                    bv[(i*j) / 2] = false;
                }
            }
        }

        var numPrimes = 0;
        for (boolean b : bv) {
            if (b) {
                numPrimes++;
            }
        }

        if (numPrimes != 78498) {
            System.out.println(numPrimes + " != 78498");
        }
    }
}
