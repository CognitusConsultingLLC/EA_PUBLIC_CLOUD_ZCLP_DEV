@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'In Process Billing for Project'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_CLP_IM_ProjectInPrBilling_A
  as select from ZI_CLP_IM_InvoicesInProcess
{
  key  ProjectID,
       @Semantics.amount.currencyCode: 'TransactionCurrency'
       @EndUserText.label: 'In-process Billing'
       sum(TotalNetAmount) as InprocessBilling,
       TransactionCurrency
}
group by
  ProjectID,
  TransactionCurrency
