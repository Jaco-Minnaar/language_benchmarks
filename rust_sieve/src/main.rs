use std::usize;

use std::time::Instant;

fn main() {
    let max = 1000000;
    let time = Instant::now();
    let mut iterations = 0;

    while time.elapsed().as_millis() <= 5000 {
        find_primes(max);
        iterations += 1;
    }
    println!("Rust performed {} iteration in 5 seconds", iterations);
}

fn find_primes(max: usize) {
    let mut bv = vec![true; max / 2 + 1];

    bv[0] = false;

    for i in (3..1 + (max as f64).sqrt() as usize).step_by(2) {
        //println!("{}", i);
        if bv[i / 2] {
            for j in (i..).step_by(2) {
                if (i * j) >= max {
                    break;
                }
                bv[(i * j) / 2] = false;
            }
            // println!("Prime");
        }
    }

    let num_primes = bv.iter().filter(|x| **x).count();
    assert_eq!(num_primes, 78498);
}
