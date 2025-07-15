@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@EndUserText.label: '###GENERATED Core Data Service Entity'
@Consumption.dbHints: ['USE_HEX_PLAN']
define root view entity ZR_TCLP_INVITEMIZE
  as select from ztclp_invitemize
{
  key sap_uuid as SapUuid,
  prelimbillingdocument as PrelimBillingDocument,
  narrativetype as NarrativeType,
  counter as Counter,
  narrative as Narrative,
  @Semantics.amount.currencyCode: 'Currency'
  amount as Amount,
  @Consumption.valueHelpDefinition: [ {
    entity.name: 'I_CurrencyStdVH', 
    entity.element: 'Currency', 
    useForValidation: true
  } ]
  currency as Currency,
  @Semantics.systemDateTime.lastChangedAt: true
  lastchanged as LastChanged,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  locallastchanged as LocalLastChanged
  
}
