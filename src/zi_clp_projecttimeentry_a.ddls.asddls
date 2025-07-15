@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Project wise Time aggregation'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_CLP_ProjectTimeEntry_A
  as select from ZI_CLP_ProjectTimeEntry
{
  key ProjectID,
//      min(ServicesRenderedDate)           as MinServicesRenderedDate,
//      max(ServicesRenderedDate)           as MaxServicesRenderedDate,
      @Semantics.quantity.unitOfMeasure: 'QuantityUnit'
      sum(OriginalTotalQuantity)          as SumOriginalTotalQuantity,
//      @Semantics.amount.currencyCode: 'TransactionCurrency'
//      sum(OriginalAmountInTransacCrcy)    as SumOriginalAmountInTransacCrcy,
//      @Semantics.amount.currencyCode: 'ProjectCurrency'
//      sum(OriginalAmountInProjectCrcy)    as SumOriginalAmountInProjectCrcy,
      @Semantics.amount.currencyCode: 'GlobalCurrency'
      sum(OriginalAmountInGlobalCurrency) as SumOriginalAmountInGlobalCrcy,
      @Semantics.quantity.unitOfMeasure: 'QuantityUnit'
      sum(OpenQuantity)                   as SumOpenQuantity,
//      @Semantics.amount.currencyCode: 'TransactionCurrency'
//      sum(OpenAmountInTransCrcy)          as SumOpenAmountInTransCrcy,

      QuantityUnit,
//      TransactionCurrency,
//      ProjectCurrency,
      GlobalCurrency
}where _TimeSheetRecord.TimeSheetStatus != '60'
group by
  ProjectID,
  QuantityUnit,
//  TransactionCurrency,
//  ProjectCurrency,
  GlobalCurrency
