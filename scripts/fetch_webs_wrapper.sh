#!/bin/bash

/root/tmp/fetch_webs.sh | sed -e "s/\,\ \]/\]/g" | sed -e "s/\}\,\ \}/\} \ \}/g"

