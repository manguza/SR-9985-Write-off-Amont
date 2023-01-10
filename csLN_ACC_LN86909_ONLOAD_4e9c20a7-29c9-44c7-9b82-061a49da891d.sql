BEGIN TRANSACTION
WHILE 1=1
BEGIN
  -- Insert scripts
begin tran
                                           UPDATE S_CLIENT_SCRIPT SET SCRIPT_ID=N'4e9c20a7-29c9-44c7-9b82-061a49da891d', INT_ID=null, FUNCTION_NAME=N'csLN_ACC_LN86909_ONLOAD', DESCRIPTION=N'csLN_ACC_LN86909_ONLOAD', FUNCTION_CODE=N'function csLN_ACC_LN86909_ONLOAD()
{
debugger;

	var PWOFID = document.getElementById(''PWOFID'').value;

	if(PWOFID == ""){
		alert(''Only Account Flag Write-off'');
	}
	else
	{
	gsGeneralViewOnLoad()
	}

}', VERSION=N'0.1', DATE_CREATED='2022-08-17 13:36:14.133', DATE_MODIFIED='2022-11-21 11:04:34.363', SCRIPT_LANGUAGE=N'JS', RETURN_FALSE=N'N', SCRIPT_TYPE=N'0', CREATED_BY=N'2364b04d-72d6-453c-b751-d534c20e44c3', MODIFIED_BY=N'0b68f8a9-6125-4111-822b-35f40dc1ca0f' WHERE SCRIPT_ID = '4e9c20a7-29c9-44c7-9b82-061a49da891d'

                                           if @@rowcount = 0
                                           begin
                                                  INSERT INTO S_CLIENT_SCRIPT(SCRIPT_ID, INT_ID, FUNCTION_NAME, DESCRIPTION, FUNCTION_CODE, VERSION, DATE_CREATED, DATE_MODIFIED, SCRIPT_LANGUAGE, RETURN_FALSE, SCRIPT_TYPE, CREATED_BY, MODIFIED_BY) VALUES(N'4e9c20a7-29c9-44c7-9b82-061a49da891d', null, N'csLN_ACC_LN86909_ONLOAD', N'csLN_ACC_LN86909_ONLOAD', N'function csLN_ACC_LN86909_ONLOAD()
{
debugger;

	var PWOFID = document.getElementById(''PWOFID'').value;

	if(PWOFID == ""){
		alert(''Only Account Flag Write-off'');
	}
	else
	{
	gsGeneralViewOnLoad()
	}

}', N'0.1', '2022-08-17 13:36:14.133', '2022-11-21 11:04:34.363', N'JS', N'N', N'0', N'2364b04d-72d6-453c-b751-d534c20e44c3', N'0b68f8a9-6125-4111-822b-35f40dc1ca0f')
                                           end
                                        commit tran

  COMMIT
PRINT 'Import completed successfully'
  BREAK
END
