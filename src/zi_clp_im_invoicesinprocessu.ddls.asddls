@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Invoices for Project for Invoice Manager'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_CLP_IM_InvoicesInProcessU
  as select from ZI_CLP_ProjectINV
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
      @EndUserText.label: 'Total Gross Amount'
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
      B2PCustomerName,
      B2PCustomerFullName,
      B2PEmailAddress,
      Status,
      StatusText,
      DateDelivered,
      @Semantics.amount.currencyCode: 'TransactionCurrency'  
      ProfessionalFee,    
      @Semantics.amount.currencyCode: 'TransactionCurrency'  
      AdminFees,
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      Expenses,
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      CourtesyDiscount,      
      @EndUserText.label: 'On Account To Be Utilized'
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      OnAccountToBeUtilized,
      IndependentAddressID,
      BusinessPartner,
      
      _BillingDocumentItemBasic,
      _UniqueBDWorkPackage,
      _OverallSDProcessStatus,
      _OverallBillingStatus,
      _OvrlBillingDocReqStatus,
      _PrelimBillingDocumentStatus,
      _BPAddressIndependentEmail
}
where
  Status = 'AWD' 
  or Status = 'PAD'
//  or ( OverallBillingStatus = 'B' and AccountingTransferStatus = 'A' )

union select from ZI_CLP_ProjectPBD
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
      TotalNetAmount,
      TotalTaxAmount,
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
      B2PCustomerName,
      B2PCustomerFullName,
      B2PEmailAddress,
      Status,
      StatusText,
      DateDelivered,
        
      ProfessionalFee,
      AdminFees,
      Expenses,
      CourtesyDiscount,
      OnAccountToBeUtilized,
      IndependentAddressID,
      BusinessPartner,
      
      _BillingDocumentItemBasic,
      _UniqueBDWorkPackage,
      _OverallSDProcessStatus,
      _OverallBillingStatus,
      _OvrlBillingDocReqStatus,
      _PrelimBillingDocumentStatus,
      _BPAddressIndependentEmail
}
where
       ( Status                     = 'IPR'
  or    Status                      = 'AWA'
  or    Status                      = 'RWK'
  or    Status                      = 'PAD'
  or    Status                      = 'PMD'
  or(
        PrelimBillingDocumentStatus = 'A'
    and YY1_CLPDocApprovalSts_BDH   = ''
  ) )
  and PrelimBillingDocumentStatus != 'C'
  and PrelimBillingDocumentStatus != 'D'
union select from ZI_CLP_ProjectBDR
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
      TotalNetAmount,
      TotalTaxAmount,
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
      B2PCustomerName,
      B2PCustomerFullName,
      B2PEmailAddress,
      Status,
      StatusText,
      DateDelivered,
      ProfessionalFee,  
      AdminFees,
      Expenses,
      CourtesyDiscount,
      OnAccountToBeUtilized,
      IndependentAddressID,
      BusinessPartner,
      
      _BillingDocumentItemBasic,
      _UniqueBDWorkPackage,
      _OverallSDProcessStatus,
      _OverallBillingStatus,
      _OvrlBillingDocReqStatus,
      _PrelimBillingDocumentStatus,
      _BPAddressIndependentEmail
}where OverallBillingDocReqStatus = 'A'
