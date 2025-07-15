@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Invoice Process Items'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZR_TCLP_INV_P_ITM
  as select from ztclp_inv_p_itm
  association to parent ZR_TCLP_INV_P_HDR as _InvProcessHeader on  _InvProcessHeader.InvoiceProcessId = $projection.InvoiceProcessId
{
  key sap_uuid as SapUuid,
  invoice_process_id     as InvoiceProcessId,
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
  locallastchanged as Locallastchanged,
  _InvProcessHeader
  
}
