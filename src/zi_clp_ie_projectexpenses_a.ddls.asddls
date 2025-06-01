@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Aggregation Of Expenses'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_CLP_IE_ProjectExpenses_A
  as select from ZI_CLP_IE_ProjectExpenses
{
  key ProjectID,
      @Semantics.quantity.unitOfMeasure: 'QuantityUnit'
      sum(OpenQuantity)                as SumOfOpenQuantity,
      @Semantics.amount.currencyCode: 'DocumentCurrency'
      sum(OpenRevenueAmtInDocCrcy) as SumOfOpenRevExpAmtInDocCrcy,
      QuantityUnit,
      DocumentCurrency
}
group by
  ProjectID,
  QuantityUnit,
  DocumentCurrency
