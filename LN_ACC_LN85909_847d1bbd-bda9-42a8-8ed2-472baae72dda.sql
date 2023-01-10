BEGIN TRANSACTION
WHILE 1=1
BEGIN
  IF NOT EXISTS(SELECT SCRIPT_ID FROM S_CLIENT_SCRIPT WHERE SCRIPT_ID ='1f7a6272-7dd0-4280-9171-c9c53dc35460')
  BEGIN
      PRINT 'S_CLIENT_SCRIPT [1f7a6272-7dd0-4280-9171-c9c53dc35460] is missing from target database'
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
  IF NOT EXISTS(SELECT SCRIPT_ID FROM S_CLIENT_SCRIPT WHERE SCRIPT_ID ='887f0b16-c62b-4e02-a1a8-24ee7347273c')
  BEGIN
      PRINT 'S_CLIENT_SCRIPT [887f0b16-c62b-4e02-a1a8-24ee7347273c] is missing from target database'
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
  IF NOT EXISTS(SELECT SCRIPT_ID FROM S_CLIENT_SCRIPT WHERE SCRIPT_ID ='3cfcfafc-19de-4e56-9942-48c354c486b6')
  BEGIN
      PRINT 'S_CLIENT_SCRIPT [3cfcfafc-19de-4e56-9942-48c354c486b6] is missing from target database'
      ROLLBACK
      BREAK
  END
  IF NOT EXISTS(SELECT SCRIPT_ID FROM S_CLIENT_SCRIPT WHERE SCRIPT_ID ='d631efb1-d33d-42ce-9cb2-4be4ecae0973')
  BEGIN
      PRINT 'S_CLIENT_SCRIPT [d631efb1-d33d-42ce-9cb2-4be4ecae0973] is missing from target database'
      ROLLBACK
      BREAK
  END
  IF NOT EXISTS(SELECT SCRIPT_ID FROM S_CLIENT_SCRIPT WHERE SCRIPT_ID ='a4f4c1e9-8b33-455a-b9c5-4fa2c8513a87')
  BEGIN
      PRINT 'S_CLIENT_SCRIPT [a4f4c1e9-8b33-455a-b9c5-4fa2c8513a87] is missing from target database'
      ROLLBACK
      BREAK
  END
  IF NOT EXISTS(SELECT SCRIPT_ID FROM S_CLIENT_SCRIPT WHERE SCRIPT_ID ='526bada3-a1af-46a2-8f34-5078b7db0e85')
  BEGIN
      PRINT 'S_CLIENT_SCRIPT [526bada3-a1af-46a2-8f34-5078b7db0e85] is missing from target database'
      ROLLBACK
      BREAK
  END
  IF NOT EXISTS(SELECT SCRIPT_ID FROM S_CLIENT_SCRIPT WHERE SCRIPT_ID ='c4cba7d7-e7f2-4c64-bb12-5bf0e9a5aa39')
  BEGIN
      PRINT 'S_CLIENT_SCRIPT [c4cba7d7-e7f2-4c64-bb12-5bf0e9a5aa39] is missing from target database'
      ROLLBACK
      BREAK
  END
  IF NOT EXISTS(SELECT SCRIPT_ID FROM S_CLIENT_SCRIPT WHERE SCRIPT_ID ='88a7cce9-df9f-457c-aacf-5d97c2a81702')
  BEGIN
      PRINT 'S_CLIENT_SCRIPT [88a7cce9-df9f-457c-aacf-5d97c2a81702] is missing from target database'
      ROLLBACK
      BREAK
  END
  IF NOT EXISTS(SELECT SCRIPT_ID FROM S_CLIENT_SCRIPT WHERE SCRIPT_ID ='f60a2051-8c21-4a3e-a268-5e22908e9b5b')
  BEGIN
      PRINT 'S_CLIENT_SCRIPT [f60a2051-8c21-4a3e-a268-5e22908e9b5b] is missing from target database'
      ROLLBACK
      BREAK
  END
  IF NOT EXISTS(SELECT SCRIPT_ID FROM S_CLIENT_SCRIPT WHERE SCRIPT_ID ='169f5514-c7d1-4057-80d9-62f1f73df440')
  BEGIN
      PRINT 'S_CLIENT_SCRIPT [169f5514-c7d1-4057-80d9-62f1f73df440] is missing from target database'
      ROLLBACK
      BREAK
  END
  IF NOT EXISTS(SELECT SCRIPT_ID FROM S_CLIENT_SCRIPT WHERE SCRIPT_ID ='92bda00c-dbf2-4b64-aa41-73ca9c2ca3ad')
  BEGIN
      PRINT 'S_CLIENT_SCRIPT [92bda00c-dbf2-4b64-aa41-73ca9c2ca3ad] is missing from target database'
      ROLLBACK
      BREAK
  END
  IF NOT EXISTS(SELECT SCRIPT_ID FROM S_CLIENT_SCRIPT WHERE SCRIPT_ID ='70c61392-1482-4309-946e-789451f86759')
  BEGIN
      PRINT 'S_CLIENT_SCRIPT [70c61392-1482-4309-946e-789451f86759] is missing from target database'
      ROLLBACK
      BREAK
  END
  IF NOT EXISTS(SELECT SCRIPT_ID FROM S_CLIENT_SCRIPT WHERE SCRIPT_ID ='65882f45-20e1-4c6c-a7d9-7da5f969a91d')
  BEGIN
      PRINT 'S_CLIENT_SCRIPT [65882f45-20e1-4c6c-a7d9-7da5f969a91d] is missing from target database'
      ROLLBACK
      BREAK
  END
  IF NOT EXISTS(SELECT SCRIPT_ID FROM S_CLIENT_SCRIPT WHERE SCRIPT_ID ='9e54e25a-d863-44f4-9f52-8091122841a6')
  BEGIN
      PRINT 'S_CLIENT_SCRIPT [9e54e25a-d863-44f4-9f52-8091122841a6] is missing from target database'
      ROLLBACK
      BREAK
  END
  IF NOT EXISTS(SELECT SCRIPT_ID FROM S_CLIENT_SCRIPT WHERE SCRIPT_ID ='e0dbef3c-840e-41d3-8ade-850921e61c24')
  BEGIN
      PRINT 'S_CLIENT_SCRIPT [e0dbef3c-840e-41d3-8ade-850921e61c24] is missing from target database'
      ROLLBACK
      BREAK
  END
  IF NOT EXISTS(SELECT SCRIPT_ID FROM S_CLIENT_SCRIPT WHERE SCRIPT_ID ='ba12a762-cfac-4344-a502-87559b26f919')
  BEGIN
      PRINT 'S_CLIENT_SCRIPT [ba12a762-cfac-4344-a502-87559b26f919] is missing from target database'
      ROLLBACK
      BREAK
  END
  IF NOT EXISTS(SELECT SCRIPT_ID FROM S_CLIENT_SCRIPT WHERE SCRIPT_ID ='c2ff1eec-def9-48ad-8273-884c7488eec8')
  BEGIN
      PRINT 'S_CLIENT_SCRIPT [c2ff1eec-def9-48ad-8273-884c7488eec8] is missing from target database'
      ROLLBACK
      BREAK
  END
  IF NOT EXISTS(SELECT SCRIPT_ID FROM S_CLIENT_SCRIPT WHERE SCRIPT_ID ='a86e9b27-f88c-46fe-9e3a-9cf8f26abd8f')
  BEGIN
      PRINT 'S_CLIENT_SCRIPT [a86e9b27-f88c-46fe-9e3a-9cf8f26abd8f] is missing from target database'
      ROLLBACK
      BREAK
  END
  IF NOT EXISTS(SELECT SCRIPT_ID FROM S_CLIENT_SCRIPT WHERE SCRIPT_ID ='50b0df13-b9ba-4d2c-880e-afb14f85f3b6')
  BEGIN
      PRINT 'S_CLIENT_SCRIPT [50b0df13-b9ba-4d2c-880e-afb14f85f3b6] is missing from target database'
      ROLLBACK
      BREAK
  END
  IF NOT EXISTS(SELECT SCRIPT_ID FROM S_CLIENT_SCRIPT WHERE SCRIPT_ID ='d0431d3a-a554-4800-8076-bf1329af5578')
  BEGIN
      PRINT 'S_CLIENT_SCRIPT [d0431d3a-a554-4800-8076-bf1329af5578] is missing from target database'
      ROLLBACK
      BREAK
  END
  IF NOT EXISTS(SELECT SCRIPT_ID FROM S_CLIENT_SCRIPT WHERE SCRIPT_ID ='983729d7-cfa6-4297-a0e2-d63f7a3188f7')
  BEGIN
      PRINT 'S_CLIENT_SCRIPT [983729d7-cfa6-4297-a0e2-d63f7a3188f7] is missing from target database'
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
DELETE FROM S_PAGE_LIST_COLUMN_WORKGROUP WHERE COLUMN_ID IN(SELECT COLUMN_ID FROM S_PAGE_LIST_COLUMN WHERE LIST_ID IN( SELECT LIST_ID FROM S_PAGE_LIST WHERE PAGE_ID='847d1bbd-bda9-42a8-8ed2-472baae72dda'))
DELETE FROM S_LANGUAGE_OBJECT_VALUE WHERE RECORD_ID IN(SELECT COLUMN_ID FROM S_PAGE_LIST_COLUMN WHERE LIST_ID IN( SELECT LIST_ID FROM S_PAGE_LIST WHERE PAGE_ID='847d1bbd-bda9-42a8-8ed2-472baae72dda'))
DELETE FROM S_PAGE_LIST_BUTTON_WORKGROUP WHERE BUTTON_ID IN(SELECT BUTTON_ID FROM S_PAGE_LIST_BUTTON WHERE LIST_ID IN( SELECT LIST_ID FROM S_PAGE_LIST WHERE PAGE_ID='847d1bbd-bda9-42a8-8ed2-472baae72dda'))
DELETE FROM S_LANGUAGE_OBJECT_VALUE WHERE RECORD_ID IN(SELECT BUTTON_ID FROM S_PAGE_LIST_BUTTON WHERE LIST_ID IN( SELECT LIST_ID FROM S_PAGE_LIST WHERE PAGE_ID='847d1bbd-bda9-42a8-8ed2-472baae72dda'))
DELETE FROM S_PAGE_FILTER_ACTION WHERE FILTER_ID IN( SELECT FILTER_ID FROM S_PAGE_FILTER WHERE PAGE_ID='847d1bbd-bda9-42a8-8ed2-472baae72dda')
DELETE FROM S_LANGUAGE_OBJECT_VALUE WHERE RECORD_ID IN( SELECT FILTER_ID FROM S_PAGE_FILTER WHERE PAGE_ID='847d1bbd-bda9-42a8-8ed2-472baae72dda')
DELETE FROM S_PAGE_FILTER_WORKGROUP WHERE FILTER_ID IN( SELECT FILTER_ID FROM S_PAGE_FILTER WHERE PAGE_ID='847d1bbd-bda9-42a8-8ed2-472baae72dda')
DELETE FROM S_LANGUAGE_OBJECT_VALUE WHERE RECORD_ID IN( SELECT FILTER_ID FROM S_PAGE_FILTER WHERE PAGE_ID='847d1bbd-bda9-42a8-8ed2-472baae72dda')
DELETE FROM S_PAGE_LIST_COLUMN WHERE LIST_ID IN( SELECT LIST_ID FROM S_PAGE_LIST WHERE PAGE_ID='847d1bbd-bda9-42a8-8ed2-472baae72dda')
DELETE FROM S_LANGUAGE_OBJECT_VALUE WHERE RECORD_ID IN( SELECT LIST_ID FROM S_PAGE_LIST WHERE PAGE_ID='847d1bbd-bda9-42a8-8ed2-472baae72dda')
DELETE FROM S_PAGE_LIST_WORKGROUP WHERE LIST_ID IN( SELECT LIST_ID FROM S_PAGE_LIST WHERE PAGE_ID='847d1bbd-bda9-42a8-8ed2-472baae72dda')
DELETE FROM S_LANGUAGE_OBJECT_VALUE WHERE RECORD_ID IN( SELECT LIST_ID FROM S_PAGE_LIST WHERE PAGE_ID='847d1bbd-bda9-42a8-8ed2-472baae72dda')
DELETE FROM S_PAGE_LIST_BUTTON WHERE LIST_ID IN( SELECT LIST_ID FROM S_PAGE_LIST WHERE PAGE_ID='847d1bbd-bda9-42a8-8ed2-472baae72dda')
DELETE FROM S_LANGUAGE_OBJECT_VALUE WHERE RECORD_ID IN( SELECT LIST_ID FROM S_PAGE_LIST WHERE PAGE_ID='847d1bbd-bda9-42a8-8ed2-472baae72dda')
DELETE FROM S_PAGE_WORKGROUP WHERE PAGE_ID = '847d1bbd-bda9-42a8-8ed2-472baae72dda'
DELETE FROM S_PAGE_FILTER WHERE PAGE_ID = '847d1bbd-bda9-42a8-8ed2-472baae72dda'
DELETE FROM S_PAGE_BUTTON WHERE PAGE_ID = '847d1bbd-bda9-42a8-8ed2-472baae72dda'
DELETE FROM S_PAGE_CLIENT_SCRIPT WHERE PAGE_ID = '847d1bbd-bda9-42a8-8ed2-472baae72dda'
DELETE FROM S_PAGE_LIST WHERE PAGE_ID = '847d1bbd-bda9-42a8-8ed2-472baae72dda'
DELETE FROM S_PAGE WHERE PAGE_ID = '847d1bbd-bda9-42a8-8ed2-472baae72dda'
DELETE FROM S_LANGUAGE_OBJECT_VALUE WHERE RECORD_ID = '847d1bbd-bda9-42a8-8ed2-472baae72dda'




  -- Insert scripts
INSERT INTO S_PAGE(PAGE_ID, PAGE_NAME, PAGE_TITLE, FILTER_TITLE, STYLE_SHEET, DATA_DATABASE, HAS_FILTER_BUTTONS, RESULTS_ON_LOAD, PAGE_TYPE, HISTORY_TITLE, ONLOAD_CLIENTSCRIPT_ID, ONLOAD_SERVERSCRIPT_ID, HISTORY_CONTEXT_ID) VALUES(N'847d1bbd-bda9-42a8-8ed2-472baae72dda', N'LN_ACC_LN85909', N'LN85909 - Write-off Amount', N'', N'list.css', null, N'True', N'1', N'0', N'LN85909 - Write-off Amount', N'1f7a6272-7dd0-4280-9171-c9c53dc35460', null, null)

begin tran
                                           UPDATE S_LANGUAGE_OBJECT_VALUE SET ID=N'186cf20b-2329-4ca9-965d-616890419dba', OBJECT_ID=N'2b675db2-6fc9-4ddc-afeb-52c247b5e37d', LANGUAGE_ID=N'2dad38f9-a30c-4c69-9c8f-c3a74c20fdf1', VALUE=N'LN85909 - Write-off Amount', RECORD_ID=N'847d1bbd-bda9-42a8-8ed2-472baae72dda', ITEM_ID=N'0a8445a4-bbcf-4450-8471-d5d72d7e9b7b' WHERE ID = '186cf20b-2329-4ca9-965d-616890419dba'

                                           if @@rowcount = 0
                                           begin
                                                  INSERT INTO S_LANGUAGE_OBJECT_VALUE(ID, OBJECT_ID, LANGUAGE_ID, VALUE, RECORD_ID, ITEM_ID) VALUES(N'186cf20b-2329-4ca9-965d-616890419dba', N'2b675db2-6fc9-4ddc-afeb-52c247b5e37d', N'2dad38f9-a30c-4c69-9c8f-c3a74c20fdf1', N'LN85909 - Write-off Amount', N'847d1bbd-bda9-42a8-8ed2-472baae72dda', N'0a8445a4-bbcf-4450-8471-d5d72d7e9b7b')
                                           end
                                        commit tran

begin tran
                                           UPDATE S_LANGUAGE_OBJECT_VALUE SET ID=N'cef7fd46-6ebc-4087-97b2-9db16eb92613', OBJECT_ID=N'2b675db2-6fc9-4ddc-afeb-52c247b5e37d', LANGUAGE_ID=N'2dad38f9-a30c-4c69-9c8f-c3a74c20fdf1', VALUE=N'LN85909 - Write-off Amount', RECORD_ID=N'847d1bbd-bda9-42a8-8ed2-472baae72dda', ITEM_ID=N'c041dfda-1e71-4b6f-8044-783af00e10f9' WHERE ID = 'cef7fd46-6ebc-4087-97b2-9db16eb92613'

                                           if @@rowcount = 0
                                           begin
                                                  INSERT INTO S_LANGUAGE_OBJECT_VALUE(ID, OBJECT_ID, LANGUAGE_ID, VALUE, RECORD_ID, ITEM_ID) VALUES(N'cef7fd46-6ebc-4087-97b2-9db16eb92613', N'2b675db2-6fc9-4ddc-afeb-52c247b5e37d', N'2dad38f9-a30c-4c69-9c8f-c3a74c20fdf1', N'LN85909 - Write-off Amount', N'847d1bbd-bda9-42a8-8ed2-472baae72dda', N'c041dfda-1e71-4b6f-8044-783af00e10f9')
                                           end
                                        commit tran

INSERT INTO S_PAGE_LIST(LIST_ID, LIST_NAME, LIST_TITLE, LIST_QUERY, PER_PAGE_LIMIT, ITEM_INDEX, SHOW_COUNT, APPLY_FILTER, HAS_WORKGROUP, TEMPLATE_HANDLES_PAGING, DATA_TRANSFORMATION_SCRIPT, DATA_TRANSFORMATION_FUNC_NAME, DATA_TRANSFORMATION_SCRIPT_LANGUAGE, RECORD_RETRIEVE_METHOD, PAGE_ID, PRESENTATION_TEMPLATE_ID, USE_NOLOCK) VALUES(N'37d0dad3-b755-4bb4-a5fc-df67b4b37f43', N'MAIN', N'', N'dim XMLHeader, XMLInqData, sts, err

XMLHeader = "LN85909" ''xml name
scb.objSession("errMsg")=""

''replacing to dp.addargument
dim ACCTNO,ACTYPE

ACCTNO= scb.objRequest.QueryString("ACCTNO")
ACTYPE = scb.objRequest.QueryString("ACTYPE")

XMLInqData = "<ACCTNO>"&ACCTNO&"</ACCTNO>"
XMLInqData = XMLInqData  & "<ACTYPE>"&ACTYPE&"</ACTYPE>"

scb.loadServerScript("5f74a9a3-9a50-4b35-83d4-9f2f54057ddf")
call gsInquiryFromHost(XMLHeader, XMLInqData, "PAGE", sts, err,buffer1,buffer2,buffer3,buffer4,buffer5,buffer6) ''PAGE or VIEW      sts-AB/AA', N'-1', N'0', N'0', N'0', N'False', N'0', null, null, N'372', N'2', N'847d1bbd-bda9-42a8-8ed2-472baae72dda', N'675ee91f-a1ef-484f-bd0e-dc199565b9f7', N'True')

INSERT INTO S_PAGE_CLIENT_SCRIPT(PAGE_ID, SCRIPT_ID) VALUES(N'847d1bbd-bda9-42a8-8ed2-472baae72dda', N'530441a9-945f-4c66-b3a9-026cd05bab5d')

INSERT INTO S_PAGE_CLIENT_SCRIPT(PAGE_ID, SCRIPT_ID) VALUES(N'847d1bbd-bda9-42a8-8ed2-472baae72dda', N'5e6237f3-0a9b-4353-a320-039cbc5b9dfa')

INSERT INTO S_PAGE_CLIENT_SCRIPT(PAGE_ID, SCRIPT_ID) VALUES(N'847d1bbd-bda9-42a8-8ed2-472baae72dda', N'5f3c9a24-f00b-4d09-9d6c-05c75a9d519d')

INSERT INTO S_PAGE_CLIENT_SCRIPT(PAGE_ID, SCRIPT_ID) VALUES(N'847d1bbd-bda9-42a8-8ed2-472baae72dda', N'6349ee47-4f14-4a76-bf17-0873c302b4c8')

INSERT INTO S_PAGE_CLIENT_SCRIPT(PAGE_ID, SCRIPT_ID) VALUES(N'847d1bbd-bda9-42a8-8ed2-472baae72dda', N'e21053bd-0f3f-4029-8596-0ff07ffc0450')

INSERT INTO S_PAGE_CLIENT_SCRIPT(PAGE_ID, SCRIPT_ID) VALUES(N'847d1bbd-bda9-42a8-8ed2-472baae72dda', N'887f0b16-c62b-4e02-a1a8-24ee7347273c')

INSERT INTO S_PAGE_CLIENT_SCRIPT(PAGE_ID, SCRIPT_ID) VALUES(N'847d1bbd-bda9-42a8-8ed2-472baae72dda', N'11f35196-b107-40d4-a49c-26ce5e30500e')

INSERT INTO S_PAGE_CLIENT_SCRIPT(PAGE_ID, SCRIPT_ID) VALUES(N'847d1bbd-bda9-42a8-8ed2-472baae72dda', N'87fbd8b8-184a-413f-a4d4-2e345b572880')

INSERT INTO S_PAGE_CLIENT_SCRIPT(PAGE_ID, SCRIPT_ID) VALUES(N'847d1bbd-bda9-42a8-8ed2-472baae72dda', N'3cfcfafc-19de-4e56-9942-48c354c486b6')

INSERT INTO S_PAGE_CLIENT_SCRIPT(PAGE_ID, SCRIPT_ID) VALUES(N'847d1bbd-bda9-42a8-8ed2-472baae72dda', N'd631efb1-d33d-42ce-9cb2-4be4ecae0973')

INSERT INTO S_PAGE_CLIENT_SCRIPT(PAGE_ID, SCRIPT_ID) VALUES(N'847d1bbd-bda9-42a8-8ed2-472baae72dda', N'a4f4c1e9-8b33-455a-b9c5-4fa2c8513a87')

INSERT INTO S_PAGE_CLIENT_SCRIPT(PAGE_ID, SCRIPT_ID) VALUES(N'847d1bbd-bda9-42a8-8ed2-472baae72dda', N'526bada3-a1af-46a2-8f34-5078b7db0e85')

INSERT INTO S_PAGE_CLIENT_SCRIPT(PAGE_ID, SCRIPT_ID) VALUES(N'847d1bbd-bda9-42a8-8ed2-472baae72dda', N'c4cba7d7-e7f2-4c64-bb12-5bf0e9a5aa39')

INSERT INTO S_PAGE_CLIENT_SCRIPT(PAGE_ID, SCRIPT_ID) VALUES(N'847d1bbd-bda9-42a8-8ed2-472baae72dda', N'88a7cce9-df9f-457c-aacf-5d97c2a81702')

INSERT INTO S_PAGE_CLIENT_SCRIPT(PAGE_ID, SCRIPT_ID) VALUES(N'847d1bbd-bda9-42a8-8ed2-472baae72dda', N'f60a2051-8c21-4a3e-a268-5e22908e9b5b')

INSERT INTO S_PAGE_CLIENT_SCRIPT(PAGE_ID, SCRIPT_ID) VALUES(N'847d1bbd-bda9-42a8-8ed2-472baae72dda', N'169f5514-c7d1-4057-80d9-62f1f73df440')

INSERT INTO S_PAGE_CLIENT_SCRIPT(PAGE_ID, SCRIPT_ID) VALUES(N'847d1bbd-bda9-42a8-8ed2-472baae72dda', N'92bda00c-dbf2-4b64-aa41-73ca9c2ca3ad')

INSERT INTO S_PAGE_CLIENT_SCRIPT(PAGE_ID, SCRIPT_ID) VALUES(N'847d1bbd-bda9-42a8-8ed2-472baae72dda', N'70c61392-1482-4309-946e-789451f86759')

INSERT INTO S_PAGE_CLIENT_SCRIPT(PAGE_ID, SCRIPT_ID) VALUES(N'847d1bbd-bda9-42a8-8ed2-472baae72dda', N'65882f45-20e1-4c6c-a7d9-7da5f969a91d')

INSERT INTO S_PAGE_CLIENT_SCRIPT(PAGE_ID, SCRIPT_ID) VALUES(N'847d1bbd-bda9-42a8-8ed2-472baae72dda', N'9e54e25a-d863-44f4-9f52-8091122841a6')

INSERT INTO S_PAGE_CLIENT_SCRIPT(PAGE_ID, SCRIPT_ID) VALUES(N'847d1bbd-bda9-42a8-8ed2-472baae72dda', N'e0dbef3c-840e-41d3-8ade-850921e61c24')

INSERT INTO S_PAGE_CLIENT_SCRIPT(PAGE_ID, SCRIPT_ID) VALUES(N'847d1bbd-bda9-42a8-8ed2-472baae72dda', N'ba12a762-cfac-4344-a502-87559b26f919')

INSERT INTO S_PAGE_CLIENT_SCRIPT(PAGE_ID, SCRIPT_ID) VALUES(N'847d1bbd-bda9-42a8-8ed2-472baae72dda', N'c2ff1eec-def9-48ad-8273-884c7488eec8')

INSERT INTO S_PAGE_CLIENT_SCRIPT(PAGE_ID, SCRIPT_ID) VALUES(N'847d1bbd-bda9-42a8-8ed2-472baae72dda', N'a86e9b27-f88c-46fe-9e3a-9cf8f26abd8f')

INSERT INTO S_PAGE_CLIENT_SCRIPT(PAGE_ID, SCRIPT_ID) VALUES(N'847d1bbd-bda9-42a8-8ed2-472baae72dda', N'50b0df13-b9ba-4d2c-880e-afb14f85f3b6')

INSERT INTO S_PAGE_CLIENT_SCRIPT(PAGE_ID, SCRIPT_ID) VALUES(N'847d1bbd-bda9-42a8-8ed2-472baae72dda', N'd0431d3a-a554-4800-8076-bf1329af5578')

INSERT INTO S_PAGE_CLIENT_SCRIPT(PAGE_ID, SCRIPT_ID) VALUES(N'847d1bbd-bda9-42a8-8ed2-472baae72dda', N'1f7a6272-7dd0-4280-9171-c9c53dc35460')

INSERT INTO S_PAGE_CLIENT_SCRIPT(PAGE_ID, SCRIPT_ID) VALUES(N'847d1bbd-bda9-42a8-8ed2-472baae72dda', N'983729d7-cfa6-4297-a0e2-d63f7a3188f7')

INSERT INTO S_PAGE_CLIENT_SCRIPT(PAGE_ID, SCRIPT_ID) VALUES(N'847d1bbd-bda9-42a8-8ed2-472baae72dda', N'cdc4ba65-2983-44d9-965a-f7e44a3684bb')

INSERT INTO S_PAGE_BUTTON(BUTTON_ID, BUTTON_TITLE, ITEM_INDEX, HAS_WORKGROUP, PROP_IS_ACCESSIBLE, PARAMETERS, BUTTON_NAME, PAGE_ID, FUNCTION_ID) VALUES(N'4b1e021e-0672-4381-9b1f-4df43d7c7533', N'Delete', N'0', null, N'21f24641-5970-4be7-b998-8e817dc27d8b', N'''chkItem'',null,''generic/view.aspx?VIEW_NAME=LN_ACC_LN86909&keyU_DUMMYPKID=0&UMode=DEL&BackUMode=UPD&NextAction=D'','''','''','''','''',false', N'btnDelete', N'847d1bbd-bda9-42a8-8ed2-472baae72dda', N'983729d7-cfa6-4297-a0e2-d63f7a3188f7')

INSERT INTO S_PAGE_BUTTON(BUTTON_ID, BUTTON_TITLE, ITEM_INDEX, HAS_WORKGROUP, PROP_IS_ACCESSIBLE, PARAMETERS, BUTTON_NAME, PAGE_ID, FUNCTION_ID) VALUES(N'd9db8988-d487-468d-8503-6ff3259f3828', N'New', N'1', null, N'21f24641-5970-4be7-b998-8e817dc27d8b', N'null,''generic/view.aspx?VIEW_NAME=LN_ACC_LN86909&UMode=ADD&A$ACCTNO=''+gsGetQueryString(''ACCTNO'','''')+''&ACTYPE=''+gsGetQueryString(''ACTYPE'',''''),'''','''','''','''',true', N'btnAdd', N'847d1bbd-bda9-42a8-8ed2-472baae72dda', N'cdc4ba65-2983-44d9-965a-f7e44a3684bb')

INSERT INTO S_PAGE_FILTER(FILTER_ID, FILTER_NAME, FIELD_NAME, FILTER_TYPE, FILTER_TITLE, FILTER_QUERY, ITEM_INDEX, ITEM_SUB_INDEX, FILTER_WIDTH, FILTER_VALUE, HAS_ACTION, HAS_WORKGROUP, ALLOW_EMPTY, EMPTY_VALUE, REF_NAME, ITEM_VALUE, INITIAL_VALUE, TEXT_DATABASE_FIELD, IS_QUICK_SEARCH, APPLY, HIDDEN, IS_MAINTAINABLE, COMPLEX_COLUMN, PROFILE_AREA_ID, PAGE_ID, OWNER_ID, IS_DELAYED_LIST, MAX_LENGTH) VALUES(N'b2c7e2a0-7320-45c6-8c93-1efec32b2063', N'SL_NFLAG', null, N'TEXT', N'SL_NFLAG', null, N'10', N'0', null, null, N'False', N'False', N'0', null, null, null, null, N'1', N'0', N'1', N'1', N'0', N'0', null, N'847d1bbd-bda9-42a8-8ed2-472baae72dda', null, null, null)

INSERT INTO S_PAGE_LIST_BUTTON(BUTTON_ID, BUTTON_NAME, BUTTON_TITLE, PARAMETERS, ITEM_INDEX, PROP_IS_ACCESSIBLE, HAS_WORKGROUP, BUTTON_LOCATION, LIST_ID, FUNCTION_ID) VALUES(N'3bbfed64-94a3-4360-87e3-1bc4766e504a', N'btnPrev', N'Previous', N'-1', N'0', N'819432e3-e0f3-4a7a-8870-ffb435ae6282', N'False', N'2', N'37d0dad3-b755-4bb4-a5fc-df67b4b37f43', N'88a7cce9-df9f-457c-aacf-5d97c2a81702')

INSERT INTO S_PAGE_LIST_BUTTON(BUTTON_ID, BUTTON_NAME, BUTTON_TITLE, PARAMETERS, ITEM_INDEX, PROP_IS_ACCESSIBLE, HAS_WORKGROUP, BUTTON_LOCATION, LIST_ID, FUNCTION_ID) VALUES(N'5c258a7e-e374-47d4-89f5-8b2d8d58f8ec', N'btnNext', N'Next', N'''list.aspx?PAGE_NAME=LN_ACC_LN85909&SL_NFLAG=<!SSL_NFLAG!>&SL_MREC=<!SSL_MREC!>&SL_SKEY=<!SSL_SKEY!>&SL_SFLD=<!SSL_SFLD!>'',''ACCTNO,ACTYPE''', N'1', N'd97aa014-83c4-4223-80b9-39d75795432b', N'False', N'2', N'37d0dad3-b755-4bb4-a5fc-df67b4b37f43', N'526bada3-a1af-46a2-8f34-5078b7db0e85')

INSERT INTO S_PAGE_LIST_BUTTON(BUTTON_ID, BUTTON_NAME, BUTTON_TITLE, PARAMETERS, ITEM_INDEX, PROP_IS_ACCESSIBLE, HAS_WORKGROUP, BUTTON_LOCATION, LIST_ID, FUNCTION_ID) VALUES(N'903bf6c5-9f13-4e3b-a351-df3f28923607', N'btnBack', N'Back', null, N'0', null, N'False', N'2', N'37d0dad3-b755-4bb4-a5fc-df67b4b37f43', N'd0431d3a-a554-4800-8076-bf1329af5578')

INSERT INTO S_PAGE_LIST_COLUMN(COLUMN_ID, ITEM_TITLE, ITEM_INDEX, COLUMN_NAME, ITEM_TYPE, SCRIPT, QUERY, APPLY_FILTER, SHOW_TOTAL, CLASS, HAS_WORKGROUP, PARAMETERS, HTML_ENCODE, LIST_ID, FUNCTION_ID, STYLE, WIDTH) VALUES(N'f5286515-490e-44ce-8798-076bc0d31feb', N'Write-off Date', N'15', N'PWDT8', N'TEXT', null, null, N'0', N'0', N'ssCell', N'False', null, N'0', N'37d0dad3-b755-4bb4-a5fc-df67b4b37f43', null, null, null)

INSERT INTO S_PAGE_LIST_COLUMN(COLUMN_ID, ITEM_TITLE, ITEM_INDEX, COLUMN_NAME, ITEM_TYPE, SCRIPT, QUERY, APPLY_FILTER, SHOW_TOTAL, CLASS, HAS_WORKGROUP, PARAMETERS, HTML_ENCODE, LIST_ID, FUNCTION_ID, STYLE, WIDTH) VALUES(N'd77e4cbb-acc7-48b9-853b-2275a71f9c99', N'Write-off Restructure Interest', N'10', N'PWRESINT', N'TEXT', null, null, N'0', N'0', N'ssCell', N'False', null, N'0', N'37d0dad3-b755-4bb4-a5fc-df67b4b37f43', null, null, null)

INSERT INTO S_PAGE_LIST_COLUMN(COLUMN_ID, ITEM_TITLE, ITEM_INDEX, COLUMN_NAME, ITEM_TYPE, SCRIPT, QUERY, APPLY_FILTER, SHOW_TOTAL, CLASS, HAS_WORKGROUP, PARAMETERS, HTML_ENCODE, LIST_ID, FUNCTION_ID, STYLE, WIDTH) VALUES(N'34731c78-8434-4069-ae1f-36fd8e58e19f', N'Write-off Accrued Moratorium Interest', N'12', N'PWMORINT', N'TEXT', null, null, N'0', N'0', N'ssCell', N'False', null, N'0', N'37d0dad3-b755-4bb4-a5fc-df67b4b37f43', null, null, null)

INSERT INTO S_PAGE_LIST_COLUMN(COLUMN_ID, ITEM_TITLE, ITEM_INDEX, COLUMN_NAME, ITEM_TYPE, SCRIPT, QUERY, APPLY_FILTER, SHOW_TOTAL, CLASS, HAS_WORKGROUP, PARAMETERS, HTML_ENCODE, LIST_ID, FUNCTION_ID, STYLE, WIDTH) VALUES(N'8e5bdbcb-dfe5-4954-a1d6-5d6f471a816b', N'Write-off Advance Payment', N'13', N'PWADVPMT', N'TEXT', null, null, N'0', N'0', N'ssCell', N'False', null, N'0', N'37d0dad3-b755-4bb4-a5fc-df67b4b37f43', null, null, null)

INSERT INTO S_PAGE_LIST_COLUMN(COLUMN_ID, ITEM_TITLE, ITEM_INDEX, COLUMN_NAME, ITEM_TYPE, SCRIPT, QUERY, APPLY_FILTER, SHOW_TOTAL, CLASS, HAS_WORKGROUP, PARAMETERS, HTML_ENCODE, LIST_ID, FUNCTION_ID, STYLE, WIDTH) VALUES(N'ad54aa78-4c0a-4158-b0b1-605e8d1a5165', N'Write-off Current Balance', N'2', N'PWCBAL', N'TEXT', null, null, N'0', N'0', N'ssCell', N'False', null, N'0', N'37d0dad3-b755-4bb4-a5fc-df67b4b37f43', null, null, null)

INSERT INTO S_PAGE_LIST_COLUMN(COLUMN_ID, ITEM_TITLE, ITEM_INDEX, COLUMN_NAME, ITEM_TYPE, SCRIPT, QUERY, APPLY_FILTER, SHOW_TOTAL, CLASS, HAS_WORKGROUP, PARAMETERS, HTML_ENCODE, LIST_ID, FUNCTION_ID, STYLE, WIDTH) VALUES(N'b5c6bab2-0922-4347-8e9a-7dfbff32be21', N'Write-off Accrued Interest', N'3', N'PWACCINT', N'TEXT', null, null, N'0', N'0', N'ssCell', N'False', null, N'0', N'37d0dad3-b755-4bb4-a5fc-df67b4b37f43', null, null, null)

INSERT INTO S_PAGE_LIST_COLUMN(COLUMN_ID, ITEM_TITLE, ITEM_INDEX, COLUMN_NAME, ITEM_TYPE, SCRIPT, QUERY, APPLY_FILTER, SHOW_TOTAL, CLASS, HAS_WORKGROUP, PARAMETERS, HTML_ENCODE, LIST_ID, FUNCTION_ID, STYLE, WIDTH) VALUES(N'1bbc625c-a165-4d15-b92d-9568f0a45844', N'Write-off Total Outstanding', N'14', N'PWCURPO', N'TEXT', null, null, N'0', N'0', N'ssCell', N'False', null, N'0', N'37d0dad3-b755-4bb4-a5fc-df67b4b37f43', null, null, null)

INSERT INTO S_PAGE_LIST_COLUMN(COLUMN_ID, ITEM_TITLE, ITEM_INDEX, COLUMN_NAME, ITEM_TYPE, SCRIPT, QUERY, APPLY_FILTER, SHOW_TOTAL, CLASS, HAS_WORKGROUP, PARAMETERS, HTML_ENCODE, LIST_ID, FUNCTION_ID, STYLE, WIDTH) VALUES(N'f39f11eb-7b46-417d-8654-95e2caaf0b1e', N'Write-off Interest Rebate', N'5', N'PWINTR', N'TEXT', null, null, N'0', N'0', N'ssCell', N'False', null, N'0', N'37d0dad3-b755-4bb4-a5fc-df67b4b37f43', null, null, null)

INSERT INTO S_PAGE_LIST_COLUMN(COLUMN_ID, ITEM_TITLE, ITEM_INDEX, COLUMN_NAME, ITEM_TYPE, SCRIPT, QUERY, APPLY_FILTER, SHOW_TOTAL, CLASS, HAS_WORKGROUP, PARAMETERS, HTML_ENCODE, LIST_ID, FUNCTION_ID, STYLE, WIDTH) VALUES(N'f7ba335e-6430-4339-9220-a82166f928e7', N'Account Number', N'1', N'ACCTNO', N'TEXT', null, null, N'0', N'0', N'ssCell', N'False', N'null,''generic/view.aspx?VIEW_NAME=LN_ACC_LN86909&keyU_DUMMYPKID=0&UMode=<!PUmode!>&ACCTNO=<!PACCTNO!>&ACTYPE=<!DACTYPE!>&RCTYPE=<!DRCTYPE!>&PWDT8=<!DPWDT8!>'',''''', N'0', N'37d0dad3-b755-4bb4-a5fc-df67b4b37f43', N'cdc4ba65-2983-44d9-965a-f7e44a3684bb', null, null)

INSERT INTO S_PAGE_LIST_COLUMN(COLUMN_ID, ITEM_TITLE, ITEM_INDEX, COLUMN_NAME, ITEM_TYPE, SCRIPT, QUERY, APPLY_FILTER, SHOW_TOTAL, CLASS, HAS_WORKGROUP, PARAMETERS, HTML_ENCODE, LIST_ID, FUNCTION_ID, STYLE, WIDTH) VALUES(N'eee7efe3-b27f-4431-a291-ab1bf072e7f8', N'Write-off Other Charge', N'8', N'PWOTHCHG', N'TEXT', null, null, N'0', N'0', N'ssCell', N'False', null, N'0', N'37d0dad3-b755-4bb4-a5fc-df67b4b37f43', null, null, null)

INSERT INTO S_PAGE_LIST_COLUMN(COLUMN_ID, ITEM_TITLE, ITEM_INDEX, COLUMN_NAME, ITEM_TYPE, SCRIPT, QUERY, APPLY_FILTER, SHOW_TOTAL, CLASS, HAS_WORKGROUP, PARAMETERS, HTML_ENCODE, LIST_ID, FUNCTION_ID, STYLE, WIDTH) VALUES(N'cee5198d-3dc1-482e-bc0b-c17a5594741a', N'Write-off Bank Discount', N'4', N'PWBKSC', N'TEXT', null, null, N'0', N'0', N'ssCell', N'False', null, N'0', N'37d0dad3-b755-4bb4-a5fc-df67b4b37f43', null, null, null)

INSERT INTO S_PAGE_LIST_COLUMN(COLUMN_ID, ITEM_TITLE, ITEM_INDEX, COLUMN_NAME, ITEM_TYPE, SCRIPT, QUERY, APPLY_FILTER, SHOW_TOTAL, CLASS, HAS_WORKGROUP, PARAMETERS, HTML_ENCODE, LIST_ID, FUNCTION_ID, STYLE, WIDTH) VALUES(N'991c02d9-cc43-4a63-89eb-d5193cd52ef6', N'hiddenRCTYPE', N'16', N'RCTYPE', N'TEXT', null, null, N'0', N'0', N'hidden', N'False', null, N'0', N'37d0dad3-b755-4bb4-a5fc-df67b4b37f43', null, null, null)

INSERT INTO S_PAGE_LIST_COLUMN(COLUMN_ID, ITEM_TITLE, ITEM_INDEX, COLUMN_NAME, ITEM_TYPE, SCRIPT, QUERY, APPLY_FILTER, SHOW_TOTAL, CLASS, HAS_WORKGROUP, PARAMETERS, HTML_ENCODE, LIST_ID, FUNCTION_ID, STYLE, WIDTH) VALUES(N'111ac5cc-fe45-4736-9de6-dbd9db33c49c', N'Write-off Late Charge', N'6', N'PWLC', N'TEXT', null, null, N'0', N'0', N'ssCell', N'False', null, N'0', N'37d0dad3-b755-4bb4-a5fc-df67b4b37f43', null, null, null)

INSERT INTO S_PAGE_LIST_COLUMN(COLUMN_ID, ITEM_TITLE, ITEM_INDEX, COLUMN_NAME, ITEM_TYPE, SCRIPT, QUERY, APPLY_FILTER, SHOW_TOTAL, CLASS, HAS_WORKGROUP, PARAMETERS, HTML_ENCODE, LIST_ID, FUNCTION_ID, STYLE, WIDTH) VALUES(N'40169a49-44a2-4187-a2b0-e69fd22ef669', N'CHKBOX', N'0', N'CHKBOX', N'TEXT', N'function main()

main="<input type=''checkbox'' class=checkbox onclick=gsLineSelected(this)  value=''{@}ACCTNO="& SCB.RS("ACCTNO")&"{@}ACTYPE="& SCB.RS("ACTYPE")&"{@}RCTYPE="& SCB.RS("RCTYPE")&"{@}PWDT8="& SCB.RS("PWDT8")&"{@}NextAction=D'' id=''chkItem''>"

end function', null, N'0', N'0', N'ssCell', N'False', null, N'0', N'37d0dad3-b755-4bb4-a5fc-df67b4b37f43', null, N'width: 30px;', null)

INSERT INTO S_PAGE_LIST_COLUMN(COLUMN_ID, ITEM_TITLE, ITEM_INDEX, COLUMN_NAME, ITEM_TYPE, SCRIPT, QUERY, APPLY_FILTER, SHOW_TOTAL, CLASS, HAS_WORKGROUP, PARAMETERS, HTML_ENCODE, LIST_ID, FUNCTION_ID, STYLE, WIDTH) VALUES(N'7f650aae-ecf1-4d3e-b840-f5b331e424e4', N'Write-off Restructure Late Charge', N'11', N'PWRESLC', N'TEXT', null, null, N'0', N'0', N'ssCell', N'False', null, N'0', N'37d0dad3-b755-4bb4-a5fc-df67b4b37f43', null, null, null)

INSERT INTO S_PAGE_LIST_COLUMN(COLUMN_ID, ITEM_TITLE, ITEM_INDEX, COLUMN_NAME, ITEM_TYPE, SCRIPT, QUERY, APPLY_FILTER, SHOW_TOTAL, CLASS, HAS_WORKGROUP, PARAMETERS, HTML_ENCODE, LIST_ID, FUNCTION_ID, STYLE, WIDTH) VALUES(N'f6caa50e-6edf-4c4d-92e4-fe4542e317b9', N'Write-off Commitment Fee', N'7', N'PWCOM', N'TEXT', null, null, N'0', N'0', N'ssCell', N'False', null, N'0', N'37d0dad3-b755-4bb4-a5fc-df67b4b37f43', null, null, null)

INSERT INTO S_PAGE_LIST_COLUMN(COLUMN_ID, ITEM_TITLE, ITEM_INDEX, COLUMN_NAME, ITEM_TYPE, SCRIPT, QUERY, APPLY_FILTER, SHOW_TOTAL, CLASS, HAS_WORKGROUP, PARAMETERS, HTML_ENCODE, LIST_ID, FUNCTION_ID, STYLE, WIDTH) VALUES(N'3372ea55-05e5-443f-af32-feade0319780', N'Write-off Miscellaneous Charges', N'9', N'PWMISCD', N'TEXT', null, null, N'0', N'0', N'ssCell', N'False', null, N'0', N'37d0dad3-b755-4bb4-a5fc-df67b4b37f43', null, null, null)

begin tran
                                           UPDATE S_LANGUAGE_OBJECT_VALUE SET ID=N'd468d138-1787-4189-9c71-04c46c75fde5', OBJECT_ID=N'1772aca7-871f-4dc3-838f-25bdf1b3eb7f', LANGUAGE_ID=N'2dad38f9-a30c-4c69-9c8f-c3a74c20fdf1', VALUE=N'Previous', RECORD_ID=N'3bbfed64-94a3-4360-87e3-1bc4766e504a', ITEM_ID=N'9891978d-37a0-4c44-8e39-c079e81b9648' WHERE ID = 'd468d138-1787-4189-9c71-04c46c75fde5'

                                           if @@rowcount = 0
                                           begin
                                                  INSERT INTO S_LANGUAGE_OBJECT_VALUE(ID, OBJECT_ID, LANGUAGE_ID, VALUE, RECORD_ID, ITEM_ID) VALUES(N'd468d138-1787-4189-9c71-04c46c75fde5', N'1772aca7-871f-4dc3-838f-25bdf1b3eb7f', N'2dad38f9-a30c-4c69-9c8f-c3a74c20fdf1', N'Previous', N'3bbfed64-94a3-4360-87e3-1bc4766e504a', N'9891978d-37a0-4c44-8e39-c079e81b9648')
                                           end
                                        commit tran

begin tran
                                           UPDATE S_LANGUAGE_OBJECT_VALUE SET ID=N'edca6528-4393-4b43-a99c-c5cd63a6bd3e', OBJECT_ID=N'1772aca7-871f-4dc3-838f-25bdf1b3eb7f', LANGUAGE_ID=N'2dad38f9-a30c-4c69-9c8f-c3a74c20fdf1', VALUE=N'Next', RECORD_ID=N'5c258a7e-e374-47d4-89f5-8b2d8d58f8ec', ITEM_ID=N'9891978d-37a0-4c44-8e39-c079e81b9648' WHERE ID = 'edca6528-4393-4b43-a99c-c5cd63a6bd3e'

                                           if @@rowcount = 0
                                           begin
                                                  INSERT INTO S_LANGUAGE_OBJECT_VALUE(ID, OBJECT_ID, LANGUAGE_ID, VALUE, RECORD_ID, ITEM_ID) VALUES(N'edca6528-4393-4b43-a99c-c5cd63a6bd3e', N'1772aca7-871f-4dc3-838f-25bdf1b3eb7f', N'2dad38f9-a30c-4c69-9c8f-c3a74c20fdf1', N'Next', N'5c258a7e-e374-47d4-89f5-8b2d8d58f8ec', N'9891978d-37a0-4c44-8e39-c079e81b9648')
                                           end
                                        commit tran

begin tran
                                           UPDATE S_LANGUAGE_OBJECT_VALUE SET ID=N'31ce7ab3-08f2-480a-8aa1-97a946a8db53', OBJECT_ID=N'1772aca7-871f-4dc3-838f-25bdf1b3eb7f', LANGUAGE_ID=N'2dad38f9-a30c-4c69-9c8f-c3a74c20fdf1', VALUE=N'Back', RECORD_ID=N'903bf6c5-9f13-4e3b-a351-df3f28923607', ITEM_ID=N'9891978d-37a0-4c44-8e39-c079e81b9648' WHERE ID = '31ce7ab3-08f2-480a-8aa1-97a946a8db53'

                                           if @@rowcount = 0
                                           begin
                                                  INSERT INTO S_LANGUAGE_OBJECT_VALUE(ID, OBJECT_ID, LANGUAGE_ID, VALUE, RECORD_ID, ITEM_ID) VALUES(N'31ce7ab3-08f2-480a-8aa1-97a946a8db53', N'1772aca7-871f-4dc3-838f-25bdf1b3eb7f', N'2dad38f9-a30c-4c69-9c8f-c3a74c20fdf1', N'Back', N'903bf6c5-9f13-4e3b-a351-df3f28923607', N'9891978d-37a0-4c44-8e39-c079e81b9648')
                                           end
                                        commit tran

begin tran
                                           UPDATE S_LANGUAGE_OBJECT_VALUE SET ID=N'66102f74-a30f-4887-9742-23e92ad5c971', OBJECT_ID=N'5aa247ed-ac65-4aa2-8c99-1b1ac432a51c', LANGUAGE_ID=N'2dad38f9-a30c-4c69-9c8f-c3a74c20fdf1', VALUE=N'Write-off Date', RECORD_ID=N'f5286515-490e-44ce-8798-076bc0d31feb', ITEM_ID=N'46dc7141-6aa7-4d6f-9e90-9fc4eaf4ee9c' WHERE ID = '66102f74-a30f-4887-9742-23e92ad5c971'

                                           if @@rowcount = 0
                                           begin
                                                  INSERT INTO S_LANGUAGE_OBJECT_VALUE(ID, OBJECT_ID, LANGUAGE_ID, VALUE, RECORD_ID, ITEM_ID) VALUES(N'66102f74-a30f-4887-9742-23e92ad5c971', N'5aa247ed-ac65-4aa2-8c99-1b1ac432a51c', N'2dad38f9-a30c-4c69-9c8f-c3a74c20fdf1', N'Write-off Date', N'f5286515-490e-44ce-8798-076bc0d31feb', N'46dc7141-6aa7-4d6f-9e90-9fc4eaf4ee9c')
                                           end
                                        commit tran

begin tran
                                           UPDATE S_LANGUAGE_OBJECT_VALUE SET ID=N'fcedb45b-a296-49de-86cd-ec62b4814ed0', OBJECT_ID=N'5aa247ed-ac65-4aa2-8c99-1b1ac432a51c', LANGUAGE_ID=N'2dad38f9-a30c-4c69-9c8f-c3a74c20fdf1', VALUE=N'Write-off Restructure Interest', RECORD_ID=N'd77e4cbb-acc7-48b9-853b-2275a71f9c99', ITEM_ID=N'46dc7141-6aa7-4d6f-9e90-9fc4eaf4ee9c' WHERE ID = 'fcedb45b-a296-49de-86cd-ec62b4814ed0'

                                           if @@rowcount = 0
                                           begin
                                                  INSERT INTO S_LANGUAGE_OBJECT_VALUE(ID, OBJECT_ID, LANGUAGE_ID, VALUE, RECORD_ID, ITEM_ID) VALUES(N'fcedb45b-a296-49de-86cd-ec62b4814ed0', N'5aa247ed-ac65-4aa2-8c99-1b1ac432a51c', N'2dad38f9-a30c-4c69-9c8f-c3a74c20fdf1', N'Write-off Restructure Interest', N'd77e4cbb-acc7-48b9-853b-2275a71f9c99', N'46dc7141-6aa7-4d6f-9e90-9fc4eaf4ee9c')
                                           end
                                        commit tran

begin tran
                                           UPDATE S_LANGUAGE_OBJECT_VALUE SET ID=N'3a3a470c-d6e2-4ddf-88b0-e85117f8c610', OBJECT_ID=N'5aa247ed-ac65-4aa2-8c99-1b1ac432a51c', LANGUAGE_ID=N'2dad38f9-a30c-4c69-9c8f-c3a74c20fdf1', VALUE=N'Write-off Accrued Moratorium Interest', RECORD_ID=N'34731c78-8434-4069-ae1f-36fd8e58e19f', ITEM_ID=N'46dc7141-6aa7-4d6f-9e90-9fc4eaf4ee9c' WHERE ID = '3a3a470c-d6e2-4ddf-88b0-e85117f8c610'

                                           if @@rowcount = 0
                                           begin
                                                  INSERT INTO S_LANGUAGE_OBJECT_VALUE(ID, OBJECT_ID, LANGUAGE_ID, VALUE, RECORD_ID, ITEM_ID) VALUES(N'3a3a470c-d6e2-4ddf-88b0-e85117f8c610', N'5aa247ed-ac65-4aa2-8c99-1b1ac432a51c', N'2dad38f9-a30c-4c69-9c8f-c3a74c20fdf1', N'Write-off Accrued Moratorium Interest', N'34731c78-8434-4069-ae1f-36fd8e58e19f', N'46dc7141-6aa7-4d6f-9e90-9fc4eaf4ee9c')
                                           end
                                        commit tran

begin tran
                                           UPDATE S_LANGUAGE_OBJECT_VALUE SET ID=N'b7995d38-6fa0-4049-bf41-2ddd55decb2a', OBJECT_ID=N'5aa247ed-ac65-4aa2-8c99-1b1ac432a51c', LANGUAGE_ID=N'2dad38f9-a30c-4c69-9c8f-c3a74c20fdf1', VALUE=N'Write-off Advance Payment', RECORD_ID=N'8e5bdbcb-dfe5-4954-a1d6-5d6f471a816b', ITEM_ID=N'46dc7141-6aa7-4d6f-9e90-9fc4eaf4ee9c' WHERE ID = 'b7995d38-6fa0-4049-bf41-2ddd55decb2a'

                                           if @@rowcount = 0
                                           begin
                                                  INSERT INTO S_LANGUAGE_OBJECT_VALUE(ID, OBJECT_ID, LANGUAGE_ID, VALUE, RECORD_ID, ITEM_ID) VALUES(N'b7995d38-6fa0-4049-bf41-2ddd55decb2a', N'5aa247ed-ac65-4aa2-8c99-1b1ac432a51c', N'2dad38f9-a30c-4c69-9c8f-c3a74c20fdf1', N'Write-off Advance Payment', N'8e5bdbcb-dfe5-4954-a1d6-5d6f471a816b', N'46dc7141-6aa7-4d6f-9e90-9fc4eaf4ee9c')
                                           end
                                        commit tran

begin tran
                                           UPDATE S_LANGUAGE_OBJECT_VALUE SET ID=N'8eb3799e-e02a-4a08-9a0d-4b2b88ce5c37', OBJECT_ID=N'5aa247ed-ac65-4aa2-8c99-1b1ac432a51c', LANGUAGE_ID=N'2dad38f9-a30c-4c69-9c8f-c3a74c20fdf1', VALUE=N'Write-off Current Balance', RECORD_ID=N'ad54aa78-4c0a-4158-b0b1-605e8d1a5165', ITEM_ID=N'46dc7141-6aa7-4d6f-9e90-9fc4eaf4ee9c' WHERE ID = '8eb3799e-e02a-4a08-9a0d-4b2b88ce5c37'

                                           if @@rowcount = 0
                                           begin
                                                  INSERT INTO S_LANGUAGE_OBJECT_VALUE(ID, OBJECT_ID, LANGUAGE_ID, VALUE, RECORD_ID, ITEM_ID) VALUES(N'8eb3799e-e02a-4a08-9a0d-4b2b88ce5c37', N'5aa247ed-ac65-4aa2-8c99-1b1ac432a51c', N'2dad38f9-a30c-4c69-9c8f-c3a74c20fdf1', N'Write-off Current Balance', N'ad54aa78-4c0a-4158-b0b1-605e8d1a5165', N'46dc7141-6aa7-4d6f-9e90-9fc4eaf4ee9c')
                                           end
                                        commit tran

begin tran
                                           UPDATE S_LANGUAGE_OBJECT_VALUE SET ID=N'09cc615c-0b64-4019-a591-16305ae872d5', OBJECT_ID=N'5aa247ed-ac65-4aa2-8c99-1b1ac432a51c', LANGUAGE_ID=N'2dad38f9-a30c-4c69-9c8f-c3a74c20fdf1', VALUE=N'Write-off Accrued Interest', RECORD_ID=N'b5c6bab2-0922-4347-8e9a-7dfbff32be21', ITEM_ID=N'46dc7141-6aa7-4d6f-9e90-9fc4eaf4ee9c' WHERE ID = '09cc615c-0b64-4019-a591-16305ae872d5'

                                           if @@rowcount = 0
                                           begin
                                                  INSERT INTO S_LANGUAGE_OBJECT_VALUE(ID, OBJECT_ID, LANGUAGE_ID, VALUE, RECORD_ID, ITEM_ID) VALUES(N'09cc615c-0b64-4019-a591-16305ae872d5', N'5aa247ed-ac65-4aa2-8c99-1b1ac432a51c', N'2dad38f9-a30c-4c69-9c8f-c3a74c20fdf1', N'Write-off Accrued Interest', N'b5c6bab2-0922-4347-8e9a-7dfbff32be21', N'46dc7141-6aa7-4d6f-9e90-9fc4eaf4ee9c')
                                           end
                                        commit tran

begin tran
                                           UPDATE S_LANGUAGE_OBJECT_VALUE SET ID=N'57c37e00-08df-4946-b1e8-058aab5493f8', OBJECT_ID=N'5aa247ed-ac65-4aa2-8c99-1b1ac432a51c', LANGUAGE_ID=N'2dad38f9-a30c-4c69-9c8f-c3a74c20fdf1', VALUE=N'Write-off Total Outstanding', RECORD_ID=N'1bbc625c-a165-4d15-b92d-9568f0a45844', ITEM_ID=N'46dc7141-6aa7-4d6f-9e90-9fc4eaf4ee9c' WHERE ID = '57c37e00-08df-4946-b1e8-058aab5493f8'

                                           if @@rowcount = 0
                                           begin
                                                  INSERT INTO S_LANGUAGE_OBJECT_VALUE(ID, OBJECT_ID, LANGUAGE_ID, VALUE, RECORD_ID, ITEM_ID) VALUES(N'57c37e00-08df-4946-b1e8-058aab5493f8', N'5aa247ed-ac65-4aa2-8c99-1b1ac432a51c', N'2dad38f9-a30c-4c69-9c8f-c3a74c20fdf1', N'Write-off Total Outstanding', N'1bbc625c-a165-4d15-b92d-9568f0a45844', N'46dc7141-6aa7-4d6f-9e90-9fc4eaf4ee9c')
                                           end
                                        commit tran

begin tran
                                           UPDATE S_LANGUAGE_OBJECT_VALUE SET ID=N'16ea5954-d9ed-41aa-b59a-18628334542a', OBJECT_ID=N'5aa247ed-ac65-4aa2-8c99-1b1ac432a51c', LANGUAGE_ID=N'2dad38f9-a30c-4c69-9c8f-c3a74c20fdf1', VALUE=N'Write-off Interest Rebate', RECORD_ID=N'f39f11eb-7b46-417d-8654-95e2caaf0b1e', ITEM_ID=N'46dc7141-6aa7-4d6f-9e90-9fc4eaf4ee9c' WHERE ID = '16ea5954-d9ed-41aa-b59a-18628334542a'

                                           if @@rowcount = 0
                                           begin
                                                  INSERT INTO S_LANGUAGE_OBJECT_VALUE(ID, OBJECT_ID, LANGUAGE_ID, VALUE, RECORD_ID, ITEM_ID) VALUES(N'16ea5954-d9ed-41aa-b59a-18628334542a', N'5aa247ed-ac65-4aa2-8c99-1b1ac432a51c', N'2dad38f9-a30c-4c69-9c8f-c3a74c20fdf1', N'Write-off Interest Rebate', N'f39f11eb-7b46-417d-8654-95e2caaf0b1e', N'46dc7141-6aa7-4d6f-9e90-9fc4eaf4ee9c')
                                           end
                                        commit tran

begin tran
                                           UPDATE S_LANGUAGE_OBJECT_VALUE SET ID=N'8f5296e9-5fdf-414c-8f6b-42944516e079', OBJECT_ID=N'5aa247ed-ac65-4aa2-8c99-1b1ac432a51c', LANGUAGE_ID=N'2dad38f9-a30c-4c69-9c8f-c3a74c20fdf1', VALUE=N'Account Number', RECORD_ID=N'f7ba335e-6430-4339-9220-a82166f928e7', ITEM_ID=N'46dc7141-6aa7-4d6f-9e90-9fc4eaf4ee9c' WHERE ID = '8f5296e9-5fdf-414c-8f6b-42944516e079'

                                           if @@rowcount = 0
                                           begin
                                                  INSERT INTO S_LANGUAGE_OBJECT_VALUE(ID, OBJECT_ID, LANGUAGE_ID, VALUE, RECORD_ID, ITEM_ID) VALUES(N'8f5296e9-5fdf-414c-8f6b-42944516e079', N'5aa247ed-ac65-4aa2-8c99-1b1ac432a51c', N'2dad38f9-a30c-4c69-9c8f-c3a74c20fdf1', N'Account Number', N'f7ba335e-6430-4339-9220-a82166f928e7', N'46dc7141-6aa7-4d6f-9e90-9fc4eaf4ee9c')
                                           end
                                        commit tran

begin tran
                                           UPDATE S_LANGUAGE_OBJECT_VALUE SET ID=N'147532a0-cdc4-4526-8651-323311a7d4f3', OBJECT_ID=N'5aa247ed-ac65-4aa2-8c99-1b1ac432a51c', LANGUAGE_ID=N'2dad38f9-a30c-4c69-9c8f-c3a74c20fdf1', VALUE=N'Write-off Other Charge', RECORD_ID=N'eee7efe3-b27f-4431-a291-ab1bf072e7f8', ITEM_ID=N'46dc7141-6aa7-4d6f-9e90-9fc4eaf4ee9c' WHERE ID = '147532a0-cdc4-4526-8651-323311a7d4f3'

                                           if @@rowcount = 0
                                           begin
                                                  INSERT INTO S_LANGUAGE_OBJECT_VALUE(ID, OBJECT_ID, LANGUAGE_ID, VALUE, RECORD_ID, ITEM_ID) VALUES(N'147532a0-cdc4-4526-8651-323311a7d4f3', N'5aa247ed-ac65-4aa2-8c99-1b1ac432a51c', N'2dad38f9-a30c-4c69-9c8f-c3a74c20fdf1', N'Write-off Other Charge', N'eee7efe3-b27f-4431-a291-ab1bf072e7f8', N'46dc7141-6aa7-4d6f-9e90-9fc4eaf4ee9c')
                                           end
                                        commit tran

begin tran
                                           UPDATE S_LANGUAGE_OBJECT_VALUE SET ID=N'801ba52f-7b2e-4730-ac75-c2adb2cc312a', OBJECT_ID=N'5aa247ed-ac65-4aa2-8c99-1b1ac432a51c', LANGUAGE_ID=N'2dad38f9-a30c-4c69-9c8f-c3a74c20fdf1', VALUE=N'Write-off Bank Discount', RECORD_ID=N'cee5198d-3dc1-482e-bc0b-c17a5594741a', ITEM_ID=N'46dc7141-6aa7-4d6f-9e90-9fc4eaf4ee9c' WHERE ID = '801ba52f-7b2e-4730-ac75-c2adb2cc312a'

                                           if @@rowcount = 0
                                           begin
                                                  INSERT INTO S_LANGUAGE_OBJECT_VALUE(ID, OBJECT_ID, LANGUAGE_ID, VALUE, RECORD_ID, ITEM_ID) VALUES(N'801ba52f-7b2e-4730-ac75-c2adb2cc312a', N'5aa247ed-ac65-4aa2-8c99-1b1ac432a51c', N'2dad38f9-a30c-4c69-9c8f-c3a74c20fdf1', N'Write-off Bank Discount', N'cee5198d-3dc1-482e-bc0b-c17a5594741a', N'46dc7141-6aa7-4d6f-9e90-9fc4eaf4ee9c')
                                           end
                                        commit tran

begin tran
                                           UPDATE S_LANGUAGE_OBJECT_VALUE SET ID=N'd2fea6a2-a3c0-47a2-88da-71498f7ee76d', OBJECT_ID=N'5aa247ed-ac65-4aa2-8c99-1b1ac432a51c', LANGUAGE_ID=N'2dad38f9-a30c-4c69-9c8f-c3a74c20fdf1', VALUE=N'hiddenRCTYPE', RECORD_ID=N'991c02d9-cc43-4a63-89eb-d5193cd52ef6', ITEM_ID=N'46dc7141-6aa7-4d6f-9e90-9fc4eaf4ee9c' WHERE ID = 'd2fea6a2-a3c0-47a2-88da-71498f7ee76d'

                                           if @@rowcount = 0
                                           begin
                                                  INSERT INTO S_LANGUAGE_OBJECT_VALUE(ID, OBJECT_ID, LANGUAGE_ID, VALUE, RECORD_ID, ITEM_ID) VALUES(N'd2fea6a2-a3c0-47a2-88da-71498f7ee76d', N'5aa247ed-ac65-4aa2-8c99-1b1ac432a51c', N'2dad38f9-a30c-4c69-9c8f-c3a74c20fdf1', N'hiddenRCTYPE', N'991c02d9-cc43-4a63-89eb-d5193cd52ef6', N'46dc7141-6aa7-4d6f-9e90-9fc4eaf4ee9c')
                                           end
                                        commit tran

begin tran
                                           UPDATE S_LANGUAGE_OBJECT_VALUE SET ID=N'76a54655-b7bc-4744-b174-26bd2b440d8a', OBJECT_ID=N'5aa247ed-ac65-4aa2-8c99-1b1ac432a51c', LANGUAGE_ID=N'2dad38f9-a30c-4c69-9c8f-c3a74c20fdf1', VALUE=N'Write-off Late Charge', RECORD_ID=N'111ac5cc-fe45-4736-9de6-dbd9db33c49c', ITEM_ID=N'46dc7141-6aa7-4d6f-9e90-9fc4eaf4ee9c' WHERE ID = '76a54655-b7bc-4744-b174-26bd2b440d8a'

                                           if @@rowcount = 0
                                           begin
                                                  INSERT INTO S_LANGUAGE_OBJECT_VALUE(ID, OBJECT_ID, LANGUAGE_ID, VALUE, RECORD_ID, ITEM_ID) VALUES(N'76a54655-b7bc-4744-b174-26bd2b440d8a', N'5aa247ed-ac65-4aa2-8c99-1b1ac432a51c', N'2dad38f9-a30c-4c69-9c8f-c3a74c20fdf1', N'Write-off Late Charge', N'111ac5cc-fe45-4736-9de6-dbd9db33c49c', N'46dc7141-6aa7-4d6f-9e90-9fc4eaf4ee9c')
                                           end
                                        commit tran

begin tran
                                           UPDATE S_LANGUAGE_OBJECT_VALUE SET ID=N'0880efce-a29b-493f-a08d-ad78d137d6b0', OBJECT_ID=N'5aa247ed-ac65-4aa2-8c99-1b1ac432a51c', LANGUAGE_ID=N'2dad38f9-a30c-4c69-9c8f-c3a74c20fdf1', VALUE=N'CHKBOX', RECORD_ID=N'40169a49-44a2-4187-a2b0-e69fd22ef669', ITEM_ID=N'46dc7141-6aa7-4d6f-9e90-9fc4eaf4ee9c' WHERE ID = '0880efce-a29b-493f-a08d-ad78d137d6b0'

                                           if @@rowcount = 0
                                           begin
                                                  INSERT INTO S_LANGUAGE_OBJECT_VALUE(ID, OBJECT_ID, LANGUAGE_ID, VALUE, RECORD_ID, ITEM_ID) VALUES(N'0880efce-a29b-493f-a08d-ad78d137d6b0', N'5aa247ed-ac65-4aa2-8c99-1b1ac432a51c', N'2dad38f9-a30c-4c69-9c8f-c3a74c20fdf1', N'CHKBOX', N'40169a49-44a2-4187-a2b0-e69fd22ef669', N'46dc7141-6aa7-4d6f-9e90-9fc4eaf4ee9c')
                                           end
                                        commit tran

begin tran
                                           UPDATE S_LANGUAGE_OBJECT_VALUE SET ID=N'36af2b94-a654-492c-9165-f135de583c83', OBJECT_ID=N'5aa247ed-ac65-4aa2-8c99-1b1ac432a51c', LANGUAGE_ID=N'2dad38f9-a30c-4c69-9c8f-c3a74c20fdf1', VALUE=N'Write-off Restructure Late Charge', RECORD_ID=N'7f650aae-ecf1-4d3e-b840-f5b331e424e4', ITEM_ID=N'46dc7141-6aa7-4d6f-9e90-9fc4eaf4ee9c' WHERE ID = '36af2b94-a654-492c-9165-f135de583c83'

                                           if @@rowcount = 0
                                           begin
                                                  INSERT INTO S_LANGUAGE_OBJECT_VALUE(ID, OBJECT_ID, LANGUAGE_ID, VALUE, RECORD_ID, ITEM_ID) VALUES(N'36af2b94-a654-492c-9165-f135de583c83', N'5aa247ed-ac65-4aa2-8c99-1b1ac432a51c', N'2dad38f9-a30c-4c69-9c8f-c3a74c20fdf1', N'Write-off Restructure Late Charge', N'7f650aae-ecf1-4d3e-b840-f5b331e424e4', N'46dc7141-6aa7-4d6f-9e90-9fc4eaf4ee9c')
                                           end
                                        commit tran

begin tran
                                           UPDATE S_LANGUAGE_OBJECT_VALUE SET ID=N'25bc38af-37e0-4bcf-b0e0-5fdbdfec13a2', OBJECT_ID=N'5aa247ed-ac65-4aa2-8c99-1b1ac432a51c', LANGUAGE_ID=N'2dad38f9-a30c-4c69-9c8f-c3a74c20fdf1', VALUE=N'Write-off Commitment Fee', RECORD_ID=N'f6caa50e-6edf-4c4d-92e4-fe4542e317b9', ITEM_ID=N'46dc7141-6aa7-4d6f-9e90-9fc4eaf4ee9c' WHERE ID = '25bc38af-37e0-4bcf-b0e0-5fdbdfec13a2'

                                           if @@rowcount = 0
                                           begin
                                                  INSERT INTO S_LANGUAGE_OBJECT_VALUE(ID, OBJECT_ID, LANGUAGE_ID, VALUE, RECORD_ID, ITEM_ID) VALUES(N'25bc38af-37e0-4bcf-b0e0-5fdbdfec13a2', N'5aa247ed-ac65-4aa2-8c99-1b1ac432a51c', N'2dad38f9-a30c-4c69-9c8f-c3a74c20fdf1', N'Write-off Commitment Fee', N'f6caa50e-6edf-4c4d-92e4-fe4542e317b9', N'46dc7141-6aa7-4d6f-9e90-9fc4eaf4ee9c')
                                           end
                                        commit tran

begin tran
                                           UPDATE S_LANGUAGE_OBJECT_VALUE SET ID=N'afa633cb-bf97-47c7-b6fd-13335c489a4c', OBJECT_ID=N'5aa247ed-ac65-4aa2-8c99-1b1ac432a51c', LANGUAGE_ID=N'2dad38f9-a30c-4c69-9c8f-c3a74c20fdf1', VALUE=N'Write-off Miscellaneous Charges', RECORD_ID=N'3372ea55-05e5-443f-af32-feade0319780', ITEM_ID=N'46dc7141-6aa7-4d6f-9e90-9fc4eaf4ee9c' WHERE ID = 'afa633cb-bf97-47c7-b6fd-13335c489a4c'

                                           if @@rowcount = 0
                                           begin
                                                  INSERT INTO S_LANGUAGE_OBJECT_VALUE(ID, OBJECT_ID, LANGUAGE_ID, VALUE, RECORD_ID, ITEM_ID) VALUES(N'afa633cb-bf97-47c7-b6fd-13335c489a4c', N'5aa247ed-ac65-4aa2-8c99-1b1ac432a51c', N'2dad38f9-a30c-4c69-9c8f-c3a74c20fdf1', N'Write-off Miscellaneous Charges', N'3372ea55-05e5-443f-af32-feade0319780', N'46dc7141-6aa7-4d6f-9e90-9fc4eaf4ee9c')
                                           end
                                        commit tran

begin tran
                                           UPDATE S_LANGUAGE_OBJECT_VALUE SET ID=N'c6b699e6-bd97-4595-a83f-e98bd4915589', OBJECT_ID=N'0176b9ac-87e2-44db-92a3-de16dc13ef7c', LANGUAGE_ID=N'2dad38f9-a30c-4c69-9c8f-c3a74c20fdf1', VALUE=N'Delete', RECORD_ID=N'4b1e021e-0672-4381-9b1f-4df43d7c7533', ITEM_ID=N'1ee65654-70f5-4dbe-b2a7-b3dfe4a84de3' WHERE ID = 'c6b699e6-bd97-4595-a83f-e98bd4915589'

                                           if @@rowcount = 0
                                           begin
                                                  INSERT INTO S_LANGUAGE_OBJECT_VALUE(ID, OBJECT_ID, LANGUAGE_ID, VALUE, RECORD_ID, ITEM_ID) VALUES(N'c6b699e6-bd97-4595-a83f-e98bd4915589', N'0176b9ac-87e2-44db-92a3-de16dc13ef7c', N'2dad38f9-a30c-4c69-9c8f-c3a74c20fdf1', N'Delete', N'4b1e021e-0672-4381-9b1f-4df43d7c7533', N'1ee65654-70f5-4dbe-b2a7-b3dfe4a84de3')
                                           end
                                        commit tran

begin tran
                                           UPDATE S_LANGUAGE_OBJECT_VALUE SET ID=N'5cd74ee2-59b4-49dd-a17f-158fa1937418', OBJECT_ID=N'0176b9ac-87e2-44db-92a3-de16dc13ef7c', LANGUAGE_ID=N'2dad38f9-a30c-4c69-9c8f-c3a74c20fdf1', VALUE=N'New', RECORD_ID=N'd9db8988-d487-468d-8503-6ff3259f3828', ITEM_ID=N'1ee65654-70f5-4dbe-b2a7-b3dfe4a84de3' WHERE ID = '5cd74ee2-59b4-49dd-a17f-158fa1937418'

                                           if @@rowcount = 0
                                           begin
                                                  INSERT INTO S_LANGUAGE_OBJECT_VALUE(ID, OBJECT_ID, LANGUAGE_ID, VALUE, RECORD_ID, ITEM_ID) VALUES(N'5cd74ee2-59b4-49dd-a17f-158fa1937418', N'0176b9ac-87e2-44db-92a3-de16dc13ef7c', N'2dad38f9-a30c-4c69-9c8f-c3a74c20fdf1', N'New', N'd9db8988-d487-468d-8503-6ff3259f3828', N'1ee65654-70f5-4dbe-b2a7-b3dfe4a84de3')
                                           end
                                        commit tran

  COMMIT
PRINT 'Import completed successfully'
  BREAK
END
