SET OLD=customer
SET NEW=MyPages
SET PATH="test/max"

icacls "pages" /grant John:(OI)(CI)F /T
cd pages

mkdir %PATH%/
timeout=1000
Xcopy /E /I %OLD%s %NEW%s
cd %PATH%/%NEW%s
timeout=10

ren %OLD%-delete-dialog %NEW%-delete-dialog
cd %NEW%-delete-dialog
ren %OLD%DeleteDialog.js %NEW%DeleteDialog.js
powershell -Command "(gc %NEW%DeleteDialog.js) -replace '%OLD%', '%NEW%' | Out-File -encoding ASCII %NEW%DeleteDialog.js"
cd ../

ren %OLD%-edit-dialog %NEW%-edit-dialog
cd %NEW%-edit-dialog
ren %OLD%EditDialog.js %NEW%EditDialog.js
powershell -Command "(gc %NEW%EditDialog.js) -replace '%OLD%', '%NEW%' | Out-File -encoding ASCII %NEW%EditDialog.js"
ren %OLD%EditDialogHeader.js %NEW%EditDialogHeader.js
powershell -Command "(gc %NEW%EditDialogHeader.js) -replace '%OLD%', '%NEW%' | Out-File -encoding ASCII %NEW%EditDialogHeader.js"
ren %OLD%EditForm.js %NEW%EditForm.js
powershell -Command "(gc %NEW%EditForm.js) -replace '%OLD%', '%NEW%' | Out-File -encoding ASCII %NEW%EditForm.js"
cd ../

ren %OLD%s-delete-dialog %NEW%s-delete-dialog
cd %NEW%s-delete-dialog
ren %OLD%sDeleteDialog.js %NEW%sDeleteDialog.js
powershell -Command "(gc %NEW%sDeleteDialog.js) -replace '%OLD%', '%NEW%' | Out-File -encoding ASCII %NEW%sDeleteDialog.js"
cd ../

ren %OLD%s-fetch-dialog %NEW%s-fetch-dialog
cd %NEW%s-fetch-dialog
ren %OLD%sFetchDialog.js %NEW%sFetchDialog.js
powershell -Command "(gc %NEW%sFetchDialog.js) -replace '%OLD%', '%NEW%' | Out-File -encoding ASCII %NEW%sFetchDialog.js"
cd ../

ren %OLD%s-filter %NEW%s-filter
cd %NEW%s-filter
ren %OLD%sFilter.js %NEW%sFilter.js
powershell -Command "(gc %NEW%sFilter.js) -replace '%OLD%', '%NEW%' | Out-File -encoding ASCII %NEW%sFilter.js"
cd ../

ren %OLD%s-grouping %NEW%s-grouping
cd %NEW%s-grouping
ren %OLD%sGrouping.js %NEW%sGrouping.js
powershell -Command "(gc %NEW%sGrouping.js) -replace '%OLD%', '%NEW%' | Out-File -encoding ASCII %NEW%sGrouping.js"
cd ../

ren %OLD%s-loading-dialog %NEW%s-loading-dialog
cd %NEW%s-loading-dialog
ren %OLD%sLoadingDialog.js %NEW%sLoadingDialog.js
powershell -Command "(gc %NEW%sLoadingDialog.js) -replace '%OLD%', '%NEW%' | Out-File -encoding ASCII %NEW%sLoadingDialog.js"
cd ../

ren %OLD%s-table %NEW%s-table
cd %NEW%s-table
ren %OLD%sTable.js %NEW%sTable.js
powershell -Command "(gc %NEW%sTable.js) -replace '%OLD%', '%NEW%' | Out-File -encoding ASCII %NEW%sTable.js"
cd column-formatters
powershell -Command "(gc ActionsColumnFormatter.js) -replace '%OLD%', '%NEW%' | Out-File -encoding ASCII ActionsColumnFormatter.js"
powershell -Command "(gc index.js) -replace '%OLD%', '%NEW%' | Out-File -encoding ASCII index.js"
powershell -Command "(gc StatusColumnFormatter.js) -replace '%OLD%', '%NEW%' | Out-File -encoding ASCII StatusColumnFormatter.js"
powershell -Command "(gc TypeColumnFormatter.js) -replace '%OLD%', '%NEW%' | Out-File -encoding ASCII TypeColumnFormatter.js"
cd ../../

ren %OLD%s-update-status-dialog %NEW%s-update-status-dialog
cd %NEW%s-update-status-dialog
ren %OLD%sUpdateStateDialog.js %NEW%sUpdateStateDialog.js
powershell -Command "(gc %NEW%sUpdateStateDialog.js) -replace '%OLD%', '%NEW%' | Out-File -encoding ASCII %NEW%sUpdateStateDialog.js"
cd ../

ren %OLD%sCard.js %NEW%sCard.js
powershell -Command "(gc %NEW%sCard.js) -replace '%OLD%', '%NEW%' | Out-File -encoding ASCII %NEW%sCard.js"
ren %OLD%sPage.js %NEW%sPage.js
powershell -Command "(gc %NEW%sPage.js) -replace '%OLD%', '%NEW%' -replace '/e-commerce/', '/%MAINS%/' | Out-File -encoding ASCII %NEW%sPage.js"
ren %OLD%sUIContext.js %NEW%sUIContext.js
powershell -Command "(gc %NEW%sUIContext.js) -replace '%OLD%', '%NEW%' | Out-File -encoding ASCII %NEW%sUIContext.js"
ren %OLD%sUIHelpers.js %NEW%sUIHelpers.js
powershell -Command "(gc %NEW%sUIHelpers.js) -replace '%OLD%', '%NEW%' | Out-File -encoding ASCII %NEW%sUIHelpers.js"
cd ../../

icacls "_redux" /grant John:(OI)(CI)F /T
cd _redux
Xcopy /E /I %OLD%s new
ren new %NEW%s
cd %NEW%s
timeout=10
ren %OLD%sActions.js %NEW%sActions.js
powershell -Command "(gc %NEW%sActions.js) -replace '%OLD%', '%NEW%' | Out-File -encoding ASCII %NEW%sActions.js"
ren %OLD%sCrud.js %NEW%sCrud.js
powershell -Command "(gc %NEW%sCrud.js) -replace '%OLD%', '%NEW%' | Out-File -encoding ASCII %NEW%sCrud.js"
ren %OLD%sSlice.js %NEW%sSlice.js
powershell -Command "(gc %NEW%sSlice.js) -replace '%OLD%', '%NEW%' | Out-File -encoding ASCII %NEW%sSlice.js"
cd ../../

icacls "__mocks__" /grant John:(OI)(CI)F /T
cd __mocks__
Xcopy /E /I %OLD%s new
ren new %NEW%s
cd %NEW%s
timeout=10
ren %OLD%TableMock.js %NEW%TableMock.js
powershell -Command "(gc %NEW%TableMock.js) -replace '%OLD%', '%NEW%' | Out-File -encoding ASCII %NEW%TableMock.js"
ren mock%OLD%.js mock%NEW%.js
powershell -Command "(gc mock%NEW%.js) -replace '%OLD%', '%NEW%' | Out-File -encoding ASCII mock%NEW%.js"
ren mock%OLD%Lib.js mock%NEW%Lib.js
powershell -Command "(gc mock%NEW%Lib.js) -replace '%OLD%', '%NEW%' | Out-File -encoding ASCII mock%NEW%Lib.js"
