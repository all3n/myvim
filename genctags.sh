#!/bin/bash
ctags -I __THROW \
    -I __attribute__ \
    -I __attribute_pure__ \
    -I __nonnull \
    --file-scope=yes \
    --langmap=c:+.h \
    --languages=c,c++ \
    --links=yes \
    --c-kinds=+p \
    --c++-kinds=+p \
    --fields=+iaS \
    --extra=+q -R \
    -f $(pwd)/tags $(pwd)

