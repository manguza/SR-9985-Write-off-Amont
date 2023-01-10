BEGIN TRANSACTION
WHILE 1=1
BEGIN
  -- Insert scripts
begin tran
                                           UPDATE S_CLIENT_SCRIPT SET SCRIPT_ID=N'4b02919d-8dd3-4791-984d-0150689dc67b', INT_ID=null, FUNCTION_NAME=N'csLN_ACC_LN86803_HDR_ONLOAD_NEW', DESCRIPTION=N'csLN_ACC_LN86803_HDR_ONLOAD_NEW', FUNCTION_CODE=N'/*------------------------------------------------------------------------------------------------------------------------------------------------
 * Modification Logs : Cimb Hubbing
 
    Name                     Init             Date              Remarks
  ----------------         --------        --------------   ----------------------------------------------------------------
  Patsakorn C.           T1001      03/04/2013      Add new screen for Maintenance -Taxable Interest Monitoring Date
  Sasinan   S.           T1002      09/09/2013      Add new screen for Maintenance - Original amount and Drawing Limit amount
  Patsakorn C.           T1003      18/10/2013      Add new screen for Loan Relate to Stamc and add new field to qry array
  Sasinan   S.           T1004      21/10/2013      Add new screen for Maintenance - Stamc Account Date
  Patsakorn C.           G001       19/10/2016      Add New screen for Simulator payment for GHB
  Sarawut K.             K0001      27/07/2017      Add new screen for Discounted Rollover Simulater
  LHL                    K0002      14/09/2017      Add new field into arrHeaderValue (TYPE,CURTYP,Campaign Code)  
  Golf K.                K0003      03/10/2017      Add new Screen for Vehicle  
  Thanakrit P.           K6401      20/10/2021      Add new Screen For Redemption Inquiry by Main (Revolving), Add new Screen For Repayment Simulator By Main
  Phatthamunee S.        K6401      30/10/2021      Add new screen for Allow IPP Paid off 
  Pruk                   S6401      05/07/2022      Add MCLNID and PRDGRP in LN_ACC_LN82548
  Thanakrit P.           K8471      05/08/2022      Add new screen for eSubscription
  Pruk H.				 K9985      15/08/2022      Add new screen for Write-off Amount and Add new field into arrHeaderValue (PWOFID)
  Pruk H.				 K9985      29/11/2022      Add new field into arrHeaderValue (PWOAP8)
--------------------------------------------------------------------------------------------------------------------------------------------------*/							      
function csLN_ACC_LN86803_HDR_ONLOAD_NEW()
{
debugger;

	var contURL = "";
	var spanItem = document.getElementsByTagName("span");
	var spanItemlength = spanItem.length;
	
	document.getElementById(''MAINTab'').style.display = "none";
	
	var cifno = gsGetQueryString("CIFNO","") 

	document.getElementById(''tabs'').style.display ="none"
	
	for(var z=0;z<spanItemlength;z++){
		if(spanItem[z].id == "ERROR"){
			var strStatus = spanItem[z].innerHTML;
		}
	}
	
	if(strStatus.length > 0){
		document.getElementById(''ctnDetails'').style.display = "none"
		// ctnDetails.location.href = ''list.aspx?PAGE_NAME=BLANK'';
		return
	}

	if (gsGetQueryString("PGIND","") != undefined)
	{	
		if(gsGetQueryString("IN_POPUP","") != undefined){
			oPop = gsGetQueryString("IN_POPUP","");
			oPop = "&INPOPUP="+ oPop;
		}
		else oPop="";

		var arrQueryString = ["PGIND","sMode","AFRPAC","AFAPNO","AFAANO","INDTitle","ACCTNO","ACCTNO2","ACTYPE","MODEIND","strT","ACTMNO","UScreen","TITLE","IBASE","EFFDT8","PENCOD","PMTYPE","PENPCT","E1PERS","E1CTNO","PRVCHG","NRMLIN","LTAMT","LATCOD","INLCOD","FUNCOD","AMTIND","INTIND","WPCODE","FLOW","SCHSTR","SSEQ","ODDUAL","CRACCT","CRTYPE","DRACCT","DRTYPE","DRSEQ","STATUS","TRACNO","TREFD8","EFFIND","LEDGERR","IDXOAC","IDXNAC"]; // PLEASE ADD THE NEW FIELD TO THE END OF THE ARRAY - by wai kit 26/07/2011
		//T1003 Patsakorn C. Add new field IDXOAC and IDXNAC
		//var arrHeaderValue = ["AXAPNO","APTYPE","TYPE","CURTYP","BKN","BRN","LNSPTF","CIFNO","CBAL","INTDUE","LCDUE","CFDUE","OTHCHG","MISCD","SNAME","ORGAMT","DRLIMT","HAVMSG","MCLNID","PARTID","AXFCDE"]; // PLEASE ADD THE NEW FIELD TO THE END OF THE ARRAY - by wai kit 26/07/2011
		// LHL K0002
		var arrHeaderValue = ["AFAPNO","CURTYP","TYPE","BRN","BKN","BRN","LNSPTF","CIFNO","CBAL","CFDUE","INTDUE","LCDUE","OTHCHG","MISCD","SNAME","ORGAMT","DRLIMT","HAVMSG","MCLNID","PARTID","AXFCDE","APTYPE","PRDGRP","FRCODE","IPCODE","MULTIR","IBASE","PAUTDB","YBASE","RATPC","PWOFID","PWOAP8"]; // PLEASE ADD THE NEW FIELD TO THE END OF THE ARRAY - by wai kit 26/07/2011 (^0^)
		
		

		for(var x=0;x<arrQueryString.length;x++){
			if(gsGetQueryString(arrQueryString[x], "") != undefined) 
			arrQueryString[x] = gsGetQueryString(arrQueryString[x], "");
		}
		//alert(arrQueryString[0]);
		for(var y=0;y<arrHeaderValue.length;y++){
			for(var z=0;z<spanItemlength;z++){
				if(spanItem[z].id == arrHeaderValue[y]) {
					arrHeaderValue[y] = spanItem[z].innerHTML;
					break;
				}
			}
		}
		
		for(var z=0;z<spanItemlength;z++){
			if(spanItem[z].id == "APTYPE"){
				var acType = spanItem[z].innerHTML;
				acType = acType.substring(0,1)
				var strAcType = "&APTYPE="+acType
			}
			else if(spanItem[z].id == "TYPE"){
				var TYPE = spanItem[z].innerHTML;
				search = TYPE.search("-");
				var strTYPE = "&TYPE=" + TYPE;
			}
		}

		if(arrHeaderValue[1]){
			var curr = arrHeaderValue[1];
		}

		if(gsGetQueryString("strT","")!=undefined)
		{
			var strT=gsGetQueryString("strT","");
			var SCHSTR="";
			if(strT=="Restructuring - Increase / Decrease Restructuring Counter" || strT=="Restructuring - Interest/Payment Amount Changes")
				SCHSTR = "R";
			else if(strT=="Rescheduling - Increase / Decrease Rescheduling Counter" || strT=="Rescheduling - Interest/Payment Amount Changes" )
				SCHSTR= "S";
		}
		
		if(gsGetQueryString("iodFlag","")!=undefined)
			var IORDFG=gsGetQueryString("iodFlag","");
			
		switch(arrQueryString[0]){
		
			case "LN_ACC_LN85534": //IIS
				code = "LN00088"
				contURL = "list.aspx?PAGE_NAME=LN_ACC_LN85534&keyU_DUMMYPKID=0&LNSPTF="+arrHeaderValue[6]+"&AFAPNO="+arrHeaderValue[0]+"&AFRPAC="+arrQueryString[2]+"&LWACNO="+arrQueryString[6]+"&LWACTP=L&CURTYP="+arrHeaderValue[1]+"&BKN="+arrHeaderValue[4]+"&BRN="+arrHeaderValue[3]+"&TYPE="+arrHeaderValue[2]+"&ACTYPE="+arrQueryString[8]+"&AFAANO="+arrQueryString[4]+"&INDTitle="+arrQueryString[5]+"&UMode=UPD";
			break;
			case "LN_ACC_LN85548":
				code = "LN00077"
				contURL = "list.aspx?PAGE_NAME=LN_ACC_LN85548&keyU_DUMMYPKID=0&LNSPTF="+arrHeaderValue[6]+"&AFAPNO="+arrHeaderValue[0]+"&AFRPAC="+arrQueryString[2]+"&ACCTNO="+arrQueryString[6]+"&CURTYP="+arrHeaderValue[1]+"&BKN="+arrHeaderValue[4]+"&BRN="+arrHeaderValue[3]+"&TYPE="+arrHeaderValue[2]+"&ACTYPE="+arrQueryString[8]+"&AFAANO="+arrQueryString[4]+"&INDTitle="+arrQueryString[5]+"&UMode=UPD";
			break;
			
			case "LN_ACC_LN25634":
				code = "LN00093"
				contURL = "list.aspx?PAGE_NAME=LN_ACC_LN25634&keyU_DUMMYPKID=0&LNSPTF="+arrHeaderValue[6]+"&AFAPNO="+arrHeaderValue[0]+"&AFRPAC="+arrQueryString[2]+"&CRACCT="+arrQueryString[6]+"&CURTYP="+arrHeaderValue[1]+"&BKN="+arrHeaderValue[4]+"&BRN="+arrHeaderValue[3]+"&TYPE="+arrHeaderValue[2]+"&CRTYPE="+arrQueryString[8]+"&AFAANO="+arrQueryString[4]+"&INDTitle="+arrQueryString[5]+"&UMode=UPD";
			break;
			
			case "LN_ACC_LN83503":
				code = "LN00023"
				contURL = "view.aspx?VIEW_NAME=LN_ACC_LN83503_TAB&keyU_DUMMYPKID=0&LNSPTF="+arrHeaderValue[6]+"&IN_IFRAME=TRUE&AFAPNO="+arrHeaderValue[0]+"&AFRPAC="+arrQueryString[2]+"&ACCTNO="+arrQueryString[6]+"&ACCTNO2="+arrQueryString[7]+"&CURTYP="+arrHeaderValue[1]+"&BKN="+arrHeaderValue[4]+"&BRN="+arrHeaderValue[5]+"&TYPE="+arrHeaderValue[2]+"&ACTYPE="+arrQueryString[8]+"&AFAANO="+arrQueryString[4]+"&CIFNO="+arrHeaderValue[7]+"&ACTMNO="+arrQueryString[11]+strAcType+"&INDTitle="+arrQueryString[5]+"&UScreen="+arrQueryString[12]+"&TITLE="+arrQueryString[13]+"&PRDGRP="+arrHeaderValue[22]+"&MULTIR="+arrHeaderValue[25]+"&IBASE="+arrHeaderValue[26]+"&PAUTDB="+arrHeaderValue[27]+"&UMode="+arrQueryString[9]+oPop;
			break;
			
			//Kenneth 04 May 2011 - for transfer of facility
			case "LN_ACC_SS85001":
				code = "LN00023"
				contURL = "list.aspx?PAGE_NAME=LN_ACC_SS85001&keyU_DUMMYPKID=0&INTRACNO="+arrQueryString[6]+"&INDTitle="+arrQueryString[5]+"&UScreen="+arrQueryString[12]+"&TITLE="+arrQueryString[13]+"&TRBKNO="+arrHeaderValue[4]+"&TRBRNO="+arrHeaderValue[5]+"&UMode=UPD";
			break;
			//Kenneth	
			
			//from CIF
			case "CF_ACC_LN86838":
				//~ code = "LN00006"
				contURL = "view.aspx?VIEW_NAME=LN_ACC_LN86838_01&keyU_DUMMYPKID=0&FROM=CIF&WPCODE="+arrQueryString[29]+"&LNSPTF="+arrHeaderValue[6]+"&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&BRN="+arrHeaderValue[3]+"&CIFNO="+arrHeaderValue[7]+"&SNAME="+arrHeaderValue[14]+"&TYPE="+arrHeaderValue[2]+"&HAVMSG="+arrHeaderValue[17]+"&AFAPNO="+arrHeaderValue[0]+"&UMode=INQ"+strAcType+"&IN_IFRAME=TRUE";
			break;
			//from CIF
			
			case "LN_ACC_LN86838_Balance":
				//~ code = "LN00006"
				var FROM;
				if(gsGetQueryString("FROM",""))
					FROM = gsGetQueryString("FROM","");
				
				contURL = "view.aspx?VIEW_NAME=LN_ACC_LN86838_01&keyU_DUMMYPKID=0&FLOW="+arrQueryString[30]+"&WPCODE="+arrQueryString[29]+"&LNSPTF="+arrHeaderValue[6]+"&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&BRN="+arrHeaderValue[3]+"&CIFNO="+arrHeaderValue[7]+"&SNAME="+arrHeaderValue[14]+"&TYPE="+arrHeaderValue[2]+"&HAVMSG="+arrHeaderValue[17]+"&AFAPNO="+arrHeaderValue[0]+"&UMode="+arrQueryString[9]+strAcType+"&FROM="+FROM+"&IN_IFRAME=TRUE";
			break;
			
			case "LN_ACC_LN86838_Balance_NoHP":
				code = "LN00006"
				contURL = "view.aspx?VIEW_NAME=LN_ACC_LN86838_01HP&keyU_DUMMYPKID=0&LNSPTF="+arrHeaderValue[6]+"&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&BRN="+arrHeaderValue[3]+"&CIFNO="+arrHeaderValue[7]+"&SNAME="+SNAME+"&TYPE="+arrHeaderValue[2]+"&HAVMSG="+HAVMSG+"&UMode="+arrQueryString[9]+strAcType+"&IN_IFRAME=TRUE";
			break;
			
			case "LN_ACC_LN86530":
				code = "LN00007"
				contURL = "view.aspx?VIEW_NAME=LN_ACC_LN86530&keyU_DUMMYPKID=0&LNSPTF="+arrHeaderValue[6]+"&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&UMode=UPD"+oPop+"&CURR="+curr+arrHeaderValue[3]+arrHeaderValue[2]+strTYPE;
			break;

			case "LN_ACC_LN85531":
				code = "LN00008"
				contURL = "list.aspx?PAGE_NAME=LN_ACC_LN85531&LNSPTF="+arrHeaderValue[6]+"&LBACCT="+arrQueryString[6]+"&LBATYP="+arrQueryString[8]+"&UMode=UPD&CBAL="+arrHeaderValue[8]+"&CFDUE="+arrHeaderValue[9]+"&INTDUE="+arrHeaderValue[10]+"&LCDUE="+arrHeaderValue[11]+"&OTHCHG="+arrHeaderValue[12]+"&MISCD="+arrHeaderValue[13]+"&strT="+strT;
			break;
			
			case "LN_ACC_LN85503":
				code = "LN00104"
				contURL = "list.aspx?PAGE_NAME=LN_ACC_LN85503&LNSPTF="+arrHeaderValue[6]+"&AKACCT="+arrQueryString[6]+"&AKACTY="+arrQueryString[8]+"&UMode=UPD&strT="+strT;
			break;

			case "LN_ACC_LN86538": //Restructure Increase Authorised Limit
				contURL = "view.aspx?VIEW_NAME=LN_ACC_LN86538&keyU_DUMMYPKID=0&LNSPTF="+arrHeaderValue[6]+"&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&UMode=UPD&strT="+strT;
			break;
			
			case "LN_ACC_LN86552":
				code = "LN00010"
				contURL = "view.aspx?VIEW_NAME=LN_ACC_LN86552&keyU_DUMMYPKID=0&LNSPTF="+arrHeaderValue[6]+"&A$ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&UMode=UPD";
			break;
			
			case "LN_ACC_LN86580":
				code = "LN00011"
				contURL = "view.aspx?VIEW_NAME=LN_ACC_LN86580&keyU_DUMMYPKID=0&LNSPTF="+arrHeaderValue[6]+"&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&UMode=UPD";
			break;
			
			case "LN_ACC_LN86545":
				var UScreen = gsGetQueryString("UScreen","");
				if(UScreen == "RESCHEDULE"){
					UScreen = "RESCHEDULING"
					var IND = "S";
					SCHSTR = "S";
					contURL = "view.aspx?VIEW_NAME=LN_ACC_LN86813&keyU_DUMMYPKID=0&IND="+IND+"&LNSPTF="+arrHeaderValue[6]+"&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&INDTitle="+arrQueryString[5]+"&UScreen="+UScreen+"&UMode=INQ&SCHSTR="+SCHSTR+"&title="+strT+"&CURTYP="+arrHeaderValue[1]+"&IN_IFRAME=TRUE";
				}
				else{
					var IND = "R";
					SCHSTR = "R";
					UScreen = "RESTRUCTURING";
					contURL = "view.aspx?VIEW_NAME=LN_ACC_LN86813&keyU_DUMMYPKID=0&IND="+IND+"&LNSPTF="+arrHeaderValue[6]+"&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&INDTitle="+arrQueryString[5]+"&UScreen="+UScreen+"&UMode=INQ&SCHSTR="+SCHSTR+"&title="+strT+"&CURTYP="+arrHeaderValue[1]+"&IN_IFRAME=TRUE";
				}
			
			break;
			
			case "LN_ACC_LN85518":
				code = "LN00013"
				contURL = "list.aspx?PAGE_NAME=LN_ACC_LN85518&keyU_DUMMYPKID=0&LNSPTF="+arrHeaderValue[6]+"&SPACNO="+arrQueryString[6]+"&SPACTP="+arrQueryString[8]+"&UMode=UPD";
			break;
			
			case "LN_ACC_LN86576":
				code = "LN00014"
				contURL = "view.aspx?VIEW_NAME=LN_ACC_LN86576&keyU_DUMMYPKID=0&LNSPTF="+arrHeaderValue[6]+"&PRACCT="+arrQueryString[6]+"&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&REBUILD=Y&UMode=UPD";
			break;
			
			case "LN_ACC_LN85532":
				code = "LN00015"					
				contURL = "list.aspx?PAGE_NAME=LN_ACC_LN85532&LNSPTF="+arrHeaderValue[6]+"&LNFACT="+arrQueryString[6]+"&LNFTYP="+arrQueryString[8]+"&UMode=UPD";
			break;
			
			case "LN_ACC_LN86539": //Restructure Decrease Authorised Limit
				contURL = "view.aspx?VIEW_NAME=LN_ACC_LN86539&keyU_DUMMYPKID=0&LNSPTF="+arrHeaderValue[6]+"&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&UMode=UPD&strT="+strT;
			break;
			
			case "LN_ACC_LN86540":
				code = "LN00017"				
				contURL = "view.aspx?VIEW_NAME=LN_ACC_LN86540&keyU_DUMMYPKID=0&LNSPTF="+arrHeaderValue[6]+"&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&UMode=UPD";
			break;
			
			case "LN_ACC_LN86561":
				code = "LN00018"
				contURL = "view.aspx?VIEW_NAME=LN_ACC_LN86561&keyU_DUMMYPKID=0&LNSPTF="+arrHeaderValue[6]+"&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&PTYPE="+arrHeaderValue[2]+"&AXFCDE="+arrHeaderValue[20]+"&CURTYP="+arrHeaderValue[1]+"&UMode=UPD&NextAction=C";
			break;
			
			case "LN_ACC_LN86550":
				if(gsGetQueryString("DUAL","") == "TRUE"){	//dual control flow
					SCHSTR = gsGetQueryString("SCHSTR","");
					IORDFG = gsGetQueryString("IORDFG","");
					
					if(SCHSTR == "R"){
						UScreen = "RESTRUCTURING"
						strT = "Restructuring - Increase / Decrease Restructuring Counter";
					}
					else{
						UScreen = "RESCHEDULING"
						strT = "Rescheduling - Increase / Decrease Rescheduling Counter";
					}
					
					contURL = "view.aspx?VIEW_NAME=LN_ACC_LN86550&keyU_DUMMYPKID=0&LNSPTF="+arrHeaderValue[6]+"&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&UMode=UPD&SCHSTR="+SCHSTR+"&IORDFG="+IORDFG+"&strT="+strT+"&UScreen="+UScreen;
				}
				else{
					if (strT=="Rescheduling - Increase / Decrease Rescheduling Counter")
						code = "LN00019";
					else if (strT=="Restructuring - Increase / Decrease Restructuring Counter")
						code = "LN00079";
						
					contURL = "view.aspx?VIEW_NAME=LN_ACC_LN86550&keyU_DUMMYPKID=0&LNSPTF="+arrHeaderValue[6]+"&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&UMode=UPD&SCHSTR="+SCHSTR+"&IORDFG="+IORDFG+"&title="+strT;
				}
			break;
			
			case "LN_ACC_LN85574":
				code = "LN00020"
				contURL = "list.aspx?PAGE_NAME=LN_ACC_LN85574&keyU_DUMMYPKID=0&LNSPTF="+arrHeaderValue[6]+"&LHACCT="+arrQueryString[6]+"&LHATYP="+arrQueryString[8]+"&UMode=UPD";
			break;
			
			case "LN_ACC_LN85533":	
				code = "LN00021"
				contURL = "list.aspx?PAGE_NAME=LN_ACC_LN85533&keyU_DUMMYPKID=0&LNSPTF="+arrHeaderValue[6]+"&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&UMode=UPD";
			break;

			
			case "LN_ACC_LN86862":
				code = "LN00022"
				contURL = "view.aspx?VIEW_NAME=LN_ACC_LN86862&keyU_DUMMYPKID=0&LNSPTF="+arrHeaderValue[6]+"&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&EFFIND="+arrQueryString[42]+"&UMode=UPD";
			break;
			
			case "LN_ACC_LN86820_NORMAL":	
				//code = "L00021"
				//var AFAPNO = gsGetQueryString("AFAPNO","")
				contURL = "view.aspx?VIEW_NAME=LN_ACC_LN86820_NORMAL&keyU_DUMMYPKID=0&LNSPTF="+arrHeaderValue[6]+"&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&AFAPNO="+arrQueryString[3]+"&AFRPAC="+arrQueryString[2]+"&UMode=DEL";
			break;
			case "LN_ACC_LN86820":	//Close Account
				if (arrHeaderValue[18] == ""){
					contURL = "view.aspx?VIEW_NAME=LN_ACC_LN86820_NORMAL&keyU_DUMMYPKID=0&LNSPTF="+arrHeaderValue[6]+"&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&AFAPNO="+arrHeaderValue[0]+"&AFRPAC="+arrQueryString[2]+"&UScreen="+arrQueryString[12]+"&Title="+arrQueryString[13]+"&UMode=UPD";
				}
				else if(arrHeaderValue[18] == "M"){
					if(arrHeaderValue[19] == "M"){
						contURL = "view.aspx?VIEW_NAME=LN_ACC_LN86564&keyU_DUMMYPKID=0&LNSPTF="+arrHeaderValue[6]+"&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&AFAPNO="+arrHeaderValue[0]+"&AFRPAC="+arrQueryString[2]+"&UScreen="+arrQueryString[12]+"&UMode=UPD";
					}
					else{
						contURL = "view.aspx?VIEW_NAME=LN_ACC_LN86820_MAIN&keyU_DUMMYPKID=0&LNSPTF="+arrHeaderValue[6]+"&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&AFAPNO="+arrHeaderValue[0]+"&AFRPAC="+arrQueryString[2]+"&UScreen="+arrQueryString[12]+"&Title="+arrQueryString[13]+"&UMode=UPD";
					}
				}
				else{
					contURL = "view.aspx?VIEW_NAME=LN_ACC_LN86820_TRANCHE&keyU_DUMMYPKID=0&LNSPTF="+arrHeaderValue[6]+"&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&AFAPNO="+arrHeaderValue[0]+"&AFRPAC="+arrQueryString[2]+"&UScreen="+arrQueryString[12]+"&UMode=UPD";
				}
			break;
			case "LN_ACC_LN86828_HP":	//HP
				contURL = "view.aspx?VIEW_NAME=LN_ACC_LN86828_HP&keyU_DUMMYPKID=0&LNSPTF="+arrHeaderValue[6]+"&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&AFAPNO="+arrHeaderValue[0]+"&UMode=DEL";
			break;
			case "LN_ACC_LN82800_MNT":	
				MFLAG = gsGetQueryString("MFLAG","") != "" ? gsGetQueryString("MFLAG","") : "";
				contURL = "list.aspx?PAGE_NAME=LN_ACC_LN82800_MNT&LNSPTF="+arrHeaderValue[6]+"&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&ACTMNO="+arrQueryString[11]+"&UMode="+arrQueryString[9]+"&UScreen="+arrQueryString[12]+"&TITLE="+arrQueryString[13]+"&CIFNO="+cifno+"&CFCIFN="+cifno+"&MFLAG="+MFLAG;
			break;
			case "LN_ACC_LN82800_POP":	//pop up screen, by Lucas Low 02/08/2011
				WANTED_FIELD = gsGetQueryString("WANTED_FIELD","");
				FRAMEID = gsGetQueryString("FRAMEID","");
				IFRAMEID = gsGetQueryString("IFRAMEID","");
				contURL = "list.aspx?PAGE_NAME=LN_ACC_LN82800_POP&LNSPTF="+arrHeaderValue[6]+"&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&ACTMNO="+arrQueryString[11]+"&UMode="+arrQueryString[9]+"&UScreen="+arrQueryString[12]+"&TITLE="+arrQueryString[13]+''&WANTED_FIELD=''+WANTED_FIELD+''&FRAMEID=''+FRAMEID+''&IFRAMEID=''+IFRAMEID;
			break;
			case "LN_ACC_LN86821"://Late Charge
				contURL = "view.aspx?VIEW_NAME=LN_ACC_LN86821&keyU_DUMMYPKID=0&LNSPTF="+arrHeaderValue[6]+"&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&AFAPNO="+arrHeaderValue[0]+"&UMode="+arrQueryString[9];
			break;
			case "LN_ACC_LN86822"://Commit & Cancelation
				contURL = "view.aspx?VIEW_NAME=LN_ACC_LN86822&keyU_DUMMYPKID=0&LNSPTF="+arrHeaderValue[6]+"&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&AFAPNO="+arrHeaderValue[0]+"&UMode="+arrQueryString[9];
			break;
			case "LN_ACC_LN86823"://Penalty & funding
				contURL = "view.aspx?VIEW_NAME=LN_ACC_LN86823&keyU_DUMMYPKID=0&LNSPTF="+arrHeaderValue[6]+"&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&AFAPNO="+arrHeaderValue[0]+"&UMode="+arrQueryString[9];
			break;
			case "LN_ACC_LN86824"://Codes & flags
				contURL = "view.aspx?VIEW_NAME=LN_ACC_LN86824&keyU_DUMMYPKID=0&LNSPTF="+arrHeaderValue[6]+"&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&AFAPNO="+arrHeaderValue[0]+"&UMode="+arrQueryString[9];
			break;
			case "LN_ACC_LN86826"://Insurance						
				contURL = "view.aspx?VIEW_NAME=LN_ACC_LN86826&keyU_DUMMYPKID=0&LNSPTF="+arrHeaderValue[6]+"&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&AFAPNO="+arrHeaderValue[0]+"&UMode="+arrQueryString[9];
			break;
			case "LN_ACC_LN86827"://Arrears Management
				contURL = "view.aspx?VIEW_NAME=LN_ACC_LN86827&keyU_DUMMYPKID=0&LNSPTF="+arrHeaderValue[6]+"&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&AFAPNO="+arrHeaderValue[0]+"&UMode="+arrQueryString[9];
			break;
			case "LN_ACC_LN85591"://CGC
				contURL = "view.aspx?VIEW_NAME=LN_ACC_LN85591&keyU_DUMMYPKID=0&LNSPTF="+arrHeaderValue[6]+"&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&AFAPNO="+arrHeaderValue[0]+"&UMode="+arrQueryString[9];
			break;
			//~ case "LN_ACC_LN85307"://Document
				//~ contURL = "list.aspx?PAGE_NAME=LN_ACC_LN85307&keyU_DUMMYPKID=0&LNSPTF="+arrHeaderValue[6]+"&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&AFAPNO="+AFAPNO+"&UMode="+MODEIND;
			//~ break;
			case "LN_ACC_LN85536"://Earmark
				contURL = "list.aspx?PAGE_NAME=LN_ACC_LN85536&keyU_DUMMYPKID=0&LNSPTF="+arrHeaderValue[6]+"&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&AFAPNO="+arrHeaderValue[0]+"&UMode="+arrQueryString[9];
			break;
			case "LN_ACC_LN85599"://Income Distribution
				contURL = "list.aspx?PAGE_NAME=LN_ACC_LN85599&keyU_DUMMYPKID=0&LNSPTF="+arrHeaderValue[6]+"&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&AFAPNO="+arrHeaderValue[0]+"&UMode="+arrQueryString[9];
			break;
			case "LN_ACC_LN85535"://Loan Fees
			// LHL K0002
				contURL = "list.aspx?PAGE_NAME=LN_ACC_LN85535&keyU_DUMMYPKID=0&LNSPTF="+arrHeaderValue[6]+"&LFEACC="+arrQueryString[6]+"&LFEACT="+arrQueryString[8]+"&AFAPNO="+arrHeaderValue[0]+"&RATPC="+arrHeaderValue[29]+"&TYPE="+arrHeaderValue[2]+"&CURTYP="+arrHeaderValue[1]+"&UMode=UPD";
			break;
			case "LN_ACC_LN85511"://Message
				contURL = "list.aspx?PAGE_NAME=LN_ACC_LN85511&keyU_DUMMYPKID=0&LNSPTF="+arrHeaderValue[6]+"&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&AFAPNO="+arrHeaderValue[0]+"&HAVMSG="+HAVMSG+"&UMode="+arrQueryString[9];
			break;
			case "LN_ACC_LN85541"://Collateral Linkage
				contURL = "list.aspx?PAGE_NAME=LN_ACC_LN85541&keyU_DUMMYPKID=0&LNSPTF="+arrHeaderValue[6]+"&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&UMode=UPD";
			break;
			case "BM_ACC_BM86500"://Central Bank Reporting
				contURL = "view.aspx?VIEW_NAME=BM_ACC_BM86500&keyU_DUMMYPKID=0&LNSPTF="+arrHeaderValue[6]+"&BAACCT="+arrQueryString[6]+"&BAACTT="+arrQueryString[8]+"&AFAPNO="+arrHeaderValue[0]+"&UMode="+arrQueryString[9];
			break;
			case "LN_ACC_LN86507"://TDR
				contURL = "view.aspx?VIEW_NAME=LN_ACC_LN86507&keyU_DUMMYPKID=0&LNSPTF="+arrHeaderValue[6]+"&LNDRAC="+arrQueryString[6]+"&LNDRAT="+arrQueryString[8]+"&UMode=UPD";
			break;
			
			case "LN_ACC_LN85304"://hold code
				contURL = "list.aspx?PAGE_NAME=LN_ACC_LN85304&keyU_DUMMYPKID=0&LNSPTF="+arrHeaderValue[6]+"&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&UMode="+arrQueryString[9];
			break;
			case "LN_ACC_LN85830":
				contURL = "view.aspx?VIEW_NAME=LN_ACC_LN85830&LNSPTF="+arrHeaderValue[6]+"&ACCTNO="+arrQueryString[6]+"&UScreen="+arrQueryString[12]+"&TITLE="+arrQueryString[13]+"&UMode=";
			break;
			case "LN_ACC_LN85830_REDP":				
				contURL = "view.aspx?VIEW_NAME=LN_ACC_LN85830_REDP&ACCTNO="+arrQueryString[6]+"&UScreen="+arrQueryString[12]+"&TITLE="+arrQueryString[13]+"&TYPE="+arrHeaderValue[2]+"&CURTYP="+arrHeaderValue[1]+"&UMode=";
			break;
			case "LN_ACC_LN85832":
				contURL = "list.aspx?PAGE_NAME=LN_ACC_LN85832&keyU_DUMMYPKID=0&LNSPTF="+arrHeaderValue[6]+"&ACCTNO="+arrQueryString[6]+"&EFFDT8="+arrQueryString[15]+"&PENCOD="+arrQueryString[16]+"&PMTYPE="+arrQueryString[17]+"&PENPCT="+arrQueryString[18]+"&E1PERS="+arrQueryString[19]+"&E1CTNO="+arrQueryString[20]+"&PRVCHG="+arrQueryString[21]+"&NRMLIN="+arrQueryString[22]+"&CBAL="+arrHeaderValue[8]+"&UScreen="+arrQueryString[12]+"&TITLE="+arrQueryString[13]+"&UMode=INQ";
			break;
			case "LN_ACC_LN85831": //Loan Partial Payoff Inquiry
				contURL =''list.aspx?PAGE_NAME=LN_ACC_LN85831&keyU_DUMMYPKID=0&LNSPTF="+arrHeaderValue[6]+"&ACCTNO=''+arrQueryString[6]+''&LTAMT=''+arrQueryString[23]+''&EFFDT8=''+arrQueryString[15]+''&LATCOD=''+arrQueryString[24]+''&PENCOD=''+arrQueryString[16]+''&INLCOD=''+arrQueryString[25]+''&NRMLIN=''+arrQueryString[22]+''&FUNCOD=''+arrQueryString[26]+''&AMTIND=''+arrQueryString[27]+''&PENPCT=''+arrQueryString[18]+''&PRVCHG=''+arrQueryString[21]+"&CBAL="+arrHeaderValue[8]+''&E1PERS=''+arrQueryString[19]+''&E1CTNO=''+arrQueryString[20]+''&INTIND=''+arrQueryString[28]+"&UScreen="+arrQueryString[12]+"&TITLE="+arrQueryString[13]+''&UMode=INQ''
			break;
			case "LN_ACC_LN85831_VIEW": //Prepayment Inquiry
				contURL =''view.aspx?VIEW_NAME=LN_ACC_LN85831&LNSPTF=''+arrHeaderValue[6]+''&ACCTNO=''+arrQueryString[6]+"&UScreen="+arrQueryString[12]+"&TITLE="+arrQueryString[13]+''&UMode=UPD''
			break;
			case "LN_ACC_LN85307":
				contURL = "list.aspx?PAGE_NAME=LN_ACC_LN85307&FEACCT="+arrQueryString[6]+"&FEACTY="+arrQueryString[8]+"&UScreen="+arrQueryString[12]+"&TITLE="+arrQueryString[13]+"&UMode=UPD";
			break;
			case "LN_ACC_LN85301":
				contURL = "list.aspx?PAGE_NAME=LN_ACC_LN85301&CPMACT="+arrQueryString[6]+"&CPMTYP="+arrQueryString[8]+"&UScreen="+arrQueryString[12]+"&TITLE="+arrQueryString[13]+"&UMode=UPD";
			break;
			//~ case "LN_ACC_LN86825"://Schedule   //old schedule
				//~ contURL = "view.aspx?VIEW_NAME=LN_ACC_LN86825&keyU_DUMMYPKID=0&LNSPTF="+arrHeaderValue[6]+"&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&AFAPNO="+AFAPNO+"&UMode="+MODEIND;
			//~ break;
			//~ case "LN_ACC_LN86825"://Schedule
				//~ contURL = "view.aspx?VIEW_NAME=LN_ACC_LN86825&keyU_DUMMYPKID=0&LNSPTF="+arrHeaderValue[6]+"&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&AFAPNO="+AFAPNO+"&UMode="+MODEIND;
			//~ break;
			case "LN_ACC_LN86825"://Schedule
				var UScreen="";
				UScreen = "SCHEDULE";
				contURL = "view.aspx?VIEW_NAME=LN_ACC_LN83503_TAB&keyU_DUMMYPKID=0&LNSPTF="+arrHeaderValue[6]+"&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&AFAPNO="+arrQueryString[3]+"&INDTitle="+arrQueryString[5]+"&UScreen="+UScreen+"&title="+arrQueryString[13]+"&FRCODE="+arrHeaderValue[23]+"&IPCODE="+arrHeaderValue[24]+"&YBASE="+arrHeaderValue[28]+"&UMode=UPD&IN_IFRAME=TRUE";
			break;
			case "OD_ACC_OD86501":
				var AXSEQ = gsGetQueryString("AXSEQ","");
				var UMode = gsGetQueryString("UMode","");
				var DUAL = gsGetQueryString("DUAL","");
				var b4UMode = gsGetQueryString("b4UMode","");
				//var AFAPNO = gsGetQueryString("AXAPNO","");
                                contURL = "view.aspx?VIEW_NAME=OD_ACC_OD86501&b4UMode="+b4UMode+"&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&AFAPNO="+arrQueryString[3]+"&AXSEQ="+AXSEQ+"&ORGAMT="+arrHeaderValue[15]+"&DRLIMT="+arrHeaderValue[16]+"&CURTYP="+arrHeaderValue[1]+"&Mode="+gsGetQueryString("Mode","")+"&UMode="+UMode+"&DUAL="+DUAL+"&ODQuickUrl=VIEW_NAME[!!EQUAL]LN_ACC_LL86399_HDR[!!AMP]PGIND[!!EQUAL]OD_ACC_OD88501[!!AMP]LNSPTF[!!EQUAL]N[!!AMP]keyU_DUMMYPKID[!!EQUAL]0[!!AMP]UMode[!!EQUAL]"+UMode+"[!!AMP]ACCTNO[!!EQUAL]"+arrQueryString[6]+"[!!AMP]ACTYPE[!!EQUAL]"+arrQueryString[8]+"[!!AMP]AFAPNO[!!EQUAL]"+arrQueryString[3]+"[!!AMP]CURTYP[!!EQUAL]"+arrHeaderValue[1]+"&ODTop=Top&ODDUAL="+arrQueryString[33];				
				if(UMode.toUpperCase() != "DEL") contURL += "&GUIDED=INITIAL";
			break;
			//S6401 Fix by Pruk  (05/07/22)	
			case "LN_ACC_LN82548":
				contURL = "view.aspx?VIEW_NAME=LN_ACC_LN82548&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&UScreen="+UScreen+"&TITLE="+arrQueryString[13]+"&MCLNID="+arrHeaderValue[18]+"&PRDGRP="+arrHeaderValue[22]+"&UMode=UPD";
			break;
			case "LN_ACC_LN85551":
				contURL = "list.aspx?PAGE_NAME=LN_ACC_LN85551&LNSPTF="+arrHeaderValue[6]+"&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&UMode=UPD"+"&strT="+strT;
			break;
			case "LN_ACC_LN86864":
				contURL = "view.aspx?VIEW_NAME=LN_ACC_LN86864&keyU_DUMMYPKID=0&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&UScreen="+arrQueryString[12]+"&TITLE="+arrQueryString[13]+"&UMode=UPD";
			break;
			
			//Kenneth 31 May 2011 - for Customer Ledger Balance
			case "LN_ACC_LN86311":
				code = "LN86311"
				if(gsGetQueryString("UMode","")=="ADD"){
				contURL = "view.aspx?VIEW_NAME=LN_ACC_LN86311&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&UScreen="+arrQueryString[12]+"&TITLE="+arrQueryString[13]+"&UMode=ADD&LEDGERR="+arrQueryString[43];
				}else{
				contURL = "view.aspx?VIEW_NAME=LN_ACC_LN86311&keyU_DUMMYPKID=0&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&UScreen="+arrQueryString[12]+"&TITLE="+arrQueryString[13]+"&UMode=UPD&LEDGERR="+arrQueryString[43];
				}
			break;
			
			//case "LN_ACC_LN86312":
			//	code = "LN86312"
			//	contURL = "view.aspx?VIEW_NAME=LN_ACC_LN86312&keyU_DUMMYPKID=0&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&UScreen="+arrQueryString[12]+"&TITLE=Ledger Balance&UMode=UPD&LEDGERR="+arrQueryString[43];
			case "LN_ACC_LN85318":
				code = "LN85318"
				contURL = "list.aspx?PAGE_NAME=LN_ACC_LN85318&keyU_DUMMYPKID=0&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&UScreen="+arrQueryString[12]+"&TITLE="+arrQueryString[13]+"&LEDGERR="+arrQueryString[43]+"&UMode=UPD";
			break;
			//Kenneth	
			
			// dual control screen ~ start
			//added by Lucas - restructuring & rescheduling maintenance
			case "LN_ACC_LN88545":
			contURL = "view.aspx?VIEW_NAME=LN_ACC_LN86545&keyU_DUMMYPKID=0&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&SCHSTR="+arrQueryString[31]+"&title="+arrQueryString[13]+"&UMode=INQ";
			break;
			//added by Lucas - Alternate Payment Schedule
			case "LN_ACC_LN86516":
			contURL = "view.aspx?VIEW_NAME=LN_ACC_LN85516&keyU_DUMMYPKID=0&SKEY="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&SSEQ="+arrQueryString[32]+"&UMode=INQ";
			break;
			//added by Lucas - Alternate Rate
			case "LN_ACC_LN86515":
			contURL = "view.aspx?VIEW_NAME=LN_ACC_LN85515&keyU_DUMMYPKID=0&AACCT="+arrQueryString[6]+"&AACTYP="+arrQueryString[8]+"&CURTYP="+arrHeaderValue[1]+"&UMode=INQ";
			break;
			//added by Lucas - Term Extension
			case "LN_ACC_LN86540":
			contURL = "view.aspx?VIEW_NAME=LN_ACC_LN86540&keyU_DUMMYPKID=0&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&UMode=INQ";
			break;
			//added by Lucas - Redraw
			case "LN_ACC_LN86860":
			contURL = "view.aspx?VIEW_NAME=LN_ACC_LN86860&keyU_DUMMYPKID=0&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&UMode=INQ";
			break;
			//added by Lucas - Source of Fund
			case "LN_ACC_LN86549":
			contURL = "view.aspx?VIEW_NAME=LN_ACC_LN85549&keyU_DUMMYPKID=0&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&UMode=INQ";
			break;
			//added by Lucas - Related Account
			case "LN_ACC_LN86554":
			contURL = "view.aspx?VIEW_NAME=LN_ACC_LN85554&keyU_DUMMYPKID=0&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&UMode=INQ";
			break;
			//added by Lucas - Central Bank Reporting
			case "LN_ACC_LN86863":
			contURL = "view.aspx?VIEW_NAME=LN_ACC_LN86863&keyU_DUMMYPKID=0&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&UMode=INQ";
			break;
			//added by Lucas - Drawdown Schedule
			case "LN_ACC_LN86513":
			contURL = "view.aspx?VIEW_NAME=LN_ACC_LN85513&keyU_DUMMYPKID=0&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&UMode=INQ";
			break;
			//added by Lucas - Interest Rollover Period
			case "LN_ACC_LN86567":
			contURL = "view.aspx?VIEW_NAME=LN_ACC_LN85567&keyU_DUMMYPKID=0&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&UMode=INQ";
			break;
			//added by Lucas - Message
			case "LN_ACC_LN86511":
			contURL = "view.aspx?VIEW_NAME=LN_ACC_LN85511&keyU_DUMMYPKID=0&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&UMode=INQ";
			break;
			//added by Lucas - Currency
			case "LN_ACC_LN86520":
			contURL = "view.aspx?VIEW_NAME=LN_ACC_LN85520&keyU_DUMMYPKID=0&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&UMode=INQ";
			break;
			//added by Lucas - Currency
			case "LN_ACC_LN86592":
			contURL = "view.aspx?VIEW_NAME=LN_ACC_LN85592&keyU_DUMMYPKID=0&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&UMode=INQ";
			break;
			//added by Lucas - Purpose Code
			case "LN_ACC_LN86592":
			contURL = "view.aspx?VIEW_NAME=LN_ACC_LN85592&keyU_DUMMYPKID=0&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&UMode=INQ";
			break;
			//added by Lucas - Tiered Prepayment
			case "LN_ACC_LN86578":
			contURL = "view.aspx?VIEW_NAME=LN_ACC_LN85578&keyU_DUMMYPKID=0&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&UMode=INQ";
			break;
			//added by Lucas - Link to CASA
			case "LN_ACC_LN85596":
			code = "LN85596"
			contURL = "view.aspx?VIEW_NAME=LN_ACC_LN85596&keyU_DUMMYPKID=0&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&TITLE="+arrQueryString[13]+"&UMode=INQ";
			break;
			//added by Lucas - Promissory Note
			case "LN_ACC_LN85595_PN":
			contURL = "view.aspx?VIEW_NAME=LN_ACC_LN85595_PN&keyU_DUMMYPKID=0&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&TITLE="+arrQueryString[13]+"&UMode=INQ";
			break;
			//added by Lucas - Bill of Exchange
			case "LN_ACC_LN85595_INV":
			contURL = "view.aspx?VIEW_NAME=LN_ACC_LN85595_INV&keyU_DUMMYPKID=0&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&TITLE="+arrQueryString[13]+"&UMode=INQ";
			break;
			//added by Lucas - Cheque
			case "LN_ACC_LN85595_CHQ":
			contURL = "view.aspx?VIEW_NAME=LN_ACC_LN85595_CHQ&keyU_DUMMYPKID=0&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&TITLE="+arrQueryString[13]+"&UMode=INQ";
			break;
			//added by Lucas - Subsidized by 3rd Party
			case "LN_ACC_LN86522":
			contURL = "view.aspx?VIEW_NAME=LN_ACC_LN85522&keyU_DUMMYPKID=0&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&TITLE="+arrQueryString[13]+"&UMode=INQ";
			break;
			//added by Lucas - Rollover Schedule
			case "LN_ACC_LN86519":
			contURL = "view.aspx?VIEW_NAME=LN_ACC_LN85519&keyU_DUMMYPKID=0&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&TITLE="+arrQueryString[13]+"&UMode=INQ";
			break;
			//added by Lucas - Rollover Schedule
			case "LN_ACC_LN86594":
			contURL = "view.aspx?VIEW_NAME=LN_ACC_LN85594&keyU_DUMMYPKID=0&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&TITLE="+arrQueryString[13]+"&UMode=INQ";
			break;
			//added by Lucas - Judgement
			case "LN_ACC_LN86558":
			contURL = "view.aspx?VIEW_NAME=LN_ACC_LN86558&keyU_DUMMYPKID=0&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&TITLE="+arrQueryString[13]+"&UMode=INQ";
			break;
			//added by Lucas - IIS Write Off/Write Back 
			case "LN_ACC_LN86534":
			contURL = "view.aspx?VIEW_NAME=LN_ACC_LN85534&keyU_DUMMYPKID=0&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&TITLE="+arrQueryString[13]+"&UMode=INQ";
			break;
			//added by Lucas - Specific Provision
			case "LN_ACC_LN86518":
			contURL = "view.aspx?VIEW_NAME=LN_ACC_LN86518&keyU_DUMMYPKID=0&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&TITLE="+arrQueryString[13]+"&UMode=INQ";
			break;
			//added by Lucas - Rate Maintenance (Single Tiered)
			case "LN_ACC_LN86858":
			contURL = "view.aspx?VIEW_NAME=LN_ACC_LN86858&keyU_DUMMYPKID=0&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&TITLE="+arrQueryString[13]+"&UMode=INQ";
			break;
			//added by Lucas - Tiered Rate by Amount
			case "LN_ACC_LN86514":
			contURL = "view.aspx?VIEW_NAME=LN_ACC_LN85514&keyU_DUMMYPKID=0&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&TITLE="+arrQueryString[13]+"&CURTYP="+arrHeaderValue[1]+"&UMode=INQ";
			break;
			//added by Lucas - Rate Schedule
			case "LN_ACC_LN86704":
			contURL = "view.aspx?VIEW_NAME=LN_ACC_LN86704&keyU_DUMMYPKID=0&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&TITLE="+arrQueryString[13]+"&CURTYP="+arrHeaderValue[1]+"&UMode=INQ";
			break;
			//added by Lucas - Backdate Rate Change
			case "LN_ACC_LN86530":
			contURL = "view.aspx?VIEW_NAME=LN_ACC_LN86530&keyU_DUMMYPKID=0&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&TITLE="+arrQueryString[13]+"&UMode=INQ";
			break;
			//added by Lucas - Average Bank Rate
			case "LN_ACC_LN86568":
			contURL = "view.aspx?VIEW_NAME=LN_ACC_LN85568&keyU_DUMMYPKID=0&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&TITLE="+arrQueryString[13]+"&UMode=INQ";
			break;
			//added by Lucas - Payment Schedule
			case "LN_ACC_LN88825":
			contURL = "view.aspx?VIEW_NAME=LN_ACC_LN86825&keyU_DUMMYPKID=0&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&TITLE="+arrQueryString[13]+"&UMode=INQ";
			break;
			//added by Lucas - Principal Repayment Schedule
			case "LN_ACC_LN86521":
			contURL = "view.aspx?VIEW_NAME=LN_ACC_LN85521&keyU_DUMMYPKID=0&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&TITLE="+arrQueryString[13]+"&UMode=INQ";
			break;
			//added by Lucas - Payment Billing 
			case "LN_ACC_LN86531":
			contURL = "view.aspx?VIEW_NAME=LN_ACC_LN85531&keyU_DUMMYPKID=0&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&TITLE="+arrQueryString[13]+"&UMode=INQ";
			break;
			case "LN_ACC_LN86551":
			contURL = "view.aspx?VIEW_NAME=LN_ACC_LN86551&keyU_DUMMYPKID=0&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&TITLE="+arrQueryString[13]+"&UMode=INQ";
			break;
			//added by Lucas - Compromised Settlement 
			case "LN_ACC_LN86301":
			contURL = "view.aspx?VIEW_NAME=LN_ACC_LN86301&keyU_DUMMYPKID=0&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&TITLE="+arrQueryString[13]+"&UMode=INQ";
			break;
			//added by Lucas - Compromised Settlement Schedule
			case "LN_ACC_LN86302":
			contURL = "view.aspx?VIEW_NAME=LN_ACC_LN86302&keyU_DUMMYPKID=0&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&TITLE="+arrQueryString[13]+"&UMode=INQ";
			break;
			//added by Lucas - Fee Charge Method/Schedule
			case "LN_ACC_LN86535":
			contURL = "view.aspx?VIEW_NAME=LN_ACC_LN85535&keyU_DUMMYPKID=0&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&TITLE="+arrQueryString[13]+"&UMode=INQ";
			break;
			//added by Lucas - Prepayment Notice
			case "LN_ACC_LN86533":
			contURL = "view.aspx?VIEW_NAME=LN_ACC_LN85533&keyU_DUMMYPKID=0&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&TITLE="+arrQueryString[13]+"&UMode=INQ";
			break;
			//added by Lucas - Write Off 
			case "LN_ACC_LN86548":
			contURL = "view.aspx?VIEW_NAME=LN_ACC_LN86548&keyU_DUMMYPKID=0&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&TITLE="+arrQueryString[13]+"&UMode=INQ";
			break;
			//added by Lucas - Hold Code 
			case "LN_ACC_LN86304":
			contURL = "view.aspx?VIEW_NAME=LN_ACC_LN85304&keyU_DUMMYPKID=0&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&TITLE="+arrQueryString[13]+"&UMode=INQ";
			break;
			case "LN_ACC_LN85305":
			contURL = "list.aspx?PAGE_NAME=LN_ACC_LN85305&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&LNSPTF="+arrHeaderValue[6]+"&TLSAPP=LN&UMode=ADD";
			break;	
			case "DD26930LN":
			contURL = "view.aspx?VIEW_NAME=LN_ACC_DD26930&keyU_DUMMYPKID=0&UMode=INQ&CRACCT="+arrQueryString[34]+"&CRTYPE="+arrQueryString[35]+"&DRACCT="+arrQueryString[36]+"&DRTYPE="+arrQueryString[37]+"&DRSEQ="+arrQueryString[38]+"&STATUS="+arrQueryString[39]+"&Terminate=T";
			break;	
			case "LN_ACC_SS86001":				
			contURL = "view.aspx?VIEW_NAME=LN_ACC_SS86001&UMode=INQ&keyU_DUMMYPKID=0&TRACNO="+arrQueryString[40]+"&TREFD8="+arrQueryString[41]+"&TRBKNO="+arrHeaderValue[4]+"&TRBRNO="+arrHeaderValue[5];
			break;
			// dual control screen ~ end
			case "LN_ACC_CF15246":
			contURL = "view.aspx?VIEW_NAME=LN_ACC_CF15246&UMode=INQ&keyU_DUMMYPKID=0&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8];
			break;
            // Adhoc Billing 
			case "LN_ACC_LN85280":
			contURL = "list.aspx?PAGE_NAME=LN_ACC_LN85280&UMode=INQ&BACCTNOX="+arrQueryString[6];
			break;
			//added by Lucas - Standing Order Waiver (27/06/2012)
			case "LN_ACC_LN85322":
			contURL = "list.aspx?PAGE_NAME=LN_ACC_LN85322&keyU_DUMMYPKID=0&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&TITLE="+arrQueryString[13]+"&UMode=UPD";
			break;
			//T1001 added by Patsakorn - Maintenance -Taxable Interest Monitoring Date(26/03/2013)
			case "LN_ACC_LN86829":
			contURL = "view.aspx?VIEW_NAME=LN_ACC_LN86829&keyU_DUMMYPKID=0&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&TITLE="+arrQueryString[13]+"&UMode=UPD";
			break; //End T1001
			//T1002 Added by Sasinan - Maintenance - Original amount and Drawing Limit amount (09/09/2013)
			case "LN_ACC_LN86831":
			contURL = "view.aspx?VIEW_NAME=LN_ACC_LN86831&keyU_DUMMYPKID=0&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&TITLE="+arrQueryString[13]+"&UMode=UPD";
			break;
			//End T1002
			//T1003
			case "LN_ACC_LN86919":
			contURL = "view.aspx?VIEW_NAME=LN_ACC_LN86919&keyU_DUMMYPKID=0&ACCTNO="+arrQueryString[6]+"&IDXOAC="+arrQueryString[44]+"&IDXNAC="+arrQueryString[45]+"&TITLE="+arrQueryString[13]+"&UMode=UPD";
			break;
			//END T1003
			//T1004 Added by Sasinan - Maintenance - Stamc Account Date (21/10/2013)
			case "LN_ACC_LN86817":
			contURL = "view.aspx?VIEW_NAME=LN_ACC_LN86817&keyU_DUMMYPKID=0&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&TITLE="+arrQueryString[13]+"&UMode=UPD";
			break;
			//End T1004	
			//G001 added by Patsakorn - Standing Order Waiver (27/06/2012)
			case "LN_ACC_LN85324":
			contURL = "list.aspx?PAGE_NAME=LN_ACC_LN85324&keyU_DUMMYPKID=0&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&TITLE="+arrQueryString[13]+"&UMode=UPD";
			break;	
                                          //K0001 added by Sarawut - Discounted Rollover Simulater (27/07/17)
            case "LN_ACC_LN84700":				
			contURL = "view.aspx?VIEW_NAME=LN_ACC_LN84700&keyU_DUMMYPKID=0&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&UScreen="+arrQueryString[12]+"&TITLE="+arrQueryString[13]+"&TYPE="+arrHeaderValue[2]+"&CURTYP="+arrHeaderValue[1]+"&UMode=UPD";
			break;
			
			                              //K0003 added by Golf - Vehicle from car Status (03/10/17)
			case "LN_ACC_LN86868_FP":				
			contURL = "view.aspx?VIEW_NAME=LN_ACC_LN86868_FP&keyU_DUMMYPKID=0&LIACCT="+arrQueryString[6]+"&LIATYP="+arrQueryString[8]+"&UScreen="+arrQueryString[12]+"&TITLE="+arrQueryString[13]+"&TYPE="+arrHeaderValue[2]+"&CURTYP="+arrHeaderValue[1]+"&UMode=INQ";
			break;	

			//K0003 added by Golf  (15/07/19)
			case "LN_ACC_LN86892":				
			contURL = "view.aspx?VIEW_NAME=LN_ACC_LN86892&keyU_DUMMYPKID=0&LNIACC="+arrQueryString[6]+"&LNITYP="+arrQueryString[8]+"&UScreen="+arrQueryString[12]+"&TITLE="+arrQueryString[13]+"&TYPE="+arrHeaderValue[2]+"&UMode=INQ";
			break;
			
			case "LN_ACC_LN86893":				
			contURL = "view.aspx?VIEW_NAME=LN_ACC_LN86893&keyU_DUMMYPKID=0&LNIACC="+arrQueryString[6]+"&LNITYP="+arrQueryString[8]+"&UScreen="+arrQueryString[12]+"&TITLE="+arrQueryString[13]+"&TYPE="+arrHeaderValue[2]+"&UMode=INQ";
			break;

			//K0004 added by JJay  (18/12/19)
			case "LN_ACC_LN86895_Collection_INQ":				
			contURL = "view.aspx?VIEW_NAME=LN_ACC_LN86895_Collection_INQ&keyU_DUMMYPKID=0&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&UScreen="+arrQueryString[12]+"&TITLE="+arrQueryString[13]+"&TYPE="+arrHeaderValue[2]+"&CIFNO="+cifno+"&CFCIFN="+cifno+"&UMode=INQ";
			break;
			
			//K6401 added by JJay  (20/10/21)			
			case "LN_ACC_LN85886":
			contURL = "view.aspx?VIEW_NAME=LN_ACC_LN85886&LNSPTF="+arrHeaderValue[6]+"&ACCTNO="+arrQueryString[6]+"&UScreen="+arrQueryString[12]+"&TITLE="+arrQueryString[13]+"&UMode=";
			break;
			
			//K6401 added by JJay  (22/10/21)			
			case "LN_ACC_LN85888":
			contURL = "view.aspx?VIEW_NAME=LN_ACC_LN85888&LNSPTF="+arrHeaderValue[6]+"&ACCTNO="+arrQueryString[6]+"&UScreen="+arrQueryString[12]+"&TITLE="+arrQueryString[13]+"&UMode=";
			break;
	                                         		

			//K6401 added by Ploy  (30/10/21)			
			case "LN_ACC_LN86960_INQ":
			contURL = "view.aspx?VIEW_NAME=LN_ACC_LN86960_INQ&keyU_DUMMYPKID=0&LNSPTF="+arrHeaderValue[6]+"&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&UScreen="+arrQueryString[12]+"&TITLE="+arrQueryString[13]+"&UMode=UPD";
			break;
			//K8471 added by JJAY  (05/08/22)			
			case "LN_ACC_LN85968":
			contURL = "list.aspx?PAGE_NAME=LN_ACC_LN85968&keyU_DUMMYPKID=0&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&TITLE="+arrQueryString[13]+"&UMode=UPD";
			break;
			//K8471 added by SONGKRAN  (10/08/22)
			case "LN_ACC_LN85967":
			contURL = "list.aspx?PAGE_NAME=LN_ACC_LN85967&keyU_DUMMYPKID=0&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&TITLE="+arrQueryString[13]+"&UMode=UPD";
			break;
			//K9985 added by Pruk  (15/08/22)
			//K9985 added by Pruk  (29/11/22)
			case "LN_ACC_LN85909":
			contURL = "list.aspx?PAGE_NAME=LN_ACC_LN85909&keyU_DUMMYPKID=0&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&TITLE="+arrQueryString[13]+"&MCLNID="+arrHeaderValue[18]+"&PRDGRP="+arrHeaderValue[22]+"&PWOFID="+arrHeaderValue[30]+"&PWOAP8="+arrHeaderValue[31]+"&UMode=UPD";
			break;
			
			default:
				alert("Page " + arrQueryString[0] + " Not Found.\n System is not able to navigate to the related screen.")
			break;
			}
			//modify for dual control by Raymond 24/06/2011
			if(gsGetQueryString("DUAL","")=="TRUE")
			{
				if(contURL.toUpperCase().indexOf("&UMODE=INQ")==-1) 	
				{
					if(contURL.toUpperCase().indexOf("&UMODE=")!=-1)
					{						
						var subUModeURL = contURL.split("&UMode=");
						var UMode = subUModeURL[1].split("&")[0];
						contURL = contURL.replace("&UMode="+UMode,"&UMode=INQ");
					}
					else
					{
						contURL = contURL + "&UMode=INQ";
					}
				}
				var arrDualQueryString = ["CHFSEQ","CHAPCD","CHFCID","CHMND8"];
				for(var x=0;x<arrDualQueryString.length;x++){
				if(gsGetQueryString(arrDualQueryString[x], "") != undefined) 
				arrDualQueryString[x] = gsGetQueryString(arrDualQueryString[x], "");
				}
				
				contURL = contURL+ "&DUAL=TRUE&CHFSEQ=" + arrDualQueryString[0]+"&CHAPCD="+ arrDualQueryString[1]+"&CHFCID="+arrDualQueryString[2]+"&CHMND8="+arrDualQueryString[3];
			}
			//end modify by Raymond 24/06/2011
			// eval(gsSScript2(''5d32f737-c1d0-4637-83b9-e7fe2c6a27ea'',''&code=''+code+''&condition=T&field=viewTitle''));
			if(document.getElementById(''ctnDetails'') != null) ctnDetails.location.href = contURL;
	}
	else
		ctnDetails.location.href = ''list.aspx?PAGE_NAME=Blank'';
}', VERSION=N'0.1', DATE_CREATED='2554-04-21 10:13:55.780', DATE_MODIFIED='2022-11-30 10:49:41.710', SCRIPT_LANGUAGE=N'JS', RETURN_FALSE=N'N', SCRIPT_TYPE=N'0', CREATED_BY=null, MODIFIED_BY=N'2364b04d-72d6-453c-b751-d534c20e44c3' WHERE SCRIPT_ID = '4b02919d-8dd3-4791-984d-0150689dc67b'

                                           if @@rowcount = 0
                                           begin
                                                  INSERT INTO S_CLIENT_SCRIPT(SCRIPT_ID, INT_ID, FUNCTION_NAME, DESCRIPTION, FUNCTION_CODE, VERSION, DATE_CREATED, DATE_MODIFIED, SCRIPT_LANGUAGE, RETURN_FALSE, SCRIPT_TYPE, CREATED_BY, MODIFIED_BY) VALUES(N'4b02919d-8dd3-4791-984d-0150689dc67b', null, N'csLN_ACC_LN86803_HDR_ONLOAD_NEW', N'csLN_ACC_LN86803_HDR_ONLOAD_NEW', N'/*------------------------------------------------------------------------------------------------------------------------------------------------
 * Modification Logs : Cimb Hubbing
 
    Name                     Init             Date              Remarks
  ----------------         --------        --------------   ----------------------------------------------------------------
  Patsakorn C.           T1001      03/04/2013      Add new screen for Maintenance -Taxable Interest Monitoring Date
  Sasinan   S.           T1002      09/09/2013      Add new screen for Maintenance - Original amount and Drawing Limit amount
  Patsakorn C.           T1003      18/10/2013      Add new screen for Loan Relate to Stamc and add new field to qry array
  Sasinan   S.           T1004      21/10/2013      Add new screen for Maintenance - Stamc Account Date
  Patsakorn C.           G001       19/10/2016      Add New screen for Simulator payment for GHB
  Sarawut K.             K0001      27/07/2017      Add new screen for Discounted Rollover Simulater
  LHL                    K0002      14/09/2017      Add new field into arrHeaderValue (TYPE,CURTYP,Campaign Code)  
  Golf K.                K0003      03/10/2017      Add new Screen for Vehicle  
  Thanakrit P.           K6401      20/10/2021      Add new Screen For Redemption Inquiry by Main (Revolving), Add new Screen For Repayment Simulator By Main
  Phatthamunee S.        K6401      30/10/2021      Add new screen for Allow IPP Paid off 
  Pruk                   S6401      05/07/2022      Add MCLNID and PRDGRP in LN_ACC_LN82548
  Thanakrit P.           K8471      05/08/2022      Add new screen for eSubscription
  Pruk H.				 K9985      15/08/2022      Add new screen for Write-off Amount and Add new field into arrHeaderValue (PWOFID)
  Pruk H.				 K9985      29/11/2022      Add new field into arrHeaderValue (PWOAP8)
--------------------------------------------------------------------------------------------------------------------------------------------------*/							      
function csLN_ACC_LN86803_HDR_ONLOAD_NEW()
{
debugger;

	var contURL = "";
	var spanItem = document.getElementsByTagName("span");
	var spanItemlength = spanItem.length;
	
	document.getElementById(''MAINTab'').style.display = "none";
	
	var cifno = gsGetQueryString("CIFNO","") 

	document.getElementById(''tabs'').style.display ="none"
	
	for(var z=0;z<spanItemlength;z++){
		if(spanItem[z].id == "ERROR"){
			var strStatus = spanItem[z].innerHTML;
		}
	}
	
	if(strStatus.length > 0){
		document.getElementById(''ctnDetails'').style.display = "none"
		// ctnDetails.location.href = ''list.aspx?PAGE_NAME=BLANK'';
		return
	}

	if (gsGetQueryString("PGIND","") != undefined)
	{	
		if(gsGetQueryString("IN_POPUP","") != undefined){
			oPop = gsGetQueryString("IN_POPUP","");
			oPop = "&INPOPUP="+ oPop;
		}
		else oPop="";

		var arrQueryString = ["PGIND","sMode","AFRPAC","AFAPNO","AFAANO","INDTitle","ACCTNO","ACCTNO2","ACTYPE","MODEIND","strT","ACTMNO","UScreen","TITLE","IBASE","EFFDT8","PENCOD","PMTYPE","PENPCT","E1PERS","E1CTNO","PRVCHG","NRMLIN","LTAMT","LATCOD","INLCOD","FUNCOD","AMTIND","INTIND","WPCODE","FLOW","SCHSTR","SSEQ","ODDUAL","CRACCT","CRTYPE","DRACCT","DRTYPE","DRSEQ","STATUS","TRACNO","TREFD8","EFFIND","LEDGERR","IDXOAC","IDXNAC"]; // PLEASE ADD THE NEW FIELD TO THE END OF THE ARRAY - by wai kit 26/07/2011
		//T1003 Patsakorn C. Add new field IDXOAC and IDXNAC
		//var arrHeaderValue = ["AXAPNO","APTYPE","TYPE","CURTYP","BKN","BRN","LNSPTF","CIFNO","CBAL","INTDUE","LCDUE","CFDUE","OTHCHG","MISCD","SNAME","ORGAMT","DRLIMT","HAVMSG","MCLNID","PARTID","AXFCDE"]; // PLEASE ADD THE NEW FIELD TO THE END OF THE ARRAY - by wai kit 26/07/2011
		// LHL K0002
		var arrHeaderValue = ["AFAPNO","CURTYP","TYPE","BRN","BKN","BRN","LNSPTF","CIFNO","CBAL","CFDUE","INTDUE","LCDUE","OTHCHG","MISCD","SNAME","ORGAMT","DRLIMT","HAVMSG","MCLNID","PARTID","AXFCDE","APTYPE","PRDGRP","FRCODE","IPCODE","MULTIR","IBASE","PAUTDB","YBASE","RATPC","PWOFID","PWOAP8"]; // PLEASE ADD THE NEW FIELD TO THE END OF THE ARRAY - by wai kit 26/07/2011 (^0^)
		
		

		for(var x=0;x<arrQueryString.length;x++){
			if(gsGetQueryString(arrQueryString[x], "") != undefined) 
			arrQueryString[x] = gsGetQueryString(arrQueryString[x], "");
		}
		//alert(arrQueryString[0]);
		for(var y=0;y<arrHeaderValue.length;y++){
			for(var z=0;z<spanItemlength;z++){
				if(spanItem[z].id == arrHeaderValue[y]) {
					arrHeaderValue[y] = spanItem[z].innerHTML;
					break;
				}
			}
		}
		
		for(var z=0;z<spanItemlength;z++){
			if(spanItem[z].id == "APTYPE"){
				var acType = spanItem[z].innerHTML;
				acType = acType.substring(0,1)
				var strAcType = "&APTYPE="+acType
			}
			else if(spanItem[z].id == "TYPE"){
				var TYPE = spanItem[z].innerHTML;
				search = TYPE.search("-");
				var strTYPE = "&TYPE=" + TYPE;
			}
		}

		if(arrHeaderValue[1]){
			var curr = arrHeaderValue[1];
		}

		if(gsGetQueryString("strT","")!=undefined)
		{
			var strT=gsGetQueryString("strT","");
			var SCHSTR="";
			if(strT=="Restructuring - Increase / Decrease Restructuring Counter" || strT=="Restructuring - Interest/Payment Amount Changes")
				SCHSTR = "R";
			else if(strT=="Rescheduling - Increase / Decrease Rescheduling Counter" || strT=="Rescheduling - Interest/Payment Amount Changes" )
				SCHSTR= "S";
		}
		
		if(gsGetQueryString("iodFlag","")!=undefined)
			var IORDFG=gsGetQueryString("iodFlag","");
			
		switch(arrQueryString[0]){
		
			case "LN_ACC_LN85534": //IIS
				code = "LN00088"
				contURL = "list.aspx?PAGE_NAME=LN_ACC_LN85534&keyU_DUMMYPKID=0&LNSPTF="+arrHeaderValue[6]+"&AFAPNO="+arrHeaderValue[0]+"&AFRPAC="+arrQueryString[2]+"&LWACNO="+arrQueryString[6]+"&LWACTP=L&CURTYP="+arrHeaderValue[1]+"&BKN="+arrHeaderValue[4]+"&BRN="+arrHeaderValue[3]+"&TYPE="+arrHeaderValue[2]+"&ACTYPE="+arrQueryString[8]+"&AFAANO="+arrQueryString[4]+"&INDTitle="+arrQueryString[5]+"&UMode=UPD";
			break;
			case "LN_ACC_LN85548":
				code = "LN00077"
				contURL = "list.aspx?PAGE_NAME=LN_ACC_LN85548&keyU_DUMMYPKID=0&LNSPTF="+arrHeaderValue[6]+"&AFAPNO="+arrHeaderValue[0]+"&AFRPAC="+arrQueryString[2]+"&ACCTNO="+arrQueryString[6]+"&CURTYP="+arrHeaderValue[1]+"&BKN="+arrHeaderValue[4]+"&BRN="+arrHeaderValue[3]+"&TYPE="+arrHeaderValue[2]+"&ACTYPE="+arrQueryString[8]+"&AFAANO="+arrQueryString[4]+"&INDTitle="+arrQueryString[5]+"&UMode=UPD";
			break;
			
			case "LN_ACC_LN25634":
				code = "LN00093"
				contURL = "list.aspx?PAGE_NAME=LN_ACC_LN25634&keyU_DUMMYPKID=0&LNSPTF="+arrHeaderValue[6]+"&AFAPNO="+arrHeaderValue[0]+"&AFRPAC="+arrQueryString[2]+"&CRACCT="+arrQueryString[6]+"&CURTYP="+arrHeaderValue[1]+"&BKN="+arrHeaderValue[4]+"&BRN="+arrHeaderValue[3]+"&TYPE="+arrHeaderValue[2]+"&CRTYPE="+arrQueryString[8]+"&AFAANO="+arrQueryString[4]+"&INDTitle="+arrQueryString[5]+"&UMode=UPD";
			break;
			
			case "LN_ACC_LN83503":
				code = "LN00023"
				contURL = "view.aspx?VIEW_NAME=LN_ACC_LN83503_TAB&keyU_DUMMYPKID=0&LNSPTF="+arrHeaderValue[6]+"&IN_IFRAME=TRUE&AFAPNO="+arrHeaderValue[0]+"&AFRPAC="+arrQueryString[2]+"&ACCTNO="+arrQueryString[6]+"&ACCTNO2="+arrQueryString[7]+"&CURTYP="+arrHeaderValue[1]+"&BKN="+arrHeaderValue[4]+"&BRN="+arrHeaderValue[5]+"&TYPE="+arrHeaderValue[2]+"&ACTYPE="+arrQueryString[8]+"&AFAANO="+arrQueryString[4]+"&CIFNO="+arrHeaderValue[7]+"&ACTMNO="+arrQueryString[11]+strAcType+"&INDTitle="+arrQueryString[5]+"&UScreen="+arrQueryString[12]+"&TITLE="+arrQueryString[13]+"&PRDGRP="+arrHeaderValue[22]+"&MULTIR="+arrHeaderValue[25]+"&IBASE="+arrHeaderValue[26]+"&PAUTDB="+arrHeaderValue[27]+"&UMode="+arrQueryString[9]+oPop;
			break;
			
			//Kenneth 04 May 2011 - for transfer of facility
			case "LN_ACC_SS85001":
				code = "LN00023"
				contURL = "list.aspx?PAGE_NAME=LN_ACC_SS85001&keyU_DUMMYPKID=0&INTRACNO="+arrQueryString[6]+"&INDTitle="+arrQueryString[5]+"&UScreen="+arrQueryString[12]+"&TITLE="+arrQueryString[13]+"&TRBKNO="+arrHeaderValue[4]+"&TRBRNO="+arrHeaderValue[5]+"&UMode=UPD";
			break;
			//Kenneth	
			
			//from CIF
			case "CF_ACC_LN86838":
				//~ code = "LN00006"
				contURL = "view.aspx?VIEW_NAME=LN_ACC_LN86838_01&keyU_DUMMYPKID=0&FROM=CIF&WPCODE="+arrQueryString[29]+"&LNSPTF="+arrHeaderValue[6]+"&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&BRN="+arrHeaderValue[3]+"&CIFNO="+arrHeaderValue[7]+"&SNAME="+arrHeaderValue[14]+"&TYPE="+arrHeaderValue[2]+"&HAVMSG="+arrHeaderValue[17]+"&AFAPNO="+arrHeaderValue[0]+"&UMode=INQ"+strAcType+"&IN_IFRAME=TRUE";
			break;
			//from CIF
			
			case "LN_ACC_LN86838_Balance":
				//~ code = "LN00006"
				var FROM;
				if(gsGetQueryString("FROM",""))
					FROM = gsGetQueryString("FROM","");
				
				contURL = "view.aspx?VIEW_NAME=LN_ACC_LN86838_01&keyU_DUMMYPKID=0&FLOW="+arrQueryString[30]+"&WPCODE="+arrQueryString[29]+"&LNSPTF="+arrHeaderValue[6]+"&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&BRN="+arrHeaderValue[3]+"&CIFNO="+arrHeaderValue[7]+"&SNAME="+arrHeaderValue[14]+"&TYPE="+arrHeaderValue[2]+"&HAVMSG="+arrHeaderValue[17]+"&AFAPNO="+arrHeaderValue[0]+"&UMode="+arrQueryString[9]+strAcType+"&FROM="+FROM+"&IN_IFRAME=TRUE";
			break;
			
			case "LN_ACC_LN86838_Balance_NoHP":
				code = "LN00006"
				contURL = "view.aspx?VIEW_NAME=LN_ACC_LN86838_01HP&keyU_DUMMYPKID=0&LNSPTF="+arrHeaderValue[6]+"&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&BRN="+arrHeaderValue[3]+"&CIFNO="+arrHeaderValue[7]+"&SNAME="+SNAME+"&TYPE="+arrHeaderValue[2]+"&HAVMSG="+HAVMSG+"&UMode="+arrQueryString[9]+strAcType+"&IN_IFRAME=TRUE";
			break;
			
			case "LN_ACC_LN86530":
				code = "LN00007"
				contURL = "view.aspx?VIEW_NAME=LN_ACC_LN86530&keyU_DUMMYPKID=0&LNSPTF="+arrHeaderValue[6]+"&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&UMode=UPD"+oPop+"&CURR="+curr+arrHeaderValue[3]+arrHeaderValue[2]+strTYPE;
			break;

			case "LN_ACC_LN85531":
				code = "LN00008"
				contURL = "list.aspx?PAGE_NAME=LN_ACC_LN85531&LNSPTF="+arrHeaderValue[6]+"&LBACCT="+arrQueryString[6]+"&LBATYP="+arrQueryString[8]+"&UMode=UPD&CBAL="+arrHeaderValue[8]+"&CFDUE="+arrHeaderValue[9]+"&INTDUE="+arrHeaderValue[10]+"&LCDUE="+arrHeaderValue[11]+"&OTHCHG="+arrHeaderValue[12]+"&MISCD="+arrHeaderValue[13]+"&strT="+strT;
			break;
			
			case "LN_ACC_LN85503":
				code = "LN00104"
				contURL = "list.aspx?PAGE_NAME=LN_ACC_LN85503&LNSPTF="+arrHeaderValue[6]+"&AKACCT="+arrQueryString[6]+"&AKACTY="+arrQueryString[8]+"&UMode=UPD&strT="+strT;
			break;

			case "LN_ACC_LN86538": //Restructure Increase Authorised Limit
				contURL = "view.aspx?VIEW_NAME=LN_ACC_LN86538&keyU_DUMMYPKID=0&LNSPTF="+arrHeaderValue[6]+"&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&UMode=UPD&strT="+strT;
			break;
			
			case "LN_ACC_LN86552":
				code = "LN00010"
				contURL = "view.aspx?VIEW_NAME=LN_ACC_LN86552&keyU_DUMMYPKID=0&LNSPTF="+arrHeaderValue[6]+"&A$ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&UMode=UPD";
			break;
			
			case "LN_ACC_LN86580":
				code = "LN00011"
				contURL = "view.aspx?VIEW_NAME=LN_ACC_LN86580&keyU_DUMMYPKID=0&LNSPTF="+arrHeaderValue[6]+"&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&UMode=UPD";
			break;
			
			case "LN_ACC_LN86545":
				var UScreen = gsGetQueryString("UScreen","");
				if(UScreen == "RESCHEDULE"){
					UScreen = "RESCHEDULING"
					var IND = "S";
					SCHSTR = "S";
					contURL = "view.aspx?VIEW_NAME=LN_ACC_LN86813&keyU_DUMMYPKID=0&IND="+IND+"&LNSPTF="+arrHeaderValue[6]+"&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&INDTitle="+arrQueryString[5]+"&UScreen="+UScreen+"&UMode=INQ&SCHSTR="+SCHSTR+"&title="+strT+"&CURTYP="+arrHeaderValue[1]+"&IN_IFRAME=TRUE";
				}
				else{
					var IND = "R";
					SCHSTR = "R";
					UScreen = "RESTRUCTURING";
					contURL = "view.aspx?VIEW_NAME=LN_ACC_LN86813&keyU_DUMMYPKID=0&IND="+IND+"&LNSPTF="+arrHeaderValue[6]+"&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&INDTitle="+arrQueryString[5]+"&UScreen="+UScreen+"&UMode=INQ&SCHSTR="+SCHSTR+"&title="+strT+"&CURTYP="+arrHeaderValue[1]+"&IN_IFRAME=TRUE";
				}
			
			break;
			
			case "LN_ACC_LN85518":
				code = "LN00013"
				contURL = "list.aspx?PAGE_NAME=LN_ACC_LN85518&keyU_DUMMYPKID=0&LNSPTF="+arrHeaderValue[6]+"&SPACNO="+arrQueryString[6]+"&SPACTP="+arrQueryString[8]+"&UMode=UPD";
			break;
			
			case "LN_ACC_LN86576":
				code = "LN00014"
				contURL = "view.aspx?VIEW_NAME=LN_ACC_LN86576&keyU_DUMMYPKID=0&LNSPTF="+arrHeaderValue[6]+"&PRACCT="+arrQueryString[6]+"&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&REBUILD=Y&UMode=UPD";
			break;
			
			case "LN_ACC_LN85532":
				code = "LN00015"					
				contURL = "list.aspx?PAGE_NAME=LN_ACC_LN85532&LNSPTF="+arrHeaderValue[6]+"&LNFACT="+arrQueryString[6]+"&LNFTYP="+arrQueryString[8]+"&UMode=UPD";
			break;
			
			case "LN_ACC_LN86539": //Restructure Decrease Authorised Limit
				contURL = "view.aspx?VIEW_NAME=LN_ACC_LN86539&keyU_DUMMYPKID=0&LNSPTF="+arrHeaderValue[6]+"&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&UMode=UPD&strT="+strT;
			break;
			
			case "LN_ACC_LN86540":
				code = "LN00017"				
				contURL = "view.aspx?VIEW_NAME=LN_ACC_LN86540&keyU_DUMMYPKID=0&LNSPTF="+arrHeaderValue[6]+"&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&UMode=UPD";
			break;
			
			case "LN_ACC_LN86561":
				code = "LN00018"
				contURL = "view.aspx?VIEW_NAME=LN_ACC_LN86561&keyU_DUMMYPKID=0&LNSPTF="+arrHeaderValue[6]+"&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&PTYPE="+arrHeaderValue[2]+"&AXFCDE="+arrHeaderValue[20]+"&CURTYP="+arrHeaderValue[1]+"&UMode=UPD&NextAction=C";
			break;
			
			case "LN_ACC_LN86550":
				if(gsGetQueryString("DUAL","") == "TRUE"){	//dual control flow
					SCHSTR = gsGetQueryString("SCHSTR","");
					IORDFG = gsGetQueryString("IORDFG","");
					
					if(SCHSTR == "R"){
						UScreen = "RESTRUCTURING"
						strT = "Restructuring - Increase / Decrease Restructuring Counter";
					}
					else{
						UScreen = "RESCHEDULING"
						strT = "Rescheduling - Increase / Decrease Rescheduling Counter";
					}
					
					contURL = "view.aspx?VIEW_NAME=LN_ACC_LN86550&keyU_DUMMYPKID=0&LNSPTF="+arrHeaderValue[6]+"&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&UMode=UPD&SCHSTR="+SCHSTR+"&IORDFG="+IORDFG+"&strT="+strT+"&UScreen="+UScreen;
				}
				else{
					if (strT=="Rescheduling - Increase / Decrease Rescheduling Counter")
						code = "LN00019";
					else if (strT=="Restructuring - Increase / Decrease Restructuring Counter")
						code = "LN00079";
						
					contURL = "view.aspx?VIEW_NAME=LN_ACC_LN86550&keyU_DUMMYPKID=0&LNSPTF="+arrHeaderValue[6]+"&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&UMode=UPD&SCHSTR="+SCHSTR+"&IORDFG="+IORDFG+"&title="+strT;
				}
			break;
			
			case "LN_ACC_LN85574":
				code = "LN00020"
				contURL = "list.aspx?PAGE_NAME=LN_ACC_LN85574&keyU_DUMMYPKID=0&LNSPTF="+arrHeaderValue[6]+"&LHACCT="+arrQueryString[6]+"&LHATYP="+arrQueryString[8]+"&UMode=UPD";
			break;
			
			case "LN_ACC_LN85533":	
				code = "LN00021"
				contURL = "list.aspx?PAGE_NAME=LN_ACC_LN85533&keyU_DUMMYPKID=0&LNSPTF="+arrHeaderValue[6]+"&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&UMode=UPD";
			break;

			
			case "LN_ACC_LN86862":
				code = "LN00022"
				contURL = "view.aspx?VIEW_NAME=LN_ACC_LN86862&keyU_DUMMYPKID=0&LNSPTF="+arrHeaderValue[6]+"&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&EFFIND="+arrQueryString[42]+"&UMode=UPD";
			break;
			
			case "LN_ACC_LN86820_NORMAL":	
				//code = "L00021"
				//var AFAPNO = gsGetQueryString("AFAPNO","")
				contURL = "view.aspx?VIEW_NAME=LN_ACC_LN86820_NORMAL&keyU_DUMMYPKID=0&LNSPTF="+arrHeaderValue[6]+"&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&AFAPNO="+arrQueryString[3]+"&AFRPAC="+arrQueryString[2]+"&UMode=DEL";
			break;
			case "LN_ACC_LN86820":	//Close Account
				if (arrHeaderValue[18] == ""){
					contURL = "view.aspx?VIEW_NAME=LN_ACC_LN86820_NORMAL&keyU_DUMMYPKID=0&LNSPTF="+arrHeaderValue[6]+"&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&AFAPNO="+arrHeaderValue[0]+"&AFRPAC="+arrQueryString[2]+"&UScreen="+arrQueryString[12]+"&Title="+arrQueryString[13]+"&UMode=UPD";
				}
				else if(arrHeaderValue[18] == "M"){
					if(arrHeaderValue[19] == "M"){
						contURL = "view.aspx?VIEW_NAME=LN_ACC_LN86564&keyU_DUMMYPKID=0&LNSPTF="+arrHeaderValue[6]+"&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&AFAPNO="+arrHeaderValue[0]+"&AFRPAC="+arrQueryString[2]+"&UScreen="+arrQueryString[12]+"&UMode=UPD";
					}
					else{
						contURL = "view.aspx?VIEW_NAME=LN_ACC_LN86820_MAIN&keyU_DUMMYPKID=0&LNSPTF="+arrHeaderValue[6]+"&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&AFAPNO="+arrHeaderValue[0]+"&AFRPAC="+arrQueryString[2]+"&UScreen="+arrQueryString[12]+"&Title="+arrQueryString[13]+"&UMode=UPD";
					}
				}
				else{
					contURL = "view.aspx?VIEW_NAME=LN_ACC_LN86820_TRANCHE&keyU_DUMMYPKID=0&LNSPTF="+arrHeaderValue[6]+"&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&AFAPNO="+arrHeaderValue[0]+"&AFRPAC="+arrQueryString[2]+"&UScreen="+arrQueryString[12]+"&UMode=UPD";
				}
			break;
			case "LN_ACC_LN86828_HP":	//HP
				contURL = "view.aspx?VIEW_NAME=LN_ACC_LN86828_HP&keyU_DUMMYPKID=0&LNSPTF="+arrHeaderValue[6]+"&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&AFAPNO="+arrHeaderValue[0]+"&UMode=DEL";
			break;
			case "LN_ACC_LN82800_MNT":	
				MFLAG = gsGetQueryString("MFLAG","") != "" ? gsGetQueryString("MFLAG","") : "";
				contURL = "list.aspx?PAGE_NAME=LN_ACC_LN82800_MNT&LNSPTF="+arrHeaderValue[6]+"&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&ACTMNO="+arrQueryString[11]+"&UMode="+arrQueryString[9]+"&UScreen="+arrQueryString[12]+"&TITLE="+arrQueryString[13]+"&CIFNO="+cifno+"&CFCIFN="+cifno+"&MFLAG="+MFLAG;
			break;
			case "LN_ACC_LN82800_POP":	//pop up screen, by Lucas Low 02/08/2011
				WANTED_FIELD = gsGetQueryString("WANTED_FIELD","");
				FRAMEID = gsGetQueryString("FRAMEID","");
				IFRAMEID = gsGetQueryString("IFRAMEID","");
				contURL = "list.aspx?PAGE_NAME=LN_ACC_LN82800_POP&LNSPTF="+arrHeaderValue[6]+"&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&ACTMNO="+arrQueryString[11]+"&UMode="+arrQueryString[9]+"&UScreen="+arrQueryString[12]+"&TITLE="+arrQueryString[13]+''&WANTED_FIELD=''+WANTED_FIELD+''&FRAMEID=''+FRAMEID+''&IFRAMEID=''+IFRAMEID;
			break;
			case "LN_ACC_LN86821"://Late Charge
				contURL = "view.aspx?VIEW_NAME=LN_ACC_LN86821&keyU_DUMMYPKID=0&LNSPTF="+arrHeaderValue[6]+"&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&AFAPNO="+arrHeaderValue[0]+"&UMode="+arrQueryString[9];
			break;
			case "LN_ACC_LN86822"://Commit & Cancelation
				contURL = "view.aspx?VIEW_NAME=LN_ACC_LN86822&keyU_DUMMYPKID=0&LNSPTF="+arrHeaderValue[6]+"&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&AFAPNO="+arrHeaderValue[0]+"&UMode="+arrQueryString[9];
			break;
			case "LN_ACC_LN86823"://Penalty & funding
				contURL = "view.aspx?VIEW_NAME=LN_ACC_LN86823&keyU_DUMMYPKID=0&LNSPTF="+arrHeaderValue[6]+"&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&AFAPNO="+arrHeaderValue[0]+"&UMode="+arrQueryString[9];
			break;
			case "LN_ACC_LN86824"://Codes & flags
				contURL = "view.aspx?VIEW_NAME=LN_ACC_LN86824&keyU_DUMMYPKID=0&LNSPTF="+arrHeaderValue[6]+"&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&AFAPNO="+arrHeaderValue[0]+"&UMode="+arrQueryString[9];
			break;
			case "LN_ACC_LN86826"://Insurance						
				contURL = "view.aspx?VIEW_NAME=LN_ACC_LN86826&keyU_DUMMYPKID=0&LNSPTF="+arrHeaderValue[6]+"&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&AFAPNO="+arrHeaderValue[0]+"&UMode="+arrQueryString[9];
			break;
			case "LN_ACC_LN86827"://Arrears Management
				contURL = "view.aspx?VIEW_NAME=LN_ACC_LN86827&keyU_DUMMYPKID=0&LNSPTF="+arrHeaderValue[6]+"&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&AFAPNO="+arrHeaderValue[0]+"&UMode="+arrQueryString[9];
			break;
			case "LN_ACC_LN85591"://CGC
				contURL = "view.aspx?VIEW_NAME=LN_ACC_LN85591&keyU_DUMMYPKID=0&LNSPTF="+arrHeaderValue[6]+"&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&AFAPNO="+arrHeaderValue[0]+"&UMode="+arrQueryString[9];
			break;
			//~ case "LN_ACC_LN85307"://Document
				//~ contURL = "list.aspx?PAGE_NAME=LN_ACC_LN85307&keyU_DUMMYPKID=0&LNSPTF="+arrHeaderValue[6]+"&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&AFAPNO="+AFAPNO+"&UMode="+MODEIND;
			//~ break;
			case "LN_ACC_LN85536"://Earmark
				contURL = "list.aspx?PAGE_NAME=LN_ACC_LN85536&keyU_DUMMYPKID=0&LNSPTF="+arrHeaderValue[6]+"&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&AFAPNO="+arrHeaderValue[0]+"&UMode="+arrQueryString[9];
			break;
			case "LN_ACC_LN85599"://Income Distribution
				contURL = "list.aspx?PAGE_NAME=LN_ACC_LN85599&keyU_DUMMYPKID=0&LNSPTF="+arrHeaderValue[6]+"&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&AFAPNO="+arrHeaderValue[0]+"&UMode="+arrQueryString[9];
			break;
			case "LN_ACC_LN85535"://Loan Fees
			// LHL K0002
				contURL = "list.aspx?PAGE_NAME=LN_ACC_LN85535&keyU_DUMMYPKID=0&LNSPTF="+arrHeaderValue[6]+"&LFEACC="+arrQueryString[6]+"&LFEACT="+arrQueryString[8]+"&AFAPNO="+arrHeaderValue[0]+"&RATPC="+arrHeaderValue[29]+"&TYPE="+arrHeaderValue[2]+"&CURTYP="+arrHeaderValue[1]+"&UMode=UPD";
			break;
			case "LN_ACC_LN85511"://Message
				contURL = "list.aspx?PAGE_NAME=LN_ACC_LN85511&keyU_DUMMYPKID=0&LNSPTF="+arrHeaderValue[6]+"&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&AFAPNO="+arrHeaderValue[0]+"&HAVMSG="+HAVMSG+"&UMode="+arrQueryString[9];
			break;
			case "LN_ACC_LN85541"://Collateral Linkage
				contURL = "list.aspx?PAGE_NAME=LN_ACC_LN85541&keyU_DUMMYPKID=0&LNSPTF="+arrHeaderValue[6]+"&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&UMode=UPD";
			break;
			case "BM_ACC_BM86500"://Central Bank Reporting
				contURL = "view.aspx?VIEW_NAME=BM_ACC_BM86500&keyU_DUMMYPKID=0&LNSPTF="+arrHeaderValue[6]+"&BAACCT="+arrQueryString[6]+"&BAACTT="+arrQueryString[8]+"&AFAPNO="+arrHeaderValue[0]+"&UMode="+arrQueryString[9];
			break;
			case "LN_ACC_LN86507"://TDR
				contURL = "view.aspx?VIEW_NAME=LN_ACC_LN86507&keyU_DUMMYPKID=0&LNSPTF="+arrHeaderValue[6]+"&LNDRAC="+arrQueryString[6]+"&LNDRAT="+arrQueryString[8]+"&UMode=UPD";
			break;
			
			case "LN_ACC_LN85304"://hold code
				contURL = "list.aspx?PAGE_NAME=LN_ACC_LN85304&keyU_DUMMYPKID=0&LNSPTF="+arrHeaderValue[6]+"&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&UMode="+arrQueryString[9];
			break;
			case "LN_ACC_LN85830":
				contURL = "view.aspx?VIEW_NAME=LN_ACC_LN85830&LNSPTF="+arrHeaderValue[6]+"&ACCTNO="+arrQueryString[6]+"&UScreen="+arrQueryString[12]+"&TITLE="+arrQueryString[13]+"&UMode=";
			break;
			case "LN_ACC_LN85830_REDP":				
				contURL = "view.aspx?VIEW_NAME=LN_ACC_LN85830_REDP&ACCTNO="+arrQueryString[6]+"&UScreen="+arrQueryString[12]+"&TITLE="+arrQueryString[13]+"&TYPE="+arrHeaderValue[2]+"&CURTYP="+arrHeaderValue[1]+"&UMode=";
			break;
			case "LN_ACC_LN85832":
				contURL = "list.aspx?PAGE_NAME=LN_ACC_LN85832&keyU_DUMMYPKID=0&LNSPTF="+arrHeaderValue[6]+"&ACCTNO="+arrQueryString[6]+"&EFFDT8="+arrQueryString[15]+"&PENCOD="+arrQueryString[16]+"&PMTYPE="+arrQueryString[17]+"&PENPCT="+arrQueryString[18]+"&E1PERS="+arrQueryString[19]+"&E1CTNO="+arrQueryString[20]+"&PRVCHG="+arrQueryString[21]+"&NRMLIN="+arrQueryString[22]+"&CBAL="+arrHeaderValue[8]+"&UScreen="+arrQueryString[12]+"&TITLE="+arrQueryString[13]+"&UMode=INQ";
			break;
			case "LN_ACC_LN85831": //Loan Partial Payoff Inquiry
				contURL =''list.aspx?PAGE_NAME=LN_ACC_LN85831&keyU_DUMMYPKID=0&LNSPTF="+arrHeaderValue[6]+"&ACCTNO=''+arrQueryString[6]+''&LTAMT=''+arrQueryString[23]+''&EFFDT8=''+arrQueryString[15]+''&LATCOD=''+arrQueryString[24]+''&PENCOD=''+arrQueryString[16]+''&INLCOD=''+arrQueryString[25]+''&NRMLIN=''+arrQueryString[22]+''&FUNCOD=''+arrQueryString[26]+''&AMTIND=''+arrQueryString[27]+''&PENPCT=''+arrQueryString[18]+''&PRVCHG=''+arrQueryString[21]+"&CBAL="+arrHeaderValue[8]+''&E1PERS=''+arrQueryString[19]+''&E1CTNO=''+arrQueryString[20]+''&INTIND=''+arrQueryString[28]+"&UScreen="+arrQueryString[12]+"&TITLE="+arrQueryString[13]+''&UMode=INQ''
			break;
			case "LN_ACC_LN85831_VIEW": //Prepayment Inquiry
				contURL =''view.aspx?VIEW_NAME=LN_ACC_LN85831&LNSPTF=''+arrHeaderValue[6]+''&ACCTNO=''+arrQueryString[6]+"&UScreen="+arrQueryString[12]+"&TITLE="+arrQueryString[13]+''&UMode=UPD''
			break;
			case "LN_ACC_LN85307":
				contURL = "list.aspx?PAGE_NAME=LN_ACC_LN85307&FEACCT="+arrQueryString[6]+"&FEACTY="+arrQueryString[8]+"&UScreen="+arrQueryString[12]+"&TITLE="+arrQueryString[13]+"&UMode=UPD";
			break;
			case "LN_ACC_LN85301":
				contURL = "list.aspx?PAGE_NAME=LN_ACC_LN85301&CPMACT="+arrQueryString[6]+"&CPMTYP="+arrQueryString[8]+"&UScreen="+arrQueryString[12]+"&TITLE="+arrQueryString[13]+"&UMode=UPD";
			break;
			//~ case "LN_ACC_LN86825"://Schedule   //old schedule
				//~ contURL = "view.aspx?VIEW_NAME=LN_ACC_LN86825&keyU_DUMMYPKID=0&LNSPTF="+arrHeaderValue[6]+"&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&AFAPNO="+AFAPNO+"&UMode="+MODEIND;
			//~ break;
			//~ case "LN_ACC_LN86825"://Schedule
				//~ contURL = "view.aspx?VIEW_NAME=LN_ACC_LN86825&keyU_DUMMYPKID=0&LNSPTF="+arrHeaderValue[6]+"&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&AFAPNO="+AFAPNO+"&UMode="+MODEIND;
			//~ break;
			case "LN_ACC_LN86825"://Schedule
				var UScreen="";
				UScreen = "SCHEDULE";
				contURL = "view.aspx?VIEW_NAME=LN_ACC_LN83503_TAB&keyU_DUMMYPKID=0&LNSPTF="+arrHeaderValue[6]+"&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&AFAPNO="+arrQueryString[3]+"&INDTitle="+arrQueryString[5]+"&UScreen="+UScreen+"&title="+arrQueryString[13]+"&FRCODE="+arrHeaderValue[23]+"&IPCODE="+arrHeaderValue[24]+"&YBASE="+arrHeaderValue[28]+"&UMode=UPD&IN_IFRAME=TRUE";
			break;
			case "OD_ACC_OD86501":
				var AXSEQ = gsGetQueryString("AXSEQ","");
				var UMode = gsGetQueryString("UMode","");
				var DUAL = gsGetQueryString("DUAL","");
				var b4UMode = gsGetQueryString("b4UMode","");
				//var AFAPNO = gsGetQueryString("AXAPNO","");
                                contURL = "view.aspx?VIEW_NAME=OD_ACC_OD86501&b4UMode="+b4UMode+"&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&AFAPNO="+arrQueryString[3]+"&AXSEQ="+AXSEQ+"&ORGAMT="+arrHeaderValue[15]+"&DRLIMT="+arrHeaderValue[16]+"&CURTYP="+arrHeaderValue[1]+"&Mode="+gsGetQueryString("Mode","")+"&UMode="+UMode+"&DUAL="+DUAL+"&ODQuickUrl=VIEW_NAME[!!EQUAL]LN_ACC_LL86399_HDR[!!AMP]PGIND[!!EQUAL]OD_ACC_OD88501[!!AMP]LNSPTF[!!EQUAL]N[!!AMP]keyU_DUMMYPKID[!!EQUAL]0[!!AMP]UMode[!!EQUAL]"+UMode+"[!!AMP]ACCTNO[!!EQUAL]"+arrQueryString[6]+"[!!AMP]ACTYPE[!!EQUAL]"+arrQueryString[8]+"[!!AMP]AFAPNO[!!EQUAL]"+arrQueryString[3]+"[!!AMP]CURTYP[!!EQUAL]"+arrHeaderValue[1]+"&ODTop=Top&ODDUAL="+arrQueryString[33];				
				if(UMode.toUpperCase() != "DEL") contURL += "&GUIDED=INITIAL";
			break;
			//S6401 Fix by Pruk  (05/07/22)	
			case "LN_ACC_LN82548":
				contURL = "view.aspx?VIEW_NAME=LN_ACC_LN82548&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&UScreen="+UScreen+"&TITLE="+arrQueryString[13]+"&MCLNID="+arrHeaderValue[18]+"&PRDGRP="+arrHeaderValue[22]+"&UMode=UPD";
			break;
			case "LN_ACC_LN85551":
				contURL = "list.aspx?PAGE_NAME=LN_ACC_LN85551&LNSPTF="+arrHeaderValue[6]+"&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&UMode=UPD"+"&strT="+strT;
			break;
			case "LN_ACC_LN86864":
				contURL = "view.aspx?VIEW_NAME=LN_ACC_LN86864&keyU_DUMMYPKID=0&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&UScreen="+arrQueryString[12]+"&TITLE="+arrQueryString[13]+"&UMode=UPD";
			break;
			
			//Kenneth 31 May 2011 - for Customer Ledger Balance
			case "LN_ACC_LN86311":
				code = "LN86311"
				if(gsGetQueryString("UMode","")=="ADD"){
				contURL = "view.aspx?VIEW_NAME=LN_ACC_LN86311&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&UScreen="+arrQueryString[12]+"&TITLE="+arrQueryString[13]+"&UMode=ADD&LEDGERR="+arrQueryString[43];
				}else{
				contURL = "view.aspx?VIEW_NAME=LN_ACC_LN86311&keyU_DUMMYPKID=0&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&UScreen="+arrQueryString[12]+"&TITLE="+arrQueryString[13]+"&UMode=UPD&LEDGERR="+arrQueryString[43];
				}
			break;
			
			//case "LN_ACC_LN86312":
			//	code = "LN86312"
			//	contURL = "view.aspx?VIEW_NAME=LN_ACC_LN86312&keyU_DUMMYPKID=0&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&UScreen="+arrQueryString[12]+"&TITLE=Ledger Balance&UMode=UPD&LEDGERR="+arrQueryString[43];
			case "LN_ACC_LN85318":
				code = "LN85318"
				contURL = "list.aspx?PAGE_NAME=LN_ACC_LN85318&keyU_DUMMYPKID=0&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&UScreen="+arrQueryString[12]+"&TITLE="+arrQueryString[13]+"&LEDGERR="+arrQueryString[43]+"&UMode=UPD";
			break;
			//Kenneth	
			
			// dual control screen ~ start
			//added by Lucas - restructuring & rescheduling maintenance
			case "LN_ACC_LN88545":
			contURL = "view.aspx?VIEW_NAME=LN_ACC_LN86545&keyU_DUMMYPKID=0&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&SCHSTR="+arrQueryString[31]+"&title="+arrQueryString[13]+"&UMode=INQ";
			break;
			//added by Lucas - Alternate Payment Schedule
			case "LN_ACC_LN86516":
			contURL = "view.aspx?VIEW_NAME=LN_ACC_LN85516&keyU_DUMMYPKID=0&SKEY="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&SSEQ="+arrQueryString[32]+"&UMode=INQ";
			break;
			//added by Lucas - Alternate Rate
			case "LN_ACC_LN86515":
			contURL = "view.aspx?VIEW_NAME=LN_ACC_LN85515&keyU_DUMMYPKID=0&AACCT="+arrQueryString[6]+"&AACTYP="+arrQueryString[8]+"&CURTYP="+arrHeaderValue[1]+"&UMode=INQ";
			break;
			//added by Lucas - Term Extension
			case "LN_ACC_LN86540":
			contURL = "view.aspx?VIEW_NAME=LN_ACC_LN86540&keyU_DUMMYPKID=0&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&UMode=INQ";
			break;
			//added by Lucas - Redraw
			case "LN_ACC_LN86860":
			contURL = "view.aspx?VIEW_NAME=LN_ACC_LN86860&keyU_DUMMYPKID=0&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&UMode=INQ";
			break;
			//added by Lucas - Source of Fund
			case "LN_ACC_LN86549":
			contURL = "view.aspx?VIEW_NAME=LN_ACC_LN85549&keyU_DUMMYPKID=0&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&UMode=INQ";
			break;
			//added by Lucas - Related Account
			case "LN_ACC_LN86554":
			contURL = "view.aspx?VIEW_NAME=LN_ACC_LN85554&keyU_DUMMYPKID=0&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&UMode=INQ";
			break;
			//added by Lucas - Central Bank Reporting
			case "LN_ACC_LN86863":
			contURL = "view.aspx?VIEW_NAME=LN_ACC_LN86863&keyU_DUMMYPKID=0&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&UMode=INQ";
			break;
			//added by Lucas - Drawdown Schedule
			case "LN_ACC_LN86513":
			contURL = "view.aspx?VIEW_NAME=LN_ACC_LN85513&keyU_DUMMYPKID=0&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&UMode=INQ";
			break;
			//added by Lucas - Interest Rollover Period
			case "LN_ACC_LN86567":
			contURL = "view.aspx?VIEW_NAME=LN_ACC_LN85567&keyU_DUMMYPKID=0&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&UMode=INQ";
			break;
			//added by Lucas - Message
			case "LN_ACC_LN86511":
			contURL = "view.aspx?VIEW_NAME=LN_ACC_LN85511&keyU_DUMMYPKID=0&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&UMode=INQ";
			break;
			//added by Lucas - Currency
			case "LN_ACC_LN86520":
			contURL = "view.aspx?VIEW_NAME=LN_ACC_LN85520&keyU_DUMMYPKID=0&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&UMode=INQ";
			break;
			//added by Lucas - Currency
			case "LN_ACC_LN86592":
			contURL = "view.aspx?VIEW_NAME=LN_ACC_LN85592&keyU_DUMMYPKID=0&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&UMode=INQ";
			break;
			//added by Lucas - Purpose Code
			case "LN_ACC_LN86592":
			contURL = "view.aspx?VIEW_NAME=LN_ACC_LN85592&keyU_DUMMYPKID=0&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&UMode=INQ";
			break;
			//added by Lucas - Tiered Prepayment
			case "LN_ACC_LN86578":
			contURL = "view.aspx?VIEW_NAME=LN_ACC_LN85578&keyU_DUMMYPKID=0&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&UMode=INQ";
			break;
			//added by Lucas - Link to CASA
			case "LN_ACC_LN85596":
			code = "LN85596"
			contURL = "view.aspx?VIEW_NAME=LN_ACC_LN85596&keyU_DUMMYPKID=0&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&TITLE="+arrQueryString[13]+"&UMode=INQ";
			break;
			//added by Lucas - Promissory Note
			case "LN_ACC_LN85595_PN":
			contURL = "view.aspx?VIEW_NAME=LN_ACC_LN85595_PN&keyU_DUMMYPKID=0&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&TITLE="+arrQueryString[13]+"&UMode=INQ";
			break;
			//added by Lucas - Bill of Exchange
			case "LN_ACC_LN85595_INV":
			contURL = "view.aspx?VIEW_NAME=LN_ACC_LN85595_INV&keyU_DUMMYPKID=0&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&TITLE="+arrQueryString[13]+"&UMode=INQ";
			break;
			//added by Lucas - Cheque
			case "LN_ACC_LN85595_CHQ":
			contURL = "view.aspx?VIEW_NAME=LN_ACC_LN85595_CHQ&keyU_DUMMYPKID=0&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&TITLE="+arrQueryString[13]+"&UMode=INQ";
			break;
			//added by Lucas - Subsidized by 3rd Party
			case "LN_ACC_LN86522":
			contURL = "view.aspx?VIEW_NAME=LN_ACC_LN85522&keyU_DUMMYPKID=0&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&TITLE="+arrQueryString[13]+"&UMode=INQ";
			break;
			//added by Lucas - Rollover Schedule
			case "LN_ACC_LN86519":
			contURL = "view.aspx?VIEW_NAME=LN_ACC_LN85519&keyU_DUMMYPKID=0&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&TITLE="+arrQueryString[13]+"&UMode=INQ";
			break;
			//added by Lucas - Rollover Schedule
			case "LN_ACC_LN86594":
			contURL = "view.aspx?VIEW_NAME=LN_ACC_LN85594&keyU_DUMMYPKID=0&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&TITLE="+arrQueryString[13]+"&UMode=INQ";
			break;
			//added by Lucas - Judgement
			case "LN_ACC_LN86558":
			contURL = "view.aspx?VIEW_NAME=LN_ACC_LN86558&keyU_DUMMYPKID=0&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&TITLE="+arrQueryString[13]+"&UMode=INQ";
			break;
			//added by Lucas - IIS Write Off/Write Back 
			case "LN_ACC_LN86534":
			contURL = "view.aspx?VIEW_NAME=LN_ACC_LN85534&keyU_DUMMYPKID=0&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&TITLE="+arrQueryString[13]+"&UMode=INQ";
			break;
			//added by Lucas - Specific Provision
			case "LN_ACC_LN86518":
			contURL = "view.aspx?VIEW_NAME=LN_ACC_LN86518&keyU_DUMMYPKID=0&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&TITLE="+arrQueryString[13]+"&UMode=INQ";
			break;
			//added by Lucas - Rate Maintenance (Single Tiered)
			case "LN_ACC_LN86858":
			contURL = "view.aspx?VIEW_NAME=LN_ACC_LN86858&keyU_DUMMYPKID=0&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&TITLE="+arrQueryString[13]+"&UMode=INQ";
			break;
			//added by Lucas - Tiered Rate by Amount
			case "LN_ACC_LN86514":
			contURL = "view.aspx?VIEW_NAME=LN_ACC_LN85514&keyU_DUMMYPKID=0&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&TITLE="+arrQueryString[13]+"&CURTYP="+arrHeaderValue[1]+"&UMode=INQ";
			break;
			//added by Lucas - Rate Schedule
			case "LN_ACC_LN86704":
			contURL = "view.aspx?VIEW_NAME=LN_ACC_LN86704&keyU_DUMMYPKID=0&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&TITLE="+arrQueryString[13]+"&CURTYP="+arrHeaderValue[1]+"&UMode=INQ";
			break;
			//added by Lucas - Backdate Rate Change
			case "LN_ACC_LN86530":
			contURL = "view.aspx?VIEW_NAME=LN_ACC_LN86530&keyU_DUMMYPKID=0&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&TITLE="+arrQueryString[13]+"&UMode=INQ";
			break;
			//added by Lucas - Average Bank Rate
			case "LN_ACC_LN86568":
			contURL = "view.aspx?VIEW_NAME=LN_ACC_LN85568&keyU_DUMMYPKID=0&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&TITLE="+arrQueryString[13]+"&UMode=INQ";
			break;
			//added by Lucas - Payment Schedule
			case "LN_ACC_LN88825":
			contURL = "view.aspx?VIEW_NAME=LN_ACC_LN86825&keyU_DUMMYPKID=0&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&TITLE="+arrQueryString[13]+"&UMode=INQ";
			break;
			//added by Lucas - Principal Repayment Schedule
			case "LN_ACC_LN86521":
			contURL = "view.aspx?VIEW_NAME=LN_ACC_LN85521&keyU_DUMMYPKID=0&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&TITLE="+arrQueryString[13]+"&UMode=INQ";
			break;
			//added by Lucas - Payment Billing 
			case "LN_ACC_LN86531":
			contURL = "view.aspx?VIEW_NAME=LN_ACC_LN85531&keyU_DUMMYPKID=0&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&TITLE="+arrQueryString[13]+"&UMode=INQ";
			break;
			case "LN_ACC_LN86551":
			contURL = "view.aspx?VIEW_NAME=LN_ACC_LN86551&keyU_DUMMYPKID=0&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&TITLE="+arrQueryString[13]+"&UMode=INQ";
			break;
			//added by Lucas - Compromised Settlement 
			case "LN_ACC_LN86301":
			contURL = "view.aspx?VIEW_NAME=LN_ACC_LN86301&keyU_DUMMYPKID=0&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&TITLE="+arrQueryString[13]+"&UMode=INQ";
			break;
			//added by Lucas - Compromised Settlement Schedule
			case "LN_ACC_LN86302":
			contURL = "view.aspx?VIEW_NAME=LN_ACC_LN86302&keyU_DUMMYPKID=0&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&TITLE="+arrQueryString[13]+"&UMode=INQ";
			break;
			//added by Lucas - Fee Charge Method/Schedule
			case "LN_ACC_LN86535":
			contURL = "view.aspx?VIEW_NAME=LN_ACC_LN85535&keyU_DUMMYPKID=0&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&TITLE="+arrQueryString[13]+"&UMode=INQ";
			break;
			//added by Lucas - Prepayment Notice
			case "LN_ACC_LN86533":
			contURL = "view.aspx?VIEW_NAME=LN_ACC_LN85533&keyU_DUMMYPKID=0&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&TITLE="+arrQueryString[13]+"&UMode=INQ";
			break;
			//added by Lucas - Write Off 
			case "LN_ACC_LN86548":
			contURL = "view.aspx?VIEW_NAME=LN_ACC_LN86548&keyU_DUMMYPKID=0&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&TITLE="+arrQueryString[13]+"&UMode=INQ";
			break;
			//added by Lucas - Hold Code 
			case "LN_ACC_LN86304":
			contURL = "view.aspx?VIEW_NAME=LN_ACC_LN85304&keyU_DUMMYPKID=0&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&TITLE="+arrQueryString[13]+"&UMode=INQ";
			break;
			case "LN_ACC_LN85305":
			contURL = "list.aspx?PAGE_NAME=LN_ACC_LN85305&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&LNSPTF="+arrHeaderValue[6]+"&TLSAPP=LN&UMode=ADD";
			break;	
			case "DD26930LN":
			contURL = "view.aspx?VIEW_NAME=LN_ACC_DD26930&keyU_DUMMYPKID=0&UMode=INQ&CRACCT="+arrQueryString[34]+"&CRTYPE="+arrQueryString[35]+"&DRACCT="+arrQueryString[36]+"&DRTYPE="+arrQueryString[37]+"&DRSEQ="+arrQueryString[38]+"&STATUS="+arrQueryString[39]+"&Terminate=T";
			break;	
			case "LN_ACC_SS86001":				
			contURL = "view.aspx?VIEW_NAME=LN_ACC_SS86001&UMode=INQ&keyU_DUMMYPKID=0&TRACNO="+arrQueryString[40]+"&TREFD8="+arrQueryString[41]+"&TRBKNO="+arrHeaderValue[4]+"&TRBRNO="+arrHeaderValue[5];
			break;
			// dual control screen ~ end
			case "LN_ACC_CF15246":
			contURL = "view.aspx?VIEW_NAME=LN_ACC_CF15246&UMode=INQ&keyU_DUMMYPKID=0&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8];
			break;
            // Adhoc Billing 
			case "LN_ACC_LN85280":
			contURL = "list.aspx?PAGE_NAME=LN_ACC_LN85280&UMode=INQ&BACCTNOX="+arrQueryString[6];
			break;
			//added by Lucas - Standing Order Waiver (27/06/2012)
			case "LN_ACC_LN85322":
			contURL = "list.aspx?PAGE_NAME=LN_ACC_LN85322&keyU_DUMMYPKID=0&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&TITLE="+arrQueryString[13]+"&UMode=UPD";
			break;
			//T1001 added by Patsakorn - Maintenance -Taxable Interest Monitoring Date(26/03/2013)
			case "LN_ACC_LN86829":
			contURL = "view.aspx?VIEW_NAME=LN_ACC_LN86829&keyU_DUMMYPKID=0&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&TITLE="+arrQueryString[13]+"&UMode=UPD";
			break; //End T1001
			//T1002 Added by Sasinan - Maintenance - Original amount and Drawing Limit amount (09/09/2013)
			case "LN_ACC_LN86831":
			contURL = "view.aspx?VIEW_NAME=LN_ACC_LN86831&keyU_DUMMYPKID=0&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&TITLE="+arrQueryString[13]+"&UMode=UPD";
			break;
			//End T1002
			//T1003
			case "LN_ACC_LN86919":
			contURL = "view.aspx?VIEW_NAME=LN_ACC_LN86919&keyU_DUMMYPKID=0&ACCTNO="+arrQueryString[6]+"&IDXOAC="+arrQueryString[44]+"&IDXNAC="+arrQueryString[45]+"&TITLE="+arrQueryString[13]+"&UMode=UPD";
			break;
			//END T1003
			//T1004 Added by Sasinan - Maintenance - Stamc Account Date (21/10/2013)
			case "LN_ACC_LN86817":
			contURL = "view.aspx?VIEW_NAME=LN_ACC_LN86817&keyU_DUMMYPKID=0&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&TITLE="+arrQueryString[13]+"&UMode=UPD";
			break;
			//End T1004	
			//G001 added by Patsakorn - Standing Order Waiver (27/06/2012)
			case "LN_ACC_LN85324":
			contURL = "list.aspx?PAGE_NAME=LN_ACC_LN85324&keyU_DUMMYPKID=0&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&TITLE="+arrQueryString[13]+"&UMode=UPD";
			break;	
                                          //K0001 added by Sarawut - Discounted Rollover Simulater (27/07/17)
            case "LN_ACC_LN84700":				
			contURL = "view.aspx?VIEW_NAME=LN_ACC_LN84700&keyU_DUMMYPKID=0&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&UScreen="+arrQueryString[12]+"&TITLE="+arrQueryString[13]+"&TYPE="+arrHeaderValue[2]+"&CURTYP="+arrHeaderValue[1]+"&UMode=UPD";
			break;
			
			                              //K0003 added by Golf - Vehicle from car Status (03/10/17)
			case "LN_ACC_LN86868_FP":				
			contURL = "view.aspx?VIEW_NAME=LN_ACC_LN86868_FP&keyU_DUMMYPKID=0&LIACCT="+arrQueryString[6]+"&LIATYP="+arrQueryString[8]+"&UScreen="+arrQueryString[12]+"&TITLE="+arrQueryString[13]+"&TYPE="+arrHeaderValue[2]+"&CURTYP="+arrHeaderValue[1]+"&UMode=INQ";
			break;	

			//K0003 added by Golf  (15/07/19)
			case "LN_ACC_LN86892":				
			contURL = "view.aspx?VIEW_NAME=LN_ACC_LN86892&keyU_DUMMYPKID=0&LNIACC="+arrQueryString[6]+"&LNITYP="+arrQueryString[8]+"&UScreen="+arrQueryString[12]+"&TITLE="+arrQueryString[13]+"&TYPE="+arrHeaderValue[2]+"&UMode=INQ";
			break;
			
			case "LN_ACC_LN86893":				
			contURL = "view.aspx?VIEW_NAME=LN_ACC_LN86893&keyU_DUMMYPKID=0&LNIACC="+arrQueryString[6]+"&LNITYP="+arrQueryString[8]+"&UScreen="+arrQueryString[12]+"&TITLE="+arrQueryString[13]+"&TYPE="+arrHeaderValue[2]+"&UMode=INQ";
			break;

			//K0004 added by JJay  (18/12/19)
			case "LN_ACC_LN86895_Collection_INQ":				
			contURL = "view.aspx?VIEW_NAME=LN_ACC_LN86895_Collection_INQ&keyU_DUMMYPKID=0&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&UScreen="+arrQueryString[12]+"&TITLE="+arrQueryString[13]+"&TYPE="+arrHeaderValue[2]+"&CIFNO="+cifno+"&CFCIFN="+cifno+"&UMode=INQ";
			break;
			
			//K6401 added by JJay  (20/10/21)			
			case "LN_ACC_LN85886":
			contURL = "view.aspx?VIEW_NAME=LN_ACC_LN85886&LNSPTF="+arrHeaderValue[6]+"&ACCTNO="+arrQueryString[6]+"&UScreen="+arrQueryString[12]+"&TITLE="+arrQueryString[13]+"&UMode=";
			break;
			
			//K6401 added by JJay  (22/10/21)			
			case "LN_ACC_LN85888":
			contURL = "view.aspx?VIEW_NAME=LN_ACC_LN85888&LNSPTF="+arrHeaderValue[6]+"&ACCTNO="+arrQueryString[6]+"&UScreen="+arrQueryString[12]+"&TITLE="+arrQueryString[13]+"&UMode=";
			break;
	                                         		

			//K6401 added by Ploy  (30/10/21)			
			case "LN_ACC_LN86960_INQ":
			contURL = "view.aspx?VIEW_NAME=LN_ACC_LN86960_INQ&keyU_DUMMYPKID=0&LNSPTF="+arrHeaderValue[6]+"&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&UScreen="+arrQueryString[12]+"&TITLE="+arrQueryString[13]+"&UMode=UPD";
			break;
			//K8471 added by JJAY  (05/08/22)			
			case "LN_ACC_LN85968":
			contURL = "list.aspx?PAGE_NAME=LN_ACC_LN85968&keyU_DUMMYPKID=0&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&TITLE="+arrQueryString[13]+"&UMode=UPD";
			break;
			//K8471 added by SONGKRAN  (10/08/22)
			case "LN_ACC_LN85967":
			contURL = "list.aspx?PAGE_NAME=LN_ACC_LN85967&keyU_DUMMYPKID=0&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&TITLE="+arrQueryString[13]+"&UMode=UPD";
			break;
			//K9985 added by Pruk  (15/08/22)
			//K9985 added by Pruk  (29/11/22)
			case "LN_ACC_LN85909":
			contURL = "list.aspx?PAGE_NAME=LN_ACC_LN85909&keyU_DUMMYPKID=0&ACCTNO="+arrQueryString[6]+"&ACTYPE="+arrQueryString[8]+"&TITLE="+arrQueryString[13]+"&MCLNID="+arrHeaderValue[18]+"&PRDGRP="+arrHeaderValue[22]+"&PWOFID="+arrHeaderValue[30]+"&PWOAP8="+arrHeaderValue[31]+"&UMode=UPD";
			break;
			
			default:
				alert("Page " + arrQueryString[0] + " Not Found.\n System is not able to navigate to the related screen.")
			break;
			}
			//modify for dual control by Raymond 24/06/2011
			if(gsGetQueryString("DUAL","")=="TRUE")
			{
				if(contURL.toUpperCase().indexOf("&UMODE=INQ")==-1) 	
				{
					if(contURL.toUpperCase().indexOf("&UMODE=")!=-1)
					{						
						var subUModeURL = contURL.split("&UMode=");
						var UMode = subUModeURL[1].split("&")[0];
						contURL = contURL.replace("&UMode="+UMode,"&UMode=INQ");
					}
					else
					{
						contURL = contURL + "&UMode=INQ";
					}
				}
				var arrDualQueryString = ["CHFSEQ","CHAPCD","CHFCID","CHMND8"];
				for(var x=0;x<arrDualQueryString.length;x++){
				if(gsGetQueryString(arrDualQueryString[x], "") != undefined) 
				arrDualQueryString[x] = gsGetQueryString(arrDualQueryString[x], "");
				}
				
				contURL = contURL+ "&DUAL=TRUE&CHFSEQ=" + arrDualQueryString[0]+"&CHAPCD="+ arrDualQueryString[1]+"&CHFCID="+arrDualQueryString[2]+"&CHMND8="+arrDualQueryString[3];
			}
			//end modify by Raymond 24/06/2011
			// eval(gsSScript2(''5d32f737-c1d0-4637-83b9-e7fe2c6a27ea'',''&code=''+code+''&condition=T&field=viewTitle''));
			if(document.getElementById(''ctnDetails'') != null) ctnDetails.location.href = contURL;
	}
	else
		ctnDetails.location.href = ''list.aspx?PAGE_NAME=Blank'';
}', N'0.1', '2554-04-21 10:13:55.780', '2022-11-30 10:49:41.710', N'JS', N'N', N'0', null, N'2364b04d-72d6-453c-b751-d534c20e44c3')
                                           end
                                        commit tran

  COMMIT
PRINT 'Import completed successfully'
  BREAK
END
