> /app/src/wolfssl-5.6.6-mp/wolfcrypt/benchmark/benchmark  
> wolfSSL version 5.6.6 wAESNI woSP-MATCH  
> Math:   Multi-Precision: Wolf(SP) word-size=64 bits=8192 sp_int.c  
> wolfCrypt Benchmark (block bytes 1048576, min 1.0 sec each)  

| ALG | MiB | CPB |
|:---:|:---:|:---:|
| RNG                             |   235 MiB took 1.013 seconds |    231.879 MiB/s  |
| AES-128-CBC-enc                 |  2195 MiB took 1.000 seconds |    2194.641 MiB/s |
| AES-128-CBC-dec                 | 14560 MiB took 1.000 seconds |   14559.899 MiB/s |
| AES-192-CBC-enc                 |  1870 MiB took 1.000 seconds |    1869.661 MiB/s |
| AES-192-CBC-dec                 | 12120 MiB took 1.000 seconds |   12117.677 MiB/s |
| AES-256-CBC-enc                 |  1620 MiB took 1.002 seconds |    1616.747 MiB/s |
| AES-256-CBC-dec                 | 10480 MiB took 1.000 seconds |   10479.515 MiB/s |
| AES-128-GCM-enc                 |  8890 MiB took 1.000 seconds |    8889.504 MiB/s |
| AES-128-GCM-dec                 |  8900 MiB took 1.000 seconds |    8898.303 MiB/s |
| AES-192-GCM-enc                 |  8080 MiB took 1.000 seconds |    8078.632 MiB/s |
| AES-192-GCM-dec                 |  8075 MiB took 1.000 seconds |    8071.315 MiB/s |
| AES-256-GCM-enc                 |  7415 MiB took 1.001 seconds |    7410.790 MiB/s |
| AES-256-GCM-dec                 |  7455 MiB took 1.000 seconds |    7453.456 MiB/s |
| GMAC Table 4-bit                |  2304 MiB took 1.000 seconds |    2303.262 MiB/s |
| AES-128-CTR                     |   945 MiB took 1.004 seconds |     941.042 MiB/s |
| AES-192-CTR                     |   870 MiB took 1.005 seconds |     866.005 MiB/s |
| AES-256-CTR                     |   820 MiB took 1.001 seconds |     818.816 MiB/s |
| CHACHA                          |  3830 MiB took 1.001 seconds |    3826.369 MiB/s |
| CHA-POLY                        |  2635 MiB took 1.001 seconds |    2633.435 MiB/s |
| MD5                             |   935 MiB took 1.001 seconds |     934.101 MiB/s |
| POLY1305                        |  8210 MiB took 1.000 seconds |    8207.206 MiB/s |
| SHA                             |   940 MiB took 1.003 seconds |     937.279 MiB/s |
| SHA-224                         |   570 MiB took 1.006 seconds |     566.356 MiB/s |
| SHA-256                         |   565 MiB took 1.005 seconds |     562.388 MiB/s |
| SHA-384                         |   875 MiB took 1.004 seconds |     871.584 MiB/s |
| SHA-512                         |   845 MiB took 1.002 seconds |     843.196 MiB/s |
| SHA-512/224                     |   875 MiB took 1.005 seconds |     870.714 MiB/s |
| SHA-512/256                     |   880 MiB took 1.004 seconds |     876.333 MiB/s |
| SHA3-224                        |   595 MiB took 1.002 seconds |     593.867 MiB/s |
| SHA3-256                        |   565 MiB took 1.002 seconds |     563.652 MiB/s |
| SHA3-384                        |   435 MiB took 1.004 seconds |     433.172 MiB/s |
| SHA3-512                        |   300 MiB took 1.002 seconds |     299.263 MiB/s |
| HMAC-MD5                        |   930 MiB took 1.003 seconds |     927.273 MiB/s |
| HMAC-SHA                        |   945 MiB took 1.004 seconds |     941.243 MiB/s |
| HMAC-SHA224                     |   570 MiB took 1.005 seconds |     567.009 MiB/s |
| HMAC-SHA256                     |   570 MiB took 1.008 seconds |     565.532 MiB/s |
| HMAC-SHA384                     |   885 MiB took 1.002 seconds |     883.307 MiB/s |
| HMAC-SHA512                     |   875 MiB took 1.000 seconds |     874.848 MiB/s |
| PBKDF2                          |    65 KiB took 1.000 seconds |      64.675 KiB/s |
| RSA   2048              key gen |   11 ops took 1.071  seconds |    10.271 ops/sec |
| RSA   2048               public | 36200 ops took 1.000 seconds | 36196.772 ops/sec |
| RSA   2048              private |   700 ops took 1.060 seconds |   660.223 ops/sec |
| DH    2048              key gen |  2970 ops took 1.000 seconds |  2969.550 ops/sec |
| DH    2048                agree |  1500 ops took 1.045 seconds |  1435.660 ops/sec |
| ECC   [SECP256R1] 256   key gen | 3400 ops took 1.021  seconds |  3328.469 ops/sec |
| ECDHE [SECP256R1] 256     agree | 3400 ops took 1.019  seconds |  3335.033 ops/sec |
| ECDSA [SECP256R1] 256      sign | 3300 ops took 1.027  seconds |  3214.745 ops/sec |
| ECDSA [SECP256R1] 256    verify | 5000 ops took 1.011  seconds |  4944.464 ops/sec |
| CURVE 25519             key gen | 49929 ops took 1.000 seconds | 49928.143 ops/sec |
| CURVE 25519               agree | 51500 ops took 1.000 seconds | 51491.443 ops/sec |

> Benchmark complete 
