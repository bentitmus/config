#!/bin/bash

. common.sh

hostname -f | sed -e "s/login\([0-9]\+\)\.\([^\.]\+\)\..*/%{F-}\2$(b_tag_non_dim)[$(b_font_italic)\1$(b_font_reg)]/"

