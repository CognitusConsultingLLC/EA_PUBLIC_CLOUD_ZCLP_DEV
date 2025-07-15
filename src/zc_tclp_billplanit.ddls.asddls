@Metadata.allowExtensions: true
@EndUserText.label: '###GENERATED Core Data Service Entity'
@AccessControl.authorizationCheck: #CHECK
@Consumption.dbHints: ['USE_HEX_PLAN']
define root view entity ZC_TCLP_BILLPLANIT
  provider contract transactional_query
  as projection on ZR_TCLP_BILLPLANIT
{
  key SapUuid,
  Customerproject,
  Salesorderitem,
  Billingplan,
  Billingplanitem,
  Salesorder,
  Billingplanbillingdate,
  Billingplanrelatedbillgstatus,
  Billingplanamount,
  @Semantics.currencyCode: true
  Transactioncurrency,
  Billingplanitemusage,
  Billingplanitemdescription,
  Billingplanservicestartdate,
  Billingplanserviceenddate,
  Expenses,
  Courtesydiscount,
  Adminfee,
  Billingplanitemtype,
  Linkedcustomerproject,
  Linkedsalesorderitem,
  Linkedbillingplan,
  Linkedbillingplanitem,
  Lastchanged,
  Locallastchanged
  
}
