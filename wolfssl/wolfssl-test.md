```
openssl speed -bytes 10485767 -seconds 1 sha256 sha512
openssl speed -bytes 10485767 -seconds 1 -evp sha256 sha512

openssl speed -bytes 10485767 -seconds 1 aes-128-cbc aes-256-cbc
openssl speed -bytes 10485767 -seconds 1 -evp aes-128-cbc aes-256-cbc

openssl speed -bytes 10485767 -seconds 1 -evp rsa2048
openssl speed -bytes 10485767 -seconds 1 -evp rsa2048

/app/src/wolfssl-5.6.6-lw/wolfcrypt/benchmark/benchmark
/app/src/wolfssl-5.6.6-mp/wolfcrypt/benchmark/benchmark
/app/src/wolfssl-5.6.6/wolfcrypt/benchmark/benchmark

some tests:
1. wout AES-NI and wout SP-MATH = LOW
2. with AES-NI and wout SP-MATH = MID
3. with AES-NI and with SP-MATH = BEST
```

> /app/src/wolfssl-5.6.6-lw/wolfcrypt/benchmark/benchmark  
> wolfSSL version 5.6.6 without AES-NI without SP-MATH  
> Math:   Multi-Precision: Wolf(SP) word-size=64 bits=8192 sp_int.c  
> wolfCrypt Benchmark (block bytes 1048576, min 1.0 sec each)  

|  |  |  |
|:---|---:|---:|
| RNG                           |   155 MiB took 1.029 seconds |
| AES-128-CBC-enc               |   420 MiB took 1.011 seconds |
| AES-128-CBC-dec               |   450 MiB took 1.004 seconds |
| AES-192-CBC-enc               |   360 MiB took 1.007 seconds |
| AES-192-CBC-dec               |   380 MiB took 1.005 seconds |
| AES-256-CBC-enc               |   315 MiB took 1.011 seconds |
| AES-256-CBC-dec               |   325 MiB took 1.008 seconds |
| AES-128-GCM-enc               |   210 MiB took 1.017 seconds |
| AES-128-GCM-dec               |   210 MiB took 1.022 seconds |
| AES-192-GCM-enc               |   195 MiB took 1.021 seconds |
| AES-192-GCM-dec               |   190 MiB took 1.006 seconds |
| AES-256-GCM-enc               |   180 MiB took 1.019 seconds |
| AES-256-GCM-dec               |   180 MiB took 1.021 seconds |
| GMAC Table 4-bit              |   444 MiB took 1.000 seconds |
| AES-128-CTR                   |   360 MiB took 1.010 seconds |
| AES-192-CTR                   |   310 MiB took 1.006 seconds |
| AES-256-CTR                   |   275 MiB took 1.002 seconds |
| CHACHA                        |   670 MiB took 1.004 seconds |
| CHA-POLY                      |   500 MiB took 1.002 seconds |
| MD5                           |   935 MiB took 1.005 seconds |
| POLY1305                      |  1955 MiB took 1.003 seconds |
| SHA                           |   955 MiB took 1.002 seconds |
| SHA-224                       |   330 MiB took 1.001 seconds |
| SHA-256                       |   335 MiB took 1.007 seconds |
| SHA-384                       |   615 MiB took 1.003 seconds |
| SHA-512                       |   620 MiB took 1.001 seconds |
| SHA-512/224                   |   620 MiB took 1.008 seconds |
| SHA-512/256                   |   620 MiB took 1.007 seconds |
| SHA3-224                      |   510 MiB took 1.009 seconds |
| SHA3-256                      |   480 MiB took 1.009 seconds |
| SHA3-384                      |   365 MiB took 1.007 seconds |
| SHA3-512                      |   260 MiB took 1.015 seconds |
| HMAC-MD5                      |   935 MiB took 1.003 seconds |
| HMAC-SHA                      |   955 MiB took 1.000 seconds |
| HMAC-SHA224                   |   335 MiB took 1.013 seconds |
| HMAC-SHA256                   |   330 MiB took 1.009 seconds |
| HMAC-SHA384                   |   620 MiB took 1.007 seconds |
| HMAC-SHA512                   |   615 MiB took 1.005 seconds |
| PBKDF2                        |    41 KiB took 1.000 seconds |
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


> /app/src/wolfssl-5.6.6-mp/wolfcrypt/benchmark/benchmark  
> wolfSSL version 5.6.6 with AES-NI without SP-MATCH  
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


> /app/src/wolfssl-5.6.6/wolfcrypt/benchmark/benchmark  
> wolfSSL version 5.6.6 with AES-NI with SP-MATH  
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

