
/*------------------------------------------------------------------------
    File        : selectCInvoice.p
    Purpose     : 

    Syntax      :

    Description : 

    Author(s)   : 
    Created     : Wed Dec 21 22:46:51 PST 2016
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

BLOCK-LEVEL ON ERROR UNDO, THROW.

/* ********************  Preprocessor Definitions  ******************** */


/* ***************************  Main Block  *************************** */
{proxy/bcinvoice/cinvoicebyallinfodef.i}
{proxy/datasets/tfilter.i}

define input parameter range as character no-undo.
define input parameter rowidd as character no-undo.
define input parameter rowum as integer no-undo.
define input parameter number as integer no-undo.
define input parameter sortColumns as character no-undo.
define input parameter countOnly as logical no-undo.
define input parameter forwardRead as logical no-undo.
define input parameter maximumBrowseRecordsToCount as integer no-undo.
define input parameter table for tfilter.
define output parameter countt as integer no-undo.
define output parameter Endofquery as logical no-undo.
define output parameter table for tqCInvoiceByAllInfo.
define output parameter table for tFcMessages.
define output parameter ReturnStatus as integer no-undo.

define variable rowCnt as integer init 0 no-undo.

assign vcProxyCompanyCode = "10usaco"
       icRange = range
       icRowid = rowidd
       iiRownum = rowum
       iiNumber = number
       icSortColumns = sortColumns
       ilCountOnly = countOnly
       ilForwardRead = forwardRead
       iiMaximumBrowseRecordsToCount = maximumBrowseRecordsToCount.              
{proxy/bcinvoice/cinvoicebyallinforun.i}
countt = oiCount.
Endofquery = olEndofquery.
ReturnStatus = oiReturnStatus.

/*for each tqSelectCInvoice:
assign rowCnt = rowCnt + 1.
end. 

disp "rowCnt: " string(rowCnt).
run disp.p(input buffer tqSelectCInvoice:handle).
message "oiReturnStatus: " string(oiReturnStatus). 
message "couutt: " string(countt).*/