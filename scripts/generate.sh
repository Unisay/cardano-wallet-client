#!/usr/bin/env bash

openapi3-code-generator-exe \
  --incremental \
  --package-name cardano-wallet-client \
  --module-name Wallet \
  --output-dir generated \
  --do-not-generate-stack-project \
  --use-numbered-variant-constructors \
  cardano_wallet_specification.yaml
