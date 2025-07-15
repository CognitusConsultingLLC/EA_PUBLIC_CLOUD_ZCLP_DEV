@Metadata.allowExtensions: true
@EndUserText.label: '###GENERATED Core Data Service Entity'
@AccessControl.authorizationCheck: #CHECK
define root view entity ZC_TCLP_WIP_RATE
  provider contract TRANSACTIONAL_QUERY
  as projection on ZR_TCLP_WIP_RATE
{
  key SapUuid,
  ProjBillgElmntEntrItmUuid,
  NetPriceAmountInDocCrcy,
  @Semantics.currencyCode: true
  DocumentCurrency,
  AdminRate
  
}
