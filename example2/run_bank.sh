#!/bin/bash

cat bank_subset.csv | ./bank_mapper.R | sort | ./bank_reducer.R
