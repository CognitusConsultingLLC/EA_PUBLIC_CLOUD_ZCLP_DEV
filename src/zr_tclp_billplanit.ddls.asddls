@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
@EndUserText.label: '###GENERATED Core Data Service Entity'
@Consumption.dbHints: ['USE_HEX_PLAN']
define root view entity ZR_TCLP_BILLPLANIT
  as select from ztclp_billplanit
{
  key sap_uuid as SapUuid,
  customerproject as Customerproject,
  salesorderitem as Salesorderitem,
  billingplan as Billingplan,
  billingplanitem as Billingplanitem,
  salesorder as Salesorder,
  billingplanbillingdate as Billingplanbillingdate,
  billingplanrelatedbillgstatus as Billingplanrelatedbillgstatus,
  @Semantics.amount.currencyCode: 'Transactioncurrency'
  billingplanamount as Billingplanamount,
  @Consumption.valueHelpDefinition: [ {
    entity.name: 'I_CurrencyStdVH', 
    entity.element: 'Currency', 
    useForValidation: true
  } ]
  transactioncurrency as Transactioncurrency,
  billingplanitemusage as Billingplanitemusage,
  billingplanitemdescription as Billingplanitemdescription,
  billingplanservicestartdate as Billingplanservicestartdate,
  billingplanserviceenddate as Billingplanserviceenddate,
  @Semantics.amount.currencyCode: 'Transactioncurrency'
  expenses as Expenses,
  @Semantics.amount.currencyCode: 'Transactioncurrency'
  courtesydiscount as Courtesydiscount,
  @Semantics.amount.currencyCode: 'Transactioncurrency'
  adminfee as Adminfee,
  billingplanitemtype as Billingplanitemtype,
  linkedcustomerproject as Linkedcustomerproject,
  linkedsalesorderitem as Linkedsalesorderitem,
  linkedbillingplan as Linkedbillingplan,
  linkedbillingplanitem as Linkedbillingplanitem,
  @Semantics.systemDateTime.lastChangedAt: true
  lastchanged as Lastchanged,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  locallastchanged as Locallastchanged
  
}
