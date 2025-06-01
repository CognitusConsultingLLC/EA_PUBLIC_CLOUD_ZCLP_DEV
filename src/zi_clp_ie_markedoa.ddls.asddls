@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'marked OA for Project'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_CLP_IE_MarkedOA as select from    
    ZI_CLP_WIPMARK_BASIC         as MarkedWIP     
  left outer join ZI_CLP_CustProjBillElemEntry as _CustProjBillElemEntry on MarkedWIP.Projbillgelmntentritmuuid = _CustProjBillElemEntry.ProjBillgElmntEntrItmUUID
{
  key _CustProjBillElemEntry.ReferenceDocument as Invoice
}
group by
  _CustProjBillElemEntry.ReferenceDocument
