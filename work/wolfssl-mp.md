> /app/src/wolfssl-5.6.6-mp/wolfcrypt/benchmark/benchmark  
> wolfSSL version 5.6.6 with AESNI without SP-MATCH  
> Math:   Multi-Precision: Wolf(SP) word-size=64 bits=8192 sp_int.c  
> wolfCrypt Benchmark (block bytes 1048576, min 1.0 sec each)  

|  |  |  |
|:---|---:|---:|
| RNG                           |   235 MiB took 1.013 seconds |
| AES-128-CBC-enc               |  2195 MiB took 1.000 seconds |
| AES-128-CBC-dec               | 14560 MiB took 1.000 seconds |
| AES-192-CBC-enc               |  1870 MiB took 1.000 seconds |
| AES-192-CBC-dec               | 12120 MiB took 1.000 seconds |
| AES-256-CBC-enc               |  1620 MiB took 1.002 seconds |
| AES-256-CBC-dec               | 10480 MiB took 1.000 seconds |
| AES-128-GCM-enc               |  8890 MiB took 1.000 seconds |
| AES-128-GCM-dec               |  8900 MiB took 1.000 seconds |
| AES-192-GCM-enc               |  8080 MiB took 1.000 seconds |
| AES-192-GCM-dec               |  8075 MiB took 1.000 seconds |
| AES-256-GCM-enc               |  7415 MiB took 1.001 seconds |
| AES-256-GCM-dec               |  7455 MiB took 1.000 seconds |
| GMAC Table 4-bit              |  2304 MiB took 1.000 seconds |
| AES-128-CTR                   |   945 MiB took 1.004 seconds |
| AES-192-CTR                   |   870 MiB took 1.005 seconds |
| AES-256-CTR                   |   820 MiB took 1.001 seconds |
| CHACHA                        |  3830 MiB took 1.001 seconds |
| CHA-POLY                      |  2635 MiB took 1.001 seconds |
| MD5                           |   935 MiB took 1.001 seconds |
| POLY1305                      |  8210 MiB took 1.000 seconds |
| SHA                           |   940 MiB took 1.003 seconds |
| SHA-224                       |   570 MiB took 1.006 seconds |
| SHA-256                       |   565 MiB took 1.005 seconds |
| SHA-384                       |   875 MiB took 1.004 seconds |
| SHA-512                       |   845 MiB took 1.002 seconds |
| SHA-512/224                   |   875 MiB took 1.005 seconds |
| SHA-512/256                   |   880 MiB took 1.004 seconds |
| SHA3-224                      |   595 MiB took 1.002 seconds |
| SHA3-256                      |   565 MiB took 1.002 seconds |
| SHA3-384                      |   435 MiB took 1.004 seconds |
| SHA3-512                      |   300 MiB took 1.002 seconds |
| HMAC-MD5                      |   930 MiB took 1.003 seconds |
| HMAC-SHA                      |   945 MiB took 1.004 seconds |
| HMAC-SHA224                   |   570 MiB took 1.005 seconds |
| HMAC-SHA256                   |   570 MiB took 1.008 seconds |
| HMAC-SHA384                   |   885 MiB took 1.002 seconds |
| HMAC-SHA512                   |   875 MiB took 1.000 seconds |
| PBKDF2                        |    65 KiB took 1.000 seconds |
| RSA   2048            key gen |   11 ops took 1.071  seconds |
| RSA   2048             public | 36200 ops took 1.000 seconds |
| RSA   2048            private |   700 ops took 1.060 seconds |
| DH    2048            key gen |  2970 ops took 1.000 seconds |
| DH    2048              agree |  1500 ops took 1.045 seconds |
| ECC   [SECP256R1] 256 key gen | 3400 ops took 1.021  seconds |
| ECDHE [SECP256R1] 256   agree | 3400 ops took 1.019  seconds |
| ECDSA [SECP256R1] 256    sign | 3300 ops took 1.027  seconds |
| ECDSA [SECP256R1] 256  verify | 5000 ops took 1.011  seconds |
| CURVE 25519           key gen | 49929 ops took 1.000 seconds |
| CURVE 25519             agree | 51500 ops took 1.000 seconds |

> Benchmark complete 