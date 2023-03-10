BEGIN TRANSACTION
WHILE 1=1
BEGIN
  IF NOT EXISTS(SELECT SCRIPT_ID FROM S_CLIENT_SCRIPT WHERE SCRIPT_ID ='c2ff1eec-def9-48ad-8273-884c7488eec8')
  BEGIN
      PRINT 'S_CLIENT_SCRIPT [c2ff1eec-def9-48ad-8273-884c7488eec8] is missing from target database'
      ROLLBACK
      BREAK
  END
  IF NOT EXISTS(SELECT SCRIPT_ID FROM S_SERVER_SCRIPT WHERE SCRIPT_ID ='675ee91f-a1ef-484f-bd0e-dc199565b9f7')
  BEGIN
      PRINT 'S_SERVER_SCRIPT [675ee91f-a1ef-484f-bd0e-dc199565b9f7] is missing from target database'
      ROLLBACK
      BREAK
  END
  IF NOT EXISTS(SELECT SCRIPT_ID FROM S_CLIENT_SCRIPT WHERE SCRIPT_ID ='530441a9-945f-4c66-b3a9-026cd05bab5d')
  BEGIN
      PRINT 'S_CLIENT_SCRIPT [530441a9-945f-4c66-b3a9-026cd05bab5d] is missing from target database'
      ROLLBACK
      BREAK
  END
  IF NOT EXISTS(SELECT SCRIPT_ID FROM S_CLIENT_SCRIPT WHERE SCRIPT_ID ='5e6237f3-0a9b-4353-a320-039cbc5b9dfa')
  BEGIN
      PRINT 'S_CLIENT_SCRIPT [5e6237f3-0a9b-4353-a320-039cbc5b9dfa] is missing from target database'
      ROLLBACK
      BREAK
  END
  IF NOT EXISTS(SELECT SCRIPT_ID FROM S_CLIENT_SCRIPT WHERE SCRIPT_ID ='5f3c9a24-f00b-4d09-9d6c-05c75a9d519d')
  BEGIN
      PRINT 'S_CLIENT_SCRIPT [5f3c9a24-f00b-4d09-9d6c-05c75a9d519d] is missing from target database'
      ROLLBACK
      BREAK
  END
  IF NOT EXISTS(SELECT SCRIPT_ID FROM S_CLIENT_SCRIPT WHERE SCRIPT_ID ='6349ee47-4f14-4a76-bf17-0873c302b4c8')
  BEGIN
      PRINT 'S_CLIENT_SCRIPT [6349ee47-4f14-4a76-bf17-0873c302b4c8] is missing from target database'
      ROLLBACK
      BREAK
  END
  IF NOT EXISTS(SELECT SCRIPT_ID FROM S_CLIENT_SCRIPT WHERE SCRIPT_ID ='e21053bd-0f3f-4029-8596-0ff07ffc0450')
  BEGIN
      PRINT 'S_CLIENT_SCRIPT [e21053bd-0f3f-4029-8596-0ff07ffc0450] is missing from target database'
      ROLLBACK
      BREAK
  END
  IF NOT EXISTS(SELECT SCRIPT_ID FROM S_CLIENT_SCRIPT WHERE SCRIPT_ID ='11f35196-b107-40d4-a49c-26ce5e30500e')
  BEGIN
      PRINT 'S_CLIENT_SCRIPT [11f35196-b107-40d4-a49c-26ce5e30500e] is missing from target database'
      ROLLBACK
      BREAK
  END
  IF NOT EXISTS(SELECT SCRIPT_ID FROM S_CLIENT_SCRIPT WHERE SCRIPT_ID ='87fbd8b8-184a-413f-a4d4-2e345b572880')
  BEGIN
      PRINT 'S_CLIENT_SCRIPT [87fbd8b8-184a-413f-a4d4-2e345b572880] is missing from target database'
      ROLLBACK
      BREAK
  END
  IF NOT EXISTS(SELECT SCRIPT_ID FROM S_CLIENT_SCRIPT WHERE SCRIPT_ID ='526bada3-a1af-46a2-8f34-5078b7db0e85')
  BEGIN
      PRINT 'S_CLIENT_SCRIPT [526bada3-a1af-46a2-8f34-5078b7db0e85] is missing from target database'
      ROLLBACK
      BREAK
  END
  IF NOT EXISTS(SELECT SCRIPT_ID FROM S_CLIENT_SCRIPT WHERE SCRIPT_ID ='88a7cce9-df9f-457c-aacf-5d97c2a81702')
  BEGIN
      PRINT 'S_CLIENT_SCRIPT [88a7cce9-df9f-457c-aacf-5d97c2a81702] is missing from target database'
      ROLLBACK
      BREAK
  END
  IF NOT EXISTS(SELECT SCRIPT_ID FROM S_CLIENT_SCRIPT WHERE SCRIPT_ID ='169f5514-c7d1-4057-80d9-62f1f73df440')
  BEGIN
      PRINT 'S_CLIENT_SCRIPT [169f5514-c7d1-4057-80d9-62f1f73df440] is missing from target database'
      ROLLBACK
      BREAK
  END
  IF NOT EXISTS(SELECT SCRIPT_ID FROM S_CLIENT_SCRIPT WHERE SCRIPT_ID ='70c61392-1482-4309-946e-789451f86759')
  BEGIN
      PRINT 'S_CLIENT_SCRIPT [70c61392-1482-4309-946e-789451f86759] is missing from target database'
      ROLLBACK
      BREAK
  END
  IF NOT EXISTS(SELECT SCRIPT_ID FROM S_CLIENT_SCRIPT WHERE SCRIPT_ID ='ba12a762-cfac-4344-a502-87559b26f919')
  BEGIN
      PRINT 'S_CLIENT_SCRIPT [ba12a762-cfac-4344-a502-87559b26f919] is missing from target database'
      ROLLBACK
      BREAK
  END
  IF NOT EXISTS(SELECT SCRIPT_ID FROM S_CLIENT_SCRIPT WHERE SCRIPT_ID ='0c443d50-a2aa-45a4-b1f7-e3cf5b03910b')
  BEGIN
      PRINT 'S_CLIENT_SCRIPT [0c443d50-a2aa-45a4-b1f7-e3cf5b03910b] is missing from target database'
      ROLLBACK
      BREAK
  END
  IF NOT EXISTS(SELECT SCRIPT_ID FROM S_CLIENT_SCRIPT WHERE SCRIPT_ID ='cdc4ba65-2983-44d9-965a-f7e44a3684bb')
  BEGIN
      PRINT 'S_CLIENT_SCRIPT [cdc4ba65-2983-44d9-965a-f7e44a3684bb] is missing from target database'
      ROLLBACK
      BREAK
  END



  -- Delete scripts
DELETE FROM S_PAGE_LIST_COLUMN_WORKGROUP WHERE COLUMN_ID IN(SELECT COLUMN_ID FROM S_PAGE_LIST_COLUMN WHERE LIST_ID IN( SELECT LIST_ID FROM S_PAGE_LIST WHERE PAGE_ID='3529f1c5-a337-4fac-98f6-c62e852d572f'))
DELETE FROM S_LANGUAGE_OBJECT_VALUE WHERE RECORD_ID IN(SELECT COLUMN_ID FROM S_PAGE_LIST_COLUMN WHERE LIST_ID IN( SELECT LIST_ID FROM S_PAGE_LIST WHERE PAGE_ID='3529f1c5-a337-4fac-98f6-c62e852d572f'))
DELETE FROM S_PAGE_LIST_BUTTON_WORKGROUP WHERE BUTTON_ID IN(SELECT BUTTON_ID FROM S_PAGE_LIST_BUTTON WHERE LIST_ID IN( SELECT LIST_ID FROM S_PAGE_LIST WHERE PAGE_ID='3529f1c5-a337-4fac-98f6-c62e852d572f'))
DELETE FROM S_LANGUAGE_OBJECT_VALUE WHERE RECORD_ID IN(SELECT BUTTON_ID FROM S_PAGE_LIST_BUTTON WHERE LIST_ID IN( SELECT LIST_ID FROM S_PAGE_LIST WHERE PAGE_ID='3529f1c5-a337-4fac-98f6-c62e852d572f'))
DELETE FROM S_PAGE_FILTER_ACTION WHERE FILTER_ID IN( SELECT FILTER_ID FROM S_PAGE_FILTER WHERE PAGE_ID='3529f1c5-a337-4fac-98f6-c62e852d572f')
DELETE FROM S_LANGUAGE_OBJECT_VALUE WHERE RECORD_ID IN( SELECT FILTER_ID FROM S_PAGE_FILTER WHERE PAGE_ID='3529f1c5-a337-4fac-98f6-c62e852d572f')
DELETE FROM S_PAGE_FILTER_WORKGROUP WHERE FILTER_ID IN( SELECT FILTER_ID FROM S_PAGE_FILTER WHERE PAGE_ID='3529f1c5-a337-4fac-98f6-c62e852d572f')
DELETE FROM S_LANGUAGE_OBJECT_VALUE WHERE RECORD_ID IN( SELECT FILTER_ID FROM S_PAGE_FILTER WHERE PAGE_ID='3529f1c5-a337-4fac-98f6-c62e852d572f')
DELETE FROM S_PAGE_LIST_COLUMN WHERE LIST_ID IN( SELECT LIST_ID FROM S_PAGE_LIST WHERE PAGE_ID='3529f1c5-a337-4fac-98f6-c62e852d572f')
DELETE FROM S_LANGUAGE_OBJECT_VALUE WHERE RECORD_ID IN( SELECT LIST_ID FROM S_PAGE_LIST WHERE PAGE_ID='3529f1c5-a337-4fac-98f6-c62e852d572f')
DELETE FROM S_PAGE_LIST_WORKGROUP WHERE LIST_ID IN( SELECT LIST_ID FROM S_PAGE_LIST WHERE PAGE_ID='3529f1c5-a337-4fac-98f6-c62e852d572f')
DELETE FROM S_LANGUAGE_OBJECT_VALUE WHERE RECORD_ID IN( SELECT LIST_ID FROM S_PAGE_LIST WHERE PAGE_ID='3529f1c5-a337-4fac-98f6-c62e852d572f')
DELETE FROM S_PAGE_LIST_BUTTON WHERE LIST_ID IN( SELECT LIST_ID FROM S_PAGE_LIST WHERE PAGE_ID='3529f1c5-a337-4fac-98f6-c62e852d572f')
DELETE FROM S_LANGUAGE_OBJECT_VALUE WHERE RECORD_ID IN( SELECT LIST_ID FROM S_PAGE_LIST WHERE PAGE_ID='3529f1c5-a337-4fac-98f6-c62e852d572f')
DELETE FROM S_PAGE_WORKGROUP WHERE PAGE_ID = '3529f1c5-a337-4fac-98f6-c62e852d572f'
DELETE FROM S_PAGE_FILTER WHERE PAGE_ID = '3529f1c5-a337-4fac-98f6-c62e852d572f'
DELETE FROM S_PAGE_BUTTON WHERE PAGE_ID = '3529f1c5-a337-4fac-98f6-c62e852d572f'
DELETE FROM S_PAGE_CLIENT_SCRIPT WHERE PAGE_ID = '3529f1c5-a337-4fac-98f6-c62e852d572f'
DELETE FROM S_PAGE_LIST WHERE PAGE_ID = '3529f1c5-a337-4fac-98f6-c62e852d572f'
DELETE FROM S_PAGE WHERE PAGE_ID = '3529f1c5-a337-4fac-98f6-c62e852d572f'
DELETE FROM S_LANGUAGE_OBJECT_VALUE WHERE RECORD_ID = '3529f1c5-a337-4fac-98f6-c62e852d572f'




  -- Insert scripts
INSERT INTO S_PAGE(PAGE_ID, PAGE_NAME, PAGE_TITLE, FILTER_TITLE, STYLE_SHEET, DATA_DATABASE, HAS_FILTER_BUTTONS, RESULTS_ON_LOAD, PAGE_TYPE, HISTORY_TITLE, ONLOAD_CLIENTSCRIPT_ID, ONLOAD_SERVERSCRIPT_ID, HISTORY_CONTEXT_ID) VALUES(N'3529f1c5-a337-4fac-98f6-c62e852d572f', N'LN_ACC_LN82800_MNT', N'LN82800 - Tranche Listing', N'', N'listInFrame.css', null, N'False', N'1', N'0', N'LN_ACC_LN82800_MNT', N'c2ff1eec-def9-48ad-8273-884c7488eec8', null, null)

begin tran
                                           UPDATE S_LANGUAGE_OBJECT_VALUE SET ID=N'986d807f-cba9-4a4a-9ccb-809b7adca7a1', OBJECT_ID=N'2b675db2-6fc9-4ddc-afeb-52c247b5e37d', LANGUAGE_ID=N'2dad38f9-a30c-4c69-9c8f-c3a74c20fdf1', VALUE=N'LN_ACC_LN82800_MNT', RECORD_ID=N'3529f1c5-a337-4fac-98f6-c62e852d572f', ITEM_ID=N'c041dfda-1e71-4b6f-8044-783af00e10f9' WHERE ID = '986d807f-cba9-4a4a-9ccb-809b7adca7a1'

                                           if @@rowcount = 0
                                           begin
                                                  INSERT INTO S_LANGUAGE_OBJECT_VALUE(ID, OBJECT_ID, LANGUAGE_ID, VALUE, RECORD_ID, ITEM_ID) VALUES(N'986d807f-cba9-4a4a-9ccb-809b7adca7a1', N'2b675db2-6fc9-4ddc-afeb-52c247b5e37d', N'2dad38f9-a30c-4c69-9c8f-c3a74c20fdf1', N'LN_ACC_LN82800_MNT', N'3529f1c5-a337-4fac-98f6-c62e852d572f', N'c041dfda-1e71-4b6f-8044-783af00e10f9')
                                           end
                                        commit tran

begin tran
                                           UPDATE S_LANGUAGE_OBJECT_VALUE SET ID=N'd6e08b7c-899e-498f-9968-8d97a526b244', OBJECT_ID=N'2b675db2-6fc9-4ddc-afeb-52c247b5e37d', LANGUAGE_ID=N'2dad38f9-a30c-4c69-9c8f-c3a74c20fdf1', VALUE=N'LN82800 - Tranche Listing', RECORD_ID=N'3529f1c5-a337-4fac-98f6-c62e852d572f', ITEM_ID=N'0a8445a4-bbcf-4450-8471-d5d72d7e9b7b' WHERE ID = 'd6e08b7c-899e-498f-9968-8d97a526b244'

                                           if @@rowcount = 0
                                           begin
                                                  INSERT INTO S_LANGUAGE_OBJECT_VALUE(ID, OBJECT_ID, LANGUAGE_ID, VALUE, RECORD_ID, ITEM_ID) VALUES(N'd6e08b7c-899e-498f-9968-8d97a526b244', N'2b675db2-6fc9-4ddc-afeb-52c247b5e37d', N'2dad38f9-a30c-4c69-9c8f-c3a74c20fdf1', N'LN82800 - Tranche Listing', N'3529f1c5-a337-4fac-98f6-c62e852d572f', N'0a8445a4-bbcf-4450-8471-d5d72d7e9b7b')
                                           end
                                        commit tran

INSERT INTO S_PAGE_LIST(LIST_ID, LIST_NAME, LIST_TITLE, LIST_QUERY, PER_PAGE_LIMIT, ITEM_INDEX, SHOW_COUNT, APPLY_FILTER, HAS_WORKGROUP, TEMPLATE_HANDLES_PAGING, DATA_TRANSFORMATION_SCRIPT, DATA_TRANSFORMATION_FUNC_NAME, DATA_TRANSFORMATION_SCRIPT_LANGUAGE, RECORD_RETRIEVE_METHOD, PAGE_ID, PRESENTATION_TEMPLATE_ID, USE_NOLOCK) VALUES(N'c9c9a046-0e61-43df-9510-5f1530fe234f', N'MAIN', N'', N'dim XMLHeader, XMLInqData, sts, err
dim STYPE,ctnName,strAccount,strType,strFlag
ctnName = "QuickView"

XMLHeader = "LN82800" 
scb.objSession("errMsg")=""
dim ACCTNO
ACCTNO = scb.objRequest.queryString("ACCTNO")
ACTMNO = scb.objRequest.queryString("ACTMNO")
MFLAG = scb.objRequest.queryString("MFLAG")
XMLInqData = "<SRCACN>"&ACCTNO&"</SRCACN>" 
XMLInqData = XMLInqData & "<ACTMNO>"&ACTMNO&"</ACTMNO>" & "<ACTYPE>L</ACTYPE>" & "<MFLAG>"&MFLAG&"</MFLAG>" 

scb.loadServerScript("5f74a9a3-9a50-4b35-83d4-9f2f54057ddf")
strFlag =  gsInquiryFromHost(XMLHeader, XMLInqData,"PAGE", sts, err,buffer1,buffer2,buffer3,buffer4,buffer5,buffer6) ''LIST or VIEW      sts-AB/AA', N'-1', N'0', N'0', N'0', N'False', N'0', null, null, N'372', N'2', N'3529f1c5-a337-4fac-98f6-c62e852d572f', N'675ee91f-a1ef-484f-bd0e-dc199565b9f7', N'False')

INSERT INTO S_PAGE_CLIENT_SCRIPT(PAGE_ID, SCRIPT_ID) VALUES(N'3529f1c5-a337-4fac-98f6-c62e852d572f', N'530441a9-945f-4c66-b3a9-026cd05bab5d')

INSERT INTO S_PAGE_CLIENT_SCRIPT(PAGE_ID, SCRIPT_ID) VALUES(N'3529f1c5-a337-4fac-98f6-c62e852d572f', N'5e6237f3-0a9b-4353-a320-039cbc5b9dfa')

INSERT INTO S_PAGE_CLIENT_SCRIPT(PAGE_ID, SCRIPT_ID) VALUES(N'3529f1c5-a337-4fac-98f6-c62e852d572f', N'5f3c9a24-f00b-4d09-9d6c-05c75a9d519d')

INSERT INTO S_PAGE_CLIENT_SCRIPT(PAGE_ID, SCRIPT_ID) VALUES(N'3529f1c5-a337-4fac-98f6-c62e852d572f', N'6349ee47-4f14-4a76-bf17-0873c302b4c8')

INSERT INTO S_PAGE_CLIENT_SCRIPT(PAGE_ID, SCRIPT_ID) VALUES(N'3529f1c5-a337-4fac-98f6-c62e852d572f', N'e21053bd-0f3f-4029-8596-0ff07ffc0450')

INSERT INTO S_PAGE_CLIENT_SCRIPT(PAGE_ID, SCRIPT_ID) VALUES(N'3529f1c5-a337-4fac-98f6-c62e852d572f', N'11f35196-b107-40d4-a49c-26ce5e30500e')

INSERT INTO S_PAGE_CLIENT_SCRIPT(PAGE_ID, SCRIPT_ID) VALUES(N'3529f1c5-a337-4fac-98f6-c62e852d572f', N'87fbd8b8-184a-413f-a4d4-2e345b572880')

INSERT INTO S_PAGE_CLIENT_SCRIPT(PAGE_ID, SCRIPT_ID) VALUES(N'3529f1c5-a337-4fac-98f6-c62e852d572f', N'526bada3-a1af-46a2-8f34-5078b7db0e85')

INSERT INTO S_PAGE_CLIENT_SCRIPT(PAGE_ID, SCRIPT_ID) VALUES(N'3529f1c5-a337-4fac-98f6-c62e852d572f', N'88a7cce9-df9f-457c-aacf-5d97c2a81702')

INSERT INTO S_PAGE_CLIENT_SCRIPT(PAGE_ID, SCRIPT_ID) VALUES(N'3529f1c5-a337-4fac-98f6-c62e852d572f', N'169f5514-c7d1-4057-80d9-62f1f73df440')

INSERT INTO S_PAGE_CLIENT_SCRIPT(PAGE_ID, SCRIPT_ID) VALUES(N'3529f1c5-a337-4fac-98f6-c62e852d572f', N'70c61392-1482-4309-946e-789451f86759')

INSERT INTO S_PAGE_CLIENT_SCRIPT(PAGE_ID, SCRIPT_ID) VALUES(N'3529f1c5-a337-4fac-98f6-c62e852d572f', N'ba12a762-cfac-4344-a502-87559b26f919')

INSERT INTO S_PAGE_CLIENT_SCRIPT(PAGE_ID, SCRIPT_ID) VALUES(N'3529f1c5-a337-4fac-98f6-c62e852d572f', N'c2ff1eec-def9-48ad-8273-884c7488eec8')

INSERT INTO S_PAGE_CLIENT_SCRIPT(PAGE_ID, SCRIPT_ID) VALUES(N'3529f1c5-a337-4fac-98f6-c62e852d572f', N'0c443d50-a2aa-45a4-b1f7-e3cf5b03910b')

INSERT INTO S_PAGE_CLIENT_SCRIPT(PAGE_ID, SCRIPT_ID) VALUES(N'3529f1c5-a337-4fac-98f6-c62e852d572f', N'cdc4ba65-2983-44d9-965a-f7e44a3684bb')

INSERT INTO S_PAGE_FILTER(FILTER_ID, FILTER_NAME, FIELD_NAME, FILTER_TYPE, FILTER_TITLE, FILTER_QUERY, ITEM_INDEX, ITEM_SUB_INDEX, FILTER_WIDTH, FILTER_VALUE, HAS_ACTION, HAS_WORKGROUP, ALLOW_EMPTY, EMPTY_VALUE, REF_NAME, ITEM_VALUE, INITIAL_VALUE, TEXT_DATABASE_FIELD, IS_QUICK_SEARCH, APPLY, HIDDEN, IS_MAINTAINABLE, COMPLEX_COLUMN, PROFILE_AREA_ID, PAGE_ID, OWNER_ID, IS_DELAYED_LIST, MAX_LENGTH) VALUES(N'78690cc7-92ce-4208-b537-63d1b718c1bc', N'SL_NFLAG', null, N'TEXT', N'SL_NFLAG', null, N'0', N'0', null, null, N'False', N'False', N'0', null, null, null, null, N'1', N'0', N'1', N'1', N'0', N'0', null, N'3529f1c5-a337-4fac-98f6-c62e852d572f', null, null, null)

INSERT INTO S_PAGE_LIST_BUTTON(BUTTON_ID, BUTTON_NAME, BUTTON_TITLE, PARAMETERS, ITEM_INDEX, PROP_IS_ACCESSIBLE, HAS_WORKGROUP, BUTTON_LOCATION, LIST_ID, FUNCTION_ID) VALUES(N'a07f065d-cf62-4fd5-870c-db44adf6aaff', N'btnPrev', N'Previous', N'-1', N'0', N'819432e3-e0f3-4a7a-8870-ffb435ae6282', N'False', N'2', N'c9c9a046-0e61-43df-9510-5f1530fe234f', N'88a7cce9-df9f-457c-aacf-5d97c2a81702')

INSERT INTO S_PAGE_LIST_BUTTON(BUTTON_ID, BUTTON_NAME, BUTTON_TITLE, PARAMETERS, ITEM_INDEX, PROP_IS_ACCESSIBLE, HAS_WORKGROUP, BUTTON_LOCATION, LIST_ID, FUNCTION_ID) VALUES(N'93dce915-04e0-4742-b5e5-e1bc28fef4d7', N'btnBack', N'Back', N'-1', N'2', null, N'False', N'2', N'c9c9a046-0e61-43df-9510-5f1530fe234f', N'11f35196-b107-40d4-a49c-26ce5e30500e')

INSERT INTO S_PAGE_LIST_BUTTON(BUTTON_ID, BUTTON_NAME, BUTTON_TITLE, PARAMETERS, ITEM_INDEX, PROP_IS_ACCESSIBLE, HAS_WORKGROUP, BUTTON_LOCATION, LIST_ID, FUNCTION_ID) VALUES(N'9521120b-9fd2-4054-a84c-f2ba984d4aba', N'btnNext', N'Next', N'''list.aspx?PAGE_NAME=LN_ACC_LN82800_MNT&UMode=UPD&TITLE=<!PTITLE!>&SL_NFLAG=<!SSL_NFLAG!>&SL_MREC=<!SSL_MREC!>&SL_SKEY=<!SSL_SKEY!>&SL_SFLD=<!SSL_SFLD!>&IN_POPUP=<!PIN_POPUP!>&UScreen=<!PUScreen!>'',''''', N'1', N'd97aa014-83c4-4223-80b9-39d75795432b', N'False', N'2', N'c9c9a046-0e61-43df-9510-5f1530fe234f', N'526bada3-a1af-46a2-8f34-5078b7db0e85')

INSERT INTO S_PAGE_LIST_COLUMN(COLUMN_ID, ITEM_TITLE, ITEM_INDEX, COLUMN_NAME, ITEM_TYPE, SCRIPT, QUERY, APPLY_FILTER, SHOW_TOTAL, CLASS, HAS_WORKGROUP, PARAMETERS, HTML_ENCODE, LIST_ID, FUNCTION_ID, STYLE, WIDTH) VALUES(N'4e7468c8-344f-408e-9747-06ec4538d518', N'Product Type', N'4', N'TYPE', N'TEXT', null, null, N'0', N'0', N'ssCell', N'False', null, N'0', N'c9c9a046-0e61-43df-9510-5f1530fe234f', null, null, null)

INSERT INTO S_PAGE_LIST_COLUMN(COLUMN_ID, ITEM_TITLE, ITEM_INDEX, COLUMN_NAME, ITEM_TYPE, SCRIPT, QUERY, APPLY_FILTER, SHOW_TOTAL, CLASS, HAS_WORKGROUP, PARAMETERS, HTML_ENCODE, LIST_ID, FUNCTION_ID, STYLE, WIDTH) VALUES(N'73fd65b2-9cf5-42d8-a89e-93115a2c83a8', N'Lender', N'3', N'LPLSNM', N'TEXT', null, null, N'0', N'0', N'ssCell', N'False', null, N'0', N'c9c9a046-0e61-43df-9510-5f1530fe234f', null, null, null)

INSERT INTO S_PAGE_LIST_COLUMN(COLUMN_ID, ITEM_TITLE, ITEM_INDEX, COLUMN_NAME, ITEM_TYPE, SCRIPT, QUERY, APPLY_FILTER, SHOW_TOTAL, CLASS, HAS_WORKGROUP, PARAMETERS, HTML_ENCODE, LIST_ID, FUNCTION_ID, STYLE, WIDTH) VALUES(N'a0741cbd-0e5d-46ea-b68f-b2d2bffc0dbe', N'Outstanding Principal', N'5', N'CBAL', N'TEXT', null, null, N'0', N'0', N'ssRightAlignCell', N'False', null, N'0', N'c9c9a046-0e61-43df-9510-5f1530fe234f', null, null, null)

INSERT INTO S_PAGE_LIST_COLUMN(COLUMN_ID, ITEM_TITLE, ITEM_INDEX, COLUMN_NAME, ITEM_TYPE, SCRIPT, QUERY, APPLY_FILTER, SHOW_TOTAL, CLASS, HAS_WORKGROUP, PARAMETERS, HTML_ENCODE, LIST_ID, FUNCTION_ID, STYLE, WIDTH) VALUES(N'807935f6-0a75-4866-8140-cab9ddcff8b8', N'Account Number', N'0', N'ACCTNO', N'TEXT', N'function main()
	dim ID
	dim VIEW,ACCTNO,ACTYPE,UScreen,TITLE,PGIND
	VIEW = "LN_ACC_LN85803_HDR_NEW"
	ACCTNO = scb.rs("ACCTNO")
	CIFNO = scb.rs("CIFNO")
	ACTYPE = "L"
	UScreen = scb.objRequest.queryString("UScreen")
	TITLE = scb.objRequest.queryString("TITLE")

	ID = UScreen
	select case ID
		case "FEE"
			PGIND = "LN_ACC_LN85535"
		case "CLOSEACCOUNT"
			PGIND = "LN_ACC_LN86820"
		case "INCREASE LIMIT"
			PGIND = "LN_ACC_LN86538"
		case "DECREASE LIMIT"
			PGIND = "LN_ACC_LN86539"
		case "REPAYMENT_SCH"
			VIEW = "LN_ACC_LN82582_HDR"
			PGIND= "LN_ACC_LN84582"
		case "REDEMPTION"
			PGIND = "LN_ACC_LN85830_REDP"
		case "PAYOFF"
			PGIND = "LN_ACC_LN85830"
		case "PREPAYMENT"
			PGIND = "LN_ACC_LN85831_VIEW"
		case "ACCOUNT"
			PGIND = "LN_ACC_LN83503"
		case "TRFFAC"
			PGIND = "LN_ACC_SS85001"
		case "RATE"
			PGIND = "LN_ACC_LN83503"
		case "DELINQUENCY"
			PGIND = "LN_ACC_LN83503"
		case "COMPROMISED"
			PGIND = "LN_ACC_LN85301"
		case "FEA"
			PGIND = "LN_ACC_LN85307"
		case "SCHEDULE"
			PGIND = "LN_ACC_LN86825"
		case "BILLING"
			PGIND = "LN_ACC_LN85531"
		case "AUTODEBIT"
			PGIND = "LN_ACC_LN25634"
		case "NOTICEDATE"
			PGIND = "LN_ACC_LN85533"
		case "LINKUNLINK"
			PGIND = "LN_ACC_LN85533"
		case "RESCHEDULE"
			VIEW = "LN_ACC_LN85803_HDR_NEW"
			PGIND = "LN_ACC_LN86545"
		case "RESTRUCTURE"
			VIEW = "LN_ACC_LN85803_HDR_NEW"
			PGIND = "LN_ACC_LN86545"
		case "RECALL"
			PGIND = "LN_ACC_LN86576"
		case "SWITCHCAMPAIGN"
			PGIND = "LN_ACC_LN86862"
		case "HOLDCODE"
			PGIND = "LN_ACC_LN85304"
		case "CHANGEPRODUCT"
			PGIND = "LN_ACC_LN86561"	
		case "FULLORPARTIAL"
			PGIND = "LN_ACC_LN82548"
		case "Restructuring_Main"
			PGIND = "LN_ACC_LN86864"
		case "ROLLOVER"
			PGIND = "LN_ACC_LN84700"
		case "WRITEOFFAMOUNT"
			PGIND = "LN_ACC_LN85909"	
		case "Collections"
			PGIND = "LN_ACC_LN86895_Collection_INQ"
		case else
			PGIND = "LN_ACC_LN83503"
	end select
		
		main = "<a href=''javascript:void(0)''  onclick=""gsOpenHref(null,''generic/view.aspx?VIEW_NAME="&VIEW&"&keyU_DUMMYPKID=0&UMode=INQ&MODEIND=UPD&UScreen="&UScreen&"&TITLE="&TITLE&"&PGIND="&PGIND&"&ACCTNO="&ACCTNO&"&ACTYPE=L&CIFNO="&CIFNO&"&INDTitle=AcctMaint'',''Top'','''','''');return false"">"&scb.rs("ACCTNO")&"</a>"

end function', null, N'0', N'0', N'ssCell', N'False', N'null, ''generic/view.aspx?VIEW_NAME=LN_ACC_LN85803_HDR&keyU_DUMMYPKID=0&UMode=INQ&MODEIND=UPD&PGIND=LN_ACC_LN83503&ACCTNO=<!DACCTNO!>&ACCTNO2=<!PACCTNO!>&ACTMNO=<!DACTMNO!>&ACTYPE=L&CIFNO=<!DCIFNO!>&INDTitle=listing'', ''Top'', '''', '''',false', N'0', N'c9c9a046-0e61-43df-9510-5f1530fe234f', null, null, null)

INSERT INTO S_PAGE_LIST_COLUMN(COLUMN_ID, ITEM_TITLE, ITEM_INDEX, COLUMN_NAME, ITEM_TYPE, SCRIPT, QUERY, APPLY_FILTER, SHOW_TOTAL, CLASS, HAS_WORKGROUP, PARAMETERS, HTML_ENCODE, LIST_ID, FUNCTION_ID, STYLE, WIDTH) VALUES(N'4cde2bca-0f1d-46a2-91b0-d42ae0f3cc25', N'Currency', N'1', N'CURTYP', N'TEXT', null, N'SELECT JFXCOD, JFXCOD + '' - '' + JFXDSC FROM PR_SSFXRP WHERE JFXCOD = ''<!DCURTYP!>''', N'0', N'0', N'ssCell', N'False', null, N'0', N'c9c9a046-0e61-43df-9510-5f1530fe234f', null, null, null)

INSERT INTO S_PAGE_LIST_COLUMN(COLUMN_ID, ITEM_TITLE, ITEM_INDEX, COLUMN_NAME, ITEM_TYPE, SCRIPT, QUERY, APPLY_FILTER, SHOW_TOTAL, CLASS, HAS_WORKGROUP, PARAMETERS, HTML_ENCODE, LIST_ID, FUNCTION_ID, STYLE, WIDTH) VALUES(N'd1a44810-4067-4dc2-a070-e1fca9ae9d91', N'CIF Number', N'2', N'CIFNO', N'TEXT', null, null, N'0', N'0', N'ssCell', N'False', null, N'0', N'c9c9a046-0e61-43df-9510-5f1530fe234f', null, null, null)

begin tran
                                           UPDATE S_LANGUAGE_OBJECT_VALUE SET ID=N'94ee3cd6-8b38-4d47-84e7-7566dcc03ef8', OBJECT_ID=N'1772aca7-871f-4dc3-838f-25bdf1b3eb7f', LANGUAGE_ID=N'2dad38f9-a30c-4c69-9c8f-c3a74c20fdf1', VALUE=N'Previous', RECORD_ID=N'a07f065d-cf62-4fd5-870c-db44adf6aaff', ITEM_ID=N'9891978d-37a0-4c44-8e39-c079e81b9648' WHERE ID = '94ee3cd6-8b38-4d47-84e7-7566dcc03ef8'

                                           if @@rowcount = 0
                                           begin
                                                  INSERT INTO S_LANGUAGE_OBJECT_VALUE(ID, OBJECT_ID, LANGUAGE_ID, VALUE, RECORD_ID, ITEM_ID) VALUES(N'94ee3cd6-8b38-4d47-84e7-7566dcc03ef8', N'1772aca7-871f-4dc3-838f-25bdf1b3eb7f', N'2dad38f9-a30c-4c69-9c8f-c3a74c20fdf1', N'Previous', N'a07f065d-cf62-4fd5-870c-db44adf6aaff', N'9891978d-37a0-4c44-8e39-c079e81b9648')
                                           end
                                        commit tran

begin tran
                                           UPDATE S_LANGUAGE_OBJECT_VALUE SET ID=N'e87583c0-b316-4305-8ca6-5b829aa1e0ee', OBJECT_ID=N'1772aca7-871f-4dc3-838f-25bdf1b3eb7f', LANGUAGE_ID=N'2dad38f9-a30c-4c69-9c8f-c3a74c20fdf1', VALUE=N'Back', RECORD_ID=N'93dce915-04e0-4742-b5e5-e1bc28fef4d7', ITEM_ID=N'9891978d-37a0-4c44-8e39-c079e81b9648' WHERE ID = 'e87583c0-b316-4305-8ca6-5b829aa1e0ee'

                                           if @@rowcount = 0
                                           begin
                                                  INSERT INTO S_LANGUAGE_OBJECT_VALUE(ID, OBJECT_ID, LANGUAGE_ID, VALUE, RECORD_ID, ITEM_ID) VALUES(N'e87583c0-b316-4305-8ca6-5b829aa1e0ee', N'1772aca7-871f-4dc3-838f-25bdf1b3eb7f', N'2dad38f9-a30c-4c69-9c8f-c3a74c20fdf1', N'Back', N'93dce915-04e0-4742-b5e5-e1bc28fef4d7', N'9891978d-37a0-4c44-8e39-c079e81b9648')
                                           end
                                        commit tran

begin tran
                                           UPDATE S_LANGUAGE_OBJECT_VALUE SET ID=N'105c7be9-8262-4a9c-bd82-ddadb2a3e0a5', OBJECT_ID=N'1772aca7-871f-4dc3-838f-25bdf1b3eb7f', LANGUAGE_ID=N'2dad38f9-a30c-4c69-9c8f-c3a74c20fdf1', VALUE=N'Next', RECORD_ID=N'9521120b-9fd2-4054-a84c-f2ba984d4aba', ITEM_ID=N'9891978d-37a0-4c44-8e39-c079e81b9648' WHERE ID = '105c7be9-8262-4a9c-bd82-ddadb2a3e0a5'

                                           if @@rowcount = 0
                                           begin
                                                  INSERT INTO S_LANGUAGE_OBJECT_VALUE(ID, OBJECT_ID, LANGUAGE_ID, VALUE, RECORD_ID, ITEM_ID) VALUES(N'105c7be9-8262-4a9c-bd82-ddadb2a3e0a5', N'1772aca7-871f-4dc3-838f-25bdf1b3eb7f', N'2dad38f9-a30c-4c69-9c8f-c3a74c20fdf1', N'Next', N'9521120b-9fd2-4054-a84c-f2ba984d4aba', N'9891978d-37a0-4c44-8e39-c079e81b9648')
                                           end
                                        commit tran

begin tran
                                           UPDATE S_LANGUAGE_OBJECT_VALUE SET ID=N'2dea5310-b52e-489f-8b42-1b039cf48ae2', OBJECT_ID=N'5aa247ed-ac65-4aa2-8c99-1b1ac432a51c', LANGUAGE_ID=N'2dad38f9-a30c-4c69-9c8f-c3a74c20fdf1', VALUE=N'Product Type', RECORD_ID=N'4e7468c8-344f-408e-9747-06ec4538d518', ITEM_ID=N'46dc7141-6aa7-4d6f-9e90-9fc4eaf4ee9c' WHERE ID = '2dea5310-b52e-489f-8b42-1b039cf48ae2'

                                           if @@rowcount = 0
                                           begin
                                                  INSERT INTO S_LANGUAGE_OBJECT_VALUE(ID, OBJECT_ID, LANGUAGE_ID, VALUE, RECORD_ID, ITEM_ID) VALUES(N'2dea5310-b52e-489f-8b42-1b039cf48ae2', N'5aa247ed-ac65-4aa2-8c99-1b1ac432a51c', N'2dad38f9-a30c-4c69-9c8f-c3a74c20fdf1', N'Product Type', N'4e7468c8-344f-408e-9747-06ec4538d518', N'46dc7141-6aa7-4d6f-9e90-9fc4eaf4ee9c')
                                           end
                                        commit tran

begin tran
                                           UPDATE S_LANGUAGE_OBJECT_VALUE SET ID=N'89bf3c55-79f0-4424-b013-142428f9891c', OBJECT_ID=N'5aa247ed-ac65-4aa2-8c99-1b1ac432a51c', LANGUAGE_ID=N'2dad38f9-a30c-4c69-9c8f-c3a74c20fdf1', VALUE=N'Lender', RECORD_ID=N'73fd65b2-9cf5-42d8-a89e-93115a2c83a8', ITEM_ID=N'46dc7141-6aa7-4d6f-9e90-9fc4eaf4ee9c' WHERE ID = '89bf3c55-79f0-4424-b013-142428f9891c'

                                           if @@rowcount = 0
                                           begin
                                                  INSERT INTO S_LANGUAGE_OBJECT_VALUE(ID, OBJECT_ID, LANGUAGE_ID, VALUE, RECORD_ID, ITEM_ID) VALUES(N'89bf3c55-79f0-4424-b013-142428f9891c', N'5aa247ed-ac65-4aa2-8c99-1b1ac432a51c', N'2dad38f9-a30c-4c69-9c8f-c3a74c20fdf1', N'Lender', N'73fd65b2-9cf5-42d8-a89e-93115a2c83a8', N'46dc7141-6aa7-4d6f-9e90-9fc4eaf4ee9c')
                                           end
                                        commit tran

begin tran
                                           UPDATE S_LANGUAGE_OBJECT_VALUE SET ID=N'3bc880d1-5385-4aaf-885f-43d800d1e437', OBJECT_ID=N'5aa247ed-ac65-4aa2-8c99-1b1ac432a51c', LANGUAGE_ID=N'2dad38f9-a30c-4c69-9c8f-c3a74c20fdf1', VALUE=N'Account Number', RECORD_ID=N'807935f6-0a75-4866-8140-cab9ddcff8b8', ITEM_ID=N'46dc7141-6aa7-4d6f-9e90-9fc4eaf4ee9c' WHERE ID = '3bc880d1-5385-4aaf-885f-43d800d1e437'

                                           if @@rowcount = 0
                                           begin
                                                  INSERT INTO S_LANGUAGE_OBJECT_VALUE(ID, OBJECT_ID, LANGUAGE_ID, VALUE, RECORD_ID, ITEM_ID) VALUES(N'3bc880d1-5385-4aaf-885f-43d800d1e437', N'5aa247ed-ac65-4aa2-8c99-1b1ac432a51c', N'2dad38f9-a30c-4c69-9c8f-c3a74c20fdf1', N'Account Number', N'807935f6-0a75-4866-8140-cab9ddcff8b8', N'46dc7141-6aa7-4d6f-9e90-9fc4eaf4ee9c')
                                           end
                                        commit tran

begin tran
                                           UPDATE S_LANGUAGE_OBJECT_VALUE SET ID=N'dc10b812-0413-423b-98bc-e3689227283a', OBJECT_ID=N'5aa247ed-ac65-4aa2-8c99-1b1ac432a51c', LANGUAGE_ID=N'2dad38f9-a30c-4c69-9c8f-c3a74c20fdf1', VALUE=N'Currency', RECORD_ID=N'4cde2bca-0f1d-46a2-91b0-d42ae0f3cc25', ITEM_ID=N'46dc7141-6aa7-4d6f-9e90-9fc4eaf4ee9c' WHERE ID = 'dc10b812-0413-423b-98bc-e3689227283a'

                                           if @@rowcount = 0
                                           begin
                                                  INSERT INTO S_LANGUAGE_OBJECT_VALUE(ID, OBJECT_ID, LANGUAGE_ID, VALUE, RECORD_ID, ITEM_ID) VALUES(N'dc10b812-0413-423b-98bc-e3689227283a', N'5aa247ed-ac65-4aa2-8c99-1b1ac432a51c', N'2dad38f9-a30c-4c69-9c8f-c3a74c20fdf1', N'Currency', N'4cde2bca-0f1d-46a2-91b0-d42ae0f3cc25', N'46dc7141-6aa7-4d6f-9e90-9fc4eaf4ee9c')
                                           end
                                        commit tran

begin tran
                                           UPDATE S_LANGUAGE_OBJECT_VALUE SET ID=N'6a49558c-898b-4e87-b30b-7ee6df307617', OBJECT_ID=N'5aa247ed-ac65-4aa2-8c99-1b1ac432a51c', LANGUAGE_ID=N'2dad38f9-a30c-4c69-9c8f-c3a74c20fdf1', VALUE=N'CIF Number', RECORD_ID=N'd1a44810-4067-4dc2-a070-e1fca9ae9d91', ITEM_ID=N'46dc7141-6aa7-4d6f-9e90-9fc4eaf4ee9c' WHERE ID = '6a49558c-898b-4e87-b30b-7ee6df307617'

                                           if @@rowcount = 0
                                           begin
                                                  INSERT INTO S_LANGUAGE_OBJECT_VALUE(ID, OBJECT_ID, LANGUAGE_ID, VALUE, RECORD_ID, ITEM_ID) VALUES(N'6a49558c-898b-4e87-b30b-7ee6df307617', N'5aa247ed-ac65-4aa2-8c99-1b1ac432a51c', N'2dad38f9-a30c-4c69-9c8f-c3a74c20fdf1', N'CIF Number', N'd1a44810-4067-4dc2-a070-e1fca9ae9d91', N'46dc7141-6aa7-4d6f-9e90-9fc4eaf4ee9c')
                                           end
                                        commit tran

  COMMIT
PRINT 'Import completed successfully'
  BREAK
END
