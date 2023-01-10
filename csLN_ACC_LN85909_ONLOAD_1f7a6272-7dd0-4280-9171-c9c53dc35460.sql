BEGIN TRANSACTION
WHILE 1=1
BEGIN
  -- Insert scripts
begin tran
                                           UPDATE S_CLIENT_SCRIPT SET SCRIPT_ID=N'1f7a6272-7dd0-4280-9171-c9c53dc35460', INT_ID=null, FUNCTION_NAME=N'csLN_ACC_LN85909_ONLOAD', DESCRIPTION=N'csLN_ACC_LN85909_ONLOAD', FUNCTION_CODE=N'function csLN_ACC_LN85909_ONLOAD()
{
debugger;	
	var LKLINE;
	var todatDate = getSessVar(''SYSTEMDATE'');
	var wkPWOFID = gsGetQueryString("PWOFID","");
	var wkPWOAP8 = gsGetQueryString("PWOAP8","");

	
	if(gsGetQueryString("LKLINE","") != ""){
		LKLINE = gsGetQueryString("LKLINE","");
	}
	
	if(LKLINE == "")
		LKLINE = opener.document.getElementById("LKLINE").innerText;


	if(wkPWOFID == "8" && todatDate == wkPWOAP8){
		document.getElementById(''bbtnAdd'').disabled = true;
		document.getElementById(''bbbtnAdd'').disabled = true;
	}else{
		if(document.getElementById(''list_MAIN'') != null){
			if(document.getElementById(''listErr'') == null){
				if(LKLINE != ''Y'' && document.getElementById(''list_MAIN'').getElementsByTagName(''tr'').length > 1){
					document.getElementById(''bbtnAdd'').disabled = true;
					document.getElementById(''bbbtnAdd'').disabled = true;
				}
			}	
		}
	}
	
	gsGeneralPageOnLoad();
	
}', VERSION=N'0.1', DATE_CREATED='2022-11-09 10:58:25.053', DATE_MODIFIED='2022-11-30 16:42:27.330', SCRIPT_LANGUAGE=N'JS', RETURN_FALSE=N'N', SCRIPT_TYPE=N'0', CREATED_BY=N'e20479e3-fcce-40ae-af0e-08f17c430890', MODIFIED_BY=N'e20479e3-fcce-40ae-af0e-08f17c430890' WHERE SCRIPT_ID = '1f7a6272-7dd0-4280-9171-c9c53dc35460'

                                           if @@rowcount = 0
                                           begin
                                                  INSERT INTO S_CLIENT_SCRIPT(SCRIPT_ID, INT_ID, FUNCTION_NAME, DESCRIPTION, FUNCTION_CODE, VERSION, DATE_CREATED, DATE_MODIFIED, SCRIPT_LANGUAGE, RETURN_FALSE, SCRIPT_TYPE, CREATED_BY, MODIFIED_BY) VALUES(N'1f7a6272-7dd0-4280-9171-c9c53dc35460', null, N'csLN_ACC_LN85909_ONLOAD', N'csLN_ACC_LN85909_ONLOAD', N'function csLN_ACC_LN85909_ONLOAD()
{
debugger;	
	var LKLINE;
	var todatDate = getSessVar(''SYSTEMDATE'');
	var wkPWOFID = gsGetQueryString("PWOFID","");
	var wkPWOAP8 = gsGetQueryString("PWOAP8","");

	
	if(gsGetQueryString("LKLINE","") != ""){
		LKLINE = gsGetQueryString("LKLINE","");
	}
	
	if(LKLINE == "")
		LKLINE = opener.document.getElementById("LKLINE").innerText;


	if(wkPWOFID == "8" && todatDate == wkPWOAP8){
		document.getElementById(''bbtnAdd'').disabled = true;
		document.getElementById(''bbbtnAdd'').disabled = true;
	}else{
		if(document.getElementById(''list_MAIN'') != null){
			if(document.getElementById(''listErr'') == null){
				if(LKLINE != ''Y'' && document.getElementById(''list_MAIN'').getElementsByTagName(''tr'').length > 1){
					document.getElementById(''bbtnAdd'').disabled = true;
					document.getElementById(''bbbtnAdd'').disabled = true;
				}
			}	
		}
	}
	
	gsGeneralPageOnLoad();
	
}', N'0.1', '2022-11-09 10:58:25.053', '2022-11-30 16:42:27.330', N'JS', N'N', N'0', N'e20479e3-fcce-40ae-af0e-08f17c430890', N'e20479e3-fcce-40ae-af0e-08f17c430890')
                                           end
                                        commit tran

  COMMIT
PRINT 'Import completed successfully'
  BREAK
END
