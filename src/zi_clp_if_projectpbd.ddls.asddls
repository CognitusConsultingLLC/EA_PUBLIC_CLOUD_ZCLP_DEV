@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'PBD of Projects for Invoice Finalizer'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZI_CLP_IF_ProjectPBD
  as select from ZI_CLP_ProjectPBD
  association [0..1] to ZI_CLP_Project     as _Project on _Project.ProjectID = $projection.ProjectID
  association [0..*] to ZR_TCLP_INVITEMIZE as _Itemize on _Itemize.PrelimBillingDocument = $projection.BillingDocument
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
      
            @EndUserText.label: 'Total ProfessionalFee'
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      TotalProfessionalFee,
      @EndUserText.label: 'Total Expenses'
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      TotalExpenses,
      @EndUserText.label: 'On Account To Be Utilized'
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      OnAccountToBeUtilized,
      @EndUserText.label: 'Time WriteOff'
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      TimeWriteOff,
      @EndUserText.label: 'Expenses WriteOff'
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      ExpensesWriteOff,
      
      @EndUserText.label: 'ProfessionalFee'
      @Semantics.amount.currencyCode: 'TransactionCurrency'
//      TotalProfessionalFee - TimeWriteOff as ProfessionalFee,
      ProfessionalFee,
      @EndUserText.label: 'Expenses'
      @Semantics.amount.currencyCode: 'TransactionCurrency'
//      TotalExpenses - ExpensesWriteOff as  Expenses,
      Expenses,
      @EndUserText.label: 'Admin Fees'
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      AdminFees,
      @EndUserText.label: 'Courtesy Discount'
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      CourtesyDiscount,
      BusinessPartner,
      ZI_CLP_ProjectPBD.IndependentAddressID,
      /* Associations */
      _BillingDocumentItemBasic,
      _UniqueBDWorkPackage,
      _YY1_CLPDocApprovalSts_BDH,
      _Project,
      _OverallSDProcessStatus,
      _OverallBillingStatus,
      _OvrlBillingDocReqStatus,
      _PrelimBillingDocumentStatus,
      _Itemize,
      _BPAddressIndependentEmail // Make association public
}
