BEGIN TRANSACTION
WHILE 1=1
BEGIN
  -- Insert scripts
begin tran
                                           UPDATE S_CLIENT_SCRIPT SET SCRIPT_ID=N'af730af4-6bbe-4a6e-ab52-e84fbf41cc20', INT_ID=null, FUNCTION_NAME=N'csLN_ACC_LN81800_ACCSearch', DESCRIPTION=N'csLN_ACC_LN81800_ACCSearch', FUNCTION_CODE=N'/*------------------------------------------------------------------------------------------------------------------------------------------------
 * Modification Logs : Cimb Hubbing
 
    Name                     Init             Date              Remarks
  ----------------         --------        --------------   ----------------------------------------------------------------
  Sarawut K.           K0001         27/07/2017      Add new screen for Discounted Rollover Simulater
  Nuttawut K.          K0002         29/09/2017      Add new screen for Floor Plan Car Status
  Thanakrit P.         K0003         18/12/2019      Add new screen for Collections Inquiry
  Thanakrit P.         K6401         18/10/2021      Add new screen for Allow IPP Paid off, Redemption Inquiry by Main, Repayment Simulator By Main
  Phatthamunee S.      K6402         02/12/2021      Fix alert screen for Redemption Inquiry by Main, Repayment Simulator By Main only Revolving
  Thanakrit P.         K8471         05/08/2022      Add new screen for eSubscription 
  Pruk H.			   K9985		 15/08/2022      Add new screen for Write off amount and add field PWOFID 
  Songkran T.          K9985         08/11/2022      Add Condition for Write off amount When MCLNID =""
  Songkran T.          K9985         09/11/2022      Add Condition for Write off amount When MCLNID ="M" Not Allow Screen
  Pruk H.              K9985         22/11/2022		 Change Condition flag for Account Write off
--------------------------------------------------------------------------------------------------------------------------------------------------*/

//parameter pass in ''ACCTNO,ACTYPE,MCLNID,MNTIND,RCDIND,LEDGERR,CPHCTP,ACTMNO,APTYPE'','''',''''

function csLN_ACC_LN81800_ACCSearch(param,mode,VBKey){
    debugger;
        var rowID,strFlag;
        var strUMode 	= "INQ";
        var aParam 		= param.split(",");
        var strUScreen	= gsGetQueryString("UScreen","");
        var strTITLE 	= gsGetQueryString("TITLE","");
        var strView 	= "LN_ACC_LN85803_HDR_NEW";
        var mode 		= mode == "SEARCH_MODE" ? mode : "";
        var flagprd     = " "; //KK6402
        
        if(mode != "SEARCH_MODE"){
            var objTable = document.getElementById("List_MAIN");
            var rowID 	= event.srcElement.parentNode.parentNode.id.split("_")[1];
            if(rowID.indexOf("A") != -1){
                sPosition = rowID.indexOf("A");
                rowID = rowID.substring(0,sPosition);
            }
            rowID = parseInt(rowID);
            aTemp = new Array (aParam.length);
            for(var x=0;x<aParam.length;x++){
                for(var y=0;y<objTable.rows[rowID+1].cells.length;y++){
                    
                    if(objTable.rows[rowID+1].cells[y].id.indexOf(aParam[x]) != -1) aTemp[x] = objTable.rows[rowID+1].cells[y].innerText;
                    
                    
                    
                }
            }
        }
        else{
            aVBKey = VBKey.split("&");
            //Add in IDXACT and IDXOAC to the array - Patsakorn 18/10/13
            aKey = ["ACCTNO","ACTYPE","MCLNID","MNTIND","RCDIND","LEDGERR","CPHCTP","ACTMNO","APTYPE","CIFNO","IDXOAC","IDXNAC","PRDGRP","PWOFID"] // add in APTYPE to the array - wai kit 01/04/12
            // add PRDGRP to Array - KK6402
            aTemp = new Array (aKey.length);
            for(var x=0;x<aKey.length;x++){
                for(var y=0;y<aVBKey.length;y++){
                    var temp = aVBKey[y].split("=");
                    if(aKey[x] == temp[0]) aTemp[x] = temp[1];
                }
            }
    
        }
        
        
        strID = strUScreen;
        
        strACCTNO = aTemp[0];
        strACTYPE = aTemp[1];
        strMCLNID = aTemp[2];
        strMNTIND = aTemp[3];
        strRCDIND = aTemp[4];
        strLEDGERR = aTemp[5];
        strCPHCTP = aTemp[6];
        strACTMNO = aTemp[7];
        strAPTYPE = aTemp[8]; // add in APTYPE to the array - wai kit 01/04/12
        strCIFNO  = aTemp[9]; // add in CIFNO
        strIDXOAC = aTemp[10];
        strIDXNAC = aTemp[11];
        strPRDGRP = aTemp[12]; //K6402 Product group
        strPWOFID = aTemp[13]; //K9985 Flag Wirte-Off
    if (strID == "STMCLN") {
        strACCTNO =  aTemp[11];
        strACTYPE = ''L'';
        }
        switch(strID){
            case "FEE":
                strPGIND = "LN_ACC_LN85535";
                break;
            case "CLOSEACCOUNT":
                strPGIND = "LN_ACC_LN86820";
                break;
            case "INCREASE LIMIT":
                strPGIND = "LN_ACC_LN86538";
                break;
            case "DECREASE LIMIT":
                strPGIND = "LN_ACC_LN86539";
                break;
            case "REPAYMENT_SCH":
                strView = "LN_ACC_LN82582_HDR";
                strPGIND= "LN_ACC_LN84582";
                break;
            case "REDEMPTION":
                strPGIND = "LN_ACC_LN85830_REDP";
                //alert(strPGIND)
                break;
            case "PAYOFF":
                strPGIND = "LN_ACC_LN85830";
                break;
            case "PREPAYMENT":
                strPGIND = "LN_ACC_LN85831_VIEW";
                break;
            case "ACCOUNT":
                strPGIND = "LN_ACC_LN83503";
                break;
            case "TRFFAC":
                strPGIND = "LN_ACC_SS85001";
                break;
            case "RATE":
                strPGIND = "LN_ACC_LN83503";
                break;
            case "DELINQUENCY":
                strPGIND = "LN_ACC_LN83503";
                break;
            case "COMPROMISED":
                strPGIND = "LN_ACC_LN85301";
                break;
            case "FEA":
                strPGIND = "LN_ACC_LN85307";
                break;
            case "SCHEDULE":
                strPGIND = "LN_ACC_LN86825";
                break;
            case "BILLING":
                if (strAPTYPE == ''O'' || strAPTYPE == ''o'') {
                    alert(''OD Account cannot Maintenance Payment Billing'')// add in APTYPE to the array - wai kit 01/04/12
                    return false;
                    }
                strPGIND = "LN_ACC_LN85531";
                break;
            case "AUTODEBIT":
                strPGIND = "LN_ACC_LN25634";
                break;
            case "NOTICEDATE":
                strPGIND = "LN_ACC_LN85533";
                break;
            case "LINKUNLINK":
                strPGIND = "LN_ACC_LN85533";
                break;
            case "RESCHEDULE":
                strView = "LN_ACC_LN85803_HDR_NEW";
                strPGIND = "LN_ACC_LN86545";
                break;
            case "RESTRUCTURE":
                strView = "LN_ACC_LN85803_HDR_NEW";
                strPGIND = "LN_ACC_LN86545";
                break;
            case "RECALL":
                strPGIND = "LN_ACC_LN86576";
                break;
            case "SWITCHCAMPAIGN":
                strPGIND = "LN_ACC_LN86862";
                break;
            case "HOLDCODE":
                strPGIND = "LN_ACC_LN85304";
                break;
            case "CHANGEPRODUCT":
                strPGIND = "LN_ACC_LN86561";
                break;			
            case "FULLORPARTIAL":
                strPGIND = "LN_ACC_LN82548";
                break;
            case "Restructuring_Main":
                strPGIND = "LN_ACC_LN86864";
                break;
            case "CUSTLEDBAL":
                strPGIND = "";
                break;
            case "ADHOCBILLING":
                strPGIND = "LN_ACC_LN85280";
                break;			
            case "LNSTNO":
                strPGIND = "LN_ACC_LN85322";
                break;	
            case "IISTAX":
                strPGIND = "LN_ACC_LN86829";
                break;				
            //Add by Sasinan 09/09/2013
            case "DRLIMT":
                strPGIND = "LN_ACC_LN86831";
                break;	
            case "STMCLN":
                strPGIND = "LN_ACC_LN86919";
                break;
            case "STAMCMNT":
                strPGIND = "LN_ACC_LN86817";
                break;		
            case "Simupayinq":
                strPGIND = "LN_ACC_LN85324";
                break;
        //K0001 Discounted Rollover Simulater
            case "ROLLOVER":
                strPGIND = "LN_ACC_LN84700";
                break;
        //k0002	Floor Plan Car Status	
            case "CarStatus":	
                strPGIND = "LN_ACC_LN86868_FP";
                break;
        //k0003	Collections Inquiry	
            case "Collections":	
                strPGIND = "LN_ACC_LN86895_Collection_INQ";
                break;			
        //K6401	Allow IPP Paid off	
            case "ALLOWIPP":	
                strPGIND = "LN_ACC_LN86960_INQ";
                break;		
            case "PAYOFFCC":
                strPGIND = "LN_ACC_LN85886";
                break;	
            case "REPAYMENTCC":
                strPGIND = "LN_ACC_LN85888";
                break;					
        //K8471 eSubscription		
            case "ESUBSCRIP":
                strPGIND = "LN_ACC_LN85968";
                break;
        //K8471 eConsent		
            case "ECONSENT":
                strPGIND = "LN_ACC_LN85967";
                break;
        //K9985 Write off amount
            case "WRITEOFFAMOUNT":
                strPGIND = "LN_ACC_LN85909";
                break;
            default :
                strPGIND = "LN_ACC_LN83503";
                break;
            //end		
        }
    
        if(strID == strUScreen){
            if(strID == "CUSTLEDBAL"){
                if(strMNTIND == "M"){
                    strPGIND = "LN_ACC_LN86311";
                    strUMode = strRCDIND == "C" ? "UPD" : "ADD";
                    strTITLE = "Ledger Balance Request";
                }else{
                    strPGIND = "LN_ACC_LN85318";
                    strTITLE = "Ledger Balance Request";
                }
                if(mode != "SEARCH_MODE"){
                    if(strMCLNID != "M")
                        gsOpenHref(null,"generic/view.aspx?VIEW_NAME="+strView+"&keyU_DUMMYPKID=0&UMode="+strUMode+"&MODEIND=UPD&UScreen="+strID+"&TITLE="+strTITLE+"&PGIND="+strPGIND+"&ACCTNO="+strACCTNO+"&ACTYPE="+strACTYPE+"&LEDGERR="+strLEDGERR+"&INDTitle=AcctMaint","","","");
                    else
                        gsOpenHref(null,"generic/view.aspx?VIEW_NAME=LN_ACC_LN85803_HDR_NEW&PGIND=LN_ACC_LN82800_MNT&keyU_DUMMYPKID=0&UScreen="+strID+"&TITLE="+strTITLE+"&INDTitle=AcctMaint&MODEIND=UPD&INDTitle=AcctMaint&NextAction=D&ACCTNO="+strACCTNO+"&ACTYPE="+strACTYPE+"&CPHCTP="+strCPHCTP+"&MCLNID="+strMCLNID+"&ACTMNO="+strACTMNO+"&MFLAG=Y","","","");
                }
                else{
                    if(strMCLNID == "M") strFlag = strID != "PAYOFF" && strID != "PAYOFFCC" && strID != "REPAYMENTCC"  ? "Main" : "";
                    else strFlag = "";
                }
            }
            else{
                if(mode != "SEARCH_MODE"){
                    if(strMCLNID != "M" || strID != "ALLOWIPP" ){
                        if(strID == "PAYOFF" || strID == "PAYOFFCC" || strID == "REPAYMENTCC" || strID == "ESUBSCRIP" || strID == "ECONSENT" || strID == "WRITEOFFAMOUNT"){	// added by Lucas 18/10/2011
                            if(strMCLNID == "M" || strMCLNID == " " ){ //KK6402
                                    // Check error page KK6402
                                if(strTITLE == "Redemption Inquiry By Main Account (Revolving)"){
                                    if(strPRDGRP != "RV"){
                                        alert("This Product not Main Account Revolving");
                                        var flagprd = ''Y'';
                                    }
                                }
                                if(strTITLE == "Repayment Simulator Inquiry by Main (Revolving)"){
                                    if(strPRDGRP != "RV"){
                                        alert("This Product not Main Account Revolving");
                                        var flagprd = ''Y'';
                                    }
                                }
                                //K9985 Start
                                if(strTITLE == "Write-off Amount"){
									//K9985 22/11/2022
                                    //if(strPWOFID == " " || strPWOFID == "1"){
									if(strPWOFID != "8" && strPWOFID != "W"){	
                                        alert("Allow only Write-off Account.");
                                        var flagprd = ''Y'';
                                    }else{
										if(strMCLNID == "M"){
											alert("Allow only Write-off Normal Account And Tranche Account.");
											var flagprd = ''Y'';
										}
									}
									
                                }
                                //K9985 End
                                if(flagprd == '' ''){
                                    gsOpenHref(null,"generic/view.aspx?VIEW_NAME="+strView+"&keyU_DUMMYPKID=0&UMode="+strUMode+"&MODEIND=UPD&UScreen="+strID+"&TITLE="+strTITLE+"&PGIND="+strPGIND+"&ACCTNO="+strACCTNO+"&IDXOAC="+strIDXOAC+"&IDXNAC="+strIDXNAC+"&ACTYPE="+strACTYPE+"&CIFNO="+strCIFNO+"&INDTitle=AcctMaint","","",""); //Ploy KK6402
                                } //KK6402
                            } //KK6402
                            else{ //KK6402
                                //K9985 Start
                                if(strMCLNID == "T" && strID == "WRITEOFFAMOUNT"){
									//K9985 22/11/2022
                                    //if(strPWOFID == " " || strPWOFID == "1"){
									if(strPWOFID != "8" && strPWOFID != "W"){
									 alert("Allow only Write-off Account.");	
									}
                                    else{
                                        strFlag = "";
                                    }
                            }
                            else{
                                // KK6402 alert("Only Main Account can proceed to next screen. ");	
                                alert("Only Main Account can proceed to next screen. ");
                            } //K9985 End
                        } //KK6402

                        
                    }
                        else{
                        gsOpenHref(null,"generic/view.aspx?VIEW_NAME="+strView+"&keyU_DUMMYPKID=0&UMode="+strUMode+"&MODEIND=UPD&UScreen="+strID+"&TITLE="+strTITLE+"&PGIND="+strPGIND+"&ACCTNO="+strACCTNO+"&IDXOAC="+strIDXOAC+"&IDXNAC="+strIDXNAC+"&ACTYPE="+strACTYPE+"&CIFNO="+strCIFNO+"&INDTitle=AcctMaint","","","");
                        }
                    }
                    else{
                        if(strID == "PAYOFF" || strID == "PAYOFFCC" || strID == "REPAYMENTCC" ||  strID != "ALLOWIPP" || strID != "ESUBSCRIP" || strID != "ECONSENT"){	// added by Lucas 18/10/2011
                            gsOpenHref(null,"generic/view.aspx?VIEW_NAME="+strView+"&keyU_DUMMYPKID=0&UMode="+strUMode+"&MODEIND=UPD&UScreen="+strID+"&TITLE="+strTITLE+"&PGIND="+strPGIND+"&ACCTNO="+strACCTNO+"&ACTYPE="+strACTYPE+"&CIFNO="+strCIFNO+"&INDTitle=AcctMaint","","","");
                        }
                        else{
                            gsOpenHref(null,"generic/view.aspx?VIEW_NAME=LN_ACC_LN85803_HDR_NEW&PGIND=LN_ACC_LN82800_MNT&keyU_DUMMYPKID=0&UScreen="+strID+"&TITLE="+strTITLE+"&INDTitle=AcctMaint&MODEIND=UPD&INDTitle=AcctMaint&NextAction=D&ACCTNO="+strACCTNO+"&ACTYPE="+strACTYPE+"&CPHCTP="+strCPHCTP+"&MCLNID="+strMCLNID+"&ACTMNO="+strACTMNO+"&MFLAG=Y","","","");
                        }
                    }
                }
                else{
                    if(strMCLNID == "M"){
                        //K9985 Start
                        if(strID == "WRITEOFFAMOUNT"){
							//K9985 22/11/2022
							//if(strPWOFID == "" || strPWOFID == "1"){
                            if(strPWOFID != "8" && strPWOFID != "W"){
                                alert("Allow only Write-off Account.");
                            }
                            else{
								if(strMCLNID == "M"){
									alert("Allow only Write-off Normal Account And Tranche Account.");
									return false;
								}
                                
                            }
                        }
                        else{ //K9985 End
                        strFlag = strID != "PAYOFF" && strID != "PAYOFFCC" && strID != "REPAYMENTCC" && strID != "ALLOWIPP" && strID != "ESUBSCRIP" && strID != "ECONSENT" ? "Main" : "";
                        }
                    }
                    else{
						//K9985 Start Songkran
						if(strID == "WRITEOFFAMOUNT"){
							//K9985 22/11/2022
                            //if(strPWOFID == "" || strPWOFID == "1"){
							if(strPWOFID != "8" && strPWOFID != "W"){
                                alert("Allow only Write-off Account.");
								return false;
                            }
                            else{
								if(strMCLNID == "M"){
									alert("Allow only Write-off Normal Account And Tranche Account.");
									return false;
								}
                                
                            }
                        }
						//K9985 End Songkran
                        if(strID == "PAYOFF" || strID == "PAYOFFCC" || strID == "REPAYMENTCC" ){	// added by Lucas 18/10/2011
                            alert("Only Main Account can proceed to next screen. ");
                        }	
                        else{
                            strFlag = "";
                        }	
                    }
                }
            } 
            
            if(strFlag == "Main" || strFlag == "") location.href = strFlag == "Main" ? "view.aspx?VIEW_NAME=LN_ACC_LN85803_HDR_NEW&PGIND=LN_ACC_LN82800_MNT&keyU_DUMMYPKID=0&UScreen="+strID+"&TITLE="+strTITLE+"&INDTitle=AcctMaint&MODEIND=UPD&INDTitle=AcctMaint&NextAction=D&ACCTNO="+strACCTNO+"&ACTYPE="+strACTYPE+"&CPHCTP="+strCPHCTP+"&MCLNID="+strMCLNID+"&ACTMNO="+strACTMNO+"&CIFNO="+strCIFNO+"&MFLAG=Y" : "view.aspx?VIEW_NAME="+strView+"&keyU_DUMMYPKID=0&UMode="+strUMode+"&MODEIND=UPD&UScreen="+strID+"&TITLE="+strTITLE+"&PGIND="+strPGIND+"&ACCTNO="+strACCTNO+"&ACTYPE="+strACTYPE+"&LEDGERR="+strLEDGERR+"&CIFNO="+strCIFNO+"&INDTitle=AcctMaint","","","";
            
        }
            
    }', VERSION=N'0.1', DATE_CREATED='3097-09-19 18:19:09.363', DATE_MODIFIED='2022-11-22 17:39:47.843', SCRIPT_LANGUAGE=N'JS', RETURN_FALSE=N'N', SCRIPT_TYPE=N'0', CREATED_BY=null, MODIFIED_BY=N'2364b04d-72d6-453c-b751-d534c20e44c3' WHERE SCRIPT_ID = 'af730af4-6bbe-4a6e-ab52-e84fbf41cc20'

                                           if @@rowcount = 0
                                           begin
                                                  INSERT INTO S_CLIENT_SCRIPT(SCRIPT_ID, INT_ID, FUNCTION_NAME, DESCRIPTION, FUNCTION_CODE, VERSION, DATE_CREATED, DATE_MODIFIED, SCRIPT_LANGUAGE, RETURN_FALSE, SCRIPT_TYPE, CREATED_BY, MODIFIED_BY) VALUES(N'af730af4-6bbe-4a6e-ab52-e84fbf41cc20', null, N'csLN_ACC_LN81800_ACCSearch', N'csLN_ACC_LN81800_ACCSearch', N'/*------------------------------------------------------------------------------------------------------------------------------------------------
 * Modification Logs : Cimb Hubbing
 
    Name                     Init             Date              Remarks
  ----------------         --------        --------------   ----------------------------------------------------------------
  Sarawut K.           K0001         27/07/2017      Add new screen for Discounted Rollover Simulater
  Nuttawut K.          K0002         29/09/2017      Add new screen for Floor Plan Car Status
  Thanakrit P.         K0003         18/12/2019      Add new screen for Collections Inquiry
  Thanakrit P.         K6401         18/10/2021      Add new screen for Allow IPP Paid off, Redemption Inquiry by Main, Repayment Simulator By Main
  Phatthamunee S.      K6402         02/12/2021      Fix alert screen for Redemption Inquiry by Main, Repayment Simulator By Main only Revolving
  Thanakrit P.         K8471         05/08/2022      Add new screen for eSubscription 
  Pruk H.			   K9985		 15/08/2022      Add new screen for Write off amount and add field PWOFID 
  Songkran T.          K9985         08/11/2022      Add Condition for Write off amount When MCLNID =""
  Songkran T.          K9985         09/11/2022      Add Condition for Write off amount When MCLNID ="M" Not Allow Screen
  Pruk H.              K9985         22/11/2022		 Change Condition flag for Account Write off
--------------------------------------------------------------------------------------------------------------------------------------------------*/

//parameter pass in ''ACCTNO,ACTYPE,MCLNID,MNTIND,RCDIND,LEDGERR,CPHCTP,ACTMNO,APTYPE'','''',''''

function csLN_ACC_LN81800_ACCSearch(param,mode,VBKey){
    debugger;
        var rowID,strFlag;
        var strUMode 	= "INQ";
        var aParam 		= param.split(",");
        var strUScreen	= gsGetQueryString("UScreen","");
        var strTITLE 	= gsGetQueryString("TITLE","");
        var strView 	= "LN_ACC_LN85803_HDR_NEW";
        var mode 		= mode == "SEARCH_MODE" ? mode : "";
        var flagprd     = " "; //KK6402
        
        if(mode != "SEARCH_MODE"){
            var objTable = document.getElementById("List_MAIN");
            var rowID 	= event.srcElement.parentNode.parentNode.id.split("_")[1];
            if(rowID.indexOf("A") != -1){
                sPosition = rowID.indexOf("A");
                rowID = rowID.substring(0,sPosition);
            }
            rowID = parseInt(rowID);
            aTemp = new Array (aParam.length);
            for(var x=0;x<aParam.length;x++){
                for(var y=0;y<objTable.rows[rowID+1].cells.length;y++){
                    
                    if(objTable.rows[rowID+1].cells[y].id.indexOf(aParam[x]) != -1) aTemp[x] = objTable.rows[rowID+1].cells[y].innerText;
                    
                    
                    
                }
            }
        }
        else{
            aVBKey = VBKey.split("&");
            //Add in IDXACT and IDXOAC to the array - Patsakorn 18/10/13
            aKey = ["ACCTNO","ACTYPE","MCLNID","MNTIND","RCDIND","LEDGERR","CPHCTP","ACTMNO","APTYPE","CIFNO","IDXOAC","IDXNAC","PRDGRP","PWOFID"] // add in APTYPE to the array - wai kit 01/04/12
            // add PRDGRP to Array - KK6402
            aTemp = new Array (aKey.length);
            for(var x=0;x<aKey.length;x++){
                for(var y=0;y<aVBKey.length;y++){
                    var temp = aVBKey[y].split("=");
                    if(aKey[x] == temp[0]) aTemp[x] = temp[1];
                }
            }
    
        }
        
        
        strID = strUScreen;
        
        strACCTNO = aTemp[0];
        strACTYPE = aTemp[1];
        strMCLNID = aTemp[2];
        strMNTIND = aTemp[3];
        strRCDIND = aTemp[4];
        strLEDGERR = aTemp[5];
        strCPHCTP = aTemp[6];
        strACTMNO = aTemp[7];
        strAPTYPE = aTemp[8]; // add in APTYPE to the array - wai kit 01/04/12
        strCIFNO  = aTemp[9]; // add in CIFNO
        strIDXOAC = aTemp[10];
        strIDXNAC = aTemp[11];
        strPRDGRP = aTemp[12]; //K6402 Product group
        strPWOFID = aTemp[13]; //K9985 Flag Wirte-Off
    if (strID == "STMCLN") {
        strACCTNO =  aTemp[11];
        strACTYPE = ''L'';
        }
        switch(strID){
            case "FEE":
                strPGIND = "LN_ACC_LN85535";
                break;
            case "CLOSEACCOUNT":
                strPGIND = "LN_ACC_LN86820";
                break;
            case "INCREASE LIMIT":
                strPGIND = "LN_ACC_LN86538";
                break;
            case "DECREASE LIMIT":
                strPGIND = "LN_ACC_LN86539";
                break;
            case "REPAYMENT_SCH":
                strView = "LN_ACC_LN82582_HDR";
                strPGIND= "LN_ACC_LN84582";
                break;
            case "REDEMPTION":
                strPGIND = "LN_ACC_LN85830_REDP";
                //alert(strPGIND)
                break;
            case "PAYOFF":
                strPGIND = "LN_ACC_LN85830";
                break;
            case "PREPAYMENT":
                strPGIND = "LN_ACC_LN85831_VIEW";
                break;
            case "ACCOUNT":
                strPGIND = "LN_ACC_LN83503";
                break;
            case "TRFFAC":
                strPGIND = "LN_ACC_SS85001";
                break;
            case "RATE":
                strPGIND = "LN_ACC_LN83503";
                break;
            case "DELINQUENCY":
                strPGIND = "LN_ACC_LN83503";
                break;
            case "COMPROMISED":
                strPGIND = "LN_ACC_LN85301";
                break;
            case "FEA":
                strPGIND = "LN_ACC_LN85307";
                break;
            case "SCHEDULE":
                strPGIND = "LN_ACC_LN86825";
                break;
            case "BILLING":
                if (strAPTYPE == ''O'' || strAPTYPE == ''o'') {
                    alert(''OD Account cannot Maintenance Payment Billing'')// add in APTYPE to the array - wai kit 01/04/12
                    return false;
                    }
                strPGIND = "LN_ACC_LN85531";
                break;
            case "AUTODEBIT":
                strPGIND = "LN_ACC_LN25634";
                break;
            case "NOTICEDATE":
                strPGIND = "LN_ACC_LN85533";
                break;
            case "LINKUNLINK":
                strPGIND = "LN_ACC_LN85533";
                break;
            case "RESCHEDULE":
                strView = "LN_ACC_LN85803_HDR_NEW";
                strPGIND = "LN_ACC_LN86545";
                break;
            case "RESTRUCTURE":
                strView = "LN_ACC_LN85803_HDR_NEW";
                strPGIND = "LN_ACC_LN86545";
                break;
            case "RECALL":
                strPGIND = "LN_ACC_LN86576";
                break;
            case "SWITCHCAMPAIGN":
                strPGIND = "LN_ACC_LN86862";
                break;
            case "HOLDCODE":
                strPGIND = "LN_ACC_LN85304";
                break;
            case "CHANGEPRODUCT":
                strPGIND = "LN_ACC_LN86561";
                break;			
            case "FULLORPARTIAL":
                strPGIND = "LN_ACC_LN82548";
                break;
            case "Restructuring_Main":
                strPGIND = "LN_ACC_LN86864";
                break;
            case "CUSTLEDBAL":
                strPGIND = "";
                break;
            case "ADHOCBILLING":
                strPGIND = "LN_ACC_LN85280";
                break;			
            case "LNSTNO":
                strPGIND = "LN_ACC_LN85322";
                break;	
            case "IISTAX":
                strPGIND = "LN_ACC_LN86829";
                break;				
            //Add by Sasinan 09/09/2013
            case "DRLIMT":
                strPGIND = "LN_ACC_LN86831";
                break;	
            case "STMCLN":
                strPGIND = "LN_ACC_LN86919";
                break;
            case "STAMCMNT":
                strPGIND = "LN_ACC_LN86817";
                break;		
            case "Simupayinq":
                strPGIND = "LN_ACC_LN85324";
                break;
        //K0001 Discounted Rollover Simulater
            case "ROLLOVER":
                strPGIND = "LN_ACC_LN84700";
                break;
        //k0002	Floor Plan Car Status	
            case "CarStatus":	
                strPGIND = "LN_ACC_LN86868_FP";
                break;
        //k0003	Collections Inquiry	
            case "Collections":	
                strPGIND = "LN_ACC_LN86895_Collection_INQ";
                break;			
        //K6401	Allow IPP Paid off	
            case "ALLOWIPP":	
                strPGIND = "LN_ACC_LN86960_INQ";
                break;		
            case "PAYOFFCC":
                strPGIND = "LN_ACC_LN85886";
                break;	
            case "REPAYMENTCC":
                strPGIND = "LN_ACC_LN85888";
                break;					
        //K8471 eSubscription		
            case "ESUBSCRIP":
                strPGIND = "LN_ACC_LN85968";
                break;
        //K8471 eConsent		
            case "ECONSENT":
                strPGIND = "LN_ACC_LN85967";
                break;
        //K9985 Write off amount
            case "WRITEOFFAMOUNT":
                strPGIND = "LN_ACC_LN85909";
                break;
            default :
                strPGIND = "LN_ACC_LN83503";
                break;
            //end		
        }
    
        if(strID == strUScreen){
            if(strID == "CUSTLEDBAL"){
                if(strMNTIND == "M"){
                    strPGIND = "LN_ACC_LN86311";
                    strUMode = strRCDIND == "C" ? "UPD" : "ADD";
                    strTITLE = "Ledger Balance Request";
                }else{
                    strPGIND = "LN_ACC_LN85318";
                    strTITLE = "Ledger Balance Request";
                }
                if(mode != "SEARCH_MODE"){
                    if(strMCLNID != "M")
                        gsOpenHref(null,"generic/view.aspx?VIEW_NAME="+strView+"&keyU_DUMMYPKID=0&UMode="+strUMode+"&MODEIND=UPD&UScreen="+strID+"&TITLE="+strTITLE+"&PGIND="+strPGIND+"&ACCTNO="+strACCTNO+"&ACTYPE="+strACTYPE+"&LEDGERR="+strLEDGERR+"&INDTitle=AcctMaint","","","");
                    else
                        gsOpenHref(null,"generic/view.aspx?VIEW_NAME=LN_ACC_LN85803_HDR_NEW&PGIND=LN_ACC_LN82800_MNT&keyU_DUMMYPKID=0&UScreen="+strID+"&TITLE="+strTITLE+"&INDTitle=AcctMaint&MODEIND=UPD&INDTitle=AcctMaint&NextAction=D&ACCTNO="+strACCTNO+"&ACTYPE="+strACTYPE+"&CPHCTP="+strCPHCTP+"&MCLNID="+strMCLNID+"&ACTMNO="+strACTMNO+"&MFLAG=Y","","","");
                }
                else{
                    if(strMCLNID == "M") strFlag = strID != "PAYOFF" && strID != "PAYOFFCC" && strID != "REPAYMENTCC"  ? "Main" : "";
                    else strFlag = "";
                }
            }
            else{
                if(mode != "SEARCH_MODE"){
                    if(strMCLNID != "M" || strID != "ALLOWIPP" ){
                        if(strID == "PAYOFF" || strID == "PAYOFFCC" || strID == "REPAYMENTCC" || strID == "ESUBSCRIP" || strID == "ECONSENT" || strID == "WRITEOFFAMOUNT"){	// added by Lucas 18/10/2011
                            if(strMCLNID == "M" || strMCLNID == " " ){ //KK6402
                                    // Check error page KK6402
                                if(strTITLE == "Redemption Inquiry By Main Account (Revolving)"){
                                    if(strPRDGRP != "RV"){
                                        alert("This Product not Main Account Revolving");
                                        var flagprd = ''Y'';
                                    }
                                }
                                if(strTITLE == "Repayment Simulator Inquiry by Main (Revolving)"){
                                    if(strPRDGRP != "RV"){
                                        alert("This Product not Main Account Revolving");
                                        var flagprd = ''Y'';
                                    }
                                }
                                //K9985 Start
                                if(strTITLE == "Write-off Amount"){
									//K9985 22/11/2022
                                    //if(strPWOFID == " " || strPWOFID == "1"){
									if(strPWOFID != "8" && strPWOFID != "W"){	
                                        alert("Allow only Write-off Account.");
                                        var flagprd = ''Y'';
                                    }else{
										if(strMCLNID == "M"){
											alert("Allow only Write-off Normal Account And Tranche Account.");
											var flagprd = ''Y'';
										}
									}
									
                                }
                                //K9985 End
                                if(flagprd == '' ''){
                                    gsOpenHref(null,"generic/view.aspx?VIEW_NAME="+strView+"&keyU_DUMMYPKID=0&UMode="+strUMode+"&MODEIND=UPD&UScreen="+strID+"&TITLE="+strTITLE+"&PGIND="+strPGIND+"&ACCTNO="+strACCTNO+"&IDXOAC="+strIDXOAC+"&IDXNAC="+strIDXNAC+"&ACTYPE="+strACTYPE+"&CIFNO="+strCIFNO+"&INDTitle=AcctMaint","","",""); //Ploy KK6402
                                } //KK6402
                            } //KK6402
                            else{ //KK6402
                                //K9985 Start
                                if(strMCLNID == "T" && strID == "WRITEOFFAMOUNT"){
									//K9985 22/11/2022
                                    //if(strPWOFID == " " || strPWOFID == "1"){
									if(strPWOFID != "8" && strPWOFID != "W"){
									 alert("Allow only Write-off Account.");	
									}
                                    else{
                                        strFlag = "";
                                    }
                            }
                            else{
                                // KK6402 alert("Only Main Account can proceed to next screen. ");	
                                alert("Only Main Account can proceed to next screen. ");
                            } //K9985 End
                        } //KK6402

                        
                    }
                        else{
                        gsOpenHref(null,"generic/view.aspx?VIEW_NAME="+strView+"&keyU_DUMMYPKID=0&UMode="+strUMode+"&MODEIND=UPD&UScreen="+strID+"&TITLE="+strTITLE+"&PGIND="+strPGIND+"&ACCTNO="+strACCTNO+"&IDXOAC="+strIDXOAC+"&IDXNAC="+strIDXNAC+"&ACTYPE="+strACTYPE+"&CIFNO="+strCIFNO+"&INDTitle=AcctMaint","","","");
                        }
                    }
                    else{
                        if(strID == "PAYOFF" || strID == "PAYOFFCC" || strID == "REPAYMENTCC" ||  strID != "ALLOWIPP" || strID != "ESUBSCRIP" || strID != "ECONSENT"){	// added by Lucas 18/10/2011
                            gsOpenHref(null,"generic/view.aspx?VIEW_NAME="+strView+"&keyU_DUMMYPKID=0&UMode="+strUMode+"&MODEIND=UPD&UScreen="+strID+"&TITLE="+strTITLE+"&PGIND="+strPGIND+"&ACCTNO="+strACCTNO+"&ACTYPE="+strACTYPE+"&CIFNO="+strCIFNO+"&INDTitle=AcctMaint","","","");
                        }
                        else{
                            gsOpenHref(null,"generic/view.aspx?VIEW_NAME=LN_ACC_LN85803_HDR_NEW&PGIND=LN_ACC_LN82800_MNT&keyU_DUMMYPKID=0&UScreen="+strID+"&TITLE="+strTITLE+"&INDTitle=AcctMaint&MODEIND=UPD&INDTitle=AcctMaint&NextAction=D&ACCTNO="+strACCTNO+"&ACTYPE="+strACTYPE+"&CPHCTP="+strCPHCTP+"&MCLNID="+strMCLNID+"&ACTMNO="+strACTMNO+"&MFLAG=Y","","","");
                        }
                    }
                }
                else{
                    if(strMCLNID == "M"){
                        //K9985 Start
                        if(strID == "WRITEOFFAMOUNT"){
							//K9985 22/11/2022
							//if(strPWOFID == "" || strPWOFID == "1"){
                            if(strPWOFID != "8" && strPWOFID != "W"){
                                alert("Allow only Write-off Account.");
                            }
                            else{
								if(strMCLNID == "M"){
									alert("Allow only Write-off Normal Account And Tranche Account.");
									return false;
								}
                                
                            }
                        }
                        else{ //K9985 End
                        strFlag = strID != "PAYOFF" && strID != "PAYOFFCC" && strID != "REPAYMENTCC" && strID != "ALLOWIPP" && strID != "ESUBSCRIP" && strID != "ECONSENT" ? "Main" : "";
                        }
                    }
                    else{
						//K9985 Start Songkran
						if(strID == "WRITEOFFAMOUNT"){
							//K9985 22/11/2022
                            //if(strPWOFID == "" || strPWOFID == "1"){
							if(strPWOFID != "8" && strPWOFID != "W"){
                                alert("Allow only Write-off Account.");
								return false;
                            }
                            else{
								if(strMCLNID == "M"){
									alert("Allow only Write-off Normal Account And Tranche Account.");
									return false;
								}
                                
                            }
                        }
						//K9985 End Songkran
                        if(strID == "PAYOFF" || strID == "PAYOFFCC" || strID == "REPAYMENTCC" ){	// added by Lucas 18/10/2011
                            alert("Only Main Account can proceed to next screen. ");
                        }	
                        else{
                            strFlag = "";
                        }	
                    }
                }
            } 
            
            if(strFlag == "Main" || strFlag == "") location.href = strFlag == "Main" ? "view.aspx?VIEW_NAME=LN_ACC_LN85803_HDR_NEW&PGIND=LN_ACC_LN82800_MNT&keyU_DUMMYPKID=0&UScreen="+strID+"&TITLE="+strTITLE+"&INDTitle=AcctMaint&MODEIND=UPD&INDTitle=AcctMaint&NextAction=D&ACCTNO="+strACCTNO+"&ACTYPE="+strACTYPE+"&CPHCTP="+strCPHCTP+"&MCLNID="+strMCLNID+"&ACTMNO="+strACTMNO+"&CIFNO="+strCIFNO+"&MFLAG=Y" : "view.aspx?VIEW_NAME="+strView+"&keyU_DUMMYPKID=0&UMode="+strUMode+"&MODEIND=UPD&UScreen="+strID+"&TITLE="+strTITLE+"&PGIND="+strPGIND+"&ACCTNO="+strACCTNO+"&ACTYPE="+strACTYPE+"&LEDGERR="+strLEDGERR+"&CIFNO="+strCIFNO+"&INDTitle=AcctMaint","","","";
            
        }
            
    }', N'0.1', '3097-09-19 18:19:09.363', '2022-11-22 17:39:47.843', N'JS', N'N', N'0', null, N'2364b04d-72d6-453c-b751-d534c20e44c3')
                                           end
                                        commit tran

  COMMIT
PRINT 'Import completed successfully'
  BREAK
END
