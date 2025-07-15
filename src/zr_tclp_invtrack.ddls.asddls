@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@EndUserText.label: '###GENERATED Core Data Service Entity'
@Consumption.dbHints: ['USE_HEX_PLAN']
define root view entity ZR_TCLP_INVTRACK
  as select from ztclp_invtrack
{
  key sap_uuid as SapUuid,
  proj_billg_elmnt_entr_itm_uuid as ProjBillgElmntEntrItmUuid,
  project_billing_element_uuid as ProjectBillingElementUuid,
  wbs_element_internal_id as WbsElementInternalId,
  project as Project,
  project_billing_request_uuid as ProjectBillingRequestUuid,
  pbr as Pbr,
  bdr as Bdr,
  pbd as Pbd,
  invoice as Invoice,
  pbr_status as PbrStatus,
  bdr_status as BdrStatus,
  pbd_status as PbdStatus,
  invoice_status as InvoiceStatus,
  @Semantics.user.createdBy: true
  created_by as CreatedBy,
  @Semantics.systemDateTime.createdAt: true
  created_on as CreatedOn,
  @Semantics.user.lastChangedBy: true
  last_changed_by as LastChangedBy,
  @Semantics.systemDateTime.lastChangedAt: true
  last_changed_on as LastChangedOn,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  local_last_changed as LocalLastChanged
  
}
