
/*------------------------------------------------------------------------
    File        : GetReasonAfterApprWkfl.p
    Purpose     : 

    Syntax      :

    Description : 

    Author(s)   : 
    Created     : Tue Dec 20 01:44:15 PST 2016
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

BLOCK-LEVEL ON ERROR UNDO, THROW.

/* ********************  Preprocessor Definitions  ******************** */


/* ***************************  Main Block  *************************** */
{proxy/bcinvoice/apigetreasonafterapprwkfldef.i}
define input parameter cInvoiceId as int64 no-undo.
define input parameter companyId as int64 no-undo.
define input parameter reasonCode as character no-undo.
define input parameter action as character no-undo.
define output parameter ReturnStatus as integer no-undo.
define output parameter ReasonCodeAfterApprWkfl as character no-undo.
define output parameter table for tFcMessages.

 
assign igCInvoiceId = cInvoiceId
       igCompanyId  = companyId
       icReasonCode = reasonCode
       icAction     = action.


{proxy/bcinvoice/apigetreasonafterapprwkflrun.i}
ReturnStatus = oiReturnStatus.
ReasonCodeAfterApprWkfl = ocReasonCodeAfterApprWkfl.

