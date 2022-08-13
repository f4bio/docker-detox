#!/bin/sh


exec "/app/xteve -temp.path=${XTEVE_TMP_DIR} -config=/config $@"
