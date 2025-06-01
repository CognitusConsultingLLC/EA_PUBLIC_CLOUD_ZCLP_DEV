@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'WIP Marking Basic'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_CLP_WIPMARK_BASIC
  as select from ztclp_wipmark as WipMark
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
  cast( lpad( invoice, 10, '0' ) as abap.char(10) ) as Invoice,
  status as Status,
  @Semantics.user.createdBy: true
  createdby as Createdby,
  @Semantics.systemDateTime.createdAt: true
  createdon as Createdon,
  @Semantics.user.lastChangedBy: true
  lastchangedby as LastChangedby,
  @Semantics.systemDateTime.lastChangedAt: true
  lastchanged as Lastchanged,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  locallastchanged as Locallastchanged
  
}
