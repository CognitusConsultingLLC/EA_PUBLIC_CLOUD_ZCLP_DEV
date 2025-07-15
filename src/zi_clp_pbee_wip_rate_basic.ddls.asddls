@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'PBEE WIP RATE basic view'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_CLP_PBEE_WIP_RATE_BASIC as select from ZR_TCLP_WIP_RATE
{
    key SapUuid,
    ProjBillgElmntEntrItmUuid,
  @Semantics.amount.currencyCode: 'DocumentCurrency'
    NetPriceAmountInDocCrcy,
    DocumentCurrency,
    AdminRate
}
