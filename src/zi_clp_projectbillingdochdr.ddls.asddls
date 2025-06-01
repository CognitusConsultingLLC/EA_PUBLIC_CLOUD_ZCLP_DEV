@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Project Billing Document Hdr'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_CLP_ProjectBillingDocHdr
  as select from ZI_CLP_ProjectBillingDocument
  association [0..1] to ZI_CLP_Project                as _CLP_Project               on _CLP_Project.ProjectID = $projection.ProjectID
  association [0..1] to I_BillingDocumentBasic        as _BillingDocumentBasic      on _BillingDocumentBasic.BillingDocument = $projection.BillingDocument
  association [0..*] to ZI_CLP_IM_UniqueBDWorkPackage as _UniqueBDWorkPackage       on _UniqueBDWorkPackage.BillingDocument = $projection.BillingDocument
  association [0..1] to ZI_CLP_DOCAPPROVALSTS_V       as _YY1_CLPDocApprovalSts_BDH on _YY1_CLPDocApprovalSts_BDH.Code = $projection.YY1_CLPDocApprovalSts_BDH
   association [0..1] to I_OverallSDProcessStatus     as _OverallSDProcessStatus        on  $projection.overallsdprocessstatus = _OverallSDProcessStatus.OverallSDProcessStatus
  association [0..1] to I_OverallBillingStatus       as _OverallBillingStatus          on  $projection.overallbillingstatus = _OverallBillingStatus.OverallBillingStatus
  association [0..1] to I_OvrlBillingDocReqStatus    as _OvrlBillingDocReqStatus       on  $projection.overallbillingdocreqstatus = _OvrlBillingDocReqStatus.OverallBillingDocReqStatus
  association [0..1] to I_PrelimBillgDocStatus       as _PrelimBillingDocumentStatus   on  $projection.prelimbillingdocumentstatus = _PrelimBillingDocumentStatus.PrelimBillingDocumentStatus

  //  association [0..1] to I_CustProjSlsOrdItemPartner as _CustProjSlsOrdItemPartner on  _CustProjSlsOrdItemPartner.CustomerProject = $projection.ProjectID
  //                                                                                  and _CustProjSlsOrdItemPartner.PartnerFunction = 'RE'
  //  association [0..1] to I_CustProjSlsOrdPartner     as _CustProjSlsOrdPartner     on  _CustProjSlsOrdPartner.CustomerProject = $projection.ProjectID
  //                                                                                  and _CustProjSlsOrdPartner.PartnerFunction = 'RE'
{
  key BillingDocument,
      ProjectID,
      SDDocumentCategory,
      _CLP_Project.ProjectUUID,
    _CLP_Project.ManagerTeamMemberUUID,
    _CLP_Project.ManagerPersonWorkAgreement,
    _CLP_Project.ManagerPersonWorkAgrExtID,
    _CLP_Project.ManagerEmailAddress,
    _CLP_Project.ManagerPersonFullName,
    _CLP_Project.ManagerBP,
    _CLP_Project.ManagerBPUUID,
    _CLP_Project.EngManagerTeamMemberUUID,
    _CLP_Project.EngManagerPersonWorkAgreement,
    _CLP_Project.EngManagerPersonWorkAgrExtID,
    _CLP_Project.EngManagerEmailAddress,
    _CLP_Project.EngManagerPersonFullName,
    _CLP_Project.EngManagerBP,
    _CLP_Project.EngManagerBPUUID,
    _CLP_Project.BillerTeamMemberUUID,
    _CLP_Project.BillerPersonWorkAgreement,
    _CLP_Project.BillerPersonWorkAgrExtID,
    _CLP_Project.BillerEmailAddress,
    _CLP_Project.BillerPersonFullName,
    _CLP_Project.BillerBP,
    _CLP_Project.BillerBPUUID,
    _CLP_Project.EngPartnerTeamMemberUUID,
    _CLP_Project.EngPartnerPersonWorkAgreement,
    _CLP_Project.EngPartnerPersonWorkAgrExtID,
    _CLP_Project.EngPartnerEmailAddress,
    _CLP_Project.EngPartnerPersonFullName,
    _CLP_Project.EngPartnerBP,
    _CLP_Project.EngPartnerBPUUID,

      _CLP_Project.Customer,
      _CLP_Project.CustomerName,


      //      case  when _CustProjSlsOrdItemPartner.Partner is not null then _CustProjSlsOrdItemPartner.Partner else _CustProjSlsOrdPartner.Partner end as BillToParty,

      _BillingDocumentBasic.BillingDocumentCategory,
      _BillingDocumentBasic.BillingDocumentType,
      _BillingDocumentBasic.BillingDocumentDate,
      _BillingDocumentBasic.BillingDocumentIsCancelled,
      _BillingDocumentBasic.CancelledBillingDocument,
      _BillingDocumentBasic.AccountingDocument,
      _BillingDocumentBasic.OverallDocumentBillingStatus,
      _BillingDocumentBasic.PrelimBillingDocumentStatus,
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      _BillingDocumentBasic.TotalNetAmount,
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      _BillingDocumentBasic.TotalTaxAmount,
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      @EndUserText.label: 'Total Gross Amount'
      (
      cast(_BillingDocumentBasic.TotalNetAmount    as abap.dec(16,2)) +
      cast(_BillingDocumentBasic.TotalTaxAmount            as abap.dec(16,2))
      )                    as TotalGrossAmount,
      
      _BillingDocumentBasic.TransactionCurrency,



      _BillingDocumentBasic.OverallBillingDocReqStatus,
      _BillingDocumentBasic.OverallSDProcessStatus,
      _BillingDocumentBasic.OverallBillingStatus,
      _BillingDocumentBasic.AccountingTransferStatus,
      _BillingDocumentBasic.PricingDocument,
      _BillingDocumentBasic.CompanyCode,
      _BillingDocumentBasic.FiscalYear,
      _BillingDocumentBasic._PartnerBasic[PartnerFunction = 'RE'].Customer as BillToParty,
      @EndUserText.label: 'Non Standard Delivery Date'
      _BillingDocumentBasic.YY1_CLPNonStdDelvrDate_BDH                     as YY1_CLPNonStdDelvrDate_BDH,

      @EndUserText.label: 'Non Standard Delivery'
      _BillingDocumentBasic.YY1_CLPNonStdDelivery_BDH                      as YY1_CLPNonStdDelivery_BDH,

      @EndUserText.label: 'Document Approval Status'
      @Consumption.valueHelpDefinition: [{
          entity: {
            name: 'ZI_CLP_DOCAPPROVALSTS_V',
            element: 'Code'
          }
        }]

      @ObjectModel.foreignKey.association: '_YY1_CLPDocApprovalSts_BDH'
      _BillingDocumentBasic.YY1_CLPDocApprovalSts_BDH                      as YY1_CLPDocApprovalSts_BDH,
      
      
      
      
      @EndUserText.label: 'ZAD1 Admin Fees'
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      _BillingDocumentBasic._PricingElementBasic[ ConditionType = 'ZAD1' ].ConditionAmount         as ZAD1AdminFees,
      @EndUserText.label: 'ZAD3 Admin Fees'
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      _BillingDocumentBasic._PricingElementBasic[ ConditionType = 'ZAD3' ].ConditionAmount         as ZAD3AdminFees,
      @EndUserText.label: 'ZADO Admin Fees'
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      _BillingDocumentBasic._PricingElementBasic[ ConditionType = 'ZADO' ].ConditionAmount         as ZADOAdminFees,
      @EndUserText.label: 'ZADR Admin Fees'
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      _BillingDocumentBasic._PricingElementBasic[ ConditionType = 'ZADR' ].ConditionAmount         as ZADRAdminFees,
      @EndUserText.label: 'Courtesy Discount'
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      _BillingDocumentBasic._PricingElementBasic[ ConditionType = 'ZCDS' ].ConditionAmount         as ZCDSCourtesyDiscount,
      
      _UniqueBDWorkPackage,
      _YY1_CLPDocApprovalSts_BDH,
      _OverallSDProcessStatus,
      _OverallBillingStatus,
      _OvrlBillingDocReqStatus,
      _PrelimBillingDocumentStatus


}
