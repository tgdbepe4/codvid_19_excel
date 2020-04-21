rem @echo off
K:
cd "K:\myCloud\QGIS_Projekte_github\covid_19_excel\python-scripts"
dir

python digest_openzh.py
python digest_probst.py
python digest_baryluk.py
python digest_baryluk.py
python common_data.py
python digest.py
cd "K:\myCloud\QGIS_Projekte_github\covid_19_excel"
git status
git add .
git commit -m update
git push