#!/bin/bash
cd /media/pi/Data/covid_19_excel/python-scripts

/usr/bin/python3.7 digest_openzh.py
/usr/bin/python3.7 digest_probst.py
/usr/bin/python3.7 digest_baryluk.py
/usr/bin/python3.7 digest_baryluk.py
/usr/bin/python3.7 common_data.py
/usr/bin/python3.7 digest.py
cd /media/pi/Data/covid_19_excel
git status
git add .
git commit -m update
git push
