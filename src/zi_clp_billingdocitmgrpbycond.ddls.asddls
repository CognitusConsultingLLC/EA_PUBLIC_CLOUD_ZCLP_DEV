@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Billing Document Summary by condition type'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_CLP_BillingDocItmGrpByCond as select from I_BillingDocItemPrcgElmntBasic
{
    key BillingDocument,
    key ConditionType,
      @Semantics.amount.currencyCode: 'TransactionCurrency'
    sum(ConditionAmount) as SumConditionAmount,
    TransactionCurrency
}group by BillingDocument,ConditionType,TransactionCurrency
