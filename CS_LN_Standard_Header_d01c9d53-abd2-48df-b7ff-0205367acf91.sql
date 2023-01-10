BEGIN TRANSACTION
WHILE 1=1
BEGIN
  -- Insert scripts
begin tran
                                           UPDATE S_SERVER_SCRIPT SET SCRIPT_ID=N'd01c9d53-abd2-48df-b7ff-0205367acf91', INT_ID=null, SCRIPT_AREA=N'8', SCRIPT_NAME=N'CS_LN_Standard_Header', SHORT_DESC=N'CS_LN_Standard_Header', DESCRIPTION=N'CS_LN_Standard_Header', CODE=N'FUNCTION CS_LN_Standard_Header

dim XMLHeader, XMLInqData,crossCountryFlag,GlobalFlag,buffer1,buffer2,buffer3,buffer4,buffer5,buffer6
dim rMSGLIN,arrMSGLIN,tMSGLIN,xfield
dim title
dim strLGCODE	''G001 13092016
strLGCODE = scb.objSession("LANGUAGE_CODE")	''G001 13092016


title = scb.objRequest.queryString("TITLE")

XMLHeader = "LN86803"
scb.objSession("errMsg")=""
dim ACCTNO,ACTYPE,MODTYP

MODTYP=scb.objRequest.queryString("MODTYP")

IF MODTYP = "D" THEN
ACCTNO=scb.objRequest.queryString("CRACCT")
ACTYPE=scb.objRequest.queryString("CRTYPE")
ELSE
ACCTNO=scb.objRequest.queryString("ACCTNO")
ACTYPE=scb.objRequest.queryString("ACTYPE")
END IF
 
XMLInqData = "<ACCTNO>"&ACCTNO&"</ACCTNO>"
XMLInqData =XMLInqData & "<ACTYPE>"&ACTYPE&"</ACTYPE>"

scb.loadServerScript("5f74a9a3-9a50-4b35-83d4-9f2f54057ddf")

IF ACCTNO <> "" THEN
	
	call gsInquiryFromHost(XMLHeader, XMLInqData, "VIEW", crossCountryFlag,GlobalFlag,buffer1,buffer2,buffer3,buffer4,buffer5,buffer6)
	set Records = scb.dataRs

	If scb.Rs("HDRIND") = "AA" Then
		
		dim sSQL1,sSQL2,sSQL3,tempRsCurrency,tempRsID,rCURTYP,rCFSSCD,rLKSHDS,rLIVPRV

		sSQL3 = "SELECT WDKEY2,WDDS01 FROM PR_WDFILE WHERE WDKEY2=''"&Records.fields("LIVPRV")&"'' AND WDFILE=''SSSTAT'' AND WDCOUN = ''"&scb.objSession("CountryCode")&"'' AND WDLANG = ''"&scb.objSession("LANGUAGE_CODE")&"'' ORDER BY WDKEY1"
		Set tempRsID = SCB.ExecuteQuery(sSQL3)
		if tempRsID.recordCount > 0 then 
			rLIVPRV = tempRsID(1)
		else
			rLIVPRV = ""
		end if


		if scb.objSession("VIEWTYPE") <> "" then
			scb.addOutput "<script type=''text/javascript''>var SFTLOGKEY = ''" & scb.rs("SFTLOGKEY") & "'';</script>" 
		else
			scb.addOutput "<script type=''text/javascript''>var SFTLOGKEY = '''';</script>" 
		end if
		
		''currency description
		sSQL1 = "SELECT WDKEY1,WDDS01 FROM PR_WDFILE WHERE WDKEY1=''"&Records.fields("CURTYP")&"'' AND WDFILE=''SSFXRP'' AND WDCOUN = ''"&scb.objSession("CountryCode")&"'' AND WDLANG = ''"&scb.objSession("LANGUAGE_CODE")&"'' ORDER BY WDKEY1"
		Set tempRsCurrency = SCB.ExecuteQuery(sSQL1)
		if tempRsCurrency.recordCount > 0 then 
			rCURTYP = tempRsCurrency(1)
		else
			rCURTYP = ""
		end if
		
		''ID Type Description
		sSQL2 = "SELECT WDKEY1,WDDS01 FROM PR_WDFILE WHERE WDKEY1=''"&Records.fields("CFSSCD")&"'' AND WDFILE=''CFPAR3'' AND WDCOUN = ''"&scb.objSession("CountryCode")&"'' AND WDLANG = ''"&scb.objSession("LANGUAGE_CODE")&"'' ORDER BY WDKEY1"
		Set tempRsID = SCB.ExecuteQuery(sSQL2)
		if tempRsID.recordCount > 0 then 
			rCFSSCD = tempRsID(1)
		else
			rCFSSCD = ""
		end if
		
		''RB Description
		sSQL2 = "SELECT WDKEY1,WDDS01 FROM PR_WDFILE WHERE WDKEY1=''"&Records.fields("RBRN")&"'' AND WDFILE=''SSDATA'' AND WDCOUN = ''"&scb.objSession("CountryCode")&"'' AND WDLANG = ''"&scb.objSession("LANGUAGE_CODE")&"'' ORDER BY WDKEY1"
		Set tempRsID = SCB.ExecuteQuery(sSQL2)
		if tempRsID.recordCount > 0 then 
			rRBRN = tempRsID(1)
		else
			rRBRN = ""
		end if		
		
		''Facility Code Description
		sSQL2 = "SELECT WDKEY1,WDDS01 FROM PR_WDFILE WHERE WDKEY1=''"&Records.fields("AXFCDE")&"'' AND WDFILE=''LLPARK'' AND WDCOUN = ''"&scb.objSession("CountryCode")&"'' AND WDLANG = ''"&scb.objSession("LANGUAGE_CODE")&"'' ORDER BY WDKEY1"
		Set tempRsID = SCB.ExecuteQuery(sSQL2)
		if tempRsID.recordCount > 0 then 
			rLKSHDS = tempRsID(1)
		else
			rLKSHDS = ""
		end if
		
		rMSGLIN = Records.fields("MSGLIN")
		arrMSGLIN = Split(rMSGLIN,"|",-1,1)
		tMSGLIN=""
		for each xfield in arrMSGLIN
			if tMSGLIN = "" then
				tMSGLIN = xfield
			else
				tMSGLIN = tMSGLIN&vbCrLf&xfield
			end if
		next
		
		SCB.addOutput("<div id=''tabGLOBAL''><table id=mainTable_Header width=100% cellspacing=0 cellpadding=0 border=0>")
		SCB.addOutput("<td width=100% id=advancedName>")
		''table start
		SCB.addOutput("<table class=headerTable id=header width=100% cellspacing=0 cellpadding=0 border=0>")
		SCB.addOutput("<tr>")
		SCB.addOutput("<td colspan=4 ><span id=viewTitle class=spanView>"&Records.fields("ACCTNO")&"<br>"&Records.fields("NA1")&"<br>"&Records.fields("NA1A")&"</span></td>")
		SCB.addOutput("</tr>")
		''row 1 of name
		SCB.addOutput("<tr>")
		SCB.addOutput("<td class=rfield2a nowrap><span id=NA2 class=spanView>"&Records.fields("NA2")&"</span><span class=spanView style=''display:none;''>"&" /"&"</span><span id=MCLNID class=spanView style=''display:none;''>"&Records.fields("MCLNID")&"</span><span id=PARTID class=spanView style=''display:none;''>"&Records.fields("PARTID")&"</span></td>")
		''G001 13092016 ''SCB.addOutput("<td class=lfield2a nowrap>Product Type / Currency / Campaign Code</td>")
		''G001 13092016
		If strLGCODE = "EN" then
		SCB.addOutput("<td class=lfield2a nowrap>Product Type / Currency / Campaign Code</td>")
		Else
		SCB.addOutput("<td class=lfield2a nowrap>ประเภทผลิตภัณฑ์ / สกุลเงิน / รหัสแคมเปญ</td>")
		End If
		''G001 13092016
		SCB.addOutput("<td class=rfield2a nowrap><span id=ACCTNO class=spanView style=''display:none;''>"&Records.fields("ACCTNO")&"</span><span class=spanView style=''display:none;''>"&" /"&"</span><span id=APTYPE class=spanView style=''display:none;''>"&Records.fields("APTYPE")&"</span><span class=spanView style=''display:none;''>"&" /"&"</span><span id=TYPE class=spanView>"&Records.fields("TYPE")&"</span><span class=spanView>"&" -"&"</span><span id=PTYDSC class=spanView>"&Records.fields("PTYDSC")&"</span><span class=spanView>"&" /"&"</span><span id=CURTYP class=spanView>"&Records.fields("CURTYP")&"</span><span class=spanView>"&" -"&"</span><span id=rCURTYP class=spanView>"&rCURTYP&"</span><span class=spanView>"&" /"&"</span><span id=RATPC class=spanView>"&Records.fields("RATPC")&"</span></td>")
		SCB.addOutput("<td class=lfield2a rowspan=11 nowrap''><textarea id=MSGLIN readonly=true rows=11 cols=50  style=''color:red; font-weight:bold; background-color:transparent''>"&tMSGLIN&"</textarea></td>")
		SCB.addOutput("</tr>")
		''row 2 of name	
		SCB.addOutput("<tr>")
		SCB.addOutput("<td class=rfield2a nowrap><span id=NA3 class=spanView>"&Records.fields("NA3")&"</span></td>")
		''G001 13092016 ''SCB.addOutput("<td class=lfield2a nowrap>AA No / Facility ID</td>")
		''G001 13092016
		If strLGCODE = "EN" then
		SCB.addOutput("<td class=lfield2a nowrap>AA No / Facility ID</td>")
		Else
		SCB.addOutput("<td class=lfield2a nowrap>เลขที่ใบคำขอ / เลขที่วงเงิน</td>")
		End If
		''G001 13092016
		SCB.addOutput("<td class=rfield2a nowrap><span id=AFACCN class=spanView>"&Records.fields("AFACCN")&"</span><span class=spanView style=''display:none;''>"&" /"&"</span><span id=AXCPNO class=spanView style=''display:none;''>"&Records.fields("AXCPNO")&"</span><span class=spanView>"&" /"&"</span><span id=AANO class=spanView>"&Records.fields("AANO")&"</span></td>")
		SCB.addOutput("</tr>")
		''row 3 of name	
		SCB.addOutput("<tr>")
		SCB.addOutput("<td class=rfield2a nowrap><span id=NA4 class=spanView>"&Records.fields("NA4")&"</span></td>")
		''G001 13092016 ''SCB.addOutput("<td class=lfield2a nowrap>Facility Code</td>")
		''G001 13092016
		If strLGCODE = "EN" then
		SCB.addOutput("<td class=lfield2a nowrap>Facility Code</td>")
		Else
		SCB.addOutput("<td class=lfield2a nowrap>รหัสวงเงิน</td>")
		End If
		''G001 13092016
		SCB.addOutput("<td class=rfield2a nowrap><span id=AXFCDE class=spanView>"&Records.fields("AXFCDE")&"</span><span class=spanView>"&" - "&"</span><span id=rLKSHDS class=spanView>"&rLKSHDS&"</span></td>")
		SCB.addOutput("</tr>")
		''row 4 of name	
		SCB.addOutput("<tr>")
		SCB.addOutput("<td class=rfield2a nowrap><span id=NA5 class=spanView>"&Records.fields("NA5")&"</span></td>")
		''G001 13092016 ''SCB.addOutput("<td class=lfield2a nowrap>Bank / Branch</td>")
		''G001 13092016
		If strLGCODE = "EN" then
		SCB.addOutput("<td class=lfield2a nowrap>Bank / Branch</td>")
		Else
		SCB.addOutput("<td class=lfield2a nowrap>ธนาคาร / สาขา</td>")
		End If
		''G001 13092016
		SCB.addOutput("<td class=rfield2a nowrap><span id=BKN class=spanView>"&Records.fields("BKN")&"</span><span class=spanView>"&" -"&"</span><span id=BKNAME class=spanView>"&Records.fields("BKNAME")&"</span><span class=spanView>"&" /"&"</span><span id=BRN class=spanView>"&Records.fields("BRN")&"</span><span class=spanView>"&" -"&"</span><span id=BRNAME class=spanView>"&Records.fields("BRNAME")&"</span></td>")
		SCB.addOutput("</tr>")
		''row 5 of name	
		SCB.addOutput("<tr>")
		SCB.addOutput("<td class=rfield2a nowrap><span id=NA6 class=spanView>"&Records.fields("NA6")&"</span></td>")
		''G001 13092016 ''SCB.addOutput("<td class=lfield2a nowrap>Reporting Branch</td>")
		''G001 13092016
		If strLGCODE = "EN" then
		SCB.addOutput("<td class=lfield2a nowrap>Reporting Branch</td>")
		Else
		SCB.addOutput("<td class=lfield2a nowrap>รายงานสาขา</td>")
		End If
		''G001 13092016
		SCB.addOutput("<td class=rfield2a2 nowrap><span id=RBRN class=spanView>"&Records.fields("RBRN")&"</span><span class=spanView>"&" -"&"</span><span id=RBNAME class=spanView>"&Records.fields("RBNAME")&"</span><span id=AFAPNO class=spanView style=''display:none;''>"&Records.fields("AANO")&"</span></td>")
		SCB.addOutput("</tr>")

		''row 5 of name	
		SCB.addOutput("<tr>")
		SCB.addOutput("<td class=rfield2a nowrap><span id=NA7 class=spanView>"&Records.fields("NA7")&"</span></td>")
		''G001 13092016 ''SCB.addOutput("<td class=lfield2a nowrap>ID Type / ID Number</td>")
		''G001 13092016
		If strLGCODE = "EN" then
		SCB.addOutput("<td class=lfield2a nowrap>ID Type / ID Number</td>")
		Else
		SCB.addOutput("<td class=lfield2a nowrap>ประเภทบัตร / เลขที่บัตร</td>")
		End If
		''G001 13092016		
		SCB.addOutput("<td class=rfield2a nowrap><span id=CFSSCD class=spanView>"&Records.fields("CFSSCD")&"</span><span class=spanView>"&" -"&"</span><span id=rCFSSCD class=spanView>"&rCFSSCD&"</span><span class=spanView>"&" /"&"</span><span id=CFSSNO class=spanView>"&Records.fields("CFSSNO")&"</span></td>")
		SCB.addOutput("</tr>")
		''row 6 of name		
		SCB.addOutput("<tr>")
		SCB.addOutput("<td class=rfield2a nowrap><span id=NA8 class=spanView>"&Records.fields("NA8")&"</span></td>")
		''G001 13092016 ''SCB.addOutput("<td class=lfield2a nowrap>Customer Number / Entity Number</td>")
		''G001 13092016
		If strLGCODE = "EN" then
		SCB.addOutput("<td class=lfield2a nowrap>Customer Number / Entity Number</td>")
		Else
		SCB.addOutput("<td class=lfield2a nowrap>เลขที่ลูกค้า / Entity Number</td>")
		End If
		''G001 13092016			
		SCB.addOutput("<td class=rfield2a2 nowrap><span id=CIFNO class=spanView>"&Records.fields("CIFNO")&"</span><span class=spanView>"&" /"&"</span><span id=CFENTN class=spanView>"&Records.fields("CFENTN")&"</span><span class=spanView style=''display:none;''>"&" /"&"</span><span id=PRDGRP class=spanView style=''display:none;''>"&Records.fields("PRDGRP")&"</span></td>")
		SCB.addOutput("</tr>")
		''row 7 of name	
		SCB.addOutput("<tr>")
		SCB.addOutput("<td class=rfield2a nowrap>&nbsp</td>")
		''G001 13092016 ''SCB.addOutput("<td class=lfield2a nowrap>Relationship Manager Code</td>")
		''G001 13092016
		If strLGCODE = "EN" then
		SCB.addOutput("<td class=lfield2a nowrap>Relationship Manager Code</td>")
		Else
		SCB.addOutput("<td class=lfield2a nowrap>รหัสผู้ดูแลบัญชี</td>")
		End If
		''G001 13092016			
		SCB.addOutput("<td class=rfield2a2 nowrap><span id=OFFCR class=spanView>"&Records.fields("OFFCR")&"</span><span class=spanView>"&" -"&"</span><span id=OFNAME class=spanView>"&Records.fields("OFNAME")&"</span></td>")
		SCB.addOutput("</tr>")
		''row 8 of name		
		SCB.addOutput("<tr >")
		SCB.addOutput("<td class=rfield2a nowrap>&nbsp</td>")
		''G001 13092016 ''SCB.addOutput("<td class=lfield2a nowrap>Customer Seqment / SBU</td>")
		''G001 13092016
		If strLGCODE = "EN" then
		SCB.addOutput("<td class=lfield2a nowrap>Customer Seqment / SBU</td>")
		Else
		SCB.addOutput("<td class=lfield2a nowrap>Customer Seqment / รหัสหน่วยงานเชิงธุรกิจ</td>")
		End If
		''G001 13092016		
		SCB.addOutput("<td class=rfield2a2 nowrap><span id=CFSEGC class=spanView>"&Records.fields("CFSEGC")&"</span><span class=spanView>"&" -"&"</span><span id=SGNAME class=spanView>"&Records.fields("SGNAME")&"</span><span class=spanView>"&" /"&"</span><span id=SBUCOD class=spanView>"&Records.fields("SBUCOD")&"</span><span class=spanView>"&" -"&"</span><span id=SBNAME class=spanView>"&Records.fields("SBNAME")&"</span></td>")
		SCB.addOutput("</tr>")
		''row 9 of name		
		SCB.addOutput("<tr >")
		SCB.addOutput("<td class=rfield2a nowrap>&nbsp</td>")
		''G001 13092016 ''SCB.addOutput("<td class=lfield2a nowrap>Specialized Lending Indicator</td>")
		''G001 13092016
		If strLGCODE = "EN" then
		SCB.addOutput("<td class=lfield2a nowrap>Specialized Lending Indicator</td>")
		Else
		SCB.addOutput("<td class=lfield2a nowrap>Specialized Lending Indicator</td>")
		End If
		''G001 13092016			
		SCB.addOutput("<td class=rfield2a2 nowrap><span id=AFFSLI class=spanView>"&Records.fields("AFFSLI")&"</span><span class=spanView>"&" -"&"</span><span id=SLNAME class=spanView>"&Records.fields("SLNAME")&"</span><span id=IPCODE class=spanView style=''display:none;''>"&Records.fields("IPCODE")&"</span><span id=MULTIR class=spanView style=''display:none;''>"&Records.fields("MULTIR")&"</span></td>")
		SCB.addOutput("</tr>")
		''row 10 of name		
		If Records.fields("PSYNLN") = "Y" Then
		SCB.addOutput("<tr >")
		SCB.addOutput("<td class=rfield2a nowrap>&nbsp</td>")
		SCB.addOutput("<td class=lfield2a nowrap>Lender Name</td>")
		SCB.addOutput("<td class=rfield2a2 nowrap><span id=LPLSNM class=spanView>"&Records.fields("LPLSNM")&"</span><span id=FRCODE class=spanView style=''display:none;''>"&Records.fields("FRCODE")&"</span></td>")
		SCB.addOutput("</tr>")
		End IF


		''KK001 by GOLF ADD 2 FIELDS LIPICN,LIVPRV''
		''row 11 of name''
		if Records.fields("LIRTYP") = "CD" THEN
		SCB.addOutput("<tr >")
		SCB.addOutput("<td class=rfield2a nowrap>&nbsp</td>")
		SCB.addOutput("<td class=lfield2a nowrap>Card reference number</td>")
		SCB.addOutput("<td class=rfield2a nowrap><span id=LIPICN class=spanView>"&Records.fields("LIPICN")&"</span></td>")
		SCB.addOutput("</tr>")
		elseif Records.fields("LIRTYP") = "FP" THEN
		SCB.addOutput("<tr >")
		SCB.addOutput("<td class=rfield2a nowrap>&nbsp</td>")
		SCB.addOutput("<td class=lfield2a nowrap>Vehicle</td>")
		SCB.addOutput("<td class=rfield2a nowrap><span id=LIVPRV class=spanView>"&Records.fields("LIVPRV")&"</span><span class=spanView>"&" -"&"</span><span id=rLIVPRV class=spanView>"&rLIVPRV&"</span></td>")
		SCB.addOutput("</tr >")
		End IF
		''End KK001''


		''row 11 of name		
		SCB.addOutput("<tr >")
		SCB.addOutput("<td class=rfield2a nowrap><span id=CBAL class=spanView style=''display:none;''>"&Records.fields("CBAL")&"</span><span class=spanView style=''display:none;''>"&" /"&"</span><span id=INTDUE class=spanView style=''display:none;''>"&Records.fields("INTDUE")&"</span><span class=spanView style=''display:none;''>"&" /"&"</span><span id=LCDUE class=spanView style=''display:none;''>"&Records.fields("LCDUE")&"</span><span class=spanView style=''display:none;''>"&" /"&"</span><span id=CFDUE class=spanView style=''display:none;''>"&Records.fields("CFDUE")&"</span><span class=spanView style=''display:none;''>"&" /"&"</span><span id=OTHCHG class=spanView style=''display:none;''>"&Records.fields("OTHCHG")&"</span><span class=spanView style=''display:none;''>"&" /"&"</span><span id=PWOFID class=spanView style=''display:none;''>"&Records.fields("PWOFID")&"</span><span id=PWOAP8 class=spanView style=''display:none;''>"&Records.fields("PWOAP8")&"</span><span id=FRCODE class=spanView style=''display:none;''>"&Records.fields("FRCODE")&"</span></td>")
		SCB.addOutput("<td class=lfield2a nowrap></td>")
		SCB.addOutput("<td class=lfield2a2 nowrap><span id=MISCD class=spanView style=''display:none;''>"&Records.fields("MISCD")&"</span><span class=spanView style=''display:none;''>"&" /"&"</span><span id=SNAME class=spanView style=''display:none;''>"&Records.fields("SNAME")&"</span><span class=spanView style=''display:none;''>"&" /"&"</span><span id=ORGAMT class=spanView style=''display:none;''>"&Records.fields("ORGAMT")&"</span><span class=spanView style=''display:none;''>"&" /"&"</span><span id=DRLIMT class=spanView style=''display:none;''>"&Records.fields("DRLIMT")&"</span><span class=spanView style=''display:none;''>"&" /"&"</span><span id=LNSPTF class=spanView style=''display:none;''>"&Records.fields("LNSPTF")&"</span><span id=PRDGRP class=spanView style=''display:none;''>"&Records.fields("PRDGRP")&"</span><span id=IBASE class=spanView style=''display:none;''>"&Records.fields("IBASE")&"</span><span id=ERROR class=spanView style=''display:none;''></span></td>")
		SCB.addOutput("</tr>")
		
		''row 12 for hidden field
		SCB.addOutput("<tr >")	
		SCB.addOutput("<td class=rfield2a nowrap><span id=HAVMSG class=spanView style=''display:none;''>"&Records.fields("HAVMSG")&"</span></td>")
		SCB.addOutput("<td class=lfield2a nowrap><span id=PAUTDB class=spanView style=''display:none;''>"&Records.fields("PAUTDB")&"</span></td>")
		SCB.addOutput("<td class=lfield2a nowrap><span id=YBASE class=spanView style=''display:none;''>"&Records.fields("YBASE")&"</span></td>")
		SCB.addOutput("<td class=lfield2a nowrap><span id=LONGRP class=spanView style=''display:none;''>"&Records.fields("LONGRP")&"</span></td>")
		''SCB.addOutput("<td class=lfield2a nowrap></td>")
		SCB.addOutput("</tr>")		
		SCB.addOutput("</table></td>")
		SCB.addOutput("</tr></table></div>") 
	Else
		''~ SCB.addOutput("<table width=100% height=100px><tr><td class=rfield2b nowrap>LN86803:No Records Found.</td></tr></table>")
		SCB.addOutput("<table width=100% height=100px><tr><td class=rfield2b nowrap><span id=ERROR class=spanView>"&scb.Rs("ERRDES")&"</span></td></tr></table>")
		scb.objSession("errMsg")=""
		scb.objSession("strErr")=""
	End If
END IF

scb.objSession("VIEWTYPE") = ""

END FUNCTION', DATE_CREATED='2554-03-29 11:04:33.673', DATE_MODIFIED='2022-11-30 10:48:55.053', FUNCTION_NAME=N'CS_LN_Standard_Header', OBJECT_ID=null, OBJECT_TYPE=null, SCRIPT_TYPE=N'0', SCRIPT_LANGUAGE=N'372', CREATED_BY=null, MODIFIED_BY=N'2364b04d-72d6-453c-b751-d534c20e44c3' WHERE SCRIPT_ID = 'd01c9d53-abd2-48df-b7ff-0205367acf91'

                                           if @@rowcount = 0
                                           begin
                                                  INSERT INTO S_SERVER_SCRIPT(SCRIPT_ID, INT_ID, SCRIPT_AREA, SCRIPT_NAME, SHORT_DESC, DESCRIPTION, CODE, DATE_CREATED, DATE_MODIFIED, FUNCTION_NAME, OBJECT_ID, OBJECT_TYPE, SCRIPT_TYPE, SCRIPT_LANGUAGE, CREATED_BY, MODIFIED_BY) VALUES(N'd01c9d53-abd2-48df-b7ff-0205367acf91', null, N'8', N'CS_LN_Standard_Header', N'CS_LN_Standard_Header', N'CS_LN_Standard_Header', N'FUNCTION CS_LN_Standard_Header

dim XMLHeader, XMLInqData,crossCountryFlag,GlobalFlag,buffer1,buffer2,buffer3,buffer4,buffer5,buffer6
dim rMSGLIN,arrMSGLIN,tMSGLIN,xfield
dim title
dim strLGCODE	''G001 13092016
strLGCODE = scb.objSession("LANGUAGE_CODE")	''G001 13092016


title = scb.objRequest.queryString("TITLE")

XMLHeader = "LN86803"
scb.objSession("errMsg")=""
dim ACCTNO,ACTYPE,MODTYP

MODTYP=scb.objRequest.queryString("MODTYP")

IF MODTYP = "D" THEN
ACCTNO=scb.objRequest.queryString("CRACCT")
ACTYPE=scb.objRequest.queryString("CRTYPE")
ELSE
ACCTNO=scb.objRequest.queryString("ACCTNO")
ACTYPE=scb.objRequest.queryString("ACTYPE")
END IF
 
XMLInqData = "<ACCTNO>"&ACCTNO&"</ACCTNO>"
XMLInqData =XMLInqData & "<ACTYPE>"&ACTYPE&"</ACTYPE>"

scb.loadServerScript("5f74a9a3-9a50-4b35-83d4-9f2f54057ddf")

IF ACCTNO <> "" THEN
	
	call gsInquiryFromHost(XMLHeader, XMLInqData, "VIEW", crossCountryFlag,GlobalFlag,buffer1,buffer2,buffer3,buffer4,buffer5,buffer6)
	set Records = scb.dataRs

	If scb.Rs("HDRIND") = "AA" Then
		
		dim sSQL1,sSQL2,sSQL3,tempRsCurrency,tempRsID,rCURTYP,rCFSSCD,rLKSHDS,rLIVPRV

		sSQL3 = "SELECT WDKEY2,WDDS01 FROM PR_WDFILE WHERE WDKEY2=''"&Records.fields("LIVPRV")&"'' AND WDFILE=''SSSTAT'' AND WDCOUN = ''"&scb.objSession("CountryCode")&"'' AND WDLANG = ''"&scb.objSession("LANGUAGE_CODE")&"'' ORDER BY WDKEY1"
		Set tempRsID = SCB.ExecuteQuery(sSQL3)
		if tempRsID.recordCount > 0 then 
			rLIVPRV = tempRsID(1)
		else
			rLIVPRV = ""
		end if


		if scb.objSession("VIEWTYPE") <> "" then
			scb.addOutput "<script type=''text/javascript''>var SFTLOGKEY = ''" & scb.rs("SFTLOGKEY") & "'';</script>" 
		else
			scb.addOutput "<script type=''text/javascript''>var SFTLOGKEY = '''';</script>" 
		end if
		
		''currency description
		sSQL1 = "SELECT WDKEY1,WDDS01 FROM PR_WDFILE WHERE WDKEY1=''"&Records.fields("CURTYP")&"'' AND WDFILE=''SSFXRP'' AND WDCOUN = ''"&scb.objSession("CountryCode")&"'' AND WDLANG = ''"&scb.objSession("LANGUAGE_CODE")&"'' ORDER BY WDKEY1"
		Set tempRsCurrency = SCB.ExecuteQuery(sSQL1)
		if tempRsCurrency.recordCount > 0 then 
			rCURTYP = tempRsCurrency(1)
		else
			rCURTYP = ""
		end if
		
		''ID Type Description
		sSQL2 = "SELECT WDKEY1,WDDS01 FROM PR_WDFILE WHERE WDKEY1=''"&Records.fields("CFSSCD")&"'' AND WDFILE=''CFPAR3'' AND WDCOUN = ''"&scb.objSession("CountryCode")&"'' AND WDLANG = ''"&scb.objSession("LANGUAGE_CODE")&"'' ORDER BY WDKEY1"
		Set tempRsID = SCB.ExecuteQuery(sSQL2)
		if tempRsID.recordCount > 0 then 
			rCFSSCD = tempRsID(1)
		else
			rCFSSCD = ""
		end if
		
		''RB Description
		sSQL2 = "SELECT WDKEY1,WDDS01 FROM PR_WDFILE WHERE WDKEY1=''"&Records.fields("RBRN")&"'' AND WDFILE=''SSDATA'' AND WDCOUN = ''"&scb.objSession("CountryCode")&"'' AND WDLANG = ''"&scb.objSession("LANGUAGE_CODE")&"'' ORDER BY WDKEY1"
		Set tempRsID = SCB.ExecuteQuery(sSQL2)
		if tempRsID.recordCount > 0 then 
			rRBRN = tempRsID(1)
		else
			rRBRN = ""
		end if		
		
		''Facility Code Description
		sSQL2 = "SELECT WDKEY1,WDDS01 FROM PR_WDFILE WHERE WDKEY1=''"&Records.fields("AXFCDE")&"'' AND WDFILE=''LLPARK'' AND WDCOUN = ''"&scb.objSession("CountryCode")&"'' AND WDLANG = ''"&scb.objSession("LANGUAGE_CODE")&"'' ORDER BY WDKEY1"
		Set tempRsID = SCB.ExecuteQuery(sSQL2)
		if tempRsID.recordCount > 0 then 
			rLKSHDS = tempRsID(1)
		else
			rLKSHDS = ""
		end if
		
		rMSGLIN = Records.fields("MSGLIN")
		arrMSGLIN = Split(rMSGLIN,"|",-1,1)
		tMSGLIN=""
		for each xfield in arrMSGLIN
			if tMSGLIN = "" then
				tMSGLIN = xfield
			else
				tMSGLIN = tMSGLIN&vbCrLf&xfield
			end if
		next
		
		SCB.addOutput("<div id=''tabGLOBAL''><table id=mainTable_Header width=100% cellspacing=0 cellpadding=0 border=0>")
		SCB.addOutput("<td width=100% id=advancedName>")
		''table start
		SCB.addOutput("<table class=headerTable id=header width=100% cellspacing=0 cellpadding=0 border=0>")
		SCB.addOutput("<tr>")
		SCB.addOutput("<td colspan=4 ><span id=viewTitle class=spanView>"&Records.fields("ACCTNO")&"<br>"&Records.fields("NA1")&"<br>"&Records.fields("NA1A")&"</span></td>")
		SCB.addOutput("</tr>")
		''row 1 of name
		SCB.addOutput("<tr>")
		SCB.addOutput("<td class=rfield2a nowrap><span id=NA2 class=spanView>"&Records.fields("NA2")&"</span><span class=spanView style=''display:none;''>"&" /"&"</span><span id=MCLNID class=spanView style=''display:none;''>"&Records.fields("MCLNID")&"</span><span id=PARTID class=spanView style=''display:none;''>"&Records.fields("PARTID")&"</span></td>")
		''G001 13092016 ''SCB.addOutput("<td class=lfield2a nowrap>Product Type / Currency / Campaign Code</td>")
		''G001 13092016
		If strLGCODE = "EN" then
		SCB.addOutput("<td class=lfield2a nowrap>Product Type / Currency / Campaign Code</td>")
		Else
		SCB.addOutput("<td class=lfield2a nowrap>ประเภทผลิตภัณฑ์ / สกุลเงิน / รหัสแคมเปญ</td>")
		End If
		''G001 13092016
		SCB.addOutput("<td class=rfield2a nowrap><span id=ACCTNO class=spanView style=''display:none;''>"&Records.fields("ACCTNO")&"</span><span class=spanView style=''display:none;''>"&" /"&"</span><span id=APTYPE class=spanView style=''display:none;''>"&Records.fields("APTYPE")&"</span><span class=spanView style=''display:none;''>"&" /"&"</span><span id=TYPE class=spanView>"&Records.fields("TYPE")&"</span><span class=spanView>"&" -"&"</span><span id=PTYDSC class=spanView>"&Records.fields("PTYDSC")&"</span><span class=spanView>"&" /"&"</span><span id=CURTYP class=spanView>"&Records.fields("CURTYP")&"</span><span class=spanView>"&" -"&"</span><span id=rCURTYP class=spanView>"&rCURTYP&"</span><span class=spanView>"&" /"&"</span><span id=RATPC class=spanView>"&Records.fields("RATPC")&"</span></td>")
		SCB.addOutput("<td class=lfield2a rowspan=11 nowrap''><textarea id=MSGLIN readonly=true rows=11 cols=50  style=''color:red; font-weight:bold; background-color:transparent''>"&tMSGLIN&"</textarea></td>")
		SCB.addOutput("</tr>")
		''row 2 of name	
		SCB.addOutput("<tr>")
		SCB.addOutput("<td class=rfield2a nowrap><span id=NA3 class=spanView>"&Records.fields("NA3")&"</span></td>")
		''G001 13092016 ''SCB.addOutput("<td class=lfield2a nowrap>AA No / Facility ID</td>")
		''G001 13092016
		If strLGCODE = "EN" then
		SCB.addOutput("<td class=lfield2a nowrap>AA No / Facility ID</td>")
		Else
		SCB.addOutput("<td class=lfield2a nowrap>เลขที่ใบคำขอ / เลขที่วงเงิน</td>")
		End If
		''G001 13092016
		SCB.addOutput("<td class=rfield2a nowrap><span id=AFACCN class=spanView>"&Records.fields("AFACCN")&"</span><span class=spanView style=''display:none;''>"&" /"&"</span><span id=AXCPNO class=spanView style=''display:none;''>"&Records.fields("AXCPNO")&"</span><span class=spanView>"&" /"&"</span><span id=AANO class=spanView>"&Records.fields("AANO")&"</span></td>")
		SCB.addOutput("</tr>")
		''row 3 of name	
		SCB.addOutput("<tr>")
		SCB.addOutput("<td class=rfield2a nowrap><span id=NA4 class=spanView>"&Records.fields("NA4")&"</span></td>")
		''G001 13092016 ''SCB.addOutput("<td class=lfield2a nowrap>Facility Code</td>")
		''G001 13092016
		If strLGCODE = "EN" then
		SCB.addOutput("<td class=lfield2a nowrap>Facility Code</td>")
		Else
		SCB.addOutput("<td class=lfield2a nowrap>รหัสวงเงิน</td>")
		End If
		''G001 13092016
		SCB.addOutput("<td class=rfield2a nowrap><span id=AXFCDE class=spanView>"&Records.fields("AXFCDE")&"</span><span class=spanView>"&" - "&"</span><span id=rLKSHDS class=spanView>"&rLKSHDS&"</span></td>")
		SCB.addOutput("</tr>")
		''row 4 of name	
		SCB.addOutput("<tr>")
		SCB.addOutput("<td class=rfield2a nowrap><span id=NA5 class=spanView>"&Records.fields("NA5")&"</span></td>")
		''G001 13092016 ''SCB.addOutput("<td class=lfield2a nowrap>Bank / Branch</td>")
		''G001 13092016
		If strLGCODE = "EN" then
		SCB.addOutput("<td class=lfield2a nowrap>Bank / Branch</td>")
		Else
		SCB.addOutput("<td class=lfield2a nowrap>ธนาคาร / สาขา</td>")
		End If
		''G001 13092016
		SCB.addOutput("<td class=rfield2a nowrap><span id=BKN class=spanView>"&Records.fields("BKN")&"</span><span class=spanView>"&" -"&"</span><span id=BKNAME class=spanView>"&Records.fields("BKNAME")&"</span><span class=spanView>"&" /"&"</span><span id=BRN class=spanView>"&Records.fields("BRN")&"</span><span class=spanView>"&" -"&"</span><span id=BRNAME class=spanView>"&Records.fields("BRNAME")&"</span></td>")
		SCB.addOutput("</tr>")
		''row 5 of name	
		SCB.addOutput("<tr>")
		SCB.addOutput("<td class=rfield2a nowrap><span id=NA6 class=spanView>"&Records.fields("NA6")&"</span></td>")
		''G001 13092016 ''SCB.addOutput("<td class=lfield2a nowrap>Reporting Branch</td>")
		''G001 13092016
		If strLGCODE = "EN" then
		SCB.addOutput("<td class=lfield2a nowrap>Reporting Branch</td>")
		Else
		SCB.addOutput("<td class=lfield2a nowrap>รายงานสาขา</td>")
		End If
		''G001 13092016
		SCB.addOutput("<td class=rfield2a2 nowrap><span id=RBRN class=spanView>"&Records.fields("RBRN")&"</span><span class=spanView>"&" -"&"</span><span id=RBNAME class=spanView>"&Records.fields("RBNAME")&"</span><span id=AFAPNO class=spanView style=''display:none;''>"&Records.fields("AANO")&"</span></td>")
		SCB.addOutput("</tr>")

		''row 5 of name	
		SCB.addOutput("<tr>")
		SCB.addOutput("<td class=rfield2a nowrap><span id=NA7 class=spanView>"&Records.fields("NA7")&"</span></td>")
		''G001 13092016 ''SCB.addOutput("<td class=lfield2a nowrap>ID Type / ID Number</td>")
		''G001 13092016
		If strLGCODE = "EN" then
		SCB.addOutput("<td class=lfield2a nowrap>ID Type / ID Number</td>")
		Else
		SCB.addOutput("<td class=lfield2a nowrap>ประเภทบัตร / เลขที่บัตร</td>")
		End If
		''G001 13092016		
		SCB.addOutput("<td class=rfield2a nowrap><span id=CFSSCD class=spanView>"&Records.fields("CFSSCD")&"</span><span class=spanView>"&" -"&"</span><span id=rCFSSCD class=spanView>"&rCFSSCD&"</span><span class=spanView>"&" /"&"</span><span id=CFSSNO class=spanView>"&Records.fields("CFSSNO")&"</span></td>")
		SCB.addOutput("</tr>")
		''row 6 of name		
		SCB.addOutput("<tr>")
		SCB.addOutput("<td class=rfield2a nowrap><span id=NA8 class=spanView>"&Records.fields("NA8")&"</span></td>")
		''G001 13092016 ''SCB.addOutput("<td class=lfield2a nowrap>Customer Number / Entity Number</td>")
		''G001 13092016
		If strLGCODE = "EN" then
		SCB.addOutput("<td class=lfield2a nowrap>Customer Number / Entity Number</td>")
		Else
		SCB.addOutput("<td class=lfield2a nowrap>เลขที่ลูกค้า / Entity Number</td>")
		End If
		''G001 13092016			
		SCB.addOutput("<td class=rfield2a2 nowrap><span id=CIFNO class=spanView>"&Records.fields("CIFNO")&"</span><span class=spanView>"&" /"&"</span><span id=CFENTN class=spanView>"&Records.fields("CFENTN")&"</span><span class=spanView style=''display:none;''>"&" /"&"</span><span id=PRDGRP class=spanView style=''display:none;''>"&Records.fields("PRDGRP")&"</span></td>")
		SCB.addOutput("</tr>")
		''row 7 of name	
		SCB.addOutput("<tr>")
		SCB.addOutput("<td class=rfield2a nowrap>&nbsp</td>")
		''G001 13092016 ''SCB.addOutput("<td class=lfield2a nowrap>Relationship Manager Code</td>")
		''G001 13092016
		If strLGCODE = "EN" then
		SCB.addOutput("<td class=lfield2a nowrap>Relationship Manager Code</td>")
		Else
		SCB.addOutput("<td class=lfield2a nowrap>รหัสผู้ดูแลบัญชี</td>")
		End If
		''G001 13092016			
		SCB.addOutput("<td class=rfield2a2 nowrap><span id=OFFCR class=spanView>"&Records.fields("OFFCR")&"</span><span class=spanView>"&" -"&"</span><span id=OFNAME class=spanView>"&Records.fields("OFNAME")&"</span></td>")
		SCB.addOutput("</tr>")
		''row 8 of name		
		SCB.addOutput("<tr >")
		SCB.addOutput("<td class=rfield2a nowrap>&nbsp</td>")
		''G001 13092016 ''SCB.addOutput("<td class=lfield2a nowrap>Customer Seqment / SBU</td>")
		''G001 13092016
		If strLGCODE = "EN" then
		SCB.addOutput("<td class=lfield2a nowrap>Customer Seqment / SBU</td>")
		Else
		SCB.addOutput("<td class=lfield2a nowrap>Customer Seqment / รหัสหน่วยงานเชิงธุรกิจ</td>")
		End If
		''G001 13092016		
		SCB.addOutput("<td class=rfield2a2 nowrap><span id=CFSEGC class=spanView>"&Records.fields("CFSEGC")&"</span><span class=spanView>"&" -"&"</span><span id=SGNAME class=spanView>"&Records.fields("SGNAME")&"</span><span class=spanView>"&" /"&"</span><span id=SBUCOD class=spanView>"&Records.fields("SBUCOD")&"</span><span class=spanView>"&" -"&"</span><span id=SBNAME class=spanView>"&Records.fields("SBNAME")&"</span></td>")
		SCB.addOutput("</tr>")
		''row 9 of name		
		SCB.addOutput("<tr >")
		SCB.addOutput("<td class=rfield2a nowrap>&nbsp</td>")
		''G001 13092016 ''SCB.addOutput("<td class=lfield2a nowrap>Specialized Lending Indicator</td>")
		''G001 13092016
		If strLGCODE = "EN" then
		SCB.addOutput("<td class=lfield2a nowrap>Specialized Lending Indicator</td>")
		Else
		SCB.addOutput("<td class=lfield2a nowrap>Specialized Lending Indicator</td>")
		End If
		''G001 13092016			
		SCB.addOutput("<td class=rfield2a2 nowrap><span id=AFFSLI class=spanView>"&Records.fields("AFFSLI")&"</span><span class=spanView>"&" -"&"</span><span id=SLNAME class=spanView>"&Records.fields("SLNAME")&"</span><span id=IPCODE class=spanView style=''display:none;''>"&Records.fields("IPCODE")&"</span><span id=MULTIR class=spanView style=''display:none;''>"&Records.fields("MULTIR")&"</span></td>")
		SCB.addOutput("</tr>")
		''row 10 of name		
		If Records.fields("PSYNLN") = "Y" Then
		SCB.addOutput("<tr >")
		SCB.addOutput("<td class=rfield2a nowrap>&nbsp</td>")
		SCB.addOutput("<td class=lfield2a nowrap>Lender Name</td>")
		SCB.addOutput("<td class=rfield2a2 nowrap><span id=LPLSNM class=spanView>"&Records.fields("LPLSNM")&"</span><span id=FRCODE class=spanView style=''display:none;''>"&Records.fields("FRCODE")&"</span></td>")
		SCB.addOutput("</tr>")
		End IF


		''KK001 by GOLF ADD 2 FIELDS LIPICN,LIVPRV''
		''row 11 of name''
		if Records.fields("LIRTYP") = "CD" THEN
		SCB.addOutput("<tr >")
		SCB.addOutput("<td class=rfield2a nowrap>&nbsp</td>")
		SCB.addOutput("<td class=lfield2a nowrap>Card reference number</td>")
		SCB.addOutput("<td class=rfield2a nowrap><span id=LIPICN class=spanView>"&Records.fields("LIPICN")&"</span></td>")
		SCB.addOutput("</tr>")
		elseif Records.fields("LIRTYP") = "FP" THEN
		SCB.addOutput("<tr >")
		SCB.addOutput("<td class=rfield2a nowrap>&nbsp</td>")
		SCB.addOutput("<td class=lfield2a nowrap>Vehicle</td>")
		SCB.addOutput("<td class=rfield2a nowrap><span id=LIVPRV class=spanView>"&Records.fields("LIVPRV")&"</span><span class=spanView>"&" -"&"</span><span id=rLIVPRV class=spanView>"&rLIVPRV&"</span></td>")
		SCB.addOutput("</tr >")
		End IF
		''End KK001''


		''row 11 of name		
		SCB.addOutput("<tr >")
		SCB.addOutput("<td class=rfield2a nowrap><span id=CBAL class=spanView style=''display:none;''>"&Records.fields("CBAL")&"</span><span class=spanView style=''display:none;''>"&" /"&"</span><span id=INTDUE class=spanView style=''display:none;''>"&Records.fields("INTDUE")&"</span><span class=spanView style=''display:none;''>"&" /"&"</span><span id=LCDUE class=spanView style=''display:none;''>"&Records.fields("LCDUE")&"</span><span class=spanView style=''display:none;''>"&" /"&"</span><span id=CFDUE class=spanView style=''display:none;''>"&Records.fields("CFDUE")&"</span><span class=spanView style=''display:none;''>"&" /"&"</span><span id=OTHCHG class=spanView style=''display:none;''>"&Records.fields("OTHCHG")&"</span><span class=spanView style=''display:none;''>"&" /"&"</span><span id=PWOFID class=spanView style=''display:none;''>"&Records.fields("PWOFID")&"</span><span id=PWOAP8 class=spanView style=''display:none;''>"&Records.fields("PWOAP8")&"</span><span id=FRCODE class=spanView style=''display:none;''>"&Records.fields("FRCODE")&"</span></td>")
		SCB.addOutput("<td class=lfield2a nowrap></td>")
		SCB.addOutput("<td class=lfield2a2 nowrap><span id=MISCD class=spanView style=''display:none;''>"&Records.fields("MISCD")&"</span><span class=spanView style=''display:none;''>"&" /"&"</span><span id=SNAME class=spanView style=''display:none;''>"&Records.fields("SNAME")&"</span><span class=spanView style=''display:none;''>"&" /"&"</span><span id=ORGAMT class=spanView style=''display:none;''>"&Records.fields("ORGAMT")&"</span><span class=spanView style=''display:none;''>"&" /"&"</span><span id=DRLIMT class=spanView style=''display:none;''>"&Records.fields("DRLIMT")&"</span><span class=spanView style=''display:none;''>"&" /"&"</span><span id=LNSPTF class=spanView style=''display:none;''>"&Records.fields("LNSPTF")&"</span><span id=PRDGRP class=spanView style=''display:none;''>"&Records.fields("PRDGRP")&"</span><span id=IBASE class=spanView style=''display:none;''>"&Records.fields("IBASE")&"</span><span id=ERROR class=spanView style=''display:none;''></span></td>")
		SCB.addOutput("</tr>")
		
		''row 12 for hidden field
		SCB.addOutput("<tr >")	
		SCB.addOutput("<td class=rfield2a nowrap><span id=HAVMSG class=spanView style=''display:none;''>"&Records.fields("HAVMSG")&"</span></td>")
		SCB.addOutput("<td class=lfield2a nowrap><span id=PAUTDB class=spanView style=''display:none;''>"&Records.fields("PAUTDB")&"</span></td>")
		SCB.addOutput("<td class=lfield2a nowrap><span id=YBASE class=spanView style=''display:none;''>"&Records.fields("YBASE")&"</span></td>")
		SCB.addOutput("<td class=lfield2a nowrap><span id=LONGRP class=spanView style=''display:none;''>"&Records.fields("LONGRP")&"</span></td>")
		''SCB.addOutput("<td class=lfield2a nowrap></td>")
		SCB.addOutput("</tr>")		
		SCB.addOutput("</table></td>")
		SCB.addOutput("</tr></table></div>") 
	Else
		''~ SCB.addOutput("<table width=100% height=100px><tr><td class=rfield2b nowrap>LN86803:No Records Found.</td></tr></table>")
		SCB.addOutput("<table width=100% height=100px><tr><td class=rfield2b nowrap><span id=ERROR class=spanView>"&scb.Rs("ERRDES")&"</span></td></tr></table>")
		scb.objSession("errMsg")=""
		scb.objSession("strErr")=""
	End If
END IF

scb.objSession("VIEWTYPE") = ""

END FUNCTION', '2554-03-29 11:04:33.673', '2022-11-30 10:48:55.053', N'CS_LN_Standard_Header', null, null, N'0', N'372', null, N'2364b04d-72d6-453c-b751-d534c20e44c3')
                                           end
                                        commit tran

  COMMIT
PRINT 'Import completed successfully'
  BREAK
END
