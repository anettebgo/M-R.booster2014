#!/bin/bash

cat post.csv | ./post_mapper.R | sort | ./post_reducer.R
