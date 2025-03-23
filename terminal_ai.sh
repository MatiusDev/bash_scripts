#!/bin/bash

# Script options below

while getopts "hv:o:d" opt; do

  case ${opt} in

    h ) # Help option

      echo "Usage: $0 [-h] [-v value] [-o output] [-d]"

      echo "Options:"

      echo "  -h     Show this help message"

      echo "  -v     Specify a value"

      echo "  -o     Specify output file"

      echo "  -d     Enable debug mode"

      exit 0

      ;;

    v ) # Value option

      VALUE=$OPTARG
      echo "The value typed is $VALUE"

      ;;

    o ) # Output option

      OUTPUT=$OPTARG
      echo "The user's output is $OUTPUT"

      ;;

    d ) # Debug option

      DEBUG=true
      echo "Debug mode activated"

      ;;

    \? )

      echo "Invalid option: -$OPTARG" 1>&2

      exit 1

      ;;

  esac

done

