> /app/src/wolfssl-5.6.6-lw/wolfcrypt/benchmark/benchmark  
> wolfSSL version 5.6.6 woEASNI woSP-MATH  
> Math:   Multi-Precision: Wolf(SP) word-size=64 bits=8192 sp_int.c  
> wolfCrypt Benchmark (block bytes 1048576, min 1.0 sec each)  

| ALG | MiB | CPB |
|:---|:---:|:---:|
| RNG                             |   155 MiB took 1.029 seconds |     150.689 MiB/s |
| AES-128-CBC-enc                 |   420 MiB took 1.011 seconds |     415.308 MiB/s |
| AES-128-CBC-dec                 |   450 MiB took 1.004 seconds |     448.390 MiB/s |
| AES-192-CBC-enc                 |   360 MiB took 1.007 seconds |     357.613 MiB/s |
| AES-192-CBC-dec                 |   380 MiB took 1.005 seconds |     377.960 MiB/s |
| AES-256-CBC-enc                 |   315 MiB took 1.011 seconds |     311.610 MiB/s |
| AES-256-CBC-dec                 |   325 MiB took 1.008 seconds |     322.276 MiB/s |
| AES-128-GCM-enc                 |   210 MiB took 1.017 seconds |     206.409 MiB/s |
| AES-128-GCM-dec                 |   210 MiB took 1.022 seconds |     205.562 MiB/s |
| AES-192-GCM-enc                 |   195 MiB took 1.021 seconds |     190.940 MiB/s |
| AES-192-GCM-dec                 |   190 MiB took 1.006 seconds |     188.932 MiB/s |
| AES-256-GCM-enc                 |   180 MiB took 1.019 seconds |     176.611 MiB/s |
| AES-256-GCM-dec                 |   180 MiB took 1.021 seconds |     176.249 MiB/s |
| GMAC Table 4-bit                |   444 MiB took 1.000 seconds |     443.988 MiB/s |
| AES-128-CTR                     |   360 MiB took 1.010 seconds |     356.399 MiB/s |
| AES-192-CTR                     |   310 MiB took 1.006 seconds |     308.118 MiB/s |
| AES-256-CTR                     |   275 MiB took 1.002 seconds |     274.392 MiB/s |
| CHACHA                          |   670 MiB took 1.004 seconds |     667.102 MiB/s |
| CHA-POLY                        |   500 MiB took 1.002 seconds |     498.897 MiB/s |
| MD5                             |   935 MiB took 1.005 seconds |     930.592 MiB/s |
| POLY1305                        |  1955 MiB took 1.003 seconds |    1950.047 MiB/s |
| SHA                             |   955 MiB took 1.002 seconds |     952.884 MiB/s |
| SHA-224                         |   330 MiB took 1.001 seconds |     329.544 MiB/s |
| SHA-256                         |   335 MiB took 1.007 seconds |     332.717 MiB/s |
| SHA-384                         |   615 MiB took 1.003 seconds |     613.450 MiB/s |
| SHA-512                         |   620 MiB took 1.001 seconds |     619.176 MiB/s |
| SHA-512/224                     |   620 MiB took 1.008 seconds |     614.853 MiB/s |
| SHA-512/256                     |   620 MiB took 1.007 seconds |     615.510 MiB/s |
| SHA3-224                        |   510 MiB took 1.009 seconds |     505.638 MiB/s |
| SHA3-256                        |   480 MiB took 1.009 seconds |     475.614 MiB/s |
| SHA3-384                        |   365 MiB took 1.007 seconds |     362.560 MiB/s |
| SHA3-512                        |   260 MiB took 1.015 seconds |     256.065 MiB/s |
| HMAC-MD5                        |   935 MiB took 1.003 seconds |     931.781 MiB/s |
| HMAC-SHA                        |   955 MiB took 1.000 seconds |     954.705 MiB/s |
| HMAC-SHA224                     |   335 MiB took 1.013 seconds |     330.575 MiB/s |
| HMAC-SHA256                     |   330 MiB took 1.009 seconds |     326.965 MiB/s |
| HMAC-SHA384                     |   620 MiB took 1.007 seconds |     615.467 MiB/s |
| HMAC-SHA512                     |   615 MiB took 1.005 seconds |     611.953 MiB/s |
| PBKDF2                          |    41 KiB took 1.000 seconds |      40.923 KiB/s |
| RSA   2048              key gen |    12 ops took 1.021 seconds |    11.749 ops/sec |
| RSA   2048               public | 35500 ops took 1.001 seconds | 35462.739 ops/sec |
| RSA   2048              private |   700 ops took 1.073 seconds |   652.654 ops/sec |
| DH    2048              key gen |  2941 ops took 1.000 seconds |  2940.701 ops/sec |
| DH    2048                agree |  1500 ops took 1.038 seconds |  1445.710 ops/sec |
| ECC   [SECP256R1] 256   key gen |  3300 ops took 1.002 seconds |  3292.622 ops/sec |
| ECDHE [SECP256R1] 256     agree |  3400 ops took 1.010 seconds |  3367.520 ops/sec |
| ECDSA [SECP256R1] 256      sign |  3300 ops took 1.023 seconds |  3225.461 ops/sec |
| ECDSA [SECP256R1] 256    verify |  5000 ops took 1.003 seconds |  4987.141 ops/sec |
| CURVE 25519             key gen | 30944 ops took 1.000 seconds | 30943.004 ops/sec |
| CURVE 25519               agree | 31300 ops took 1.002 seconds | 31235.248 ops/sec |

> Benchmark complete  