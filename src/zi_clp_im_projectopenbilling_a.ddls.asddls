@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Project Billing Plan Item Aggregation'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_CLP_IM_ProjectOpenBilling_A
  as select from ZI_CLP_IM_UnbilledScheduledInv
{
  key CustomerProject,
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      @EndUserText.label: 'Open Billing'
      sum(TotalAmount)      as OpenBilling,
      TransactionCurrency,
      @EndUserText.label: 'Next Billing Due Date'
      min(BillingPlanBillingDate) as NextBillingDueDate
}
where
      BillingPlanItemUsage_2        = '1'
  and BillingPlanRelatedBillgStatus = 'A'
group by
  CustomerProject,
  TransactionCurrency
