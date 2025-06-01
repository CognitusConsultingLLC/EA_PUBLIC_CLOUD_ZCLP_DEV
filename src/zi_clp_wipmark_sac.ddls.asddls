@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'WIP Marking for SAC'
@Metadata.ignorePropagatedAnnotations: true
@AbapCatalog.dataMaintenance: #DISPLAY_ONLY
@Analytics.dataCategory: #CUBE
@ObjectModel.supportedCapabilities: [ #CDS_MODELING_ASSOCIATION_TARGET, #CDS_MODELING_DATA_SOURCE, #EXTRACTION_DATA_SOURCE]
define view entity ZI_CLP_WIPMARK_SAC
  as select from ZI_CLP_WIPMARK_BASIC
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
      LastChangedby,
      Lastchanged,
      Locallastchanged
}
