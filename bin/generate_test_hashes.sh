#!/bin/bash

echo -n "Password1" | md5sum | tr -d " -" >> test_hashes.txt
echo -n "HELLO" | md5sum | tr -d " -" >> test_hashes.txt
echo -n "MYSECRET" | md5sum | tr -d " -" >> test_hashes.txt
echo -n "mYSECRET" | md5sum | tr -d " -" >> test_hashes.txt
echo -n "Test1234" | md5sum | tr -d " -" >> test_hashes.txt
echo -n "P455w0rd" | md5sum | tr -d " -" >> test_hashes.txt