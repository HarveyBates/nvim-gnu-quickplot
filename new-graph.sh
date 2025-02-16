#!/bin/sh

# Template paths
template_2d="${GRAPH_PATH}/basic_2d.gp"
template_3d="${GRAPH_PATH}/basic_3d.gp"

while getopts n:d:h-: flag; do 
  case "${flag}" in
      # Subject Name
    n) graph_name="${OPTARG}" ;;
    d) graph_dims="${OPTARG}" ;;
    h) 
      echo "New Graph - New 2D or 3D graph from templates." 
      echo " "
      echo "Options:"
      echo "-h              Show help information."
      echo "-n              Graph name."
      echo "-d              Graph dimensions."
      exit 0 ;;
    \?) 
      echo "Invalid option: -"$OPTARG"" >&3
      exit 1 ;;
		:) 
      echo "Option -"$OPTARG" requires an argument" >&2
			exit 1 ;;
  esac
done
shift "$(( OPTIND - 1 ))"

if [[ "$graph_name" == "" ]]; then
  echo "No graph name provided."
  exit 1
fi

if [[ "$graph_dims" == "" ]]; then
  echo "No required dimensions provided."
  exit 1
fi

if [[ $graph_dims == "2" ]]; then
  echo "Creating 2D-graph."
  cp "$template_2d" "$graph_name.gp"
  exit 0
fi

if [[ $graph_dims == "3" ]]; then
  echo "Creating 3D-graph."
  cp "$template_3d" "$graph_name.gp"
  exit 0
fi

echo "Failed to create plot."

exit 1

