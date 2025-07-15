@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Invoice Process Items'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZC_TCLP_INV_P_ITM as projection on ZR_TCLP_INV_P_ITM
{
    key SapUuid,
    InvoiceProcessId,
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
    Locallastchanged,
    /* Associations */
    _InvProcessHeader:redirected to parent ZC_TCLP_INV_P_HDR
}
