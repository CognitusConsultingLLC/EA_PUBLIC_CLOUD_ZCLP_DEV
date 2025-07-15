@Metadata.allowExtensions: true
@EndUserText.label: '###GENERATED Core Data Service Entity'
@AccessControl.authorizationCheck: #CHECK
@Consumption.dbHints: ['USE_HEX_PLAN']
define root view entity ZC_TCLP_WIPMARK
  provider contract transactional_query
  as projection on ZR_TCLP_WIPMARK
{
  key SapUuid,
  Projbillgelmntentritmuuid,
  Projectbillingelementuuid,
  Wbselementinternalid,
  Project,
  Projectbillingrequestuuid,
  Pbr,
  Bdr,
  Pbd,
  Invoice,
  Status,
  Createdby,
  Createdon,
  Lastchangedby,
  Lastchanged,
  Locallastchanged
  
}
