begin tran
                                           UPDATE D_LOOKUP_AREA_ITEM SET ITEM_ID=N'15240010-f630-4f89-be07-146ea665d5bb', INT_ID=N'1841', PARENT_ID=N'ee53acda-dcff-418c-b06f-76d61190f680', AREA_ID=null, VALUE_STR=null, VALUE_INT=null, DESCRIPTION=N'Write-off Amount', USER_STR1=N'generic/list.aspx?PAGE_NAME=LN_ACC_LN81800&UMode=UPD&UScreen=WRITEOFFAMOUNT&TITLE=Write-off Amount', USER_STR2=N'generic/list.aspx?PAGE_NAME=LN_ACC_LN81800&UMode=UPD&UScreen=WRITEOFFAMOUNT&TITLE=Write-off Amount', ENABLED=N'1', ITEM_INDEX=N'42', HAS_WORKGROUP=N'0' WHERE ITEM_ID = '15240010-f630-4f89-be07-146ea665d5bb'

                                           if @@rowcount = 0
                                           begin
                                                  INSERT INTO D_LOOKUP_AREA_ITEM(ITEM_ID, INT_ID, PARENT_ID, AREA_ID, VALUE_STR, VALUE_INT, DESCRIPTION, USER_STR1, USER_STR2, ENABLED, ITEM_INDEX, HAS_WORKGROUP) VALUES(N'15240010-f630-4f89-be07-146ea665d5bb', N'1841', N'ee53acda-dcff-418c-b06f-76d61190f680', null, null, null, N'Write-off Amount', N'generic/list.aspx?PAGE_NAME=LN_ACC_LN81800&UMode=UPD&UScreen=WRITEOFFAMOUNT&TITLE=Write-off Amount', N'generic/list.aspx?PAGE_NAME=LN_ACC_LN81800&UMode=UPD&UScreen=WRITEOFFAMOUNT&TITLE=Write-off Amount', N'1', N'42', N'0')
                                           end
                                        commit tran

begin tran
                                           UPDATE S_LANGUAGE_OBJECT_VALUE SET ID=N'945a526e-0d2a-46d3-a842-b93de03954cb', OBJECT_ID=N'952a274e-c49b-4423-b545-7b51360d68ab', LANGUAGE_ID=N'2dad38f9-a30c-4c69-9c8f-c3a74c20fdf1', VALUE=N'Write-off Amount', RECORD_ID=N'15240010-f630-4f89-be07-146ea665d5bb', ITEM_ID=null WHERE ID = '945a526e-0d2a-46d3-a842-b93de03954cb'

                                           if @@rowcount = 0
                                           begin
                                                  INSERT INTO S_LANGUAGE_OBJECT_VALUE(ID, OBJECT_ID, LANGUAGE_ID, VALUE, RECORD_ID, ITEM_ID) VALUES(N'945a526e-0d2a-46d3-a842-b93de03954cb', N'952a274e-c49b-4423-b545-7b51360d68ab', N'2dad38f9-a30c-4c69-9c8f-c3a74c20fdf1', N'Write-off Amount', N'15240010-f630-4f89-be07-146ea665d5bb', null)
                                           end
                                        commit tran