> /app/src/wolfssl-5.6.6-lw/wolfcrypt/benchmark/benchmark  
> wolfSSL version 5.6.6 without AESNI without SP-MATH  
> Math:   Multi-Precision: Wolf(SP) word-size=64 bits=8192 sp_int.c  
> wolfCrypt Benchmark (block bytes 1048576, min 1.0 sec each)  

|  |  |  |
|:---|---:|---:|
| RNG                           |   155 MiB took 1.029 seconds |
| AES-128-CBC-enc               |   420 MiB took 1.011 seconds |
| AES-128-CBC-dec               |   450 MiB took 1.004 seconds |
| AES-256-CBC-enc               |   315 MiB took 1.011 seconds |
| AES-256-CBC-dec               |   325 MiB took 1.008 seconds |
| AES-128-GCM-enc               |   210 MiB took 1.017 seconds |
| AES-128-GCM-dec               |   210 MiB took 1.022 seconds |
| AES-256-GCM-enc               |   180 MiB took 1.019 seconds |
| AES-256-GCM-dec               |   180 MiB took 1.021 seconds |
| AES-128-CTR                   |   360 MiB took 1.010 seconds |
| AES-256-CTR                   |   275 MiB took 1.002 seconds |
| CHACHA                        |   670 MiB took 1.004 seconds |
| CHA-POLY                      |   500 MiB took 1.002 seconds |
| POLY1305                      |  1955 MiB took 1.003 seconds |
| SHA-256                       |   335 MiB took 1.007 seconds |
| SHA-384                       |   615 MiB took 1.003 seconds |
| SHA-512                       |   620 MiB took 1.001 seconds |
| SHA-512/256                   |   620 MiB took 1.007 seconds |
| SHA3-256                      |   480 MiB took 1.009 seconds |
| SHA3-384                      |   365 MiB took 1.007 seconds |
| SHA3-512                      |   260 MiB took 1.015 seconds |
| HMAC-SHA                      |   955 MiB took 1.000 seconds |
| HMAC-SHA256                   |   330 MiB took 1.009 seconds |
| HMAC-SHA384                   |   620 MiB took 1.007 seconds |
| HMAC-SHA512                   |   615 MiB took 1.005 seconds |
| RSA   2048            key gen |    12 ops took 1.021 seconds |
| RSA   2048             public | 35500 ops took 1.001 seconds |
| RSA   2048            private |   700 ops took 1.073 seconds |
| DH    2048            key gen |  2941 ops took 1.000 seconds |
| DH    2048              agree |  1500 ops took 1.038 seconds |
| ECC   [SECP256R1] 256 key gen |  3300 ops took 1.002 seconds |
| ECDHE [SECP256R1] 256   agree |  3400 ops took 1.010 seconds |
| ECDSA [SECP256R1] 256    sign |  3300 ops took 1.023 seconds |
| ECDSA [SECP256R1] 256  verify |  5000 ops took 1.003 seconds |
| CURVE 25519           key gen | 30944 ops took 1.000 seconds |
| CURVE 25519             agree | 31300 ops took 1.002 seconds |

> Benchmark complete  