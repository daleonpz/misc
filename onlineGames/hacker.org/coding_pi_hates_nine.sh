#!/bin/bash

# Challenge 'Pi Hates Nines' [Coding]
cat 1000000.file | tr '9' '\n' | sort -nr | head -1
