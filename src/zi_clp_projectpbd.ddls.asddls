@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'PBDs for Project'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_CLP_ProjectPBD
  as select from ZI_CLP_ProjectBillingDocHdr
  association [0..1] to I_Customer                  as _I_Customer               on _I_Customer.Customer = $projection.BillToParty
  association [0..*] to ZI_CLP_BillingDoctItemBasic as _BillingDocumentItemBasic on _BillingDocumentItemBasic.BillingDocument = $projection.BillingDocument
{
  key BillingDocument,
      ProjectID,
      SDDocumentCategory,
      ProjectUUID,
      ManagerTeamMemberUUID,
      ManagerPersonWorkAgreement,
      ManagerPersonWorkAgrExtID,
      ManagerEmailAddress,
      ManagerPersonFullName,
      ManagerBP,
      ManagerBPUUID,
      EngManagerTeamMemberUUID,
      EngManagerPersonWorkAgreement,
      EngManagerPersonWorkAgrExtID,
      EngManagerEmailAddress,
      EngManagerPersonFullName,
      EngManagerBP,
      EngManagerBPUUID,
      BillerTeamMemberUUID,
      BillerPersonWorkAgreement,
      BillerPersonWorkAgrExtID,
      BillerEmailAddress,
      BillerPersonFullName,
      BillerBP,
      BillerBPUUID,
      EngPartnerTeamMemberUUID,
      EngPartnerPersonWorkAgreement,
      EngPartnerPersonWorkAgrExtID,
      EngPartnerEmailAddress,
      EngPartnerPersonFullName,
      EngPartnerBP,
      EngPartnerBPUUID,
      Customer,
      CustomerName,
      BillToParty,
      BillingDocumentCategory,
      BillingDocumentType,
      BillingDocumentDate,
      BillingDocumentIsCancelled,
      CancelledBillingDocument,
      AccountingDocument,
      OverallDocumentBillingStatus,
      PrelimBillingDocumentStatus,
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      TotalNetAmount,
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      TotalTaxAmount,
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      TotalGrossAmount,
      TransactionCurrency,
      OverallBillingDocReqStatus,
      OverallSDProcessStatus,
      OverallBillingStatus,
      AccountingTransferStatus,
      PricingDocument,
      CompanyCode,
      FiscalYear,
      YY1_CLPNonStdDelvrDate_BDH,
      YY1_CLPNonStdDelivery_BDH,
      YY1_CLPDocApprovalSts_BDH,


      @EndUserText.label: 'Bill-To-Party Customer Name'
      _I_Customer.BPCustomerName                                                                              as B2PCustomerName,

      @EndUserText.label: 'Bill-To-Party Customer Full Name'
      _I_Customer.BPCustomerFullName                                                                          as B2PCustomerFullName,

      @EndUserText.label: 'Bill-To-Party Email Address'
      _I_Customer._AddressDefaultRepresentation._CurrentDfltEmailAddress.EmailAddress                         as B2PEmailAddress,

      @EndUserText.label: 'Status'
      case when  YY1_CLPDocApprovalSts_BDH = 'P' then 'IPR'
           when  YY1_CLPDocApprovalSts_BDH = 'A' then 'AWA'
           when  YY1_CLPDocApprovalSts_BDH = 'B' and  BillingDocumentDate > $session.system_date and YY1_CLPNonStdDelivery_BDH = '' then 'PAD'
      else ''
      end                                                                                                     as Status,
      @EndUserText.label: 'Status Text'
      case when  YY1_CLPDocApprovalSts_BDH = 'P' then 'In Preparation'
           when  YY1_CLPDocApprovalSts_BDH = 'A' then 'Pending Approval'
           when  YY1_CLPDocApprovalSts_BDH = 'B' and  BillingDocumentDate > $session.system_date and YY1_CLPNonStdDelivery_BDH = '' then 'Pending Auto Delivery'
      else ''
      end                                                                                                     as StatusText,
      @EndUserText.label: 'Date Delivered'
      case  when YY1_CLPNonStdDelivery_BDH = 'X' then YY1_CLPNonStdDelvrDate_BDH else BillingDocumentDate end as DateDelivered,
      @EndUserText.label: 'ZAD1 Admin Fees'
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      ZAD1AdminFees,
      @EndUserText.label: 'ZAD3 Admin Fees'
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      ZAD3AdminFees,
      @EndUserText.label: 'ZADO Admin Fees'
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      ZADOAdminFees,
      @EndUserText.label: 'ZADR Admin Fees'
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      ZADRAdminFees,
      @EndUserText.label: 'Courtesy Discount'
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      ZCDSCourtesyDiscount,
      
      _BillingDocumentItemBasic,
      _UniqueBDWorkPackage,
      _YY1_CLPDocApprovalSts_BDH,
      _OverallSDProcessStatus,
      _OverallBillingStatus,
      _OvrlBillingDocReqStatus,
      _PrelimBillingDocumentStatus

}
where
      SDDocumentCategory          =  'PBD'
