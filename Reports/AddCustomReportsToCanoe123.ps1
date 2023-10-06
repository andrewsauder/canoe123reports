$now = (Get-Date).ToUniversalTime().ToString("yyyy-MM-ddTHHmm")

$documentsPath = [Environment]::GetFolderPath("MyDocuments")
$reportFilePathname = "$documentsPath\Canoe123\Reports.xml"

Copy-Item $reportFilePathname -Destination "$documentsPath\Canoe123\Reports-backup-$now.xml" -Force

# Read the existing file
[xml]$xmlDoc = Get-Content $reportFilePathname


#judge sheets
$Reports = $xmlDoc.CreateElement("Reports")
$ReportTypeCode = $xmlDoc.CreateElement("ReportTypeCode")
$ReportTypeCode.InnerText = "StartList"
$Description = $xmlDoc.CreateElement("Description")
$Description.InnerText = "Judge Sheets"
$Reportfile = $xmlDoc.CreateElement("Reportfile")
$Reportfile.InnerText = "StartList-JudgesSheet-5bib-notes-2022.lst"
$Customization = $xmlDoc.CreateElement("Customization")

$Reports.AppendChild($ReportTypeCode)
$Reports.AppendChild($Description)
$Reports.AppendChild($Reportfile)
$Reports.AppendChild($Customization)

$xmlDoc.Canoe123Reports.AppendChild($Reports)


#checklist
$Reports = $xmlDoc.CreateElement("Reports")
$ReportTypeCode = $xmlDoc.CreateElement("ReportTypeCode")
$ReportTypeCode.InnerText = "CheckList"
$Description = $xmlDoc.CreateElement("Description")
$Description.InnerText = "Corrected"
$Reportfile = $xmlDoc.CreateElement("Reportfile")
$Reportfile.InnerText = "ChecklistCorrected.lst"
$Customization = $xmlDoc.CreateElement("Customization")

$Reports.AppendChild($ReportTypeCode)
$Reports.AppendChild($Description)
$Reports.AppendChild($Reportfile)
$Reports.AppendChild($Customization)

$xmlDoc.Canoe123Reports.AppendChild($Reports)

# $newReportNode = [xml]@"  
# <Reports>
#     <ReportTypeCode>StartList</ReportTypeCode>
#     <Description>Judge Sheets</Description>
#     <Reportfile>StartList-JudgesSheet-5bib-notes-2022.lst</Reportfile>
#     <Customization />
# </Reports>
# "@

# $newReportNode2 = [xml]@"  
# <Reports>
#     <ReportTypeCode>CheckList</ReportTypeCode>
#     <Description>Corrected Checklist</Description>
#     <Reportfile>ChecklistCorrected.lst</Reportfile>
#     <Customization />
# </Reports>
# "@



# Then you can save that back to the xml file
$xmlDoc.Save($reportFilePathname)


