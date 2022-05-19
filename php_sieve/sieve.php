<?php 

$max = 1_000_000;
$iterations = 0;
$start = time();

while (time() - $start < 5) {
    findPrimes($max);
    $iterations += 1;
}

printf("PHP performed %d iterations in 5 seconds\n", $iterations);

function findPrimes(int $max) {
    $bv = array();
    $bv = array_pad($bv, floor($max / 2 + 1), true);

    $bv[0] = false;

    for ($i = 3; $i <= floor(sqrt($max)); $i += 2) {
        if ($bv[floor($i / 2)]) {
            for ($j = $i; $i * $j < $max; $j += 2) {
                $bv[floor(($i * $j) / 2)] = false;
            }
        }
    }

    $num_p = 0;
    foreach ($bv as $p) {
        if ($p) $num_p++;
    }
}

