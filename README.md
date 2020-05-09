# Covid19 CH Dashboard in MS Excel
## Ausgangslage
Zurzeit existieren mindestens drei verschiedene Online Covid-19 CH Dashboads. Alle drei bieten gute Grafiken jedoch teilweise mit verschiedenen Diagrammen an. Die Daten sind alle up-to-date.
## Covid-19 CH als Excelfile
Die Online Dashboards sind betreffend den Daten und Grafiken statisch. Da heisst, der Endbenutzer hat keine Möglichkeiten die Daten anders auszuwerten und auch andere Grafiken anzufertigen. Daraus entstand die Idee inwieweit sich ein solches Dashboard in MS Excel realisieren liesse. 
### Excel mit VBA COde für Updates
Damit die alle Updates funktionieren bedarf es der Ausführung von VBA Code in Excel. Excel muss dies explizit erlauben. 
#### VBA COde für Pivot-Tabellen Updates
Die Covi19-Daten wachsen kontinuierlich und somit auch die Tabellen. Dass die notwendigen Pivot-Tablellen auf die neuen Zeilenlängen angepasst werden ist VBA Code notwendig. Der dafür notwendige COde sieht so aus:

Private Sub Worksheet_Change(ByVal Target As Range)

    Dim Sheet As Worksheet, Pivot As PivotTable
 
        For Each Sheet In ThisWorkbook.Worksheets
            For Each Pivot In Sheet.PivotTables
                Pivot.RefreshTable
                Pivot.Update
        Next
    Next
End Sub
#### Datenverbindungen und Probleme beim Start von Excel
In Excel selbt kann man festlegen, wann und wie of eine Datenverbindung aktualisiert wird So zum Beispiel wie oft und auch beim Start von Excel. wenn man nun die Daten beim Start aktualisieren will so kommt Excel mit der untenstehenden Routine durcheinander und stürzt ab. Die gefundene Lösung schaltet beim Start von Excel den Worksheet_Change Event für ein paar Sekunden aus. Excel kann damit voll aufstarten, die Daten aktualisieren und erst danach auf das Worksheet_Change reagieren.
Code:
Private Sub Workbook_Open()
       Application.EnableEvents = False
       Application.Wait (Now + TimeValue("0:00:10"))
       Application.EnableEvents = True
End Sub
## Datenbezug
Die Daten werden über Webverbindungen aus Excel heraus bezogen und transformiert. 
Quellen sind:
https://raw.githubusercontent.com/zdavatz/covid19_ch/master/data-cantons-csv/dd-covid19-openzh-cantons-series.csv
https://raw.githubusercontent.com/zdavatz/covid19_ch/master/data-cantons-csv/dd-covid19-openzh-cantons-latest.csv
https://raw.githubusercontent.com/zdavatz/covid19_ch/master/data-switzerland-csv/dd-covid19-openzh-switzerland-latest.csv
### Limitation
Weil diese Daten in einem anderen Projekt mit Python Scripts aufbereitet werden besteht eine Abhängigkeit bezüglich Aktualisierung. Wird die Datenstruktur verändert so funktionieren die Updates nicht mehr. Die Daten im Excelfile sind dann quasi eingefroren.
## Datenaktualisierung
In Excel muss die Datenbearbeitung aktiviert sein. Danach verbindet Excel bei jedem neuen Start des Excelfiles die Daten und aktualisiert diese alle 20 Minuten.
# Vorteile
Da man das Excelfile nach eigenem Wunsch anpassen kann sind Auswertungen aller Art möglich.
## Warnung
Die Tabellenblätter „ch_latest“, „kt_latest“, kt_serie“, pivot_kt_latest und „pivot_kt_serie“ sollten nicht verändert werden, da sonst auch das Blatt Graphs nicht mehr funktionieren könnte. Will man eigene Auswertungen machen, so empfiehlt es sich sehr neue Tablellenblätter anzulegen und dort tätig zu werden.
## Updates
Das Excelfile wird periodisch updated. Die aktuelle Version ist über https://github.com/tgdbepe4/covid_19_excel zu finden.
## Kontakt
Meinungen, Fehlermeldungen, etc bitte an mailto:corona@bergi-it-consulting.ch
Peter Berger, Zürich, 2020-04-19

# Covid19 CH Dashboard in MS Excel
## Starting point
There are currently at least three different online Covid-19 CH Dashboads. However, all three offer good graphics, some with different charts. The data is all up-to-date.
## Covid-19 CH as Excelfile
The online dashboards are static in terms of data and graphics. This means that the end user has no options to evaluate the data differently and also to make other graphics. This gave rise to the idea of how such a dashboard could be realized in MS Excel. 
## Data source
The data is obtained and transformed from Excel via web connections.
Sources are:
https://raw.githubusercontent.com/zdavatz/covid19_ch/master/data-cantons-csv/dd-covid19-openzh-cantons-series.csv
https://raw.githubusercontent.com/zdavatz/covid19_ch/master/data-cantons-csv/dd-covid19-openzh-cantons-latest.csv
https://raw.githubusercontent.com/zdavatz/covid19_ch/master/data-switzerland-csv/dd-covid19-openzh-switzerland-latest.csv
### Limitations
Because this data is processed in another project with Python Scripts, there is a dependency on updating. If the data structure there is changed, the updates will no longer work. The data in the Excelfile is then frozen.
## Data update
In Excel, data editing must be enabled. After that, Excel connects the data each time the Excel file is started and updates it every 20 minutes.
## Benefits
Since you can customize the Excelfile according to your wishes, evaluations of all kinds are possible.
## Warning
The worksheets "ch_latest", "kt_latest",  kt_serie",  pivot_kt_latest and "pivot_kt_serie" should not bechanged, otherwise the sheet Graphs might not work. If you want to do your own evaluations, it is recommended to create very new table sheets and to work there.
## Updates
The Excelfile is updatedperiodically. The current version can be found via https://github.com/tgdbepe4/covid_19_excel.
## Contact
Opinions, error messages, etc. please contact mailto:corona@bergi-it-consulting.ch
Peter Berger, Zurich, 2020-04-19






