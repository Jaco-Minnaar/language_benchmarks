const findPrimes = (max) => {
  const bv = Array(Math.floor(max / 2) + 1).fill(true);
  bv[0] = false;

  for (let i = 3; i < 1 + Math.floor(Math.sqrt(max)) ; i+=2) {
    if (bv[Math.floor(i / 2)]) {
      for (let j = i; i*j < max; j+=2) {
        bv[Math.floor(i*j/2)] = false;
      }
    }
  }

  const numPrimes = bv.filter(x => x).length;

  // if (numPrimes !== 78498) {
  //   console.log(`${numPrimes} != 78498`);
  //   return -1;
  // }
}

const start = new Date().getTime();
let iterator = 0;

while (new Date().getTime() - start < 5000) {
  findPrimes(1000000);
  iterator++;
}

console.log(`NodeJS performed ${iterator} iterations in 5 seconds`);



