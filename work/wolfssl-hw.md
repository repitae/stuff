> /app/src/wolfssl-5.6.6/wolfcrypt/benchmark/benchmark  
> wolfSSL version 5.6.6 with AESNI with SP-MATH  
> Math:   Single Precision: ecc 256 384 521 rsa/dh 2048 3072 4096 asm sp_x86_64.c  
> wolfCrypt Benchmark (block bytes 1048576, min 1.0 sec each)  

|  |  |  |
|:---|---:|---:|
| RNG                           |    235 MiB took 1.011 seconds |
| AES-128-CBC-enc               |   2210 MiB took 1.002 seconds |
| AES-128-CBC-dec               |  14675 MiB took 1.000 seconds |
| AES-192-CBC-enc               |   1880 MiB took 1.002 seconds |
| AES-192-CBC-dec               |  12215 MiB took 1.000 seconds |
| AES-256-CBC-enc               |   1625 MiB took 1.001 seconds |
| AES-256-CBC-dec               |  10575 MiB took 1.000 seconds |
| AES-128-GCM-enc               |   8900 MiB took 1.000 seconds |
| AES-128-GCM-dec               |   8915 MiB took 1.000 seconds |
| AES-192-GCM-enc               |   8105 MiB took 1.001 seconds |
| AES-192-GCM-dec               |   8150 MiB took 1.000 seconds |
| AES-256-GCM-enc               |   7435 MiB took 1.000 seconds |
| AES-256-GCM-dec               |   7480 MiB took 1.001 seconds |
| GMAC Table 4-bit              |   2300 MiB took 1.000 seconds |
| AES-128-CTR                   |    940 MiB took 1.004 seconds |
| AES-192-CTR                   |    875 MiB took 1.005 seconds |
| AES-256-CTR                   |    820 MiB took 1.003 seconds |
| CHACHA                        |   3855 MiB took 1.001 seconds |
| CHA-POLY                      |   2650 MiB took 1.001 seconds |
| MD5                           |    935 MiB took 1.002 seconds |
| POLY1305                      |   8305 MiB took 1.000 seconds |
| SHA                           |    945 MiB took 1.002 seconds |
| SHA-224                       |    570 MiB took 1.007 seconds |
| SHA-256                       |    570 MiB took 1.009 seconds |
| SHA-384                       |    875 MiB took 1.001 seconds |
| SHA-512                       |    875 MiB took 1.006 seconds |
| SHA-512/224                   |    875 MiB took 1.003 seconds |
| SHA-512/256                   |    875 MiB took 1.003 seconds |
| SHA3-224                      |    595 MiB took 1.008 seconds |
| SHA3-256                      |    565 MiB took 1.009 seconds |
| SHA3-384                      |    430 MiB took 1.003 seconds |
| SHA3-512                      |    300 MiB took 1.004 seconds |
| HMAC-MD5                      |    935 MiB took 1.003 seconds |
| HMAC-SHA                      |    950 MiB took 1.003 seconds |
| HMAC-SHA224                   |    570 MiB took 1.008 seconds |
| HMAC-SHA256                   |    565 MiB took 1.007 seconds |
| HMAC-SHA384                   |    870 MiB took 1.001 seconds |
| HMAC-SHA512                   |    880 MiB took 1.001 seconds |
| PBKDF2                        |     64 KiB took 1.000 seconds |
| RSA   2048            key gen |     34 ops took 1.027 seconds |
| RSA   2048             public |  90200 ops took 1.001 seconds |
| RSA   2048            private |   2700 ops took 1.015 seconds |
| DH    2048            key gen |   5432 ops took 1.000 seconds |
| DH    2048              agree |   5500 ops took 1.008 seconds |
| ECC   [SECP256R1] 256 key gen | 109300 ops took 1.000 seconds |
| ECDHE [SECP256R1] 256   agree |  29200 ops took 1.000 seconds |
| ECDSA [SECP256R1] 256    sign |  71700 ops took 1.000 seconds |
| ECDSA [SECP256R1] 256  verify |  27600 ops took 1.001 seconds |
| CURVE 25519           key gen |  49427 ops took 1.000 seconds |
| CURVE 25519             agree |  50900 ops took 1.000 seconds |

> Benchmark complete