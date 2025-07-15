@Metadata.allowExtensions: true
@EndUserText.label: '###GENERATED Core Data Service Entity'
@AccessControl.authorizationCheck: #CHECK
@Consumption.dbHints: ['USE_HEX_PLAN']
define root view entity ZC_TCLP_INVITEMIZE
  provider contract transactional_query
  as projection on ZR_TCLP_INVITEMIZE
{
  key SapUuid,
  PrelimBillingDocument,
  NarrativeType,
  Counter,
  Narrative,
  Amount,  
  @Semantics.currencyCode: true
  Currency,
  LastChanged,
  LocalLastChanged
  
}
