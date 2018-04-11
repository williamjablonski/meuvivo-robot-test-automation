#!/usr/bin/env bash

#----------------------------------------

# PRE PROD - PRE

robot --outputDir reports/meuvivo --variable URL:"https://hmlxxx-meuvivo.vivo.com.br/meuvivo" --variable USERNAME:"12345" --variable PASSWORD:"12345" test/vivo-tests.robot
