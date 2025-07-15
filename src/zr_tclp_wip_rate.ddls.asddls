@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@EndUserText.label: '###GENERATED Core Data Service Entity'
define root view entity ZR_TCLP_WIP_RATE
  as select from ZTCLP_WIP_RATE
{
  key sap_uuid as SapUuid,
  proj_billg_elmnt_entr_itm_uuid as ProjBillgElmntEntrItmUuid,
  @Semantics.amount.currencyCode: 'DocumentCurrency'
  net_price_amount_in_doc_crcy as NetPriceAmountInDocCrcy,
  @Consumption.valueHelpDefinition: [ {
    entity.name: 'I_CurrencyStdVH', 
    entity.element: 'Currency', 
    useForValidation: true
  } ]
  document_currency as DocumentCurrency,
  admin_rate as AdminRate
  
}
