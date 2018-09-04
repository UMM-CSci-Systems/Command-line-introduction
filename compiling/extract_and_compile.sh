#!/bin/sh

tar -xf NthPrime.tgz -C $2

cd $2/NthPrime

gcc main.c nth_prime.c -o NthPrime

./NthPrime $1


