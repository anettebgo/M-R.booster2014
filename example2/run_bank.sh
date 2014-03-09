#!/bin/bash

cat bank.csv | ./bank_mapper.R | sort | ./bank_reducer.R
