 
 /*------------------------------------------------------------------------
    File        : testcase.p 
    Syntax      : 
    Author(s)   : cln
    Created     : Sun Dec 18 22:58:58 PST 2016
    Notes       : 
  ----------------------------------------------------------------------*/

USING Progress.Lang.*.
USING OpenEdge.Core.Assert.
BLOCK-LEVEL ON ERROR UNDO, THROW.

{proxy/bcinvoice/apigetcinvoiceapprovaldatadef.i}
{proxy/bcinvoice/apigetreasonafterapprwkfldef.i}
{proxy/bcinvoice/apiupdatecinvoicereasonv01def.i}
{proxy/bcinvoice/cinvoicebyallinfodef.i}
{proxy/datasets/tfilter.i}



@Before.
PROCEDURE setUpBeforeProcedure:
/*------------------------------------------------------------------------------
        Purpose:                                                                      
        Notes:                                                                        
------------------------------------------------------------------------------*/

END PROCEDURE. 

@Setup.
PROCEDURE setUp:
/*------------------------------------------------------------------------------
        Purpose:                                                                      
        Notes:                                                                        
------------------------------------------------------------------------------*/

END PROCEDURE.  

@TearDown.
PROCEDURE tearDown:
/*------------------------------------------------------------------------------
        Purpose:                                                                      
        Notes:                                                                        
------------------------------------------------------------------------------*/

END PROCEDURE. 

@After.
PROCEDURE tearDownAfterProcedure: 
/*------------------------------------------------------------------------------
        Purpose:                                                                      
        Notes:                                                                        
------------------------------------------------------------------------------*/

END PROCEDURE. 


@Test.
PROCEDURE GetSuppInvoiceApprovalDataApprove:
    empty temp-table tCInvoiceSummaryInfo.

    run GetSuppInvoiceApprovalData.p(input "10usaco",
                                          input "14470", 
                                          output oiReturnStatus,                                       
                                          output table tCInvoicePostingCIAndMF,
                                          output table tCInvoiceSummaryInfo,
                                          output table tFcMessages).
    
    for first tCInvoiceSummaryInfo:
        Assert:Equals("ALLOCATION", tCInvoiceSummaryInfo.tcCInvoiceAllocationStatus).
        Assert:Equals("INVOICE", tCInvoiceSummaryInfo.tcCInvoiceType).
        Assert:Equals("SIHO", tCInvoiceSummaryInfo.tcJournalCode).
        Assert:Equals("beforeapproval", tCInvoiceSummaryInfo.tcReasonCode).
        Assert:Equals(1142, tCInvoiceSummaryInfo.tiCInvoiceVoucher).
        Assert:Equals(2410953000, tCInvoiceSummaryInfo.tiCInvoice_ID).
        Assert:Equals("55667342", tCInvoiceSummaryInfo.tcCInvoiceOwnBankNumber).
    end.
    
    run GetReasonAfterApprWkfl.p(input "2410953000",
                                          input "219435", 
                                          input "beforeapproval",
                                          input "Approve",
                                          output oiReturnStatus, 
                                          output ocReasonCodeAfterApprWkfl,                                                                               
                                          output table tFcMessages).  
    
    Assert:Equals("approved", ocReasonCodeAfterApprWkfl).
    
           
    run UpdateSuppInvoiceReasonV01.p(input "219435",
                                          input "10usaco", 
                                          input "SIHO",
                                          input "2016",
                                          input "1142", 
                                          input "Approve",
                                          input "approved",
                                          input "Approve", 
                                          input "",
                                          input "",
                                          output oiReturnStatus,                                                                                                                        
                                          output table tFcMessages).         
    
    create tFilter.
    assign tFilter.tiMetricID=0
           tFilter.tcBusinessFieldName="iiCInvoice_ID"
           tFilter.tcDataType="g"
           tFilter.tcOperator="=" 
           tFilter.tcParameterValue="2410953000".
    run selectCInvoice.p(input "A",
                         input "", 
                         input 0,
                         input 30000,
                         input "",
                         input no,
                         input yes,
                         input 50000,
                         input table tFilter,
                         output oiCount,
                         output olEndofquery, 
                         output table tqCInvoiceByAllInfo,
                         output table tFcMessages,                                    
                         output oiReturnStatus).
    for each tqCInvoiceByAllInfo:                 
        Assert:Equals("yes",string(tqCInvoiceByAllInfo.tlCInvoiceIsInvoiceApproved)).
    end.
                      
END PROCEDURE.


@Test.
PROCEDURE GetSuppInvoiceApprovalDataReject:
    empty temp-table tCInvoiceSummaryInfo.

    run GetSuppInvoiceApprovalData.p(input "10usaco",
                                          input "14471", 
                                          output oiReturnStatus,                                       
                                          output table tCInvoicePostingCIAndMF,
                                          output table tCInvoiceSummaryInfo,
                                          output table tFcMessages).
    
    for first tCInvoiceSummaryInfo:
        Assert:Equals("ALLOCATION", tCInvoiceSummaryInfo.tcCInvoiceAllocationStatus).
        Assert:Equals("INVOICE", tCInvoiceSummaryInfo.tcCInvoiceType).
        Assert:Equals("SIHO", tCInvoiceSummaryInfo.tcJournalCode).
        Assert:Equals("beforeapproval", tCInvoiceSummaryInfo.tcReasonCode).
        Assert:Equals(1143, tCInvoiceSummaryInfo.tiCInvoiceVoucher).
        Assert:Equals(2410953216, tCInvoiceSummaryInfo.tiCInvoice_ID).
        Assert:Equals("55667342", tCInvoiceSummaryInfo.tcCInvoiceOwnBankNumber).
    end.
    
    run GetReasonAfterApprWkfl.p(input "2410953216",
                                          input "219435", 
                                          input "beforeapproval",
                                          input "Reject",
                                          output oiReturnStatus, 
                                          output ocReasonCodeAfterApprWkfl,                                                                               
                                          output table tFcMessages).  
    
    Assert:Equals("denied1", ocReasonCodeAfterApprWkfl).
    
           
    run UpdateSuppInvoiceReasonV01.p(input "219435",
                                          input "10usaco", 
                                          input "SIHO",
                                          input "2016",
                                          input "1143", 
                                          input "Approve",
                                          input "denied1",
                                          input "Reject", 
                                          input "",
                                          input "",
                                          output oiReturnStatus,                                                                                                                        
                                          output table tFcMessages).         
    
    create tFilter.
    assign tFilter.tiMetricID=0
           tFilter.tcBusinessFieldName="iiCInvoice_ID"
           tFilter.tcDataType="g"
           tFilter.tcOperator="=" 
           tFilter.tcParameterValue="2410953216".
    
    run selectCInvoice.p(input "A",
                         input "", 
                         input 0,
                         input 30000,
                         input "",
                         input no,
                         input yes,
                         input 50000,
                         input table tFilter,
                         output oiCount,
                         output olEndofquery, 
                         output table tqCInvoiceByAllInfo,
                         output table tFcMessages,                                    
                         output oiReturnStatus).
    for each tqCInvoiceByAllInfo:                 
        Assert:Equals("no",string(tqCInvoiceByAllInfo.tlCInvoiceIsInvoiceApproved)).
    end.
                   
END PROCEDURE.

