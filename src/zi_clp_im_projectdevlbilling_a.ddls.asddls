@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Previously Delivered Billing for Project'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_CLP_IM_ProjectDevlBilling_A
  as select from ZI_CLP_IM_PreviousDelvInvoices
{
  key  ProjectID,
       @Semantics.amount.currencyCode: 'TransactionCurrency'
       @EndUserText.label: 'Previously Delivered Billing'
       sum(TotalNetAmount) as DeliveredBilling,
       TransactionCurrency
}
group by
  ProjectID,
  TransactionCurrency
