@Metadata.allowExtensions: true
@EndUserText.label: '###GENERATED Core Data Service Entity'
@AccessControl.authorizationCheck: #CHECK
define root view entity ZC_TCLP_INV_P_HDR
  provider contract TRANSACTIONAL_QUERY
  as projection on ZR_TCLP_INV_P_HDR
{
  key InvoiceProcessId,
  ProjectId,
  InvoiceDate,
  @Semantics.currencyCode: true
  TransactionCurrency,
  MarkOa,
  ReliWip,
  FinalInv,
  OutSourceSl,
  InvoiceInpFeeValue,
  InvoiceInpAdminFeeValue,
  InvoiceInpExpenseValue,
  InvoiceInpCourtesyDisc,
  InvoiceInpPriorAccAmount,
  TotalInvoiceAmt,
  CreatedBy,
  CreatedOn,
  LastChangedBy,
  LastChangedOn,
  LocalLastChanged
  
}
