#!/bin/sh

# Compress the file 'NthPrime.tgz' to the tmp directory provided in argument 2
tar -xf NthPrime.tgz -C $2

# Go to the tmp directory provided
cd $2/NthPrime

# Compile the contents of the tmp directory into a executable
gcc main.c nth_prime.c -o NthPrime

# Call the resulting program with our original number argument
./NthPrime $1


