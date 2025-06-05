@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Awaiting Delivery for Project'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_CLP_IM_ProjectAWDBilling_A
  as select from ZI_CLP_IM_InvoicesInProcess
{
  key  ProjectID,
       @Semantics.amount.currencyCode: 'TransactionCurrency'
       @EndUserText.label: 'Billing Awaiting Delivery'
       sum(TotalNetAmount) as BillingAwaitDelv,
       TransactionCurrency
}
where
  Status = 'AWD'
group by
  ProjectID,
  TransactionCurrency
