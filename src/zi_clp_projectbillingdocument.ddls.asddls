@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Billing Documents for Project'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_CLP_ProjectBillingDocument

  as select from I_CustProjSlsOrdItem as I_CustProjSlsOrdItem
  association [0..*] to I_BillingDocumentItemBasic as _I_BillingDocumentItemBasic on  _I_BillingDocumentItemBasic.SalesDocument     = I_CustProjSlsOrdItem.SalesOrder
                                                                                  and _I_BillingDocumentItemBasic.SalesDocumentItem = I_CustProjSlsOrdItem.SalesOrderItem
{
  key _I_BillingDocumentItemBasic.BillingDocument,
      I_CustProjSlsOrdItem.CustomerProject as ProjectID,
      _I_BillingDocumentItemBasic.SDDocumentCategory
}
group by
  CustomerProject,
  _I_BillingDocumentItemBasic.BillingDocument,
  _I_BillingDocumentItemBasic.SDDocumentCategory
