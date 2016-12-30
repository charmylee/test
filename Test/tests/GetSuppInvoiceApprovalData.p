
/*------------------------------------------------------------------------
    File        : GetSuppInvoiceApprovalData.p
    Purpose     : 

    Syntax      :

    Description : 

    Author(s)   : 
    Created     : Sun Dec 18 22:31:34 PST 2016
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

BLOCK-LEVEL ON ERROR UNDO, THROW.

/* ********************  Preprocessor Definitions  ******************** */


/* ***************************  Main Block  *************************** */

{proxy/bcinvoice/apigetcinvoiceapprovaldatadef.i}
define input parameter companyCode as character no-undo.
define input parameter cInvoiceRegistrationNr as int64 no-undo.
define output parameter ReturnStatus as integer no-undo.
define output parameter table for tCInvoicePostingCIAndMF.
define output parameter table for tCInvoiceSummaryInfo.
define output parameter table for tFcMessages.



assign icCompanyCode = companyCode
       iiCInvoiceRegistrationNr = cInvoiceRegistrationNr.

{proxy/bcinvoice/apigetcinvoiceapprovaldatarun.i}
ReturnStatus = oiReturnStatus.


