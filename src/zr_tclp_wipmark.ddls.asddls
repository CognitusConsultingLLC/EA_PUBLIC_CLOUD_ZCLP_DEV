@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@EndUserText.label: '###GENERATED Core Data Service Entity'
@Consumption.dbHints: ['USE_HEX_PLAN']
define root view entity ZR_TCLP_WIPMARK
  as select from ztclp_wipmark
{
  key sap_uuid as SapUuid,
  projbillgelmntentritmuuid as Projbillgelmntentritmuuid,
  projectbillingelementuuid as Projectbillingelementuuid,
  wbselementinternalid as Wbselementinternalid,
  project as Project,
  projectbillingrequestuuid as Projectbillingrequestuuid,
  pbr as Pbr,
  bdr as Bdr,
  pbd as Pbd,
  invoice as Invoice,
  status as Status,
  @Semantics.user.createdBy: true
  createdby as Createdby,
  @Semantics.systemDateTime.createdAt: true
  createdon as Createdon,
  @Semantics.user.lastChangedBy: true
  lastchangedby as Lastchangedby,
  @Semantics.systemDateTime.lastChangedAt: true
  lastchanged as Lastchanged,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  locallastchanged as Locallastchanged
  
}
