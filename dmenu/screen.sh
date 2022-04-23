#!/bin/bash
readlink -f "$(ls  ./screen_layouts/* | dmenu -p 'Ingrese el layout Deseado')" | bash

