
/*------------------------------------------------------------------------
    File        : UpdateSuppInvoiceReasonV01.p
    Purpose     : 

    Syntax      :

    Description : 

    Author(s)   : 
    Created     : Tue Dec 20 01:44:41 PST 2016
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

BLOCK-LEVEL ON ERROR UNDO, THROW.

/* ********************  Preprocessor Definitions  ******************** */


/* ***************************  Main Block  *************************** */

{proxy/bcinvoice/apiupdatecinvoicereasonv01def.i}
define input parameter companyId as int64 no-undo.
define input parameter companyCode as character no-undo.
define input parameter journalCode as character no-undo.
define input parameter cInvoicePostingYear as integer no-undo.
define input parameter cInvoiceVoucher as integer no-undo.
define input parameter activityCode as character no-undo.
define input parameter reasonCode as character no-undo.
define input parameter action as character no-undo.
define input parameter comments as character no-undo.
define input parameter approver as character no-undo.
define output parameter ReturnStatus as integer no-undo.
define output parameter table for tFcMessages.

 
assign igCompanyId           = companyId
       icCompanyCode         = companyCode
       icJournalCode         = journalCode
       iiCInvoicePostingYear = cInvoicePostingYear
       iiCInvoiceVoucher     = cInvoiceVoucher
       icActivityCode        = activityCode
       icReasonCode          = reasonCode
       icAction              = action
       icComments            = comments
       icApprover            = approver.


{proxy/bcinvoice/apiupdatecinvoicereasonv01run.i}
ReturnStatus = oiReturnStatus.
run disp.p(input buffer tFcMessages:handle).

