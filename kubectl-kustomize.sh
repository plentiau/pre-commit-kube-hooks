#!/bin/bash

if ! hash kubectl 2>/dev/null; then
  echo "kubectl not found"
  exit 1
fi

dirsToCheck=$(find . -type f -name "kustomization.yaml" -exec dirname "{}" \; |sort -u)

while IFS= read -r dir; do
  echo "Checking kustomization on $dir"
  kubectl kustomize "$dir" 1>/dev/null
  ret=$?
  if $ret -ne "0"; then
    echo "Kustomize failed on $dir"
    exit 1
  fi
done <<< "$dirsToCheck"